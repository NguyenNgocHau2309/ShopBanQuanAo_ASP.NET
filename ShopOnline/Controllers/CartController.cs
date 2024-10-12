using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore.Migrations;
using ShopOnline.Models;
using ShopOnline.ViewModels;
using System.Drawing;
using ShopOnline.Extensions;
using System.Drawing.Imaging;

namespace ShopOnline.Controllers
{
    public class CartController : Controller
    {
        QuanLyShopOnlineContext db = new QuanLyShopOnlineContext();


        [HttpPost]
        public IActionResult AddToCart(string productId, string mams, string masize, int quantity, decimal Gia)
        {
            var username = HttpContext.Session.GetString("Username");
            if (username != null)
            {
                string makh = db.KhachHangs.Where(x => x.Username == username).Select(x => x.MaKh).FirstOrDefault();
                AddItemToCart(makh, productId, quantity, mams, masize, Gia);
                TransferTempCartToDatabase(makh);
                return Json(new { success = true, message = "Sản phẩm đã được thêm vào giỏ hàng của bạn." });
            }
            else
            {
                var tempCart = HttpContext.Session.GetObjectFromJson<List<CartItemViewModel>>("TempCart") ?? new List<CartItemViewModel>();

                //Kiểm tra xem sản phẩm đã có trong giỏ hàng tạm thời chưa
               var existingItem = tempCart.FirstOrDefault(c => c.ProductId == productId && c.Color == GetColorName(mams) && c.Size == GetSizeName(masize));

                if (existingItem != null)
                {
                    //Nếu sản phẩm đã có, cập nhật số lượng
                        existingItem.Quantity += quantity;
                }
                else
                {
                    //Nếu sản phẩm chưa có, thêm mới vào giỏ hàng tạm
                        tempCart.Add(new CartItemViewModel
                        {
                            ProductId = productId,
                            Color = GetColorName(mams),
                            Size = GetSizeName(masize),
                            ProductName = GetProductName(productId),
                            AnhSP = GetProductImage(productId),
                            Quantity = quantity,
                            UnitPrice = Gia
                        });
                }
                HttpContext.Session.SetObjectAsJson("TempCart", tempCart);

                return Json(new { success = true, message = "Sản phẩm đã được thêm vào giỏ hàng tạm thời." });
            }
        }

        private void AddItemToCart(string customerID, string productId, int quantity, string colorCode, string sizeCode, decimal gia)
        {

            var cartItem = db.GioHangs.FirstOrDefault(c => c.MaSP == productId && c.MaMS == colorCode && c.MaS == sizeCode && c.MaKH == customerID);

            if (cartItem == null)
            {
                var newCartItem = new GioHang
                {
                    MaKH = customerID,
                    MaSP = productId,
                    MaMS = colorCode,
                    MaS = sizeCode,
                    SoLuong = quantity,
                    Gia = gia
                };

                db.GioHangs.Add(newCartItem);
                db.SaveChanges();
            }
            else
            {
                cartItem.SoLuong += quantity;

                //Cập nhật sản phẩm trong cơ sở dữ liệu
                db.GioHangs.Update(cartItem);
                db.SaveChanges();
            }

        }


        private void TransferTempCartToDatabase(string customerID)
        {
            //Lấy giỏ hàng tạm thời từ session
           var tempCart = HttpContext.Session.GetObjectFromJson<List<CartItemViewModel>>("TempCart") ?? new List<CartItemViewModel>();

            foreach (var item in tempCart)
            {
                var selectedColor = db.MauSacs.FirstOrDefault(c => c.TenMs == item.Color);
                var selectedSize = db.Sizes.FirstOrDefault(c => c.TenSize == item.Size);

                string color = selectedColor.MaMs;
                string size = selectedSize.MaSize;

                AddItemToCart(customerID, item.ProductId, item.Quantity, color, size, item.UnitPrice);
            }
            
            //Xóa giỏ hàng tạm sau khi đã lưu vào CSDL
            HttpContext.Session.Remove("TempCart");
        }

