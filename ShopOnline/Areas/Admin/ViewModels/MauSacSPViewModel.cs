using Microsoft.Identity.Client;

namespace ShopOnline.Areas.Admin.ViewModels
{
    public class MauSacSPViewModel
    {
        public string MaCTSP { get; set; }
        public string MaSP { get; set; }
        public List<string> ListMS {  get; set; }
        public string TenMS { get; set; }
        public IFormFile HinhAnhDD { get; set; }
    }
}
