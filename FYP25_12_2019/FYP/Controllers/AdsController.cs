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
    public class AdsController : Controller
    {
        MV db = new MV();
        FYPEntities model = new FYPEntities();

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



                Ads emp = db.AutoGenerate();
                ViewBag.state = new SelectList(model.States, "S_id", "S_name");
                ViewBag.category = new SelectList(model.Categories, "C_id", "C_Name");

                MAI.Menu = menudisplay;
                MAI.ads = emp;

                return View(MAI);
            }
            
        }

        [HttpPost]
        public ActionResult Index(adsform t)
        {
            //bool status = false;
            if (ModelState.IsValid)
            {
                //db.InsertAds(t);

                //var path = "";
                //foreach (var items in files)
                //{
                //    if (items != null)
                //    {
                //        if (items.ContentLength > 0)
                //        {
                //            if (Path.GetExtension(items.FileName).ToLower() == ".jpg"
                //              || Path.GetExtension(items.FileName).ToLower() == ".png"
                //              || Path.GetExtension(items.FileName).ToLower() == ".gif"
                //              || Path.GetExtension(items.FileName).ToLower() == ".jpeg")
                //            {
                //                path = Path.Combine(Server.MapPath("~/Content/Images"), items.FileName);
                //                items.SaveAs(path);
                //            }

                //            var im = "~/Content/Images/" + items.FileName;


                //            db.InsertImages(im, a.p_id);


                //        }
                //    }

                //}



                //ViewData["save"] = "Saved successfully...!";

                //ModelState.Clear();
            }
            return View();
        }
    }
}