using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore.Migrations;
using ShopOnline.Models;
using ShopOnline.ViewModels;
using System.Drawing;
using ShopOnline.Extensions;
using System.Drawing.Imaging;
using Microsoft.EntityFrameworkCore;

namespace ShopOnline.Controllers
{
    public class CheckoutController : Controller
    {
        QuanLyShopOnlineContext db = new QuanLyShopOnlineContext();

        [HttpGet]
        public IActionResult ThanhToan()
        {
            var username = HttpContext.Session.GetString("Username");
            var makh = db.KhachHangs.Where(c => c.Username == username).Select(c => c.MaKh).FirstOrDefault();
            var cartItems = GetCartItems(makh);

            if (cartItems == null || !cartItems.Any())
            {
                TempData["ErrorMessage"] = "Giỏ hàng của bạn chưa có sản phẩm nào. Không thể tiến hành thanh toán.";
                return RedirectToAction("GioHang", "Cart");
            }
            var tongTienResult = hoadon(makh, 20);

            var summaryModel = new CheckOutViewModel
            {
                TongTien = tongTienResult.TongTien,
                GiamGia = tongTienResult.GiamGia,
                TienShip = tongTienResult.TienShip,
                QuaTang = tongTienResult.QuaTang,
                TienThu = tongTienResult.TienThu,
                SanPham = tongTienResult.SanPham,
            };

            // Nếu có lỗi, trả về model để hiển thị lại thông tin
            return View(summaryModel);
        }
        [HttpPost]
        public IActionResult ThanhToan(InvoiceViewModel model)
        {
            if (model == null)
            {
                ModelState.AddModelError("", "Thông tin thanh toán không hợp lệ.");
                return View(); // Trả về view với model để hiển thị lỗi
            }
            var username = HttpContext.Session.GetString("Username");
            var makh = db.KhachHangs.Where(c => c.Username == username).Select(c => c.MaKh).FirstOrDefault();
            //var khachHang = new KhachHang();
            //if (model.GiongKhachHang)
            //{
            //    khachHang = db.KhachHangs.SingleOrDefault(kh => kh.MaKh == makh);
            //}
            var cartItems = GetCartItems(makh);

            if (cartItems == null || !cartItems.Any())
            {
                ModelState.AddModelError("", "Giỏ hàng trống.");
                return View();
            }

            var tongTienResult = hoadon(makh, model.TienShip);
            decimal TongTien = tongTienResult.TongTien;
            decimal TienGiam = tongTienResult.GiamGia;
            decimal TienShip = tongTienResult.TienShip;
            List<string> quatang = tongTienResult.QuaTang;
            decimal TienThu = TongTien - TienGiam + TienShip;
            var summaryModel = new CheckOutViewModel
            {
                TongTien = TongTien,
                GiamGia = TienGiam,
                TienShip = TienShip,
                QuaTang = quatang,
                TienThu = TienThu,
                SanPham = tongTienResult.SanPham,
            };

            string newInvoiceCode = GenerateUniqueInvoiceCode();

            string newcode = GenerateUniqueCode();
            string newstatus = GenerateStatus();

            var invoice = new DonHang
            {
                MaKh = makh,
                MaDh = newInvoiceCode,
                MaCode = newcode,
                NgayDh = DateOnly.Parse("10/05/2024")/*DateOnly.FromDateTime(DateTime.Today)*/,
                TrangThai = newstatus,
                TenNguoiNhan = model.TenNguoiNhan ,
                SoDienThoai = model.SoDienThoai,
                Pttt = model.PTTT,
                Dcgh = model.DiaChiGH,
                TongTien = TongTien,
                TienGiam = TienGiam,
                TienShip = TienShip,
                TienThu = TienThu,
                Ptgh = model.PhucThucGH,
                DanhGia = null,
                DoiTras = null  
            };

            // Sử dụng transaction để đảm bảo tính toàn vẹn của dữ liệu
            using (var transaction = db.Database.BeginTransaction())
            {
                try
                {
                    db.DonHangs.Add(invoice);
                    db.SaveChanges();

                    // Thêm chi tiết đơn hàng
                    foreach (var item in cartItems)
                    {
                        var ctdh = new Ctdh
                        {
                            MaDh = newInvoiceCode,
                            MaCtspSize = GetMactsp_size(item.Masp, item.Mams, item.Masize),
                            SoLuong = item.Soluong,
                            GiaBan = item.Gia,
                            TongTien = item.Gia * item.Soluong
                        };
                        db.Ctdhs.Add(ctdh);
                    }
                    if (TienGiam > 0) // Giả định rằng item có thuộc tính Dicount để kiểm tra
                    {
                        var ctkmList = HttpContext.Session.GetObjectFromJson<List<CtkmViewModel>>("ctkmTam") ?? new List<CtkmViewModel>();
                        if (ctkmList != null && ctkmList.Any())
                        {
                            foreach (var ctkmItem in ctkmList)
                            {
                                var ctkm = new Ctkm
                                {
                                    MaDh = newInvoiceCode,
                                    MaKm = ctkmItem.MaKm, // Lấy mã khuyến mãi từ danh sách tạm
                                    NgaySd = DateOnly.Parse("10/05/2024") /*DateOnly.FromDateTime(DateTime.Today)*/,
                                    TienGiam = (decimal)ctkmItem.GiamGia/2, // Lấy số tiền giảm giá từ danh sách tạm
                                    Khac = ctkmItem.Khac
                                };
                                db.Ctkms.Add(ctkm);
                            }
                            HttpContext.Session.Remove("ctkmTam");
                        }
                    }

                    db.SaveChanges();
                    // Xóa giỏ hàng sau khi thanh toán thành công
                    ClearCart(makh);

                    transaction.Commit(); // Commit transaction nếu thành công

                    TempData["SuccessMessage"] = "Mua hàng thành công.";
                    HttpContext.Session.SetString("Macode", newcode);

                    return RedirectToAction("TheoDoiDonHang", "MonitorInvoice"); // Truyền model cho view
                }
                catch (Exception ex)
                {
                    // Rollback transaction nếu có lỗi
                    transaction.Rollback();

                    // Log lỗi chi tiết để kiểm tra
                    Console.WriteLine(ex.Message);

                    ModelState.AddModelError("", "Đã có lỗi xảy ra, vui lòng thử lại.");
                }
            }

            // Trả về model nếu có lỗi
            return View();
        }
        //Xử lý giỏ hàng 
        public void ClearCart(string makh)
        {
            if (string.IsNullOrEmpty(makh))
            {
                // Nếu mã khách hàng null, có thể xử lý giỏ hàng tạm thời bằng session
                var tempCart = HttpContext.Session.GetObjectFromJson<List<CartItemViewModel>>("TempCart");
                if (tempCart != null)
                {
                    // Xóa giỏ hàng tạm trong session
                    HttpContext.Session.Remove("TempCart");
                    Console.WriteLine("Giỏ hàng tạm đã được xóa.");
                }
            }
            else
            {
                // Nếu mã khách hàng có giá trị, xóa các mục giỏ hàng trong database
                var cartItems = db.GioHangs.Where(c => c.MaKH == makh).ToList();
                db.GioHangs.RemoveRange(cartItems);
                db.SaveChanges();
            }
        }

