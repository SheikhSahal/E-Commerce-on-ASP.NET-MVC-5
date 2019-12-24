using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace FYP.Models
{
    public class adsform
    {
        public int p_id { get; set; }

        [Required(ErrorMessage = "Product Name is required")]
        [Display(Name = "Name:")]
        public string P_name { get; set; }

        [Required(ErrorMessage = "Product Desc is required")]
        [StringLength(500)]
        [Display(Name = "Desc.:")]
        public string P_Desc { get; set; }
        public int User_id { get; set; }

        public string Make { get; set; }
        public string Condition { get; set; }
        [Required(ErrorMessage = "Title is required")]
        [Display(Name = "Title:")]
        public string Ad_title { get; set; }
        [Required(ErrorMessage = "Price is required")]
        [Display(Name = "Price:")]
        [Range(1, int.MaxValue, ErrorMessage = "The value must be greater than 0")]
        public int Price { get; set; }
        [Required(ErrorMessage = "State is required")]
        [Display(Name = "State:")]

        public int State_id { get; set; }
        [Required(ErrorMessage = "Category is required")]
        [Display(Name = "Category:")]
        public int C_id { get; set; }
    }
}