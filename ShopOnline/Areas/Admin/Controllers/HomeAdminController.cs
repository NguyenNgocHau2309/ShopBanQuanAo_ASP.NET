using Microsoft.AspNetCore.Mvc;
using ShopOnline.Areas.Admin.ViewModels;
using ShopOnline.Models;
using ShopOnline.ViewModels;
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
        public IActionResult Index()
        {
            return View();
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
        public IActionResult SanPham(int? page)
        {
            int pageSize = 15;
            int pageNumber = page == null || page < 1 ? 1 : page.Value;

            // Lấy dữ liệu từ database và sắp xếp trước khi phân trang
            var listSanPham = db.SanPhams.OrderByDescending(sp => sp.MaSp).AsQueryable();

            // Tạo PagedList dựa trên dữ liệu
            var pagedList = listSanPham.ToPagedList(pageNumber, pageSize);

            return View(pagedList);
        }

        [Route("AddSanPham")]
        [HttpGet]
        public IActionResult AddSanPham()
        {
            var danhMucList = db.DanhMucs.Select(x => x.TenDm).ToList(); // Lấy danh sách danh mục từ CSDL
            var mauSacList = db.MauSacs.Select(x => x.TenMs).ToList(); // Lấy danh sách màu sắc từ CSDL
            var kichThuocList = db.Sizes.Select(x => x.TenSize).ToList(); // Lấy danh sách kích thước từ CSDL

            var viewModel = new SanPhamViewModel
            {
                DanhMucs = danhMucList,
                Colors = mauSacList,
                Kichthuocs = kichThuocList
            };

            return View(viewModel);
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult CTSPTam(ChiTietSPTamViewModel Temctsp)
        {
            // Kiểm tra nếu Temctsp là null hoặc không hợp lệ
            if (Temctsp == null || !ModelState.IsValid)
            {
                // Bạn có thể thêm thông báo lỗi ở đây nếu cần
                return BadRequest("Dữ liệu không hợp lệ."); // Trả về lỗi nếu Temctsp là null hoặc không hợp lệ
            }

            // Lấy danh sách ctsp từ session, nếu không có thì khởi tạo mới
            var ctsp = HttpContext.Session.GetObjectFromJson<List<ChiTietSPTamViewModel>>("ctspTam") ?? new List<ChiTietSPTamViewModel>();

            // Tạo một đối tượng mới từ dữ liệu nhận được
            var newCtsp = new ChiTietSPTamViewModel
            {
                MauSac = Temctsp.MauSac,
                HinhAnh = Temctsp.HinhAnh,
                Size = Temctsp.Size,
                Gia = Temctsp.Gia,
                SoLuongTon = Temctsp.SoLuongTon
            };

            // Thêm vào danh sách
            ctsp.Add(newCtsp);

            // Lưu danh sách vào session
            HttpContext.Session.SetObjectAsJson("ctspTam", ctsp);

            // Chuyển hướng tới một action khác sau khi thêm thành công
            return RedirectToAction("AddSanPham"); // Hoặc action bạn muốn chuyển hướng đến
        }



        [Route("AddSanPham")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult AddSanPham(SanPhamViewModel model)
        {
            if (model == null || model.Ctsp == null || model.Ctsp.Count == 0)
            {
                var danhMucList = db.DanhMucs.Select(x => x.TenDm).ToList();
                var mauSacList = db.MauSacs.Select(x => x.TenMs).ToList();
                var kichThuocList = db.Sizes.Select(x => x.TenSize).ToList();

                var viewModel = new SanPhamViewModel
                {
                    DanhMucs = danhMucList,
                    Colors = mauSacList,
                    Kichthuocs = kichThuocList
                };
                return View(viewModel);
            }

            var ChitietSPTam = HttpContext.Session.GetObjectFromJson<List<ChiTietSPTamViewModel>>("ctspTam") ?? new List<ChiTietSPTamViewModel>();

            decimal minPrice = decimal.MaxValue;
            decimal maxPrice = decimal.MinValue;

            string newCodeProduct = GenerateUniqueProductCode();
            List<CtspSize> ctspSizes = new List<CtspSize>();
            List<Ctsp> ctsps = new List<Ctsp>();

            SanPham sanpham = null; // Để lưu trữ sản phẩm

            string mausac = "";
            string NewMaCtsp = "";

            foreach (var item in ChitietSPTam)
            {
                if (item.MauSac == mausac)
                {
                    CtspSize ctspSize = new CtspSize
                    {
                        MaCtspSize = GenerateUniqueCtspsCode(),
                        MaCtsp = NewMaCtsp,
                        MaSize = db.Sizes.FirstOrDefault(x => x.TenSize == item.Size).MaSize,
                        Gia = item.Gia,
                        SoLuongTon = item.SoLuongTon
                    };
                    ctspSizes.Add(ctspSize);
                }
                else
                {
                    mausac = item.MauSac;
                    NewMaCtsp = GenerateUniqueCtspCode();
                    Ctsp ctsp = new Ctsp
                    {
                        MaCtsp = NewMaCtsp,
                        MaSp = newCodeProduct,
                        MaMs = db.MauSacs.FirstOrDefault(x => x.TenMs == item.MauSac).MaMs,
                        HinhAnh = item.HinhAnh
                    };
                    ctsps.Add(ctsp);
                }

                // Cập nhật giá min và max
                if (item.Gia < minPrice)
                {
                    minPrice = item.Gia;
                }

                if (item.Gia > maxPrice)
                {
                    maxPrice = item.Gia;
                }
            }

            HttpContext.Session.Remove("ctspTam");

            if (model.HinhanhDD != null && model.HinhanhDD.Length > 0)
            {
                // Lưu hình ảnh vào hệ thống tập tin và lấy đường dẫn hình ảnh
                string hinhAnhDuocLuu = SaveImageToFileSystem(model.HinhanhDD);
                sanpham = new SanPham
                {
                    MaSp = newCodeProduct,
                    HinhAnhDd = hinhAnhDuocLuu,
                    TenSp = model.TenSP,
                    MoTa = model.MoTa,
                    MaDm = model.Madm,
                    MinGia = minPrice,
                    MaxGia = maxPrice
                };
            }

            try
            {
                // Lưu sản phẩm vào cơ sở dữ liệu
                if (sanpham != null)
                {
                    db.SanPhams.Add(sanpham); // Thêm sản phẩm duy nhất
                }

                db.Ctsps.AddRange(ctsps);
                db.CtspSizes.AddRange(ctspSizes);
                db.SaveChanges();

                TempData["SuccessMessage"] = "Sản phẩm đã được thêm thành công!";
            }
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = "Đã xảy ra lỗi: " + ex.Message;
            }

            return RedirectToAction("SanPham");
        }


        private string SaveImageToFileSystem(IFormFile file)
        {
            var uploadsFolder = Path.Combine(Directory.GetCurrentDirectory(), "../../LayoutAdmin/assets/images");
            Directory.CreateDirectory(uploadsFolder); // Tạo thư mục nếu chưa có

            var fileName = Guid.NewGuid().ToString() + Path.GetExtension(file.FileName);
            var filePath = Path.Combine(uploadsFolder, fileName);

            using (var stream = new FileStream(filePath, FileMode.Create))
            {
                file.CopyTo(stream);
            }

            return $"/images/{fileName}"; // Đường dẫn tương đối
        }

        [Route("ChiTietSanPham")]
        [HttpGet]
        public IActionResult ChiTietSanPham()
        {
            return View();
        }
        //Xử lý mã sản phẩm
        [Route("GetMaxProductCode")]
        [HttpGet]
        public string GetMaxProductCode()
        {
            // Lấy mã khách hàng lớn nhất, nếu không có sẽ trả về null
            var maxproductCode = db.SanPhams
                .OrderByDescending(c => c.MaSp)
                .Select(c => c.MaSp)
                .FirstOrDefault();

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
            // Lấy mã khách hàng lớn nhất, nếu không có sẽ trả về null
            var maxCtspsCode = db.CtspSizes
                .OrderByDescending(c => c.MaCtspSize)
                .Select(c => c.MaCtspSize)
                .FirstOrDefault();

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
            string numericPart = maxCtspsCode.Substring(2);
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
                .OrderByDescending(c => c.MaCtsp)
                .Select(c => c.MaCtsp)
                .FirstOrDefault();

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
            string numericPart = maxCtspCode.Substring(2);
            int newNumber = int.Parse(numericPart) + 1;

            return "CTSP" + newNumber.ToString().PadLeft(4, '0');
        }
    }
}