        //Xử lý lấy chi tiết đơn hàng
        public string GetMactsp_size (string masp, string mams, string mas)
        {
            string mactsp = db.Ctsps.Where(c => c.MaSp == masp && c.MaMs == mams).Select(c => c.MaCtsp).FirstOrDefault();

            string macts = db.CtspSizes.Where(c => c.MaCtsp == mactsp && c.MaSize == mas).Select(c => c.MaCtspSize).FirstOrDefault();
            return macts;
        }
        private List<CheckoutTempViewModel> GetCartItems(string customerID)
        {
            var cartItems = new List<CheckoutTempViewModel>();

            if (customerID != null)
            {
                var giohang = db.GioHangs.Where(c => c.MaKH == customerID).ToList();
                foreach (var g in giohang)
                {
                    cartItems.Add(new CheckoutTempViewModel
                    {
                        Masp = g.MaSP,
                        Mams = g.MaMS,
                        Masize = g.MaS,
                        Gia = g.Gia,
                        Soluong = g.SoLuong
                    });
                }
            }
            else
            {
                var giohang = HttpContext.Session.GetObjectFromJson<List<CartItemViewModel>>("TempCart") ?? new List<CartItemViewModel>();
                foreach (var g in giohang)
                {
                    cartItems.Add(new CheckoutTempViewModel
                    {
                        Masp = g.ProductId,
                        Mams = db.MauSacs.Where(c => c.TenMs == g.Color).Select(x => x.MaMs).FirstOrDefault(),
                        Masize = db.Sizes.Where(c => c.TenSize == g.Size).Select(x => x.MaSize).FirstOrDefault(),
                        Gia = g.UnitPrice,
                        Soluong = g.Quantity
                    });
                }
            }

            return cartItems;
        }
        // Xử lý mục hóa đơn trong view 
        public CheckOutViewModel hoadon(string customerID, decimal ship)
        {
            decimal totalAmount = 0;
            decimal dicount = 0;
            List<string> gifts = new List<string>();

            List<CheckoutTempViewModel> cartItems = new List<CheckoutTempViewModel>();
            List<ProductCheckoutViewModel> sanPhamList = new List<ProductCheckoutViewModel>();

            cartItems = GetCartItems(customerID);

            foreach (var item in cartItems)
            {
                var discountResult = CheckDiscountProduct(item.Masp, item.Gia, item.Soluong);
                dicount += discountResult.Dicount;
                if (!string.IsNullOrEmpty(discountResult.Gift)) // Kiểm tra Gift không phải là null hoặc empty
                {
                    gifts.Add(discountResult.Gift);
                }
                sanPhamList.Add(new ProductCheckoutViewModel
                {
                    TenSp = db.SanPhams.Where(sp => sp.MaSp == item.Masp).Select(sp => sp.TenSp).FirstOrDefault(),
                    GiaGoc = item.Gia,
                    GiaGiam = item.Gia - ((decimal)discountResult.Dicount / (decimal)item.Soluong)
                });
            }

            totalAmount = cartItems.Sum(c => c.Soluong * c.Gia);

            // Sử dụng lại CheckDiscountInvoice để tính tổng tiền, giảm giá và tiền ship
            var invoiceDiscount = CheckDiscountInvoice(totalAmount, ship);
            totalAmount = invoiceDiscount.TongTien;
            dicount += invoiceDiscount.GiamGia;
            if (!string.IsNullOrEmpty(invoiceDiscount.QuaTang)) // Kiểm tra QuaTang không phải là null hoặc empty
            {
                gifts.Add(invoiceDiscount.QuaTang);
            }
            ship = invoiceDiscount.TienShip;

            return new CheckOutViewModel
            {
                TongTien = totalAmount,
                TienShip = ship,
                GiamGia = dicount,
                QuaTang = gifts,
                TienThu = totalAmount - dicount + ship,
                SanPham = sanPhamList
            };
        }


