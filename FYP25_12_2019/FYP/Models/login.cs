using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace FYP.Models
{
    public class login
    {
        public int id { get; set; }
        [Required(ErrorMessage = "User Name is required")]
        [Display(Name = "User Name:")]
        public string Username { get; set; }

        [Required(ErrorMessage = "Password is required")]
        public string Password { get; set; }

        [Required(ErrorMessage ="Confirm password is required")]
        [Compare(nameof(Password),ErrorMessage = "Passwords don't match.")]
        public string C_Password { get; set; }
        [Required(ErrorMessage = "Email is required")]
        [Display(Name = "Email:")]
        public string User_email { get; set; }

        [Required(ErrorMessage = "Contact is required")]
        [Display(Name = "Contact:")]
        public long User_contact { get; set; }

       
        public string User_profile { get; set; }
        [Display(Name = "Change Profile:")]
        public HttpPostedFileBase file { get; set; }
        public int Role_id { get; set; }

        public string c_password { get; set; }

        public bool remeberMe { get; set; }
    }
}
