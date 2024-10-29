using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore.Migrations;
using ShopOnline.Models;
using ShopOnline.ViewModels;
using System.Drawing;
using ShopOnline.Extensions;
using System.Drawing.Imaging;
using Microsoft.CodeAnalysis;
using System.Security.Policy;
using System;
using ShopOnline.Models.Authentication;
using Microsoft.IdentityModel.Tokens;
using System.Linq;

namespace ShopOnline.Controllers
{
    public class CartController : Controller
    {
        QuanLyShopOnlineContext db = new QuanLyShopOnlineContext();
        public string MaKH { get; private set; }
        [HttpPost]
        public IActionResult AddToCart(string productId, string mams, string masize, int quantity, decimal Gia)
        {
            var username = HttpContext.Session.GetString("Username");
            if (username != null)
            {
                string makh = db.KhachHangs.Where(x => x.Username == username).Select(x => x.MaKh).FirstOrDefault();
                string errorMessage = AddItemToCart(makh, productId, quantity, mams, masize, Gia);

                if (errorMessage != null)
                {
                    return Json(new { success = false, message = errorMessage });
                }

                //TransferTempCartToDatabase(makh);
                return Json(new { success = true, message = "Sản phẩm đã được thêm vào giỏ hàng của bạn." });
            }
            else
            {
                //var tempCart = HttpContext.Session.GetObjectFromJson<List<CartItemViewModel>>("TempCart") ?? new List<CartItemViewModel>();

                ////Kiểm tra xem sản phẩm đã có trong giỏ hàng tạm thời chưa
                //var existingItem = tempCart.FirstOrDefault(c => c.ProductId == productId && c.Color == LayTenMS(mams) && c.Size == LayTenSize(masize));

                //if (existingItem != null)
                //{
                //    //Nếu sản phẩm đã có, cập nhật số lượng
                //    existingItem.Quantity += quantity;
                //}
                //else
                //{
                //    //Nếu sản phẩm chưa có, thêm mới vào giỏ hàng tạm
                //    tempCart.Add(new CartItemViewModel
                //    {
                //        ProductId = productId,
                //        Color = LayTenMS(mams),
                //        Size = LayTenSize(masize),
                //        ProductName = LayTenSP(productId),
                //        AnhSP = LayHaSP(productId),
                //        Quantity = quantity,
                //        UnitPrice = Gia
                //    });
                //}
                //HttpContext.Session.SetObjectAsJson("TempCart", tempCart);

                return Json(new { success = true, message = "Hãy đăng nhập để thêm vào giỏ hàng." });
            }
        }
        ////đây chỉ sử dụng cho add giỏ hàng tạm thôi
        //private string LayTenSP(string productId)
        //{
        //    return db.SanPhams.FirstOrDefault(p => p.MaSp == productId)?.TenSp ?? "Unknown Product";
        //}
        //private string LayHaSP(string productId)
        //{
        //    return db.SanPhams.FirstOrDefault(p => p.MaSp == productId)?.HinhAnhDd ?? "Unknown Image";
        //}
        //private string LayTenMS(string colorId)
        //{
        //    return db.MauSacs.FirstOrDefault(p => p.MaMs == colorId)?.TenMs ?? "Unknown Color";
        //}

        //private string LayTenSize(string SizeId)
        //{
        //    return db.Sizes.FirstOrDefault(p => p.MaSize == SizeId)?.TenSize ?? "Unknown Size";
        //}

        private string AddItemToCart(string customerID, string productId, int quantity, string colorCode, string sizeCode, decimal gia)
        {
            string CartID = db.GioHangs.Where(x => x.MaKH == customerID).Select(x => x.MaGH).FirstOrDefault();
            var ctsp = db.Ctsps.Where(x => x.MaSp == productId && x.MaMs == colorCode).ToList();
            string ctsps = null;

            foreach (var item in ctsp)
            {
                ctsps = db.CtspSizes.Where(x => x.MaCtsp == item.MaCtsp && x.MaSize == sizeCode).Select(x => x.MaCtspSize).FirstOrDefault();
                if (ctsps != null) break;
            }

            if (ctsps == null)
            {
                return "Sản phẩm không tồn tại trong kích thước và màu sắc được chọn.";
            }

            var cartItem = db.Ctghs.FirstOrDefault(x => x.MaGH == CartID && x.MaCTSP_Size == ctsps);
            var ctspSize = db.CtspSizes.FirstOrDefault(x => x.MaCtspSize == ctsps);

            if (ctspSize == null || ctspSize.SoLuongTon <= 0)
            {
                return "Sản phẩm đã hết hàng";
            }
            else if (ctspSize.SoLuongTon < (cartItem?.SoLuong ?? 0) + quantity)
            {
                return $"Số lượng sản phẩm chỉ còn {ctspSize.SoLuongTon - (cartItem?.SoLuong ?? 0)}";
            }
            else
            {
                if (cartItem == null)
                {
                    var newCartItem = new Ctgh
                    {
                        MaGH = CartID,
                        MaCTSP_Size = ctsps,
                        SoLuong = quantity
                    };
                    db.Ctghs.Add(newCartItem);
                }
                else
                {
                    cartItem.SoLuong += quantity;
                    db.Ctghs.Update(cartItem);
                }
                db.SaveChanges();
            }
            return null;
        }