        //Kiểm tra khuyến mãi 
        public (decimal Dicount, string Gift) CheckDiscountProduct(string masp, decimal Gia, decimal sl)
        {
            string madm = db.DanhMucs.Where(dm => dm.SanPhams.Any(sp => sp.MaSp == masp)).Select(dm => dm.MaDm).FirstOrDefault();
            var currentDate = new DateOnly(2024, 5, 10);/*DateOnly.FromDateTime(DateTime.Today)*/;

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
            var ctkm = HttpContext.Session.GetObjectFromJson<List<CtkmViewModel>>("ctkmTam") ?? new List<CtkmViewModel>();
            foreach (var khuyenMai in khuyenMais)
            {
                decimal tamGiam = 0;
                decimal soTienPhanTramDecimal = (decimal)khuyenMai.SoTienPhanTram;
                if (khuyenMai.LoaiKm == "%") // Nếu là khuyến mãi theo phần trăm
                {
                    dicount += (decimal)(Gia * sl * (soTienPhanTramDecimal / 100));
                    tamGiam += (decimal)(Gia * sl * (soTienPhanTramDecimal / 100));
                }
                else if (khuyenMai.LoaiKm == "Tiền") // Nếu là khuyến mãi theo tiền
                {
                    dicount += (decimal)(soTienPhanTramDecimal * sl);
                    tamGiam += (decimal)(soTienPhanTramDecimal * sl);
                }
                else if (khuyenMai.LoaiKm == "Quà tặng")
                {
                    gift = khuyenMai.MoTa;
                }

                // Kiểm tra nếu trùng masp
                var existingCtkm = ctkm.FirstOrDefault(k => k.MaKm == khuyenMai.MaKm);

                if (existingCtkm != null)
                {
                    // Nếu đã tồn tại, cập nhật giá trị
                    existingCtkm.GiamGia += tamGiam;
                }
                else
                {
                    // Nếu chưa tồn tại, tạo đối tượng CtkmViewModel mới và thêm vào danh sách
                    var newCtkm = new CtkmViewModel
                    {
                        MaKm = khuyenMai.MaKm,
                        GiamGia = tamGiam,
                        Khac = gift
                    };
                    ctkm.Add(newCtkm);
                }
            }

            // Lưu giỏ hàng tạm lại vào session
            HttpContext.Session.SetObjectAsJson("ctkmTam", ctkm);
            return (dicount, gift);
        }

