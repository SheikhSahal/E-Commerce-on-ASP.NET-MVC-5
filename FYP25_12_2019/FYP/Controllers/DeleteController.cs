using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FYP.ViewModel.Home;

namespace FYP.Controllers
{
    public class DeleteController : Controller
    {
        // GET: Delete
        public ActionResult Index(int id)
        {
            MV db = new MV();

            db.Ddeleterecord(id);
            db.Mdeleterecord(id);
            

            return RedirectToAction("index", "MyAds");
        }
    }
}