using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace first
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Response.Write(" <b>Welcome PhionX</b>");

            //for (int i = 0; i <= 10; i++)
            //{
            //    Response.Write(" <i>Welcome PhionX</i>");

            //}

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {

                SqlConnection con = new SqlConnection();
                con.ConnectionString = @"Data Source=.\MSSQLSERVER20;Initial Catalog=Inventory;User ID=sa;Password=Sql123";
                con.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;


                var d = cmd.CommandText = " select * from tblUser where LoginName='" + txtUsername.Text + "' and Password='" + txtPassword.Text + "' ";
                var dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    // 3 Using Session

                    Session["UID"] = txtUsername.Text;
                    Session["Password"] = txtPassword.Text;

                    Response.Redirect("Vender.aspx");





                    //2 using Cookies

                    //Response.Cookies["UID"].Value=txtUsername.Text;
                    //Response.Cookies["UID"].Expires=DateTime.Now.AddSeconds(10);
                    //Response.Cookies["Password"].Value = txtPassword.Text;
                    //Response.Cookies["Password"].Expires = DateTime.Now.AddSeconds(10);

                    //Response.Redirect("Vender.aspx");

                    // using QueryString
                    //Response.Redirect("Vender.aspx?username=" + txtUsername.Text + "&password=" + txtPassword.Text + "");

                }

                lblStetus.ForeColor = System.Drawing.Color.Green;
                lblStetus.Text = "Invalid Creditial";







                con.Close();


            }
            catch (Exception)
            {






            }
        }
    }
}