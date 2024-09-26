using System;
using System.ComponentModel.DataAnnotations;

namespace ShopOnline.ValidationAttributes 
{
    public class AgeValidation : ValidationAttribute
    {
        private readonly int _minimumAge;

        public AgeValidation(int minimumAge)
        {
            _minimumAge = minimumAge;
            // Gán thông báo lỗi mặc định
            ErrorMessage = $"Người dùng phải trên {_minimumAge} tuổi.";
        }

        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            if (value is DateTime dateOfBirth)
            {
                var age = DateTime.Now.Year - dateOfBirth.Year;
                if (dateOfBirth > DateTime.Now.AddYears(-age)) age--;

                if (age < _minimumAge)
                {
                    return new ValidationResult(ErrorMessage);
                }
            }
            return ValidationResult.Success;
        }
    }
}
