using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace FYP.Models
{
    public class Ads
    {
        
        public int p_id { get; set; }

        public int bid { get; set; }

        [Required(ErrorMessage ="Product Name is required")]
        [Display(Name ="Name:")]
        public string P_name { get; set; }


        public string p_Date { get; set; }

        public int count_ads { get; set; }

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

        [Required(ErrorMessage ="Files is required")]
        public List<HttpPostedFileBase> files { get; set; }

        [Display(Name ="Sold:")]
        public string sold_product { get; set; }


        [Display(Name = "Add Image:")]
        public string add_image { get; set; }


        public virtual ICollection<img_st> img { get; set; }
        public int image_id { get; set; }
        public string images { get; set; }

        public string State_Name { get; set; }
        public string category_Name { get; set; }
        public string User_name { get; set; }
        public string User_contact { get; set; }
        public string user_profile { get; set; }
        public string user_email { get; set; }
        public DateTime Last_login { get; set; }
        public string User_active { get; set; }
    }
}