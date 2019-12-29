using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FYP.ViewModel.Home;
using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;

namespace FYP.Controllers
{
    public class SubscribeController : Controller
    {
        // GET: Subscribe
        MV db = new MV();
        public async Task<ActionResult> Index(string subscribe)
        {
            bool status = true;
            db.subscribe(subscribe);

            var body = "<h2>Welcome to the Big Bang Store</h2><p>Dear Customer,</p><br/><p>Thanks for registering Big Bang Store.</p>";
            var message = new MailMessage();
            message.To.Add(new MailAddress(subscribe));
            /*message.To.Add(new MailAddress("s.m.sahal789@gmail.com"));*/  // replace with valid value 
            message.From = new MailAddress("s.m.sahal786@outlook.com");  // replace with valid value

            message.Subject = "Your email subject";
            message.Body = string.Format(body, "from name", "from email", "message");
            message.IsBodyHtml = true;

            using (var smtp = new SmtpClient())
            {
                var credential = new NetworkCredential
                {
                    //UserName = "no.reply.Big.Bang@outlook.com",  // replace with valid value
                    //Password = "bigbangstore123"  // replace with valid value2
                    UserName = "no.reply.big.bangstore@gmail.com",  // replace with valid value
                    Password = "29202000a"  // replace with valid value2
                };
                smtp.Credentials = credential;
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.EnableSsl = true;
                await smtp.SendMailAsync(message);
                return new JsonResult { Data = new { status = status } };
            }

           
        }
    }
}