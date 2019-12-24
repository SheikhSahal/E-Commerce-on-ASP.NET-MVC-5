using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FYP.ViewModel.Home;
using System.IO;
using FYP.Models;

namespace FYP.Controllers
{
    public class UpdateAdsController : Controller
    {
        private MV db = new MV();

        FYPEntities model = new FYPEntities();

        public ActionResult Index(int id)
        {
            if (Session["U_id"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                MV db = new MV();
                AP_Menu menu = new AP_Menu();

                var r = Convert.ToInt32(Session["U_id"]);
                var user_id = r;

                var Menulist = db.user_rights(user_id);
                List<AP_Menu> menudisplay = menu.Menutree(Menulist, null);


                //Merge_Ads_images MAI = new Merge_Ads_images();
                //MAI.ads = db.adsdetail(id);
                //MAI.images = db.adsdetailimages(id);
                //MAI.Menu = menudisplay;
                Ads ad =  db.adsdetail(id);
                ViewBag.ads = ad;

                List<Ads> img_list = db.adsdetailimages(id);
                ViewBag.imglst = img_list;

                ViewBag.state = new SelectList(model.States, "S_id", "S_name");
                ViewBag.category = new SelectList(model.Categories, "C_id", "C_Name");

                return View(menudisplay);
            }


        }

        [HttpPost]
        public JsonResult Index(Ads a,img_st t)
        {


            bool status = false;
            db.updateemp(a);
            status = true;

            if (t.g != null)
            {
                foreach (var s in t.g)
                {
                    string inpu = s;

                    string gl = inpu.Substring(inpu.Length - 1);
                    string rl = inpu.Remove(inpu.Length - 1);

                    if (gl == "D")
                    {
                        db.Deleteimage(rl);
                        status = true;
                    }

                }
            }
        

            

            for (int i = 0; i < Request.Files.Count; i++)
            {
                var file = Request.Files[i];

                var fileName = Path.GetFileName(file.FileName);
                var path = Path.Combine(Server.MapPath("~/Content/Images"), fileName);
                file.SaveAs(path);

                var im = "~/Content/Images/" + fileName;
                status = true;

                db.InsertImages(im, a.p_id);
                status = true;
            }

            return new JsonResult { Data = new { status = status, newurl = Url.Action("Index", "MyAds") } };
        }

    }
}