using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using FYP.ViewModel.Home;
using FYP.Models;

namespace FYP.Controllers
{
    public class SearchController : Controller
    {
        MV dblayer = new MV();
        // GET: Hone
        public ActionResult Index()
        {
            return RedirectToAction("Index","N_Main_Page");
        }

        public JsonResult GetRecord(string prefix)
        {
            DataSet ds = dblayer.GetName(prefix);
            List<search> searchlist = new List<search>();
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                searchlist.Add(new search
                {
                    C_id = dr["C_id"].ToString(),
                    C_Name = dr["C_Name"].ToString()
                });

            }

            return Json(searchlist, JsonRequestBehavior.AllowGet);
        }


        public ActionResult search(string searchbar)
        {
            bool status = false;

            if (searchbar != "")
            {
                status = true;
            }
            else
            {
                status = false;
            }

        
            return new JsonResult { Data = new { status = status, newurl = Url.Action("Index", "itemdetails", new { id = searchbar }), cURL = Url.Action("Index", "Search") } };
        }


   
    
    }
}