        //private void TransferTempCartToDatabase(string customerID)
        //{
        //    //Lấy giỏ hàng tạm thời từ session
        //   var tempCart = HttpContext.Session.GetObjectFromJson<List<CartItemViewModel>>("TempCart") ?? new List<CartItemViewModel>();

        //    foreach (var item in tempCart)
        //    {
        //        var selectedColor = db.MauSacs.FirstOrDefault(c => c.TenMs == item.Color);
        //        var selectedSize = db.Sizes.FirstOrDefault(c => c.TenSize == item.Size);

        //        string color = selectedColor.MaMs;
        //        string size = selectedSize.MaSize;

        //        AddItemToCart(customerID, item.ProductId, item.Quantity, color, size, item.UnitPrice);
        //    }
            
        //    //Xóa giỏ hàng tạm sau khi đã lưu vào CSDL
        //    HttpContext.Session.Remove("TempCart");
        //}

        [HttpGet]
        public IActionResult GioHang()
        {
            var username = HttpContext.Session.GetString("Username");
            List<CartItemViewModel> cartItems = new List<CartItemViewModel>(); 
            //var tempCart = HttpContext.Session.GetObjectFromJson<List<CartItemViewModel>>("TempCart") ?? new List<CartItemViewModel>();

            //if (username == null)
            //{
            //    if (!tempCart.Any())
            //    {
            //        ViewBag.Message = "Giỏ hàng tạm của bạn đang trống.";
            //    }
            //    else
            //    {
            //        cartItems = tempCart; 
            //    }
            //}
            //else
            //{
                string maKH = db.KhachHangs.Where(x => x.Username == username).Select(x => x.MaKh).FirstOrDefault();

            //if (tempCart.Any())
            //{
            //    TransferTempCartToDatabase(maKH);
            //}
            decimal giamGia = 0;
            List<string> quaTang = new List<string>();
            var customerCart = db.GioHangs.FirstOrDefault(item => item.MaKH == maKH);
            if (customerCart != null)
            {
                var cartItemList = db.Ctghs.Where(x => x.MaGH == customerCart.MaGH).ToList();
                if (cartItemList.Any())
                {
                    decimal tong = 0;
                    foreach (var item in cartItemList)
                    {
                        var cartItemViewModel = new CartItemViewModel
                        {
                            ProductId = GetProductID(item.MaCTSP_Size),
                            ProductName = GetProductName(item.MaCTSP_Size),
                            AnhSP = GetProductImage(item.MaCTSP_Size),
                            Color = GetColorName(item.MaCTSP_Size),
                            Size = GetSizeName(item.MaCTSP_Size),
                            Quantity = item.SoLuong,
                            UnitPrice = Gia(item.MaCTSP_Size)
                        };
                        tong += cartItemViewModel.UnitPrice;

                        cartItems.Add(cartItemViewModel);
                        var discountResultProducts = CheckDiscountProduct(cartItemViewModel.ProductId, cartItemViewModel.UnitPrice, cartItemViewModel.Quantity);
                        giamGia += discountResultProducts.Dicount;

                        string gift = discountResultProducts.Gift;
                        if (!string.IsNullOrEmpty(gift) && !quaTang.Contains(gift))
                        {
                            quaTang.Add(gift);
                        }
                    }
                    var discountResultCart = CheckDiscountCart(tong);
                    giamGia += discountResultCart.GiamGia;
                    List<string> QT = discountResultCart.QuaTang;
                    if (QT.Any())
                    {
                        foreach (string item in QT)
                        {
                            if (!string.IsNullOrEmpty(item) && !quaTang.Contains(item))
                            {
                                quaTang.Add(item);
                            }
                        }
                    }
                }
                if (!cartItems.Any())
                {
                    ViewBag.Message = "Giỏ hàng của bạn đang trống.";
                }
            }
            //}
            ViewBag.GiamGia = giamGia;
            ViewBag.QuaTang = quaTang;
            return View(cartItems);
        }
        private string GetProductID (string mactsps)
        {
            string mactsp = db.CtspSizes.FirstOrDefault(x => x.MaCtspSize == mactsps).MaCtsp;
            return db.Ctsps.FirstOrDefault(p => p.MaCtsp == mactsp).MaSp;
        }
        private string GetProductName(string mactsps)
        {
            string mactsp = db.CtspSizes.FirstOrDefault(x => x.MaCtspSize == mactsps).MaCtsp;
            string masp = db.Ctsps.FirstOrDefault(p => p.MaCtsp == mactsp).MaSp;
            return db.SanPhams.FirstOrDefault(p => p.MaSp == masp).TenSp;
        }
        private string GetProductImage(string mactsps)
        {
            string mactsp = db.CtspSizes.FirstOrDefault(x => x.MaCtspSize == mactsps).MaCtsp;
            string masp = db.Ctsps.FirstOrDefault(p => p.MaCtsp == mactsp).MaSp ;
            return db.SanPhams.FirstOrDefault(p => p.MaSp == masp).HinhAnhDd;
        }
        private string GetColorName(string mactsps)
        {
            string mactsp = db.CtspSizes.FirstOrDefault(x => x.MaCtspSize == mactsps).MaCtsp;
            string mams = db.Ctsps.FirstOrDefault(p => p.MaCtsp == mactsp).MaMs ;
            return db.MauSacs.FirstOrDefault(p => p.MaMs == mams).TenMs;
        }

