using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Identity.Client;
using ShopOnline.Models;
using ShopOnline.ViewModels;
namespace ShopOnline.Controllers
{
    public class AccessController : Controller
    {
        QuanLyShopOnlineContext db = new QuanLyShopOnlineContext();
        [HttpGet]
        public IActionResult Login()
        {
            if(HttpContext.Session.GetString("Username") == null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }
        [HttpPost]
        public IActionResult Login(KhachHang user)
        {
            if (HttpContext.Session.GetString("Username") == null)
            {
                var u = db.KhachHangs.Where(x => x.Username.Equals(user.Username) && x.Password.Equals(user.Password)).FirstOrDefault();
                if (u != null)
                {
                    HttpContext.Session.SetString("Username", u.Username.ToString());
                    return RedirectToAction("Index", "Home");
                }
            }
            return View();
        }
        public IActionResult Logout()
        {
            HttpContext.Session.Clear();
            HttpContext.Session.Remove("Username");
            return RedirectToAction("Index", "Home");
        }
        // Xử lý mã khách hàng
        public string GetMaxCustomerCode()
        {
            // Lấy mã khách hàng lớn nhất, nếu không có sẽ trả về null
            var maxCustomerCode = db.KhachHangs
                .OrderByDescending(c => c.MaKh)
                .Select(c => c.MaKh)
                .FirstOrDefault();

            return maxCustomerCode;
        }

        public string GenerateUniqueCustomerCode()
        {
            var maxCustomerCode = GetMaxCustomerCode();

            if (maxCustomerCode == null)
            {
                // Nếu không có mã nào, bắt đầu từ KH001
                return "KH001";
            }

            // Lấy phần số từ mã khách hàng lớn nhất
            string numericPart = maxCustomerCode.Substring(2);
            int newNumber = int.Parse(numericPart) + 1;

            return "KH" + newNumber.ToString();
        }

        // Hiển thị trang đăng ký
        [HttpGet]
        public IActionResult Register()
        {
            return View(new RegisterViewModel());
        }

        // Xử lý đăng ký
        [HttpPost]
        public IActionResult Register(RegisterViewModel model)
        {
            if (ModelState.IsValid)
            {
                var existingUser = db.KhachHangs.FirstOrDefault(x => x.Username == model.Username);
                var existingEmail = db.KhachHangs.FirstOrDefault(x => x.Email == model.Email);

                if (existingUser == null && existingEmail == null)
                {
                    // Tạo mã khách hàng mới
                    string newCustomerCode = GenerateUniqueCustomerCode();
                    var user = new KhachHang
                    {
                        MaKh = newCustomerCode, // Gán mã khách hàng mới
                        HovaTen = model.FullName,
                        GioiTinh = model.Gender,
                        NgaySinh = DateOnly.FromDateTime(model.DateOfBirth), // Chuyển đổi nếu cần
                        Sdt = model.PhoneNumber,
                        Email = model.Email,
                        DiaChi = string.IsNullOrWhiteSpace(model.Address) ? null : model.Address,
                        Username = model.Username,
                        Password = model.Password // Mã hóa mật khẩu
                    };
                    try
                    {
                        db.KhachHangs.Add(user);
                        db.SaveChanges();
                        TempData["SuccessMessage"] = "Đăng ký thành công! Vui lòng đăng nhập.";
                        return RedirectToAction("Login");
                    }
                    catch (Exception ex)
                    {
                        // Xử lý ngoại lệ (có thể log lỗi hoặc thông báo cho người dùng)
                        ModelState.AddModelError("", "Đã có lỗi xảy ra, vui lòng thử lại.");
                    }
                }
                else
                {
                    if (existingUser != null)
                        ModelState.AddModelError("Username", "Username đã tồn tại.");
                    if (existingEmail != null)
                        ModelState.AddModelError("Email", "Email đã được sử dụng.");
                }
            }
            return View(model);
        }

    }
}
