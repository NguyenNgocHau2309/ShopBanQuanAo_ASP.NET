using Microsoft.AspNetCore.Mvc;
using ShopOnline.Models;
using ShopOnline.Models.Authentication;
using ShopOnline.ViewModels;
using System;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace ShopOnline.Controllers
{
    public class EvaluateController : Controller
    {
        QuanLyShopOnlineContext db = new QuanLyShopOnlineContext();
        [Authentication]
        [HttpGet]
        public IActionResult DanhGia(string macts, string madh)
        {
            ViewBag.MaCtspSize = macts;
            ViewBag.MaDh = madh;
            return View();
        }
        [HttpPost]
        public IActionResult DanhGia(EvaluateViewModel model)
        {

            var username = HttpContext.Session.GetString("Username");
            var makh = db.KhachHangs
                        .Where(c => c.Username == username)
                        .Select(c => c.MaKh)
                        .FirstOrDefault();
            bool isExist = db.DanhGia.Any(d => d.MaDh == model.madh && d.MaCtspSize == model.macts);
            if (isExist)
            {
                ViewBag.Message = "Bạn đã đánh giá sản phẩm này cho đơn hàng này rồi.";
                return RedirectToAction("DanhGia", "Evaluate");
            }
            // Tạo mã đánh giá mới
            string newcodeEvaluate = GenerateUniqueEvaluateCode();

            // Tạo đối tượng DanhGia và gán dữ liệu
            var danhgia = new DanhGia
            {
                MaDg = newcodeEvaluate,
                MaDh = model.madh,
                MaCtspSize = model.macts,
                NoiDung = model.noidung,
                DiemSao = model.diem,
                NgayDg = DateOnly.FromDateTime(DateTime.Today),
            };

            // Thêm đối tượng danhgia vào DbSet
            db.DanhGia.Add(danhgia);

            // Đường dẫn thư mục để lưu hình ảnh trong LayoutShop/img
            var uploadFolder = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "LayoutShop", "img");

            // Kiểm tra và tạo thư mục nếu chưa có
            if (!Directory.Exists(uploadFolder))
            {
                Directory.CreateDirectory(uploadFolder);
            }

            // Lưu hình ảnh đánh giá
            if (model.anh != null && model.anh.Count > 0)
            {
                foreach (var file in model.anh)
                {
                    if (file != null && file.Length > 0)
                    {
                        string fileName = Path.GetFileName(file.FileName);  // Lấy tên file
                        string filePath = Path.Combine(uploadFolder, fileName);

                        // Lưu tệp vào thư mục
                        using (var stream = new FileStream(filePath, FileMode.Create))
                        {
                            file.CopyTo(stream);
                        }

                        // Tạo đối tượng HinhAnh và lưu vào cơ sở dữ liệu
                        var HinhAnh = new HinhAnhDanhGium
                        {
                            MaHinhAnh = GenerateUniquePictureCode(),
                            MaDg = newcodeEvaluate,
                            DuongDan = "/LayoutShop/img/" + fileName
                        };
                        db.HinhAnhDanhGia.Add(HinhAnh);
                        db.SaveChanges();
                    }
                }
            }

            // Lưu video đánh giá (tương tự như xử lý hình ảnh)
            if (model.video != null && model.video.Count > 0)
            {
                foreach (var file in model.video)
                {
                    if (file != null && file.Length > 0)
                    {
                        string fileName = Path.GetFileName(file.FileName);
                        string filePath = Path.Combine(uploadFolder, fileName);

                        using (var stream = new FileStream(filePath, FileMode.Create))
                        {
                            file.CopyTo(stream);
                        }

                        var Video = new VideoDanhGium
                        {
                            MaVideo = GenerateUniqueVideoCode(),
                            MaDg = newcodeEvaluate,
                            DuongDan = "/LayoutShop/img/" + fileName
                        };
                        db.VideoDanhGia.Add(Video);
                        db.SaveChanges();
                    }
                }
            }

            // Lưu các thay đổi vào cơ sở dữ liệu
            db.SaveChanges();

            string mact = db.CtspSizes.FirstOrDefault(x => x.MaCtspSize == model.macts).MaCtsp;
            string masp = db.Ctsps.FirstOrDefault(x => x.MaCtsp == mact).MaSp;
            return RedirectToAction("ChiTietSP", "DetailProduct", new { masp = masp, activeTab = "tab-pane-3" });
        }


        //Tạo mã đánh giá
        public string GetMaxEvaluateCode()
        {
            // Lấy mã khách hàng lớn nhất, nếu không có sẽ trả về null
            var maxEvaluateCode = db.DanhGia
                .OrderByDescending(c => c.MaDg)
                .Select(c => c.MaDg)
                .FirstOrDefault();

            return maxEvaluateCode;
        }
        private string GenerateUniqueEvaluateCode()
        {
            var maxEvaluateCode = GetMaxEvaluateCode();

            if (maxEvaluateCode == null)
            {
                // Nếu không có mã nào, bắt đầu từ DH001
                return "DG001";
            }

            // Lấy phần số từ mã đơn hàng lớn nhất
            string numericPart = maxEvaluateCode.Substring(2);
            int newNumber = int.Parse(numericPart) + 1;

            return "DG" + newNumber.ToString().PadLeft(3, '0');
        }
        //Tạo mã hình ảnh
        public string GetMaxPictureCode()
        {
            // Lấy mã khách hàng lớn nhất, nếu không có sẽ trả về null
            var maxPictureCode = db.HinhAnhDanhGia
                .OrderByDescending(c => c.MaHinhAnh)
                .Select(c => c.MaHinhAnh)
                .FirstOrDefault();

            return maxPictureCode;
        }
        private string GenerateUniquePictureCode()
        {
            var maxPictureCode = GetMaxPictureCode();

            if (maxPictureCode == null)
            {
                // Nếu không có mã nào, bắt đầu từ DH001
                return "HA001";
            }

            // Lấy phần số từ mã đơn hàng lớn nhất
            string numericPart = maxPictureCode.Substring(2);
            int newNumber = int.Parse(numericPart) + 1;

            return "HA" + newNumber.ToString().PadLeft(3, '0');
        }
        //Tạo mã video
        public string GetMaxVideoCode()
        {
            // Lấy mã khách hàng lớn nhất, nếu không có sẽ trả về null
            var maxVideoCode = db.VideoDanhGia
                .OrderByDescending(c => c.MaVideo)
                .Select(c => c.MaVideo)
                .FirstOrDefault();

            return maxVideoCode;
        }
        private string GenerateUniqueVideoCode()
        {
            var maxVideoCode = GetMaxVideoCode();

            if (maxVideoCode == null)
            {
                // Nếu không có mã nào, bắt đầu từ DH001
                return "VD001";
            }

            // Lấy phần số từ mã đơn hàng lớn nhất
            string numericPart = maxVideoCode.Substring(2);
            int newNumber = int.Parse(numericPart) + 1;

            return "VD" + newNumber.ToString().PadLeft(3, '0');
        }
        //Sửa đánh giá
        [HttpGet]
        [Authentication]
        public IActionResult EditDanhGia(string madg)
        {
            // Tìm đánh giá theo mã
            var danhGia = db.DanhGia.FirstOrDefault(d => d.MaDg == madg);
            if (danhGia == null)
            {
                return NotFound(); // Nếu không tìm thấy đánh giá
            }

            // Tạo ViewModel để hiển thị trong form
            var model = new EvaluateViewModel
            {
                madg = danhGia.MaDg, 
                madh = danhGia.MaDh,
                macts = danhGia.MaCtspSize,
                noidung = danhGia.NoiDung,
                diem = danhGia.DiemSao
            };

            return View(model);
        }

        [HttpPost]
        public IActionResult EditDanhGia(EvaluateViewModel model)
        {
            // Kiểm tra đánh giá tồn tại
            var danhGia = db.DanhGia.FirstOrDefault(d => d.MaDg == model.madg);
            if (danhGia == null)
            {
                return NotFound();
            }

            // Cập nhật thông tin đánh giá
            danhGia.NoiDung = model.noidung;
            danhGia.DiemSao = model.diem;
            danhGia.NgayDg = DateOnly.FromDateTime(DateTime.Today); // Cập nhật ngày đánh giá

            // Xử lý hình ảnh
            var uploadFolder = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "LayoutShop", "img");

            // Kiểm tra và tạo thư mục nếu chưa có
            if (!Directory.Exists(uploadFolder))
            {
                Directory.CreateDirectory(uploadFolder);
            }

            // Lưu hình ảnh đánh giá mới nếu có
            if (model.anh != null && model.anh.Count > 0)
            {
                foreach (var file in model.anh)
                {
                    if (file != null && file.Length > 0)
                    {
                        string fileName = Path.GetFileName(file.FileName); // Lấy tên file
                        string filePath = Path.Combine(uploadFolder, fileName);

                        // Lưu tệp vào thư mục
                        using (var stream = new FileStream(filePath, FileMode.Create))
                        {
                            file.CopyTo(stream);
                        }

                        // Tạo đối tượng HinhAnh và lưu vào cơ sở dữ liệu
                        var hinhAnh = new HinhAnhDanhGium
                        {
                            MaHinhAnh = GenerateUniquePictureCode(),
                            MaDg = model.madg,
                            DuongDan = "/LayoutShop/img/" + fileName
                        };
                        db.HinhAnhDanhGia.Add(hinhAnh);
                    }
                }
            }

            // Lưu video đánh giá mới nếu có
            if (model.video != null && model.video.Count > 0)
            {
                foreach (var file in model.video)
                {
                    if (file != null && file.Length > 0)
                    {
                        string fileName = Path.GetFileName(file.FileName);
                        string filePath = Path.Combine(uploadFolder, fileName);

                        using (var stream = new FileStream(filePath, FileMode.Create))
                        {
                            file.CopyTo(stream);
                        }

                        var video = new VideoDanhGium
                        {
                            MaVideo = GenerateUniqueVideoCode(),
                            MaDg = model.madg,
                            DuongDan = "/LayoutShop/img/" + fileName
                        };
                        db.VideoDanhGia.Add(video);
                    }
                }
            }

            // Lưu các thay đổi vào cơ sở dữ liệu
            db.SaveChanges();

            // Chuyển hướng về trang chi tiết sản phẩm
            string mact = db.CtspSizes.FirstOrDefault(x => x.MaCtspSize == model.macts).MaCtsp;
            string masp = db.Ctsps.FirstOrDefault(x => x.MaCtsp == mact).MaSp;
            return RedirectToAction("ChiTietSP", "DetailProduct", new { masp = masp, activeTab = "tab-pane-3" });
        }
        public IActionResult DeleteDanhGia(string madg)
        {
            var danhGia = db.DanhGia.FirstOrDefault(d => d.MaDg == madg);

            if (danhGia == null)
            {
                return NotFound();
            }

            // Lấy danh sách hình ảnh và video liên quan đến đánh giá
            var hinhAnhs = db.HinhAnhDanhGia.Where(x => x.MaDg == danhGia.MaDg).ToList();
            var videos = db.VideoDanhGia.Where(x => x.MaDg == danhGia.MaDg).ToList();

            // Xóa tất cả hình ảnh liên quan
            foreach (var hinhAnh in hinhAnhs)
            {
                db.HinhAnhDanhGia.Remove(hinhAnh);
            }

            // Xóa tất cả video liên quan
            foreach (var video in videos)
            {
                db.VideoDanhGia.Remove(video);
            }

            // Xóa đánh giá khỏi cơ sở dữ liệu
            db.DanhGia.Remove(danhGia);
            db.SaveChanges();

            return RedirectToAction("ThongTinCaNhan", "Personal", new { activeTab = "reviews" });
        }


    }
}