        private string GetSizeName(string mactsps)
        {
            string mas = db.CtspSizes.FirstOrDefault(p => p.MaCtspSize== mactsps).MaSize;
            return db.Sizes.FirstOrDefault(p => p.MaSize == mas).TenSize;
        }
        private decimal Gia(string mactsps)
        {
            var ctspSize = db.CtspSizes.FirstOrDefault(p => p.MaCtspSize == mactsps);
            return ctspSize?.Gia ?? 0; 
        }



        //Xóa sản phẩm
        [HttpPost]
        public IActionResult DeleteToCart(string productId, string mams, string masize)
        {
            var username = HttpContext.Session.GetString("Username");
            string colorid = db.MauSacs.FirstOrDefault(c => c.TenMs == mams).MaMs;
            string sizeid = db.Sizes.FirstOrDefault(c => c.TenSize == masize).MaSize;

            string mactsp = db.Ctsps.FirstOrDefault(x => x.MaSp == productId && x.MaMs == colorid).MaCtsp;
            string mactsps = db.CtspSizes.FirstOrDefault(x => x.MaCtsp == mactsp && x.MaSize == sizeid).MaCtspSize;

            //if (username != null)
            //{
            string makh = db.KhachHangs.Where(x => x.Username == username).Select(x => x.MaKh).FirstOrDefault();
            string magh = db.GioHangs.FirstOrDefault(x => x.MaKH == makh).MaGH;
            bool result = DeleteItemFromCart(magh, mactsps);
            if (result)
            {
                return RedirectToAction("GioHang", "Cart"); ;
            }
            else
            {
                 TempData["message"]  = "Không tìm thấy sản phẩm trong giỏ hàng của bạn.";
                return RedirectToAction("GioHang", "Cart");
            }
            //}
            //else
            //{
            //    // Xử lý khi người dùng chưa đăng nhập và sử dụng giỏ hàng tạm thời
            //    var tempCart = HttpContext.Session.GetObjectFromJson<List<CartItemViewModel>>("TempCart") ?? new List<CartItemViewModel>();
            //    var existingItem = tempCart.FirstOrDefault(c => c.ProductId == productId && c.Color == mams && c.Size == masize);

            //    if (existingItem != null)
            //    {
            //        tempCart.Remove(existingItem);
            //        HttpContext.Session.SetObjectAsJson("TempCart", tempCart);
            //        return Json(new { success = true, message = "Sản phẩm trong giỏ hàng tạm thời đã được xóa." });
            //    }
            //    else
            //    {
            //        return Json(new { success = false, message = "Không tìm thấy sản phẩm trong giỏ hàng tạm thời." });
            //    }
            //}
        }

