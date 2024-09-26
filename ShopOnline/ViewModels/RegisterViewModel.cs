using ShopOnline.ValidationAttributes;
using System.ComponentModel.DataAnnotations;

namespace ShopOnline.ViewModels
{
    public class RegisterViewModel
    {
        [Required(ErrorMessage = "Họ và tên là bắt buộc.")]
        public string FullName { get; set; }

        [Required(ErrorMessage = "Giới tính là bắt buộc.")]
        public string Gender { get; set; }

        [Required(ErrorMessage = "Ngày sinh là bắt buộc.")]
        [DataType(DataType.Date)]
        [AgeValidation(16, ErrorMessage = "Người dùng phải trên 16 tuổi.")]
        public DateTime DateOfBirth { get; set; }

        [Required(ErrorMessage = "Số điện thoại là bắt buộc.")]
        [DataType(DataType.PhoneNumber)]
        [RegularExpression(@"^\d{10,15}$", ErrorMessage = "Số điện thoại không hợp lệ.")]
        public string PhoneNumber { get; set; }

        [Required(ErrorMessage = "Email là bắt buộc.")]
        [EmailAddress(ErrorMessage = "Email không hợp lệ.")]
        public string Email { get; set; }

        [Required(ErrorMessage = "Username là bắt buộc.")]
        public string Username { get; set; }

        [DataType(DataType.Password)]
        [Required(ErrorMessage = "Mật khẩu không được để trống.")]
        [StringLength(100, ErrorMessage = "Mật khẩu phải có ít nhất {2} ký tự.", MinimumLength = 5)]
        [RegularExpression(@"^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{5,}$",
        ErrorMessage = "Mật khẩu phải có ít nhất 5 ký tự, bao gồm ít nhất một chữ cái, một số và một ký tự đặc biệt.")]
        public string Password { get; set; }

        // Địa chỉ có thể null
        public string Address { get; set; }
    }
}
