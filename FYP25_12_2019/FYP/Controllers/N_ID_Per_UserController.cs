using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FYP.Models;
using FYP.ViewModel.Home;

namespace FYP.Controllers
{
    public class N_ID_Per_UserController : Controller
    {
        MV db = new MV();
        public ActionResult Index(int id)
        {
            Ads master = db.promstrdata(id);
            List<Ads> detail = db.prodtldata(id);

            List<Category> cat = db.NavMenu();
            ViewBag.category = cat;

            Merge_Ads_images pass = new Merge_Ads_images();
            pass.ads = master;
            pass.images = detail;

            return View(pass);
        }
    }
}