        [HttpGet]
        public IActionResult GioHang()
        {
            var username = HttpContext.Session.GetString("Username");
            List<CartItemViewModel> cartItems;
            var tempCart = HttpContext.Session.GetObjectFromJson<List<CartItemViewModel>>("TempCart") ?? new List<CartItemViewModel>();
            if (username == null)
            {
                if (!tempCart.Any())
                {
                    ViewBag.Message = "Giỏ hàng tạm của bạn đang trống.";
                }

                cartItems = tempCart;
            }
            else
            {
                string maKH = db.KhachHangs.Where(x => x.Username == username).Select(x => x.MaKh).FirstOrDefault();
                if (tempCart.Any())
                {
                    TransferTempCartToDatabase(maKH);

                }

                //Lấy giỏ hàng của khách hàng
                    var customerCart = db.GioHangs.Where(item => item.MaKH == maKH).ToList();

                cartItems = customerCart.Select(item => new CartItemViewModel
                {
                    ProductId = item.MaSP,
                    ProductName = GetProductName(item.MaSP),
                    AnhSP = GetProductImage(item.MaSP),
                    Color = GetColorName(item.MaMS),
                    Size = GetSizeName(item.MaS),
                    Quantity = item.SoLuong,
                    UnitPrice = item.Gia
                }).ToList();
                if (!cartItems.Any())
                {
                    ViewBag.Message = "Giỏ hàng của bạn đang trống.";
                }
            }
            return View(cartItems);
        }
        private string GetProductName(string productId)
        {
            return db.SanPhams.FirstOrDefault(p => p.MaSp == productId)?.TenSp ?? "Unknown Product";
        }
        private string GetProductImage(string productId)
        {
            return db.SanPhams.FirstOrDefault(p => p.MaSp == productId)?.HinhAnhDd ?? "Unknown Image";
        }
        private string GetColorName(string colorId)
        {
            return db.MauSacs.FirstOrDefault(p => p.MaMs == colorId)?.TenMs ?? "Unknown Color";
        }

        private string GetSizeName(string SizeId)
        {
            return db.Sizes.FirstOrDefault(p => p.MaSize == SizeId)?.TenSize ?? "Unknown Size";
        }



        //Xóa sản phẩm
        [HttpPost]
        public IActionResult DeleteToCart(string productId, string mams, string masize)
        {
            var username = HttpContext.Session.GetString("Username");
            var selectedColor = db.MauSacs.FirstOrDefault(c => c.TenMs == mams);
            var selectedSize = db.Sizes.FirstOrDefault(c => c.TenSize == masize);

            string color = selectedColor.MaMs;
            string size = selectedSize.MaSize;

            if (username != null)
            {
                string makh = db.KhachHangs.Where(x => x.Username == username).Select(x => x.MaKh).FirstOrDefault();
                bool result = DeleteItemFromCart(makh, productId,color, size);
                if (result)
                {
                    return Json(new { success = true, message = "Sản phẩm trong giỏ hàng của bạn đã được xóa." });
                }
                else
                {
                    return Json(new { success = false, message = "Không tìm thấy sản phẩm trong giỏ hàng của bạn." });
                }
            }
            else
            {
                // Xử lý khi người dùng chưa đăng nhập và sử dụng giỏ hàng tạm thời
                var tempCart = HttpContext.Session.GetObjectFromJson<List<CartItemViewModel>>("TempCart") ?? new List<CartItemViewModel>();
                var existingItem = tempCart.FirstOrDefault(c => c.ProductId == productId && c.Color == mams && c.Size == masize);

                if (existingItem != null)
                {
                    tempCart.Remove(existingItem);
                    HttpContext.Session.SetObjectAsJson("TempCart", tempCart);
                    return Json(new { success = true, message = "Sản phẩm trong giỏ hàng tạm thời đã được xóa." });
                }
                else
                {
                    return Json(new { success = false, message = "Không tìm thấy sản phẩm trong giỏ hàng tạm thời." });
                }
            }
        }

