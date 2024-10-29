using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using ShopOnline.Areas.Admin.ViewModels;
using ShopOnline.Models;
using ShopOnline.Models.Authentication;
using ShopOnline.ViewModels;
using System.Drawing;
using System.Globalization;
using System.Text;
using X.PagedList;
using X.PagedList.Extensions;

namespace ShopOnline.Areas.Admin.Controllers
{
    [Area("admin")]
    [Route("admin")]
    [Route("admin/homeadmin")]
    public class HomeAdminController : Controller
    {
        QuanLyShopOnlineContext db = new QuanLyShopOnlineContext();
        [Route("")]
        [Route("index")]
        [HttpGet("Index")]
        [Authentication]
        public IActionResult Index()
        {
            var username = HttpContext.Session.GetString("Username");
            if (username != null && username == "admin")
            {
                return View();
            }
            else
            {
                TempData["ErrorMessage"] = "Bạn không có quyền truy cập trang này."; // Thông báo lỗi nếu không phải admin
                return RedirectToAction("Login", "Home"); // Chuyển hướng đến trang đăng nhập
            }

        }


        [Route("danhmucsanpham")]
        public IActionResult DanhMucSanPham(int? page)
        {
            int pageSize = 15;
            int pageNumber = page == null || page < 1 ? 1 : page.Value;

            // Lấy dữ liệu từ database và sắp xếp trước khi phân trang
            var listDanhMuc = db.DanhMucs.OrderBy(dm => dm.TenDm).AsQueryable();

            // Tạo PagedList dựa trên dữ liệu
            var pagedList = listDanhMuc.ToPagedList(pageNumber, pageSize);

            return View(pagedList);
        }
        [Route("AddDanhMuc")]
        [HttpGet]
        public IActionResult AddDanhMuc()
        {
            return View();
        }
        [Route("AddDanhMuc")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult AddDanhMuc (DanhMuc DanhMuc)
        {
            // Kiểm tra mã danh mục (dm) có tồn tại trong cơ sở dữ liệu hay không
            var existingDanhMuc = db.DanhMucs.FirstOrDefault(dm => dm.MaDm == DanhMuc.MaDm);

            if (existingDanhMuc != null)
            {
                // Nếu tồn tại, thêm thông báo lỗi vào ModelState
                ModelState.AddModelError("MaDm", "Mã danh mục đã tồn tại.");
            }

            if (ModelState.IsValid)
            {
                db.Add(DanhMuc);
                db.SaveChanges();
                return RedirectToAction("DanhMucSanPham");
            }

            // Trả lại View với thông tin lỗi (nếu có)
            return View(DanhMuc);
        }

        [Route("EditDanhMuc")]
        [HttpGet]
        public IActionResult EditDanhMuc(string madm)
        {
            var danhmuc = db.DanhMucs.Find(madm);
            return View();
        }
        [Route("EditDanhMuc")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult EditDanhMuc(DanhMuc DanhMuc)
        {
            if (ModelState.IsValid)
            {
                db.Entry(DanhMuc).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("DanhMucSanPham", "HomeAdmin");
            }
            // Trả lại View với thông tin lỗi (nếu có)
            return View(DanhMuc);
        }
        [Route("DeleteDanhMuc")]
        [HttpGet]
        public IActionResult DeleteDanhMuc(String madm)
        {
           
            TempData["Message"] = "";
            // Lấy tất cả sản phẩm trong danh mục
            var sanPhams = db.SanPhams.Where(x => x.MaDm == madm).ToList();
            // Nếu không có sản phẩm trong danh mục, xóa danh mục ngay
            if (sanPhams.Count == 0)
            {
                var danhmuc = db.DanhMucs.FirstOrDefault(x => x.MaDm == madm);
                if (danhmuc != null)
                {
                    db.DanhMucs.Remove(danhmuc);
                    db.SaveChanges();

                    TempData["Message"] = "Danh mục đã được xóa vì không có sản phẩm nào.";
                }
                else
                {
                    TempData["Message"] = "Không tìm thấy danh mục cần xóa.";
                }
                return RedirectToAction("DanhMucSanPham", "HomeAdmin");
            }
            // Cờ để xác định có thể xóa hay không
            bool canDelete = true;

            // Kiểm tra xem có sản phẩm nào trong danh mục liên quan đến hóa đơn không
            foreach (var sanPham in sanPhams)
            {
                var ctsps = db.Ctsps.Where(x => x.MaSp == sanPham.MaSp).ToList();
                foreach (var ctsp in ctsps)
                {
                    var chitietspsize = db.CtspSizes.Where(x => x.MaCtsp == ctsp.MaCtsp).ToList();
                    foreach (var size in chitietspsize)
                    {
                        var chitiethoadon = db.Ctdhs.Where(x => x.MaCtspSize == size.MaCtspSize).ToList();

                        // Nếu tìm thấy hóa đơn, không thể xóa danh mục
                        if (chitiethoadon.Count > 0)
                        {
                            canDelete = false;
                            TempData["Message"] = "Không thể xóa danh mục này vì có sản phẩm liên quan đến hóa đơn.";
                            break;
                        }
                    }
                    // Nếu không thể xóa, thoát khỏi vòng lặp ngoài
                    if (!canDelete) break;
                }
                // Nếu không thể xóa, thoát khỏi vòng lặp ngoài
                if (!canDelete) break;
            }

            // Nếu có thể xóa (không có sản phẩm nào liên quan đến hóa đơn), tiến hành xóa
            if (canDelete)
            {
                foreach (var sanPham in sanPhams)
                {
                    var ctsps = db.Ctsps.Where(x => x.MaSp == sanPham.MaSp).ToList();
                    foreach (var ctsp in ctsps)
                    {
                        var chitietspsize = db.CtspSizes.Where(x => x.MaCtsp == ctsp.MaCtsp).ToList();
                        db.CtspSizes.RemoveRange(chitietspsize);
                    }
                    db.Ctsps.RemoveRange(ctsps);
                }
                db.SanPhams.RemoveRange(sanPhams);

                // Xóa danh mục
                var danhmucToDelete = db.DanhMucs.Find(madm);
                db.DanhMucs.Remove(danhmucToDelete);
                db.SaveChanges();

                TempData["Message"] = "Danh mục và các sản phẩm liên quan đã được xóa thành công.";
            }
            return RedirectToAction("DanhMucSanPham", "HomeAdmin");
        }

        [Route("sanpham")]
        public IActionResult SanPham(int? page, string search)
        {
            int pageSize = 15;
            int pageNumber = page ?? 1;

            var originalSanPhamList = db.SanPhams
                .AsNoTracking()
                .OrderByDescending(sp => sp.MaSp)
                .ToList();

            // Nếu có từ khóa tìm kiếm
            if (!string.IsNullOrEmpty(search))
            {
                search = search.Trim();
                var processedSearch = RemoveDiacritics(search.ToLower());
                var searchKeywords = processedSearch.Split(' ', StringSplitOptions.RemoveEmptyEntries);

                var currentFilteredList = originalSanPhamList;

                foreach (var keyword in searchKeywords)
                {
                    var filteredList = currentFilteredList
                        .Where(sp => RemoveDiacritics(sp.TenSp.ToLower()).Contains(keyword))
                        .ToList();

                    if (filteredList.Any())
                    {
                        currentFilteredList = filteredList;
                    }
                }

                originalSanPhamList = currentFilteredList;
            }
            var pagedList = originalSanPhamList.ToPagedList(pageNumber, pageSize);

            return View(pagedList);
        }
        //Tìm kiếm theo tên
        // Phương thức RemoveDiacritics
        public static string RemoveDiacritics(string text)
        {
            var normalizedString = text.Normalize(NormalizationForm.FormD);
            var stringBuilder = new StringBuilder();

            foreach (var c in normalizedString)
            {
                var unicodeCategory = CharUnicodeInfo.GetUnicodeCategory(c);
                if (unicodeCategory != UnicodeCategory.NonSpacingMark)
                {
                    stringBuilder.Append(c);
                }
            }
            return stringBuilder.ToString().Normalize(NormalizationForm.FormC);
        }
        [Route("AddSanPham")]
        [HttpGet]
        public IActionResult AddSanPham()
        {
            var DanhMuc = db.DanhMucs.Select(x => x.TenDm).ToList();
            var model = new SanPhamViewModel
            {
                listTenDM = DanhMuc
            };
            return View(model);
        }

        [Route("AddSanPham")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult AddSanPham(SanPhamViewModel model)
        {
            var uploadFolder = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "LayoutShop", "img");
            string ha = "";

            if (model.HinhanhDD != null && model.HinhanhDD.Length > 0)
            {
                string fileName = Guid.NewGuid() + Path.GetExtension(model.HinhanhDD.FileName); // Generate a unique filename
                string filePath = Path.Combine(uploadFolder, fileName);

                using (var stream = new FileStream(filePath, FileMode.Create))
                {
                    model.HinhanhDD.CopyTo(stream);
                }

                ha = "/LayoutShop/img/" + fileName; // Save the path to the database
            }
            else
            {
                TempData["ErrorMessage"] = "Hình ảnh không hợp lệ.";
                model.listTenDM = db.DanhMucs.Select(x => x.TenDm).ToList();
                return View(model);
            }

            string newMaSP = GenerateUniqueProductCode();
            string madm = db.DanhMucs.FirstOrDefault(x => x.TenDm == model.Tendm)?.MaDm;

            if (madm == null)
            {
                ModelState.AddModelError("Tendm", "Danh mục không tồn tại.");
                model.listTenDM = db.DanhMucs.Select(x => x.TenDm).ToList();
                return View(model);
            }

            var SanPham = new SanPham
            {
                MaDm = madm,
                MaSp = newMaSP,
                TenSp = model.TenSP,
                MoTa = model.MoTa,
                HinhAnhDd = ha,
                MaxGia = 0,
                MinGia = 0
            };

            db.SanPhams.Add(SanPham);
            db.SaveChanges();
            return RedirectToAction("SanPham");
        }

        [Route("DeleteSanPham")]
        [HttpGet]
        public IActionResult DeleteSanPham(string MaSP)
        {
            var sanPham = db.SanPhams.FirstOrDefault(x => x.MaSp == MaSP);
            if (sanPham == null)
            {
                TempData["Message"] = "Sản phẩm không tồn tại.";
                return RedirectToAction("SanPham"); 
            }

            var ctspList = db.Ctsps.Where(x => x.MaSp == MaSP).ToList();

            bool canDelete = true;

            foreach (var ctsp in ctspList)
            {
                var ctspSizes = db.CtspSizes.Where(x => x.MaCtsp == ctsp.MaCtsp).ToList();

                foreach (var ctspSize in ctspSizes)
                {
                    var ctdhList = db.Ctdhs.Where(x => x.MaCtspSize == ctspSize.MaCtspSize).ToList();
                    foreach (var ctdh in ctdhList)
                    {
                        var donHang = db.DonHangs.FirstOrDefault(x => x.MaDh == ctdh.MaDh);
                        if (donHang != null)
                        {
                            canDelete = false;
                            break; 
                        }
                    }
                    if (!canDelete) break; 
                }
                if (!canDelete) break; 
            }

            if (!canDelete)
            {
                TempData["Message"] = "Không thể xóa sản phẩm này vì có đơn hàng liên quan.";
                return RedirectToAction("SanPham"); 
            }

            foreach (var ctsp in ctspList)
            {
                var ctspSizes = db.CtspSizes.Where(x => x.MaCtsp == ctsp.MaCtsp).ToList();
                foreach (var ctspSize in ctspSizes)
                {
                    var ctdhList = db.Ctdhs.Where(x => x.MaCtspSize == ctspSize.MaCtspSize).ToList();
                    db.Ctdhs.RemoveRange(ctdhList); 
                }

                db.CtspSizes.RemoveRange(ctspSizes);
            }

            db.Ctsps.RemoveRange(ctspList); 
            db.SanPhams.Remove(sanPham);
            db.SaveChanges(); 

            TempData["Message"] = "Sản phẩm đã được xóa thành công.";
            return RedirectToAction("SanPham"); 
        }

        [Route("ChiTietSanPham")]
        [HttpGet]
        public IActionResult ChiTietSanPham(string MaSP)
        {
            var ctspList = db.Ctsps.Where(x => x.MaSp == MaSP).AsNoTracking().ToList();
            var ctspIds = ctspList.Select(x => x.MaCtsp).ToList();
            var ctspSizeList = db.CtspSizes.Where(x => ctspIds.Contains(x.MaCtsp)).ToList();
            var sizeIds = ctspSizeList.Select(x => x.MaSize).Distinct().ToList();
            var sizes = db.Sizes.Where(x => sizeIds.Contains(x.MaSize)).ToList();
            var mauSacs = db.MauSacs.ToList();

            List<CTMauSacViewModel> ListMS = new List<CTMauSacViewModel>();

            var product = db.SanPhams.FirstOrDefault(x => x.MaSp == MaSP);
            decimal MinGia = product.MinGia;
            decimal MaxGia = product.MaxGia;

            decimal newMinGia, newMaxGia;

            if (ctspSizeList.Any())
            {
                newMinGia = ctspSizeList.Min(x => x.Gia);
                newMaxGia = ctspSizeList.Max(x => x.Gia);
            }
            else
            {
                newMinGia = 0; // Gán lại MinGia về 0 nếu không có giá nào
                newMaxGia = 0; // Gán lại MaxGia về 0 nếu không có giá nào
            }
            if (newMinGia != MinGia || newMaxGia != MaxGia)
            {
                product.MinGia = newMinGia;
                product.MaxGia = newMaxGia;
                db.SaveChanges();
            }

            foreach (var ctsp in ctspList)
            {
                var ctspSizeFiltered = ctspSizeList.Where(x => x.MaCtsp == ctsp.MaCtsp).ToList();
                List<CTSizeViewModel> ListSize = new List<CTSizeViewModel>();

                foreach (var ctspSize in ctspSizeFiltered)
                {
                    var size = sizes.FirstOrDefault(x => x.MaSize == ctspSize.MaSize);
                    if (size != null)
                    {
                        var Size = new CTSizeViewModel
                        {
                            MaCTSP_Size = ctspSize.MaCtspSize,
                            TenSize = size.TenSize,
                            Gia = ctspSize.Gia,
                            SoLuongTon = ctspSize.SoLuongTon
                        };
                        ListSize.Add(Size);
                    }
                }

                var mauSac = mauSacs.FirstOrDefault(x => x.MaMs == ctsp.MaMs);
                var MauSac = new CTMauSacViewModel
                {
                    MaCTSP = ctsp.MaCtsp,
                    TenMS = mauSac?.TenMs,
                    HinhAnhDD = ctsp.HinhAnh,
                    Sizes = ListSize.Any() ? ListSize : null
                };

                ListMS.Add(MauSac);
            }

            var ChiTietSP = new ChiTietSPViewModel
            {
                MaSP = MaSP,
                MauSacs = ListMS
            };

            return View(ChiTietSP);
        }
        //Chỉnh sửa sản phẩm 
        [Route("EditSanPham")]
        [HttpGet]
        public IActionResult EditSanPham (string MaSP)
        {
            var sanPham = db.SanPhams.Where(x => x.MaSp == MaSP).FirstOrDefault();
            List<string> listDM = db.DanhMucs.Select(x => x.TenDm).ToList();
            var modelSP = new SanPhamViewModel
            {
                MaSP = MaSP,
                TenSP = sanPham.TenSp,
                MoTa = sanPham.MoTa,
                Tendm = db.DanhMucs.FirstOrDefault(x => x.MaDm == sanPham.MaDm).TenDm,
                listTenDM = listDM
            };
            return View(modelSP);
        }
        [Route("EditSanPham")]
        [HttpPost]
        public IActionResult EditSanPham (SanPhamViewModel model)
        {
            var sanPham = db.SanPhams.FirstOrDefault(x => x.MaSp == model.MaSP);
            var uploadFolder = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "LayoutShop", "img");
            string ha = sanPham.HinhAnhDd;

            if (model.HinhanhDD != null && model.HinhanhDD.Length > 0)
            {
                string fileName = Guid.NewGuid() + Path.GetExtension(model.HinhanhDD.FileName); // Generate a unique filename
                string filePath = Path.Combine(uploadFolder, fileName);

                using (var stream = new FileStream(filePath, FileMode.Create))
                {
                    model.HinhanhDD.CopyTo(stream);
                }

                ha = "/LayoutShop/img/" + fileName; // Save the path to the database
            }
            else
            {
                TempData["ErrorMessage"] = "Hình ảnh không hợp lệ.";
                model.listTenDM = db.DanhMucs.Select(x => x.TenDm).ToList();
                return View(model);
            }
            string madm = db.DanhMucs.FirstOrDefault(x => x.TenDm == model.Tendm)?.MaDm;

            if (madm == null)
            {
                TempData["ErrorMessage"] = "Danh mục không tồn tại.";
                model.listTenDM = db.DanhMucs.Select(x => x.TenDm).ToList();
                return View(model);
            }

            sanPham.TenSp = model.TenSP;
            sanPham.MoTa = model.MoTa;
            sanPham.HinhAnhDd = ha;
            sanPham.MaDm = madm;
            db.SaveChanges();
            return RedirectToAction("SanPham");

        }



        //Thêm màu sắc
        [Route("AddMauSacSP")]
        [HttpGet]
        public IActionResult AddMauSacSP(string MaSP)
        {
            List<string> Colors = db.MauSacs.Select(x => x.TenMs).ToList();
            var mauSac = new MauSacSPViewModel
            {
                MaSP = MaSP,
                ListMS = Colors
            };
            return View(mauSac);
        }
        [Route("AddMauSacSP")]
        [HttpPost]
        public IActionResult AddMauSacSP(MauSacSPViewModel model)
        {
            string mams = db.MauSacs.FirstOrDefault(x => x.TenMs == model.TenMS)?.MaMs;

            if (mams == null && !string.IsNullOrEmpty(model.TenMS))
            {
                var CreateMS = new MauSac
                {
                    MaMs = GenerateUniqueColorCode(),
                    TenMs = model.TenMS
                };

                db.MauSacs.Add(CreateMS);
                db.SaveChanges(); 
                mams = CreateMS.MaMs;
            }

            //Kiểm tra màu sắc đã có trong sản phẩm chưa
            var ctsp = db.Ctsps.Where(x => x.MaSp == model.MaSP).ToList();

            if (db.Ctsps.Any(x => x.MaSp == model.MaSP && x.MaMs == mams))
            {
                TempData["ErrorMessage"] = "Màu sắc này đã có trong sản phẩm.";
                var mauSac = new MauSacSPViewModel
                {
                    MaSP = model.MaSP,
                    ListMS = db.MauSacs.Select(x => x.TenMs).ToList(),
                };
                return View(mauSac);
            }

            var uploadFolder = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "LayoutShop", "img");
            string ha = "";

            if (model.HinhAnhDD != null && model.HinhAnhDD.Length > 0)
            {
                string fileName = Guid.NewGuid() + Path.GetExtension(model.HinhAnhDD.FileName);
                string filePath = Path.Combine(uploadFolder, fileName);

                using (var stream = new FileStream(filePath, FileMode.Create))
                {
                    model.HinhAnhDD.CopyTo(stream); 
                }
                ha = "/LayoutShop/img/" + fileName;
            }
            else
            {
                TempData["ErrorMessage"] = "Hình ảnh không hợp lệ.";
                return View(model);
            }

            var CTSP = new Ctsp
            {
                MaCtsp = GenerateUniqueCtspCode(),
                MaSp = model.MaSP,
                MaMs = mams,
                HinhAnh = ha
            };

            db.Ctsps.Add(CTSP);
            db.SaveChanges();
            return RedirectToAction("ChiTietSanPham", new { MaSP = model.MaSP });
        }
        //Thêm màu sắc
        [Route("EditMauSacSP")]
        [HttpGet]
        public IActionResult EditMauSacSP(string MaSP, string MaCTSP)
        {
            List<string> Colors = db.MauSacs.Select(x => x.TenMs).ToList();
            string mams = db.Ctsps.FirstOrDefault(x => x.MaCtsp == MaCTSP).MaMs;
            string tenms = db.MauSacs.FirstOrDefault(x => x.MaMs == mams).TenMs;
            var mauSac = new MauSacSPViewModel
            {
                MaCTSP = MaCTSP,
                MaSP = MaSP,
                TenMS = tenms,
                ListMS = Colors
            };
            return View(mauSac);
        }
        [Route("EditMauSacSP")]
        [HttpPost]
        public IActionResult EditMauSacSP(MauSacSPViewModel model)
        {
            string mams = db.MauSacs.FirstOrDefault(x => x.TenMs == model.TenMS)?.MaMs;

            if (mams == null && !string.IsNullOrEmpty(model.TenMS))
            {
                var CreateMS = new MauSac
                {
                    MaMs = GenerateUniqueColorCode(),
                    TenMs = model.TenMS
                };

                db.MauSacs.Add(CreateMS);
                db.SaveChanges();
                mams = CreateMS.MaMs;
            }
            //Kiểm tra màu sắc đã có trong sản phẩm chưa
            var ctsp = db.Ctsps.Where(x => x.MaSp == model.MaSP).ToList();

            if (db.Ctsps.Any(x => x.MaSp == model.MaSP && x.MaMs == mams) && db.Ctsps.FirstOrDefault(x => x.MaCtsp == model.MaCTSP).MaMs != mams)
            {
                TempData["ErrorMessage"] = "Màu sắc này đã có trong sản phẩm.";
                var mauSac = new MauSacSPViewModel
                {
                    MaSP = model.MaSP,
                    ListMS = db.MauSacs.Select(x => x.TenMs).ToList(),
                };
                return View(mauSac);
            }


            var uploadFolder = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "LayoutShop", "img");
            string ha = "";

