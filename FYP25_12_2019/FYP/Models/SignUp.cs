using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace FYP.Models
{
    public class SignUp
    {
        
        [Required(ErrorMessage = "User Name is required")]
        [Display(Name = "User Name:")]
        public string Username { get; set; }

        [Required(ErrorMessage = "Password is required")]
        public string Password { get; set; }

        [Display(Name = "Confirm Password:")]
        [Required(ErrorMessage = "Confirm password is required")]
        [Compare(nameof(Password), ErrorMessage = "Passwords don't match.")]
        public string C_Password { get; set; }

        [Required(ErrorMessage = "Email is required")]
        [Display(Name = "Email:")]
        [RegularExpression("^[a-zA-Z0-9_\\.-]+@([a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$", ErrorMessage = "Invalid Email Address.")]
        public string User_email { get; set; }

        [Required(ErrorMessage = "Contact is required")]
        [Display(Name = "Contact:")]
        [StringLength(11 , MinimumLength = 11,ErrorMessage = "Please Enter Valid number.")]
        public string User_contact { get; set; }

        [Display(Name = "User Profile:")]
        public HttpPostedFileBase file { get; set; }

        public string Filename { get; set; }

        public int Role_id { get; set; }

    }
}