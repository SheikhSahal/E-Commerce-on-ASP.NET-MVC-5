using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FYP.Models;
using FYP.ViewModel.Home;

namespace FYP.Controllers
{
    public class itemdetailsController : Controller
    {
        MV db = new MV();
        // GET: itemdetails
        public ActionResult Index(string id)
        {
            ViewBag.getsearch = id;
            List<Ads> ads = db.Searchdata(id);
            List<Category> cat = db.NavMenu();
            ViewBag.category = cat;

            return View(ads);
        }
    }
}