        public CartSummaryViewModel CheckDiscountInvoice(decimal total, decimal ship)
        {
            var currentDate = DateOnly.Parse("10/05/2024")/* DateOnly.FromDateTime(DateTime.Today)*/;
            var khuyenMai = db.KhuyenMais
               .Where(c => c.MaSp == null && c.MaDm == null && currentDate >= c.NgayBd && currentDate <= c.NgayKt && c.TienToiThieu <= total)
               .Select(x => new { x.LoaiKm, x.MoTa, x.SoTienPhanTram, x.TienToiThieu })
               .FirstOrDefault();
            string gift = null;
            decimal dicount = 0;
            if (khuyenMai != null)
            {
                if (khuyenMai.LoaiKm == "%") // Nếu là khuyến mãi theo phần trăm
                {
                    dicount = (decimal)(total * (khuyenMai.SoTienPhanTram / 100));
                }
                else if (khuyenMai.LoaiKm == "Tiền") // Nếu là khuyến mãi theo tiền
                {
                    dicount = (decimal)(khuyenMai.SoTienPhanTram * total);
                }
                else if (khuyenMai.LoaiKm == "Quà tặng")
                {
                    gift = khuyenMai.MoTa;
                }
                if (khuyenMai.LoaiKm == "free ship")
                {
                    ship = 0;
                }
            }
            return new CartSummaryViewModel
            {
                TongTien = total,
                GiamGia = dicount,
                QuaTang = gift,
                TienShip = ship
            };
        }

        // Xử lý mã hóa đơn
        public string GetMaxInvoiceCode()
        {
            // Lấy mã khách hàng lớn nhất, nếu không có sẽ trả về null
            var maxInvoiceCode = db.DonHangs
                .OrderByDescending(c => c.MaDh)
                .Select(c => c.MaDh)
                .FirstOrDefault();

            return maxInvoiceCode;
        }

        private string GenerateUniqueInvoiceCode()
        {
            var maxInvoiceCode = GetMaxInvoiceCode();

            if (maxInvoiceCode == null)
            {
                // Nếu không có mã nào, bắt đầu từ DH001
                return "DH001";
            }

            // Lấy phần số từ mã đơn hàng lớn nhất
            string numericPart = maxInvoiceCode.Substring(2);
            int newNumber = int.Parse(numericPart) + 1;

            return "DH" + newNumber.ToString().PadLeft(3, '0');
        }


        //Xử lý mã code để theo dõi đơn hàng
        private string GenerateUniqueCode()
        {
            string code;
            do
            {
                code = Guid.NewGuid().ToString().Substring(0, 8).ToUpper(); // Tạo mã mới gồm 8 ký tự
            }
            while (db.DonHangs.Any(x => x.MaCode == code)); 
            return code;
        }

        //Xử lý trạng thái đơn hàng ngẫu nhiên 
        private string GenerateStatus()
        {
            Random random = new Random();

            // Tạo danh sách các trạng thái
            List<string> trangThaiList = new List<string> { "Đang giao hàng", "Đã hủy", "Đã giao" };

            // Chọn ngẫu nhiên một trạng thái từ danh sách
            string trangThaiNgauNhien = trangThaiList[random.Next(trangThaiList.Count)];
            return trangThaiNgauNhien;
        }
    }
}
