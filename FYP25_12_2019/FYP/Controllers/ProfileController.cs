using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FYP.Models;
using FYP.ViewModel.Home;
using System.IO;

namespace FYP.Controllers
{
    public class ProfileController : Controller
    {
        MV db = new MV();
        
        public ActionResult Index()
        {
            if (Session["U_id"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                AP_Menu menu = new AP_Menu();
                var r = Convert.ToInt32(Session["U_id"]);
                var user_id = r;

                var Menulist = db.user_rights(user_id);
                List<AP_Menu> menudisplay = menu.Menutree(Menulist, null);

                //ViewBag.menu = menudisplay;

                login login = db.user_profile(r);
                ViewBag.data = login;

                return View(menudisplay);
            }
        }

        [HttpPost]
        public ActionResult Index(int id,string Username,string User_email, string User_contact, HttpPostedFileBase file)
        {

            var path = "";
            if (file != null)
            {
                if (file.ContentLength > 0)
                {
                    if (Path.GetExtension(file.FileName).ToLower() == ".jpg"
                      || Path.GetExtension(file.FileName).ToLower() == ".png"
                      || Path.GetExtension(file.FileName).ToLower() == ".gif"
                      || Path.GetExtension(file.FileName).ToLower() == ".jpeg")
                    {
                        path = Path.Combine(Server.MapPath("~/Content/Images"), file.FileName);
                        file.SaveAs(path);
                    }

                    var filename = file.FileName;

                    var Userprofile = "~/Content/Images/" + filename;

                    db.Profileupdate(id, Username, User_email, User_contact, Userprofile);
                }
            }

            return RedirectToAction("Index", "Profile");

            

     

         
          
        }
    }
}