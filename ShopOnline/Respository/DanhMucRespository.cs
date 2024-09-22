using ShopOnline.Models;
namespace ShopOnline.Respository
{
    public interface DanhMucRespository
    {
        DanhMuc Add(DanhMuc tenDM);
        DanhMuc Update(DanhMuc tenDM);
        DanhMuc Delete(DanhMuc MaDM);
        DanhMuc GetDanhMuc(string MaDM); // Sửa kiểu tham số sang string
        IEnumerable<DanhMuc> GetAllDanhmuc();
        IEnumerable<SanPham> GetSanPhamsByDanhMuc(string madm);
    }
}