        private bool DeleteItemFromCart(string customerID, string productId, string colorCode, string sizeCode)
        {
            // Tìm sản phẩm trong giỏ hàng của khách hàng
            var cartItem = db.GioHangs.FirstOrDefault(c =>
                c.MaKH == customerID &&
                c.MaSP == productId &&
                c.MaMS == colorCode &&
                c.MaS == sizeCode);

            if (cartItem != null)
            {
                db.GioHangs.Remove(cartItem);
                db.SaveChanges();
                return true;
            }
            return false; // Trả về false nếu không tìm thấy sản phẩm
        }


        //Chỉnh sửa tăng giảm số lượng - update lại giỏ hàng

        [HttpPost]
        public IActionResult In_Decrease_Quantity(string productId, string mams, string masize, int quantity)
        {
            var username = HttpContext.Session.GetString("Username");
            var selectedColor = db.MauSacs.FirstOrDefault(c => c.TenMs == mams);
            var selectedSize = db.Sizes.FirstOrDefault(c => c.TenSize == masize);

            string color = selectedColor.MaMs;
            string size = selectedSize.MaSize;

            // Tìm sản phẩm trong giỏ hàng
            var cartItem = db.GioHangs.FirstOrDefault(c => c.MaSP == productId && c.MaMS == color && c.MaS == size);

            if (username != null)
            {
                // Người dùng đã đăng nhập
                if (cartItem != null)
                {
                    cartItem.SoLuong = quantity; // Cập nhật số lượng
                    db.GioHangs.Update(cartItem);
                    db.SaveChanges();
                    return Json(new { success = true, message = "Số lượng sản phẩm đã được cập nhật." });
                }
                else
                {
                    return Json(new { success = false, message = "Không tìm thấy sản phẩm trong giỏ hàng của bạn." });
                }
            }
            else
            {
                // Người dùng chưa đăng nhập, sử dụng giỏ hàng tạm thời
                var tempCart = HttpContext.Session.GetObjectFromJson<List<CartItemViewModel>>("TempCart") ?? new List<CartItemViewModel>();
                var existingItem = tempCart.FirstOrDefault(c => c.ProductId == productId && c.Color == mams && c.Size == masize);

                if (existingItem != null)
                {
                    existingItem.Quantity = quantity; // Cập nhật số lượng
                    HttpContext.Session.SetObjectAsJson("TempCart", tempCart);
                    return Json(new { success = true, message = "Số lượng sản phẩm trong giỏ hàng tạm thời đã được cập nhật." });
                }
                else
                {
                    return Json(new { success = false, message = "Không tìm thấy sản phẩm trong giỏ hàng tạm thời." });
                }
            }
        }

        //Tổng tiền để thanh toán
        [HttpPost]
        public JsonResult GetTotalPay()
        {
            var tempTotal = HttpContext.Session.GetObjectFromJson<List<CartSummaryViewModel>>("TempTotal") ?? new List<CartSummaryViewModel>();
            decimal totalAmount = 0;
            var username = HttpContext.Session.GetString("Username");

            if (username == null)
            {
                var tempCart = HttpContext.Session.GetObjectFromJson<List<CartItemViewModel>>("TempCart") ?? new List<CartItemViewModel>();
                if (tempCart.Count > 0)
                {
                    totalAmount = tempCart.Sum(c => c.Quantity * c.UnitPrice);
                }
            }
            else
            {
                var cartItems = db.GioHangs.Where(c => c.MaKH == username).ToList();
                if (cartItems.Count > 0)
                {
                    totalAmount = cartItems.Sum(c => c.SoLuong * c.Gia);
                }
            }

            return Json(new { totalPay = totalAmount });
        }


        [HttpPost]
        public JsonResult GetQuantityCart()
        {
            decimal quantity = 0;
            var username = HttpContext.Session.GetString("Username");

            if (username == null)
            {
                var tempCart = HttpContext.Session.GetObjectFromJson<List<CartItemViewModel>>("TempCart") ?? new List<CartItemViewModel>();
               
                foreach (var item in tempCart)
                {
                    quantity += 1;
                }

            }
            else
            {
                var cartItems = db.GioHangs.Where(c => c.MaKH == username).ToList();
                foreach (var item in cartItems)
                {
                    quantity += 1;
                }
            }

            return Json(new {quantityCart = quantity });
        }

    }
}
