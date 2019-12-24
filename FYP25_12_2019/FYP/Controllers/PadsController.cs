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
    public class PadsController : Controller
    {
        MV db = new MV();
        FYPEntities model = new FYPEntities();
        // GET: Pads
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



                Ads emp = db.AutoGenerate();
                ViewBag.autoid = emp;
                ViewBag.state = new SelectList(model.States, "S_id", "S_name");
                ViewBag.category = new SelectList(model.Categories, "C_id", "C_Name");

                //ViewBag.menu = menudisplay;

                return View(menudisplay);
            }
        }

        [HttpPost]
        //public ActionResult Index(Ads i)
        public ActionResult Index(Ads a)
        {
            bool status = false;

            db.InsertAds(a);
            status = true;

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
            //    db.InsertAds(i);

            //    var path = "";
            //    foreach (var items in i.files)
            //    {
            //        if (items != null)
            //        {
            //            if (items.ContentLength > 0)
            //            {
            //                if (Path.GetExtension(items.FileName).ToLower() == ".jpg"
            //                  || Path.GetExtension(items.FileName).ToLower() == ".png"
            //                  || Path.GetExtension(items.FileName).ToLower() == ".gif"
            //                  || Path.GetExtension(items.FileName).ToLower() == ".jpeg")
            //                {
            //                    path = Path.Combine(Server.MapPath("~/Content/Images"), items.FileName);
            //                    items.SaveAs(path);
            //                }

            //                var im = "~/Content/Images/" + items.FileName;


            //                db.InsertImages(im, i.p_id);


            //            }
            //        }

            //    }



            //    ViewData["save"] = "Saved successfully...!";

            //    ModelState.Clear();
            //    return RedirectToAction("Index", "MyAds");
            //}
            //else
            //{
            //    AP_Menu menu = new AP_Menu();
            //    var r = Convert.ToInt32(Session["U_id"]);
            //    var user_id = r;

            //    var Menulist = db.user_rights(user_id);
            //    List<AP_Menu> menudisplay = menu.Menutree(Menulist, null);

            //    ViewBag.state = new SelectList(model.States, "S_id", "S_name");
            //    ViewBag.category = new SelectList(model.Categories, "C_id", "C_Name");

            //    ViewBag.menu = menudisplay;

            //    return View();
            //}
            return new JsonResult { Data = new { status = status } };

        }
    }
}