            if (model.HinhAnhDD != null && model.HinhAnhDD.Length > 0)
            {
                string fileName = Guid.NewGuid() + Path.GetExtension(model.HinhAnhDD.FileName);
                string filePath = Path.Combine(uploadFolder, fileName);

                using (var stream = new FileStream(filePath, FileMode.Create))
                {
                    model.HinhAnhDD.CopyTo(stream);
                }
                ha = "/LayoutShop/img/" + fileName;
            }
            else
            {
                TempData["ErrorMessage"] = "Hình ảnh không hợp lệ.";
                return View(model);
            }

            var CTSP = db.Ctsps.FirstOrDefault(x => x.MaCtsp == model.MaCTSP);
            CTSP.MaMs = mams;
            CTSP.HinhAnh = ha;
            db.SaveChanges();
            return RedirectToAction("ChiTietSanPham", new { MaSP = model.MaSP });
        }

        [Route("DeleteMauSacSP")]
        [HttpGet]
        public IActionResult DeleteMauSacSP(string MaCTSP)
        {
            var CTSP = db.Ctsps.FirstOrDefault(x => x.MaCtsp == MaCTSP);

            var CTSP_Size = db.CtspSizes.Where(x => x.MaCtsp == MaCTSP).ToList();
            bool CheckDelete = true;

            if (CTSP_Size.Count > 0)
            {
                foreach(var ctsp in CTSP_Size)
                {
                    var CTHD = db.Ctdhs.Where(x => x.MaCtspSize == ctsp.MaCtspSize).ToList();
                    if (CTHD.Count > 0)
                    {
                        CheckDelete = false;
                        break;
                    }
                }
                if (CheckDelete)
                {
                    db.CtspSizes.RemoveRange(CTSP_Size);
                    db.Ctsps.Remove(CTSP);
                    db.SaveChanges();
                    return RedirectToAction("ChiTietSanPham", new { MaSP = CTSP.MaSp});
                }
                else
                {
                    TempData["ErrorMessage"] = "Không xóa được. Chi tiết sản phẩm đã liên quan đến hóa đơn.";
                    return RedirectToAction("ChiTietSanPham", new { MaSP = CTSP.MaSp });
                }
            }
            else
            {
                db.Ctsps.Remove(CTSP);
                db.SaveChanges();
                return RedirectToAction("ChiTietSanPham", new { MaSP = CTSP.MaSp });
            }
        }
        //Xử lý phần chi tiết sản phẩm size 
        [Route("AddSizeSP")]
        [HttpGet]
        public IActionResult AddSizeSP(string MaCTSP)
        {
            List<string> listSize = db.Sizes.Select(x => x.TenSize).ToList();
            var SizeSP = new SizeSPViewModel
            {
                MaCTSP = MaCTSP,
                Sizes = listSize
            };
            return View(SizeSP);
        }
        [Route("AddSizeSP")]
        [HttpPost]
        public IActionResult AddSizeSP (SizeSPViewModel model)
        {
            var existingSize = db.Sizes.FirstOrDefault(x => x.TenSize == model.TenSize);
            string maSize;
            if (existingSize == null && !string.IsNullOrEmpty(model.TenSize))
            {
                var newSize = new Models.Size
                {
                    MaSize = GenerateUniqueSizeCode(),
                    TenSize = model.TenSize
                };
                db.Sizes.Add(newSize);
                db.SaveChanges();
                maSize = newSize.MaSize;
            }
            else
            {
                maSize = existingSize.MaSize; 
            }
            //Kiểm tra không cho tạo lặp lại chi tiết size
            var CTSPS = db.CtspSizes.Where(x => x.MaCtsp == model.MaCTSP).ToList();
            if (db.CtspSizes.Any(x => x.MaCtsp == model.MaCTSP && x.MaSize == maSize))
            {
                TempData["ErrorMessage"] = "Size này đã có trong chi tiết sản phẩm.";
                var kichThuoc = new SizeSPViewModel
                {
                    MaCTSP = model.MaCTSP,
                    Sizes = db.Sizes.Select(x => x.TenSize).ToList(),
                };
                return View(kichThuoc);
            }

            string MaSP = db.Ctsps.FirstOrDefault(x => x.MaCtsp == model.MaCTSP).MaSp;
            var CTSP_Size = new CtspSize
            {
                MaCtspSize = GenerateUniqueCtspsCode(),
                MaCtsp = model.MaCTSP,
                MaSize = db.Sizes.FirstOrDefault(x => x.TenSize == model.TenSize).MaSize,
                Gia = model.Gia,
                SoLuongTon = model.SoLuongTon
            };
            db.CtspSizes.Add(CTSP_Size);
            db.SaveChanges();
            return RedirectToAction("ChiTietSanPham", new { MaSP = MaSP });
        }
        [Route("EditSizeSP")]
        [HttpGet]
        public IActionResult EditSizeSP(string MaCTSPS)
        {
            List<string> listSize = db.Sizes.Select(x => x.TenSize).ToList();
            var CTSPS = db.CtspSizes.FirstOrDefault(x => x.MaCtspSize == MaCTSPS);

            var SizeSP = new SizeSPViewModel
            {
                MaCTSP_Size = MaCTSPS,
                MaCTSP = CTSPS.MaCtsp,
                TenSize = db.Sizes.FirstOrDefault(x => x.MaSize == CTSPS.MaSize).TenSize,
                Sizes = listSize,
                Gia = CTSPS.Gia,
                SoLuongTon = CTSPS.SoLuongTon
            };
            return View(SizeSP);
        }
        [Route("EditSizeSP")]
        [HttpPost]
        public IActionResult EditSizeSP(SizeSPViewModel model)
        {
            var existingSize = db.Sizes.FirstOrDefault(x => x.TenSize == model.TenSize);
            string maSize;
            if (existingSize == null && !string.IsNullOrEmpty(model.TenSize))
            {
                var newSize = new Models.Size
                {
                    MaSize = GenerateUniqueSizeCode(),
                    TenSize = model.TenSize
                };
                db.Sizes.Add(newSize);
                db.SaveChanges();
                maSize = newSize.MaSize;
            }
            else
            {
                maSize = existingSize.MaSize;
            }

            //Kiểm tra không cho tạo lặp lại chi tiết size
            var CTSPS = db.CtspSizes.Where(x => x.MaCtsp == model.MaCTSP).ToList();
            if (db.CtspSizes.Any(x => x.MaCtsp == model.MaCTSP && x.MaSize == maSize) && db.CtspSizes.FirstOrDefault(x => x.MaCtspSize == model.MaCTSP_Size).MaSize != maSize)
            {
                TempData["ErrorMessage"] = "Size này đã có trong chi tiết sản phẩm.";
                var kichThuoc = new SizeSPViewModel
                {
                    MaCTSP = model.MaCTSP,
                    Sizes = db.Sizes.Select(x => x.TenSize).ToList(),
                };
                return View(kichThuoc);
            }



            string MaSP = db.Ctsps.FirstOrDefault(x => x.MaCtsp == model.MaCTSP).MaSp;
            var CTSP_Size = db.CtspSizes.FirstOrDefault(x => x.MaCtspSize == model.MaCTSP_Size);
            CTSP_Size.MaSize = maSize;
            CTSP_Size.Gia = model.Gia;
            CTSP_Size.SoLuongTon = model.SoLuongTon;

            db.SaveChanges();
            return RedirectToAction("ChiTietSanPham", new { MaSP = MaSP });
        }
        [Route("DeleteSizeSP")]
        [HttpGet]
        public IActionResult DeleteSizeSP(string MaCTSPS)
        {
            var CTSP_Size = db.CtspSizes.FirstOrDefault(x => x.MaCtspSize == MaCTSPS);
            string MaSP = db.Ctsps.FirstOrDefault(x => x.MaCtsp == CTSP_Size.MaCtsp)?.MaSp;

            var CTHD = db.Ctdhs.Where(x => x.MaCtspSize == CTSP_Size.MaCtspSize).ToList();
            if (CTHD.Count == 0)
            {
                db.CtspSizes.Remove(CTSP_Size);
                db.SaveChanges();
                return RedirectToAction("ChiTietSanPham", new { MaSP = MaSP });
            }
            else
            {
                TempData["ErrorMessage"] = "Không xóa được. Chi tiết này đã liên quan đến hóa đơn.";
                return RedirectToAction("ChiTietSanPham", new { MaSP = MaSP });
            }
        }


