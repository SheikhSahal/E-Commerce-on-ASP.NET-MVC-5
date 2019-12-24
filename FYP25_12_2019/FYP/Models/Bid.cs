using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FYP.Models
{
    public class Bid
    {
        public int P_id { get; set; }
        public int U_id { get; set; }
        public int Bid_Amount { get; set; }
        public DateTime bid_Date { get; set; }

        public string User_Name { get; set; }
        public string User_profile { get; set; }
        public long User_contact { get; set; }

    }
}