
using System.ComponentModel.DataAnnotations;

namespace ShopOnline.ViewModels
{
    public class EvaluateViewModel
    {
        public string madg {  get; set; }
        [Required]
        public string macts { get; set; }

        [Required]
        public string madh { get; set; }

        [Required]
        [Range(1, 5)] // Giả sử bạn muốn điểm từ 1 đến 5
        public int diem { get; set; }

        [Required]
        public string noidung { get; set; }
        public DateOnly Ngaydg {  get; set; }   
        public List<IFormFile> anh { get; set; }
        public List<IFormFile> video { get; set; }
    }
}
