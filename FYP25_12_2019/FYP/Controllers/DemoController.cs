using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FYP.ViewModel.Home;
using FYP.Models;
using System.Web.Security;


namespace FYP.Controllers
{
    public class DemoController : Controller
    {

        MV db = new MV();
        public ActionResult Index()
        {
    

                AP_Menu menu = new AP_Menu();

                //var user = Convert.ToInt32(Session["U_id"]);
                var Menulist = db.user_rights(1);
                List<AP_Menu> menudisplay = menu.Menutree(Menulist, null);


                return View(menudisplay);
            
        }
    }
}