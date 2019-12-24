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
    public class DashboardController : Controller
    {

        MV db = new MV();
        public ActionResult Index()
        {
            if (Session["U_id"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                
                AP_Menu menu = new AP_Menu();
                Merge_Ads_images MAI = new Merge_Ads_images();

                var user = Convert.ToInt32(Session["U_id"]);
                var Menulist = db.user_rights(user);
                List<AP_Menu> menudisplay = menu.Menutree(Menulist, null);
                

                var r = Session["U_id"].ToString();
                var graph = db.adscount(r).ToArray();

                List<Ads> ads = db.fetchdetail(Convert.ToInt16(r));
                ViewBag.table_list = ads;

                ViewBag.grap = graph;

                var bid_count = db.count_bid(Convert.ToInt16(r));
                ViewBag.bid_count = bid_count.id;

                var bid_prod = db.count_prod(Convert.ToInt16(r));
                ViewBag.bid_prod = bid_prod.id;

                var earn = db.earntotal(Convert.ToInt16(r));
                ViewBag.earn = earn.Price;

                var bid_saleprod = db.count_saleprod(Convert.ToInt16(r));
                ViewBag.bid_saleprod = bid_saleprod.id;


                var count_bid = db.count_bidperprod(Convert.ToInt16(r));
                ViewBag.count_bid = count_bid.id;

                

                return View(menudisplay);
            }
        }



        public ActionResult Logout()
        {
            var sess = Convert.ToInt16( Session["U_id"]);
            string status = 'N'.ToString();
            db.Logoutupdate(sess, DateTime.Today, status);

            Session.Clear();
            Session.Abandon();
            Session.RemoveAll();
            Session["U_id"] = null;

            FormsAuthentication.SignOut();


            this.Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            this.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            this.Response.Cache.SetNoStore();

            return RedirectToAction("index", "Home");

        }

        

       
    }
}