        private bool DeleteItemFromCart(string magh, string mactsps)
        {
            // Tìm sản phẩm trong giỏ hàng của khách hàng
            var cartItem = db.Ctghs.FirstOrDefault(c =>
                c.MaGH == magh &&
                c.MaCTSP_Size == mactsps);

            if (cartItem != null)
            {
                db.Ctghs.Remove(cartItem);
                db.SaveChanges();
                return true;
            }
            return false; // Trả về false nếu không tìm thấy sản phẩm
        }
        // Xử lý mã Giỏ hàng
        public string GetMaxCartCode()
        {
            // Lấy mã khách hàng lớn nhất, nếu không có sẽ trả về null
            var maxInvoiceCode = db.GioHangs
                .OrderByDescending(c => c.MaGH)
                .Select(c => c.MaGH)
                .FirstOrDefault();

            return maxInvoiceCode;
        }

        private string GenerateUniqueCartCode()
        {
            var maxInvoiceCode = GetMaxCartCode();

            if (maxInvoiceCode == null)
            {
                // Nếu không có mã nào, bắt đầu từ DH001
                return "GH001";
            }

            // Lấy phần số từ mã đơn hàng lớn nhất
            string numericPart = maxInvoiceCode.Substring(2);
            int newNumber = int.Parse(numericPart) + 1;

            return "GH" + newNumber.ToString().PadLeft(3, '0');
        }


        //Chỉnh sửa tăng giảm số lượng - update lại giỏ hàng

        [HttpPost]
        public IActionResult In_Decrease_Quantity(string productId, string mams, string masize, int quantity)
        {
            var username = HttpContext.Session.GetString("Username");
            //if (username != null)
            //{
            string makh = db.KhachHangs.Where(x => x.Username == username).Select(x => x.MaKh).FirstOrDefault();
            string magh = db.GioHangs.FirstOrDefault(x => x.MaKH == makh).MaGH;

            string colorid = db.MauSacs.FirstOrDefault(c => c.TenMs == mams).MaMs;
            string sizeid = db.Sizes.FirstOrDefault(c => c.TenSize == masize).MaSize;

            string mactsp = db.Ctsps.FirstOrDefault(x => x.MaSp == productId && x.MaMs == colorid).MaCtsp;
            string mactsps = db.CtspSizes.FirstOrDefault(x => x.MaCtsp == mactsp && x.MaSize == sizeid).MaCtspSize;

            // Tìm sản phẩm trong giỏ hàng
            var cartItem = db.Ctghs.FirstOrDefault(c => c.MaGH == magh && c.MaCTSP_Size == mactsps);
            // Người dùng đã đăng nhập
            if (cartItem != null)
            {
                cartItem.SoLuong = quantity; // Cập nhật số lượng
                db.Ctghs.Update(cartItem);
                db.SaveChanges();
                return RedirectToAction("GioHang", "Cart");
            }
            else
            {
                return RedirectToAction("GioHang", "Cart");
            }
            //}
            //else
            //{
            //    var tempCart = HttpContext.Session.GetObjectFromJson<List<CartItemViewModel>>("TempCart") ?? new List<CartItemViewModel>();
            //    var existingItem = tempCart.FirstOrDefault(c => c.ProductId == productId && c.Color == mams && c.Size == masize);

            //    if (existingItem != null)
            //    {
            //        existingItem.Quantity = quantity; // Cập nhật số lượng
            //        HttpContext.Session.SetObjectAsJson("TempCart", tempCart);
            //        return Json(new { success = true, message = "Số lượng sản phẩm trong giỏ hàng tạm thời đã được cập nhật." });
            //    }
            //    else
            //    {
            //        return Json(new { success = false, message = "Không tìm thấy sản phẩm trong giỏ hàng tạm thời." });
            //    }
            //}
        }

        //Tổng tiền để thanh toán
        [HttpPost]
        public JsonResult GetTotalPay()
        {
            //var tempTotal = HttpContext.Session.GetObjectFromJson<List<CartSummaryViewModel>>("TempTotal") ?? new List<CartSummaryViewModel>();
            decimal totalAmount = 0;
            var username = HttpContext.Session.GetString("Username");
            string makh = db.KhachHangs.Where(x => x.Username == username).Select(x => x.MaKh).FirstOrDefault();


            //if (username == null)
            //{
            //    var tempCart = HttpContext.Session.GetObjectFromJson<List<CartItemViewModel>>("TempCart") ?? new List<CartItemViewModel>();
            //    if (tempCart.Count > 0)
            //    {
            //        totalAmount = tempCart.Sum(c => c.Quantity * c.UnitPrice);
            //    }
            //}
            //else
            //{
            string magh = db.GioHangs.FirstOrDefault(x => x.MaKH == makh).MaGH;
            var cartItems = db.Ctghs.Where(c => c.MaGH == magh).ToList();
            if (cartItems.Count > 0)
            {
                foreach (var item in cartItems)
                {
                    decimal gia = Gia(item.MaCTSP_Size);
                    totalAmount += item.SoLuong * gia;
                }
            }
            //}

            return Json(new { totalPay = totalAmount });
        }