        //Xử lý mã sản phẩm
        [Route("GetMaxProductCode")]
        [HttpGet]
        public string GetMaxProductCode()
        {
            // Lấy mã khách hàng lớn nhất, nếu không có sẽ trả về null
            var maxproductCode = db.SanPhams
                .AsNoTracking()
                .Select(x => x.MaSp)
                .Max();

            return maxproductCode;
        }


        private string GenerateUniqueProductCode()
        {
            var maxproductCode = GetMaxProductCode();

            if (maxproductCode == null)
            {
                // Nếu không có mã nào, bắt đầu từ DH001
                return "SP001";
            }

            // Lấy phần số từ mã đơn hàng lớn nhất
            string numericPart = maxproductCode.Substring(2);
            int newNumber = int.Parse(numericPart) + 1;

            return "SP" + newNumber.ToString().PadLeft(3, '0');
        }
        //Xử lý mã ctsp_size
        [Route("GetMaxCtspsCode")]
        [HttpGet]
        public string GetMaxCtspsCode()
        {
            // Sử dụng Max để lấy mã CtspSize lớn nhất, không cần sắp xếp toàn bộ
            var maxCtspsCode = db.CtspSizes
                .AsNoTracking() // Không theo dõi các đối tượng
                .Select(c => c.MaCtspSize)
                .Max(); // Lấy giá trị lớn nhất

            return maxCtspsCode;
        }

