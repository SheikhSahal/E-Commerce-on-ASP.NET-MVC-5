using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FYP.ViewModel.Home;
using FYP.Models;

namespace FYP.Controllers
{
    public class MyAdsController : Controller
    {
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

                List<Ads> ads = db.fetchdetail(r);
                ViewBag.data = ads;
                //MAI.Menu = menudisplay;
                //MAI.images = ads;

                return View(menudisplay);
            }
        }
    }
}