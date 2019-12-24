using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FYP.Models;
using FYP.ViewModel.Home;
using System.IO;
using FYP.ViewModel.Home;
using System.Data.SqlClient;

namespace FYP.Controllers
{
    public class SignUpController : Controller
    {
        SqlConnection con = new SqlConnection();
        SqlCommand com = new SqlCommand();
        SqlDataReader dr;

        MV db = new MV();
        // GET: SignUp
        public ActionResult Index()
        {
            return View();
        }

        void connectionstring()
        {
            con.ConnectionString = @"Data Source=SHEIKH_M_SAHAL\SQLEXPRESS;Initial Catalog=FYP;Integrated Security=True";
        }

        [HttpPost]
        public ActionResult Signup(SignUp l)
        {

            bool status = false;


            var user = l.User_email;

            string username = "";
            connectionstring();
            con.Open();
            com.Connection = con;
            com.CommandText = "select l.User_email from Login l where l.User_email ='" + user + "'";
            dr = com.ExecuteReader();


            if (dr.Read())
            {
                status = false;
            }
            else
            {
                var file = l.file;
                if (file != null)
                {

                    file.SaveAs(Server.MapPath("/Content/Images/" + file.FileName));
                    var img = "";
                    img = "~/Content/Images/" + file.FileName;
                    l.Filename = img;

                    db.Signup(l);
                    status = true;

                }
            }

          

            return new JsonResult { Data = new { status = status, newurl = Url.Action("Index", "N_Main_Page") } };
        }


   
    }
}