using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using FYP.Models;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace FYP.ViewModel.Home
{
    public class MV
    {
        string connstring = ConfigurationManager.ConnectionStrings["dbx"].ConnectionString;

        public List<AP_Menu> user_rights(int user_id)
        {
            List<AP_Menu> DBase = new List<AP_Menu>();

            using (SqlConnection conn = new SqlConnection(connstring))
            {
                using (SqlCommand cmd = new SqlCommand("select m.Menu_id ,m.Menu_name , m.Menu_parent_id ,m.Menu_URL from Login l , role r , user_privilege u , Menu m where l.Role_id = r.Role_id and r.Role_id = u.role_id and u.menu_id = m.Menu_id and l.User_id = @user_id", conn))
                {
                    conn.Open();
                    SqlParameter user = cmd.Parameters.AddWithValue("@user_id", user_id);
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        AP_Menu emp = new AP_Menu();

                        emp.Menu_id = Convert.ToInt16(reader["Menu_id"]);
                        emp.Menu_name = reader["Menu_name"].ToString();
                        emp.Menu_URL = reader["Menu_URL"].ToString();
                        
                        emp.Menu_parent_id = reader["Menu_parent_id"] != DBNull.Value ? Convert.ToInt16(reader["Menu_Parent_id"]) : (int?)null;
                        

                        DBase.Add(emp);

                    }
                }
            }
            return DBase;
        }

        public Ads AutoGenerate()
        {
            Ads ads= new Ads();
            SqlConnection con = new SqlConnection(connstring);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select max(p.P_id)+1 as p_id from Product_Master p";
            cmd.Connection = con;
            con.Open();


            SqlDataReader reader = cmd.ExecuteReader();

            reader.Read();

            ads.p_id = Convert.ToInt16(reader["p_id"]);

            reader.Close();
            return ads;
        }


        public void InsertAds(Ads empl)
        {

            using (SqlConnection conn = new SqlConnection(connstring))
            {

                using (SqlCommand cmd = new SqlCommand("insert into Product_Master(P_id	,P_date	,P_Name,P_desc,User_id,Make,Condition,Ad_title,Price,State_id,C_id) values (@P_id,@p_date,@P_name , @P_desc ,@P_user_id ,@p_make ,@p_cond ,@p_title ,@P_price ,@state_id ,@c_id)", conn))
                {

                    conn.Open();

                    cmd.Parameters.AddWithValue("@P_id", empl.p_id);
                    cmd.Parameters.AddWithValue("@p_date", empl.p_Date);
                    cmd.Parameters.AddWithValue("@P_name", empl.P_name);
                    cmd.Parameters.AddWithValue("@P_desc", empl.P_Desc);
                    cmd.Parameters.AddWithValue("@P_user_id", empl.User_id);
                    cmd.Parameters.AddWithValue("@p_make", empl.Make);
                    cmd.Parameters.AddWithValue("@p_cond", empl.Condition);
                    cmd.Parameters.AddWithValue("@p_title", empl.Ad_title);
                    cmd.Parameters.AddWithValue("@P_price", empl.Price);
                    cmd.Parameters.AddWithValue("@state_id", empl.State_id);
                    cmd.Parameters.AddWithValue("@c_id", empl.C_id);
                 
                    cmd.ExecuteNonQuery();
                }
            }

       }


        public void categoryad(string category)
        {

            using (SqlConnection conn = new SqlConnection(connstring))
            {

                using (SqlCommand cmd = new SqlCommand("insert into Category (C_Name,C_Active) values (@c_name,'Y')", conn))
                {

                    conn.Open();

                    cmd.Parameters.AddWithValue("@c_name", category);
     

                    cmd.ExecuteNonQuery();
                }
            }

        }


        public void InsertImages(string files,int p_id)
        {

            using (SqlConnection conn = new SqlConnection(connstring))
            {

                using (SqlCommand cmd = new SqlCommand("insert into Product_Detail values (@p_id,@p_images)", conn))
                {

                    conn.Open();
                    cmd.Parameters.AddWithValue("@p_id", p_id);
                    cmd.Parameters.AddWithValue("@p_images", files);
                   

                    cmd.ExecuteNonQuery();
                }
            }
        }




        public void bidinsert(Bid bid)
        {

            using (SqlConnection conn = new SqlConnection(connstring))
            {

                using (SqlCommand cmd = new SqlCommand("insert into BID values (@P_id,@U_id,@bid_amount,@bid_date)", conn))
                {

                    conn.Open();
                    cmd.Parameters.AddWithValue("@P_id", bid.P_id);
                    cmd.Parameters.AddWithValue("@U_id", bid.U_id);
                    cmd.Parameters.AddWithValue("@bid_amount", bid.Bid_Amount);
                    cmd.Parameters.AddWithValue("@bid_date", bid.bid_Date);


                    cmd.ExecuteNonQuery();
                }
            }
        }


        public void BidDelete(Bid b)
        {

            using (SqlConnection conn = new SqlConnection(connstring))
            {
                using (SqlCommand cmd = new SqlCommand("delete from bid where p_id = @pro_id and u_id = @u_id", conn))
                {
                    conn.Open();

                    cmd.Parameters.AddWithValue("@pro_id", b.P_id);
                    cmd.Parameters.AddWithValue("@u_id", b.U_id);

                    cmd.ExecuteNonQuery();

                }
            }
        }




        public List<Ads> fetchdetail(int id)
        {
            List<Ads> DBase = new List<Ads>();

            using (SqlConnection conn = new SqlConnection(connstring))
            {
                using (SqlCommand cmd = new SqlCommand("select p.P_id,p.P_Name , p.Ad_title , p.Condition , p.Make, p.Price from Product_Master p where p.User_id = @id order by p.p_id", conn))
                {
                    conn.Open();

                    cmd.Parameters.AddWithValue("@id", id);

                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        Ads emp = new Ads();

                        emp.p_id = Convert.ToInt32(reader["P_id"]);
                        emp.P_name = reader["P_Name"].ToString();
                        emp.Ad_title = reader["Ad_title"].ToString();
                        emp.Condition =  reader["Condition"].ToString();
                        emp.Make = reader["Make"].ToString();
                        emp.Price =Convert.ToInt32(reader["Price"]);


                        DBase.Add(emp);

                    }
                }
            }
            return DBase;
        }


        public List<Ads> bid_records(int id)
        {
            List<Ads> DBase = new List<Ads>();

            using (SqlConnection conn = new SqlConnection(connstring))
            {
                using (SqlCommand cmd = new SqlCommand("select p.P_id,p.P_Name , p.Ad_title , p.Condition , p.Make, p.Price , count(b.p_id)count_bid  from BID b  , Product_Master p where b.p_id = p.P_id and p.User_id = @id group by p.p_id,p.P_Name , p.Ad_title , p.Condition , p.Make, p.Price", conn))
                {
                    conn.Open();

                    cmd.Parameters.AddWithValue("@id", id);

                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        Ads emp = new Ads();

                        emp.p_id = Convert.ToInt32(reader["P_id"]);
                        emp.P_name = reader["P_Name"].ToString();
                        emp.Ad_title = reader["Ad_title"].ToString();
                        emp.Condition = reader["Condition"].ToString();
                        emp.Make = reader["Make"].ToString();
                        emp.Price = Convert.ToInt32(reader["Price"]);
                        emp.bid = Convert.ToInt32(reader["count_bid"]);


                        DBase.Add(emp);

                    }
                }
            }
            return DBase;
        }


        

        public List<Ads> userdetailfetch()
        {
            List<Ads> DBase = new List<Ads>();

            using (SqlConnection conn = new SqlConnection(connstring))
            {
                using (SqlCommand cmd = new SqlCommand("select p.P_date , p.P_Name, l.User_name , p.Make , p.Price , s.S_name , p.Sold_product from Product_Master p , login l , state s where p.User_id = l.User_id and p.State_id = s.S_id", conn))
                {
                    conn.Open();

                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        Ads emp = new Ads();

                        emp.p_Date = reader["P_date"].ToString();
                        emp.P_name = reader["P_Name"].ToString();
                        emp.User_name = reader["User_name"].ToString();
                        emp.Make = reader["Make"].ToString();
                        emp.Price = Convert.ToInt32( reader["Price"]);
                        emp.State_Name = reader["S_name"].ToString();
                        emp.sold_product = reader["Sold_product"].ToString();


                        DBase.Add(emp);

                    }
                }
            }
            return DBase;
        }


        public List<Ads> userfetchdetail(int id)
        {
            List<Ads> DBase = new List<Ads>();

            using (SqlConnection conn = new SqlConnection(connstring))
            {
                using (SqlCommand cmd = new SqlCommand("select l.User_name , l.User_email , l.User_contact, l.Last_login,l.User_Active from login l", conn))
                {
                    conn.Open();

                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        Ads emp = new Ads();

                        emp.User_name = reader["User_name"].ToString();
                        emp.user_email = reader["User_email"].ToString();
                        emp.User_contact = reader["User_contact"].ToString();
                        if (reader["Last_login"] != DBNull.Value)
                        {
                            emp.Last_login = Convert.ToDateTime(reader["Last_login"]);
                        }
                      
                        emp.User_active = reader["User_Active"].ToString();

                        DBase.Add(emp);

                    }
                }
            }
            return DBase;
        }


        public Ads adsdetail(int id)
        {
            Ads employee = new Ads();

            using (SqlConnection conn = new SqlConnection(connstring))
            {
                using (SqlCommand cmd = new SqlCommand("select p.P_id,p.P_Name , p.P_desc , p.Make , p.Condition , p.Ad_title ,p.Price,p.State_id,p.C_id,p.sold_product from Product_Master p where p.P_id = @p_id", conn))
                {
                    
                    conn.Open();

                    cmd.Parameters.AddWithValue("@p_id", id);
                    SqlDataReader reader = cmd.ExecuteReader();

                    reader.Read();

                    employee.p_id = Convert.ToInt16(reader["P_id"]);
                    employee.P_name = reader["P_Name"].ToString();
                    employee.P_Desc = reader["P_desc"].ToString();
                    employee.Make = reader["Make"].ToString();
                    employee.Condition =reader["Condition"].ToString();
                    employee.Ad_title = reader["Ad_title"].ToString();
                    employee.Price =Convert.ToInt32( reader["Price"]);
                    employee.State_id = Convert.ToInt32(reader["State_id"]);
                    employee.C_id = Convert.ToInt32(reader["C_id"]);
                    employee.sold_product = reader["sold_product"].ToString();
                }
            }
            return employee;
        }

        public Ads earntotal(int id)
        {
            Ads employee = new Ads();

            using (SqlConnection conn = new SqlConnection(connstring))
            {
                using (SqlCommand cmd = new SqlCommand("select sum(m.Price) price from Product_Master m where m.User_id = @p_id and m.Sold_product = 'Y' group by m.User_id", conn))
                {

                    conn.Open();

                    cmd.Parameters.AddWithValue("@p_id", id);
                    SqlDataReader reader = cmd.ExecuteReader();


                    if (reader.Read())
                    {

                        employee.Price = Convert.ToInt16(reader["price"]);
                    }
  
                }
            }
            return employee;
        }


        public Ads promstrdata(int id)
        {
            Ads employee = new Ads();

            using (SqlConnection conn = new SqlConnection(connstring))
            {
                using (SqlCommand cmd = new SqlCommand("select m.p_id , m.P_date , m.P_Name , m.P_desc , m.Make , m.Condition , m.Ad_title , m.Price , s.S_name , c.C_Name , m.sold_product , l.User_name , l.User_contact , ISNULL(l.User_Profile,'~/Content/Images/user.png') as user_profile from Product_Master m , State s , Category c , login l where m.State_id = s.S_id and m.C_id = c.C_id and l.User_id = m.User_id and m.P_id = @P_id", conn))
                {

                    conn.Open();

                    cmd.Parameters.AddWithValue("@P_id", id);
                    SqlDataReader reader = cmd.ExecuteReader();

                    reader.Read();

                    employee.p_id = Convert.ToInt16(reader["P_id"]);
                    employee.P_name = reader["P_Name"].ToString();
                    employee.P_Desc = reader["P_desc"].ToString();
                    employee.Make = reader["Make"].ToString();
                    employee.Condition = reader["Condition"].ToString();
                    employee.Ad_title = reader["Ad_title"].ToString();
                    employee.Price = Convert.ToInt32(reader["Price"]);
                    employee.State_Name = reader["S_name"].ToString();
                    employee.category_Name = reader["C_Name"].ToString();
                    employee.sold_product = reader["sold_product"].ToString();
                    employee.User_name = reader["User_name"].ToString();
                    employee.User_contact = reader["User_contact"].ToString(); 
                    employee.user_profile = reader["user_profile"].ToString();
                }
            }
            return employee;
        }


        public List<Ads> prodtldata(int id)
        {
            List<Ads> DBase = new List<Ads>();

            using (SqlConnection conn = new SqlConnection(connstring))
            {
                using (SqlCommand cmd = new SqlCommand("select pd.P_id , pd.P_Images from Product_Detail pd where pd.P_id = @p_id", conn))
                {
                    conn.Open();

                    cmd.Parameters.AddWithValue("@p_id", id);

                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        Ads emp = new Ads();

                        emp.p_id = Convert.ToInt32(reader["P_id"]);
                        emp.images = reader["P_Images"].ToString();


                        DBase.Add(emp);

                    }
                }
            }
            return DBase;
        }





        public List<Ads> adsdetailimages(int id)
        {
            List<Ads> DBase = new List<Ads>();

            using (SqlConnection conn = new SqlConnection(connstring))
            {
                using (SqlCommand cmd = new SqlCommand("select pd.id ,pd.P_id,pd.P_Images from Product_Detail pd where pd.P_id =@p_id ", conn))
                {
                   

                    conn.Open();

                    cmd.Parameters.AddWithValue("@p_id", id);
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        Ads emp = new Ads();
                        emp.image_id= Convert.ToInt16(reader["id"]);
                        emp.p_id = Convert.ToInt16(reader["P_id"]);
                        emp.images = reader["P_Images"].ToString();
                       
                        DBase.Add(emp);

                    }
                }
            }
            return DBase;
        }



        public List<Ads> adscount(string id)
        {
            List<Ads> DBase = new List<Ads>();

            using (SqlConnection conn = new SqlConnection(connstring))
            {
                using (SqlCommand cmd = new SqlCommand("select p.p_date,count(*) as count_ad from Product_Master p where p.User_id = @id group by p.p_date", conn))
                {


                    conn.Open();

                    cmd.Parameters.AddWithValue("@id", id);
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        Ads emp = new Ads();
                        emp.p_Date = reader["p_date"].ToString(); /*Convert.ToDateTime(reader["p_date"]);*/
                        emp.count_ads = Convert.ToInt32(reader["count_ad"]);

                        DBase.Add(emp);

                    }
                }
            }
            return DBase;
        }

        public List<Ads> getimagewisedata()
        {
            List<Ads> DBase = new List<Ads>();

            using (SqlConnection conn = new SqlConnection(connstring))
            {
                using (SqlCommand cmd = new SqlCommand("fetchimagewisedata", conn))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    conn.Open();

                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        Ads emp = new Ads();
                        emp.p_id = Convert.ToInt16(reader["P_id"]);
                        emp.p_Date = reader["p_date"].ToString();
                        emp.P_name = reader["P_Name"].ToString();
                        emp.P_Desc = reader["P_desc"].ToString();
                        emp.Price = Convert.ToInt32( reader["Price"]);
                        emp.images = reader["p_image"].ToString();
                        DBase.Add(emp);

                    }
                }
            }
            return DBase;
        }



        public List<Ads> Searchdata(string id)
        {
            List<Ads> DBase = new List<Ads>();

            using (SqlConnection conn = new SqlConnection(connstring))
            {
                using (SqlCommand cmd = new SqlCommand("Searchwithitems", conn))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    conn.Open();

                    cmd.Parameters.AddWithValue("@C_Name", id);
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        Ads emp = new Ads();
                        emp.p_id = Convert.ToInt16(reader["P_id"]);
                        emp.p_Date = reader["p_date"].ToString();
                        emp.P_name = reader["P_Name"].ToString();
                        emp.P_Desc = reader["P_desc"].ToString();
                        emp.Price = Convert.ToInt32(reader["Price"]);
                        emp.images = reader["p_image"].ToString();
                        DBase.Add(emp);

                    }
                }
            }
            return DBase;
        }


        public List<Category> NavMenu()
        {
            List<Category> DBase = new List<Category>();

            using (SqlConnection conn = new SqlConnection(connstring))
            {
                using (SqlCommand cmd = new SqlCommand("select Top 7 c.C_id , c.C_Name from Category c", conn))
                {

                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        Category emp = new Category();
                        emp.C_id = Convert.ToInt16(reader["C_id"]);
                        emp.C_Name = reader["C_Name"].ToString();

                        DBase.Add(emp);

                    }
                }
            }
            return DBase;
        }




        public void Mdeleterecord(int id)
        {

            using (SqlConnection conn = new SqlConnection(connstring))
            {
                using (SqlCommand cmd = new SqlCommand("delete from Product_Master where p_id = @id", conn))
                {
                    conn.Open();

                    cmd.Parameters.AddWithValue("@id", id);

                    cmd.ExecuteNonQuery();

                }
            }
        }

        public void Ddeleterecord(int id)
        {

            using (SqlConnection conn = new SqlConnection(connstring))
            {
                using (SqlCommand cmd = new SqlCommand("delete from Product_Detail where p_id = @id", conn))
                {
                    conn.Open();

                    cmd.Parameters.AddWithValue("@id", id);

                    cmd.ExecuteNonQuery();

                }
            }
        }


        public void Deleteimage(string id)
        {

            SqlConnection con = new SqlConnection(connstring);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "delete from Product_Detail where id = @id";
            cmd.Connection = con;
            con.Open();

            cmd.Parameters.AddWithValue("@id", id);


            cmd.ExecuteNonQuery();
        }



        public void updateemp(Ads empl)
        {

            using (SqlConnection conn = new SqlConnection(connstring))
            {
                using (SqlCommand cmd = new SqlCommand("update Product_Master set P_Name=@P_name ,P_desc= @P_desc ,Make = @p_make , Condition = @p_cond , Ad_title = @p_title , Price = @P_price , State_id = @state_id ,C_id= @c_id,sold_product = @s_p where P_id = @p_id", conn))
                {
                    

                    conn.Open();

                    cmd.Parameters.AddWithValue("@p_id", empl.p_id);
                    cmd.Parameters.AddWithValue("@P_name", empl.P_name);
                    cmd.Parameters.AddWithValue("@P_desc", empl.P_Desc);
                    cmd.Parameters.AddWithValue("@p_make", empl.Make);
                    cmd.Parameters.AddWithValue("@p_cond", empl.Condition);
                    cmd.Parameters.AddWithValue("@p_title", empl.Ad_title);
                    cmd.Parameters.AddWithValue("@P_price", empl.Price);
                    cmd.Parameters.AddWithValue("@state_id", empl.State_id);
                    cmd.Parameters.AddWithValue("@c_id", empl.C_id);
                    cmd.Parameters.AddWithValue("@s_p", empl.sold_product);

                    

                    cmd.ExecuteNonQuery();
                }
            }
        }

        public void updatepassword(string password , int user_id)
        {

            using (SqlConnection conn = new SqlConnection(connstring))
            {
                using (SqlCommand cmd = new SqlCommand("update login set password = @password where user_id = @user_id", conn))
                {


                    conn.Open();

                    cmd.Parameters.AddWithValue("@password", password);
                    cmd.Parameters.AddWithValue("@user_id", user_id);
                    



                    cmd.ExecuteNonQuery();
                }
            }
        }

        public void Logoutupdate(int User_id, DateTime Last_login, string user_active)
        {

            using (SqlConnection conn = new SqlConnection(connstring))
            {
                using (SqlCommand cmd = new SqlCommand("update login set last_login = @last_login , User_Active = @user_active where user_id = @user_id", conn))
                {


                    conn.Open();

                    cmd.Parameters.AddWithValue("@last_login", Last_login);
                    cmd.Parameters.AddWithValue("@user_active", user_active);
                    cmd.Parameters.AddWithValue("@user_id", User_id);
    
                    cmd.ExecuteNonQuery();
                }
            }
        }


        public List<Bid> Bid_user_details(int getid)
        {
            List<Bid> DBase = new List<Bid>();

            using (SqlConnection conn = new SqlConnection(connstring))
            {
                using (SqlCommand cmd = new SqlCommand("select b.p_id,b.u_id,  l.User_name,  ISNULL(l.User_Profile,'~/Content/Images/user.png') User_Profile, l.User_contact, b.bid_date , b.bid_Amount  from bid b , Login l where b.u_id = l.User_id and b.p_id = @user_id order by b.bid_date desc", conn))
                {
                    conn.Open();
                    SqlParameter user = cmd.Parameters.AddWithValue("@user_id", getid);
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        Bid emp = new Bid();

                        emp.P_id = Convert.ToInt16(reader["p_id"]);
                        emp.U_id = Convert.ToInt16(reader["u_id"]);
                        emp.User_Name = reader["User_Name"].ToString();
                        emp.User_profile = reader["User_profile"].ToString();
                        emp.User_contact = Convert.ToInt64(reader["User_contact"]);
                        emp.bid_Date = Convert.ToDateTime( reader["bid_date"]);
                        emp.Bid_Amount = Convert.ToInt32(reader["bid_Amount"]);


                        DBase.Add(emp);

                    }
                }
            }
            return DBase;
        }

        public login user_profile(int id)
        {
            login employee = new login();

            using (SqlConnection conn = new SqlConnection(connstring))
            {
                using (SqlCommand cmd = new SqlCommand("select * from Login where user_id = @u_id", conn))
                {

                    conn.Open();

                    cmd.Parameters.AddWithValue("@u_id", id);
                    SqlDataReader reader = cmd.ExecuteReader();

                    reader.Read();

                    employee.id = Convert.ToInt32(reader["User_id"]);
                    employee.Username = reader["User_name"].ToString();
                    employee.User_email = reader["User_email"].ToString();
                    employee.User_contact = Convert.ToInt64(reader["User_contact"]);
                    employee.User_profile = reader["User_Profile"].ToString();
                }
            }
            return employee;
        }

        public login count_bid(int id)
        {
            login employee = new login();

            using (SqlConnection conn = new SqlConnection(connstring))
            {
                using (SqlCommand cmd = new SqlCommand("select count(*) as count_bid from BID b where b.u_id= @u_id group by b.u_id", conn))
                {

                    conn.Open();

                    cmd.Parameters.AddWithValue("@u_id", id);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        employee.id = Convert.ToInt32(reader["count_bid"]);
                    }

                      

                }
            }
            return employee;
        }


        public login count_prod(int id)
        {
            login employee = new login();

            using (SqlConnection conn = new SqlConnection(connstring))
            {
                using (SqlCommand cmd = new SqlCommand("select count(*) as count_prod from Product_Master pm where pm.User_id = @u_id  group by pm.User_id ", conn))
                {

                    conn.Open();

                    cmd.Parameters.AddWithValue("@u_id", id);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        employee.id = Convert.ToInt32(reader["count_prod"]);
                    }

                   

                }
            }
            return employee;
        }


        public login count_saleprod(int id)
        {
            login employee = new login();

            using (SqlConnection conn = new SqlConnection(connstring))
            {
                using (SqlCommand cmd = new SqlCommand("select count(*) as count_saleprod from Product_Master pm where pm.User_id = @u_id and pm.Sold_product = 'Y' group by pm.User_id ", conn))
                {

                    conn.Open();

                    cmd.Parameters.AddWithValue("@u_id", id);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {

                        employee.id = Convert.ToInt32(reader["count_saleprod"]);

                    }


                }
            }
            return employee;
        }


        public login count_bidperprod(int id)
        {
            login employee = new login();

            using (SqlConnection conn = new SqlConnection(connstring))
            {
                using (SqlCommand cmd = new SqlCommand("select count(b.p_id)count_bid  from BID b  where b.u_id = @u_id group by b.p_id", conn))
                {

                    conn.Open();

                    cmd.Parameters.AddWithValue("@u_id", id);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {

                        employee.id = Convert.ToInt32(reader["count_bid"]);

                    }


                }
            }
            return employee;
        }

        public void Profileupdate(int id, string Username, string User_email, string User_contact, string User_profile)
        {

            using (SqlConnection conn = new SqlConnection(connstring))
            {
                using (SqlCommand cmd = new SqlCommand("update Login set User_name = @Username, User_email = @Useremail , User_contact = @Usercontact, User_Profile = @Userprofile where User_id = @u_id", conn))
                {


                    conn.Open();

                    cmd.Parameters.AddWithValue("@u_id", id);
                    cmd.Parameters.AddWithValue("@Username", Username);
                    cmd.Parameters.AddWithValue("@Useremail", User_email);
                    cmd.Parameters.AddWithValue("@Usercontact", User_contact);
                    cmd.Parameters.AddWithValue("@Userprofile", User_profile);
                    

                    cmd.ExecuteNonQuery();
                }
            }
        }




        public void Signup(SignUp bid)
        {

            using (SqlConnection conn = new SqlConnection(connstring))
            {

                using (SqlCommand cmd = new SqlCommand("insert into login(User_name, Password , User_email, User_contact, User_Profile) values (@Username , @Password , @User_email, @User_contact, @User_profile)", conn))
                {

                    conn.Open();
                    cmd.Parameters.AddWithValue("@Username", bid.Username);
                    cmd.Parameters.AddWithValue("@Password", bid.Password);
                    cmd.Parameters.AddWithValue("@User_email", bid.User_email);
                    cmd.Parameters.AddWithValue("@User_contact", bid.User_contact);
                    cmd.Parameters.AddWithValue("@User_profile", bid.Filename);


                    cmd.ExecuteNonQuery();
                }
            }
        }



        public DataSet GetName(string prefix)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbx"].ConnectionString);
            SqlCommand com = new SqlCommand("select * from Category c where c.C_Name like '%'+@prefix+'%'", con);
            com.Parameters.AddWithValue("@prefix", prefix);
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(com);
            da.Fill(ds);
            return ds;
        }
    }
}