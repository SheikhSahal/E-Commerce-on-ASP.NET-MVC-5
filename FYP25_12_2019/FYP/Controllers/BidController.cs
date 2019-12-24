using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FYP.Models;
using FYP.ViewModel.Home;
using System.Data.SqlClient;

namespace FYP.Controllers
{
    public class BidController : Controller
    {
        
        MV db = new MV();
        SqlConnection con = new SqlConnection();
        SqlCommand com = new SqlCommand();
        SqlDataReader dr;


        public ActionResult Index(int getid)
        {
            Ads bid = db.adsdetail(getid);
            List<Category> cat = db.NavMenu();
            ViewBag.category = cat;

            if (bid.sold_product == 'Y'.ToString())
            {
                return RedirectToAction("Index", "main");
            }
            else
            {
                ViewBag.bid_user = db.Bid_user_details(getid);

                return View(bid);

            }

         
        }

        void connectionstring()
        {
            con.ConnectionString = @"Data Source=SHEIKH_M_SAHAL\SQLEXPRESS;Initial Catalog=FYP;Integrated Security=True";
        }


        [HttpPost]
        public ActionResult Index(Bid b)
        {
            bool status = false;

            connectionstring();

            con.Open();
            com.Connection = con;
            com.CommandText = "select b.p_id , b.u_id from BID b where b.p_id ='" + b.P_id + "' and b.u_id ='" + b.U_id + "'";
            dr = com.ExecuteReader();
            if (dr.Read())
            {
            
                status = false;
            }
            else
            {
                db.bidinsert(b);
                status = true;

            }

            return new JsonResult { Data = new { status = status } };
        }


        public ActionResult Delete(Bid del)
        {
            if (Session["U_id"] == null)
            {
                return RedirectToAction("index", "Home");
            }
            else
            {
                bool status = false;

                db.BidDelete(del);
                status = true;

                //return RedirectToAction("index", "Bid",new { getid=del.P_id });
                return new JsonResult { Data = new { status = status } };
            }
    
        }


    }
}