using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FYP.ViewModel.Home;
using FYP.Models;

namespace FYP.Controllers
{
    public class MainController : Controller
    {
        MV db = new MV();
        
        public ActionResult Index()
        {

            List<Ads> ads = db.getimagewisedata();
            List<Category> cat = db.NavMenu();
            ViewBag.category = cat;

            return View(ads);
        }
    }
}