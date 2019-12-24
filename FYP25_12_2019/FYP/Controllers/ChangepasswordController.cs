using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FYP.Models;
using FYP.ViewModel.Home;

namespace FYP.Controllers
{
    public class ChangepasswordController : Controller
    {
        // GET: Changepassword
        private MV db = new MV();

        public ActionResult Index()
        {

            if (Session["U_id"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                Merge_Ads_images MAI = new Merge_Ads_images();

                AP_Menu menu = new AP_Menu();
                var r = Convert.ToInt32(Session["U_id"]);
                var user_id = r;

                var Menulist = db.user_rights(user_id);
                List<AP_Menu> menudisplay = menu.Menutree(Menulist, null);

                //MAI.Menu = menudisplay;

                return View(menudisplay);
            }
        }

        [HttpPost]
        public JsonResult Index(string Password)
        {
            bool status = true;

            var session = Convert.ToInt32(Session["U_id"]);
            db.updatepassword(Password,session);
            status = true;

            return new JsonResult { Data = new { status = status } };
        }
    }
}