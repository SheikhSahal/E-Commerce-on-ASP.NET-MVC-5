using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FYP.Models;
using System.Data.SqlClient;
using System.Web.Security;
using FYP.ViewModel.Home;

namespace FYP.Controllers
{
    public class HomeController : Controller
    {
        
        SqlConnection con = new SqlConnection();
        SqlCommand com = new SqlCommand();
        SqlDataReader dr;
        MV db = new MV();

        public ActionResult Index()
        {
            return View();
        }

        void connectionstring()
        {
            con.ConnectionString = @"Data Source=SHEIKH_M_SAHAL\SQLEXPRESS;Initial Catalog=FYP;Integrated Security=True";
        }

        [HttpPost]
        public ActionResult login(string Username, string Password)
        {
            string returnurl = "/Dashboard/index";
            bool remeberMe = true;
            var user = Username;
            var password = Password;// Password;

            string username = "";
            connectionstring();
           
            con.Open();
            com.Connection = con;
            com.CommandText = "select l.User_id,l.User_name, l.User_email ,ISNULL(l.user_profile,'~/Content/Images/user.png') user_profile, l.Password from Login l where l.User_email='" + user + "' and l.password ='" + password + "'";
            dr = com.ExecuteReader();
            bool status = false;

            if (dr.Read())
            {
                string u_id = dr["User_id"].ToString();
                string u = dr["User_name"].ToString();
                string e = dr["User_email"].ToString();
                string p = dr["Password"].ToString();
                string i = dr["user_profile"].ToString();

                if (e == user && p == password)
                {

                    FormsAuthentication.SetAuthCookie(user, remeberMe);
                    if (Url.IsLocalUrl(returnurl))
                    {
                        status = true;
                        Session["Username"] = u;
                        Session["U_id"] = u_id;
                        Session["pic"] = i;
                        Session["email"] = e;
                        var sess = Convert.ToInt16(Session["U_id"]);
                        string user_status = 'Y'.ToString();
                        db.Logoutupdate(sess, DateTime.Today, user_status);

                    }
                    else
                    {
                        status = false;
                        Session["Username"] = null;
                        Session["U_id"] = null;
                    }

                }
                con.Close();
            }
            return new JsonResult { Data = new { status = status, newurl = Url.Action("Index", "Dashboard", new { user_id = Session["U_id"], returnurl = "/Dashboard/index" }) } };
        }
    }
}