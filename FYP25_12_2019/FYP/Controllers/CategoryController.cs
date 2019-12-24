using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FYP.Models;
using FYP.ViewModel.Home;

namespace FYP.Controllers
{
    public class CategoryController : Controller
    {
        // GET: Category
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
                AP_Menu menu = new AP_Menu();
                var r = Convert.ToInt32(Session["U_id"]);
                var user_id = r;

                var Menulist = db.user_rights(user_id);
                List<AP_Menu> menudisplay = menu.Menutree(Menulist, null);

                ViewBag.category = new SelectList(model.Categories, "C_id", "C_Name");

                return View(menudisplay);
            }
        }

        [HttpPost]
        public ActionResult Index(string category)
        {
            db.categoryad(category);


            return RedirectToAction("Index","Category");
        }

    }
}