        private string GenerateUniqueCtspsCode()
        {
            var maxCtspsCode = GetMaxCtspsCode();

            if (maxCtspsCode == null)
            {
                // Nếu không có mã nào, bắt đầu từ DH001
                return "CTSPS0001";
            }

            // Lấy phần số từ mã đơn hàng lớn nhất
            string numericPart = maxCtspsCode.Substring(5);
            int newNumber = int.Parse(numericPart) + 1;

            return "CTSPS" + newNumber.ToString().PadLeft(4, '0');
        }
        //Xử lý mã ctsp
        [Route("GetMaxCtspCode")]
        [HttpGet]
        public string GetMaxCtspCode()
        {
            // Lấy mã khách hàng lớn nhất, nếu không có sẽ trả về null
            var maxCtspCode = db.Ctsps
                .AsNoTracking()
                .Select(x => x.MaCtsp)
                .Max();

            return maxCtspCode;
        }

        private string GenerateUniqueCtspCode()
        {
            var maxCtspCode = GetMaxCtspCode();

            if (maxCtspCode == null)
            {
                // Nếu không có mã nào, bắt đầu từ DH001
                return "CTSP0001";
            }

            // Lấy phần số từ mã đơn hàng lớn nhất
            string numericPart = maxCtspCode.Substring(4);
            int newNumber = int.Parse(numericPart) + 1;

            return "CTSP" + newNumber.ToString().PadLeft(4, '0');
        }
        //Xử lý mã màu sắc
        [Route("GetMaxColorCode")]
        [HttpGet]
        public string GetMaxColorCode()
        {
            // Lấy mã khách hàng lớn nhất, nếu không có sẽ trả về null
            var maxColorCode = db.MauSacs
                .AsNoTracking()
                .Select(x => x.MaMs)
                .Max();

            return maxColorCode;
        }