        [HttpGet]
        public JsonResult GetQuantityCart()
        {
            int quantity = 0;
            var username = HttpContext.Session.GetString("Username");

            if (string.IsNullOrEmpty(username)) // Nếu chưa đăng nhập
            {
                var tempCart = HttpContext.Session.GetObjectFromJson<List<CartItemViewModel>>("TempCart") ?? new List<CartItemViewModel>();
                quantity = tempCart.Count;
            }
            else // Nếu đã đăng nhập
            {
                string makh = db.KhachHangs.Where(x => x.Username == username).Select(x => x.MaKh).FirstOrDefault();
                if (!string.IsNullOrEmpty(makh))
                {
                    string magh = db.GioHangs.Where(c => c.MaKH == makh).Select(x => x.MaGH).FirstOrDefault();
                    if (!string.IsNullOrEmpty(magh))
                    {
                        quantity = db.Ctghs.Where(c => c.MaGH == magh).Count();
                    }
                }
            }

            return Json(quantity); // Trả về kết quả dạng JSON
        }


        //Kiểm tra khuyến mãi 
        public (decimal Dicount, string Gift) CheckDiscountProduct(string masp, decimal Gia, decimal sl)
        {
            string madm = db.DanhMucs.Where(dm => dm.SanPhams.Any(sp => sp.MaSp == masp)).Select(dm => dm.MaDm).FirstOrDefault();
            var currentDate = DateOnly.FromDateTime(DateTime.Today);

            var khuyenMais = db.KhuyenMais
            .Where(c => (c.MaSp == masp || c.MaDm == madm)
                        && currentDate >= c.NgayBd
                        && currentDate <= c.NgayKt)
            .Select(x => new
            {
                x.MaKm,
                x.LoaiKm,
                x.SoTienPhanTram,
                x.MoTa
            })
            .ToList();
            string gift = null;
            decimal dicount = 0;
            if (khuyenMais == null || !khuyenMais.Any())
            {
                return (dicount, gift); // Trả về 0 và null nếu không có khuyến mãi
            }
            foreach (var khuyenMai in khuyenMais)
            {
                decimal soTienPhanTramDecimal = (decimal)khuyenMai.SoTienPhanTram;
                if (khuyenMai.LoaiKm == "%") // Nếu là khuyến mãi theo phần trăm
                {
                    dicount += (decimal)(Gia * sl * (soTienPhanTramDecimal / 100));
                }
                else if (khuyenMai.LoaiKm == "Tiền") // Nếu là khuyến mãi theo tiền
                {
                    dicount += (decimal)(soTienPhanTramDecimal * sl);
                }
                else if (khuyenMai.LoaiKm == "Quà tặng")
                {
                    gift = khuyenMai.MoTa;
                }
            }
            return (dicount, gift);
        }

        public CartSummaryViewModel CheckDiscountCart(decimal total)
        {
            var currentDate = DateOnly.FromDateTime(DateTime.Today);
            var khuyenMai = db.KhuyenMais
               .Where(c => c.MaSp == null && c.MaDm == null && currentDate >= c.NgayBd && currentDate <= c.NgayKt && c.TienToiThieu <= total)
               .Select(x => new { x.MaKm, x.LoaiKm, x.MoTa, x.SoTienPhanTram, x.TienToiThieu })
               .ToList();
            List<string> gift = new List<string>(); ;
            decimal dicount = 0;
            foreach (var c in khuyenMai)
            {
                decimal phantram = (decimal)c.SoTienPhanTram;
                if (c != null)
                {
                    if (c.LoaiKm == "%" && c.SoTienPhanTram > 0) // Nếu là khuyến mãi theo phần trăm
                    {
                        dicount += (decimal)(total * (phantram / 100));
                    }
                    else if (c.LoaiKm == "Tiền" && c.SoTienPhanTram > 0) // Nếu là khuyến mãi theo tiền
                    {
                        dicount += (decimal)(c.SoTienPhanTram * total);
                    }
                    else if (c.LoaiKm == "Quà tặng")
                    {
                        gift.Add(c.MoTa);
                    }
                    else if (c.LoaiKm == "Free ship")
                    {
                        gift.Add("Miễn phí ship");
                    }
                }
            }
            return new CartSummaryViewModel
            {
                GiamGia = dicount,
                QuaTang = gift
            };
        }
    }
}
