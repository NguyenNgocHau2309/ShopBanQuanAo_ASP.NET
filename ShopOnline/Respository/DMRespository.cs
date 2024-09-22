using ShopOnline.Models;

namespace ShopOnline.Respository
{
    public class DMRespository : DanhMucRespository
    {
        private readonly QuanLyShopOnlineContext _context;
        public DMRespository(QuanLyShopOnlineContext context)
        {
            _context = context;
        }

        public DanhMuc Add(DanhMuc tenDM)
        {
            _context.DanhMucs.Add(tenDM);
            _context.SaveChanges();
            return tenDM;
        }

        public DanhMuc Delete(DanhMuc MaDM)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<DanhMuc> GetAllDanhmuc()
        {
            return _context.DanhMucs.ToList();
        }

        public DanhMuc GetDanhMuc(string MaDM)
        {
            return _context.DanhMucs.FirstOrDefault(dm => dm.MaDm == MaDM); // Tìm theo mã danh mục
        }

        public IEnumerable<SanPham> GetSanPhamsByDanhMuc(string madm) // Trả về danh sách sản phẩm theo danh mục
        {
            return _context.SanPhams.Where(sp => sp.MaDm == madm).ToList();
        }

        public DanhMuc Update(DanhMuc tenDM)
        {
            _context.Update(tenDM);
            _context.SaveChanges();
            return tenDM;
        }
    }
}