        private string GenerateUniqueColorCode()
        {
            var maxColorCode = GetMaxColorCode();

            if (maxColorCode == null)
            {
                // Nếu không có mã nào, bắt đầu từ DH001
                return "MS01";
            }

            // Lấy phần số từ mã đơn hàng lớn nhất
            string numericPart = maxColorCode.Substring(2);
            int newNumber = int.Parse(numericPart) + 1;

            return "MS" + newNumber.ToString().PadLeft(2, '0');
        }
        //Xử lý mã size
        [Route("GetMaxSizeCode")]
        [HttpGet]
        public string GetMaxSizeCode()
        {
            // Lấy mã khách hàng lớn nhất, nếu không có sẽ trả về null
            var maxSizeCode = db.Sizes
                .AsNoTracking()
                .Select(x => x.MaSize)
                .Max();

            return maxSizeCode;
        }


        private string GenerateUniqueSizeCode()
        {
            var maxSizeCode = GetMaxSizeCode();

            if (maxSizeCode == null)
            {
                // Nếu không có mã nào, bắt đầu từ DH001
                return "S01";
            }

            // Lấy phần số từ mã đơn hàng lớn nhất
            string numericPart = maxSizeCode.Substring(1);
            int newNumber = int.Parse(numericPart) + 1;

            return "S" + newNumber.ToString().PadLeft(2, '0');
        }
    }
}
