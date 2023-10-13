using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Security.Cryptography;

namespace first
{
    public partial class Vender : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UID"] != null)
            {
                txtUser.Text = Session["UID"].ToString();

            }
            else
            {
                Response.Redirect("Login.aspx");
            }
            if (Session["Password"] != null)
            {
                txtAddress.Text = Session["Password"].ToString();
            }
            loadData();



            //if (Request.QueryString["username"]!=null)
            //{
            //   txtUser.Text = Request.QueryString["username"].ToString();

            //}
            //if (Request.QueryString["password"]!= null)
            //{
            //    txtAddress.Text = Request.QueryString["password"].ToString();
            //}
            //loadData();

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            byte[] photArray = null;
            if (fileUpload.HasFile)
            {
                //string Path = Server.MapPath("~/Media/") + fileUpload.FileName;
                //fileUpload.SaveAs(Path);
                photArray = fileUpload.FileBytes;

            }


            int Vid = Convert.ToInt32(venderGrid.SelectedValue);
            try
            {

                SqlConnection con = new SqlConnection();
                con.ConnectionString = @"Data Source=.\MSSQLSERVER20;Initial Catalog=Inventory;User ID=sa;Password=Sql123";
                con.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;



                if (Vid > 0)
                {
                    cmd.CommandText = "UPDATE tblVender set Name='" + txtName.Text + "',Address='" + txtAddress.Text + "',MobileNo=" + TxtMobileno.Text + ",Email='" + txtEmail.Text + "',GSTN='141fdfv5515',Pancard='KATPK9456f',IsActive=" + cmbActive.SelectedValue + ",CreatedOn= GETDATE(),CreatedBy='1',Photo=@file where Id=" + Vid + " ";

                    SqlParameter p1 = new SqlParameter();
                    p1.ParameterName = "file";
                    p1.SqlDbType = SqlDbType.VarBinary;
                    p1.SqlValue = photArray;
                    cmd.Parameters.Add(p1);

                    cmd.ExecuteNonQuery();
                    lblStatus.ForeColor = System.Drawing.Color.Green;
                    lblStatus.Text = "Updated Succesfully";
                }
                else
                {
                    string dr = "INSERT INTO tblVender (Name,Address,MobileNo,Email,GSTN,Pancard,IsActive,CreatedOn,CreatedBy,Photo)VALUES('" + txtName.Text + "','" + txtAddress.Text + "'," + TxtMobileno.Text + ",'" + txtEmail.Text + "','12e12331313','KATPK9456F'," + cmbActive.SelectedValue + ",getDate(),'1',@file)";
                    cmd.CommandText = dr;

                    SqlParameter p1 = new SqlParameter();
                    p1.ParameterName = "file";
                    p1.SqlDbType = SqlDbType.VarBinary;
                    p1.SqlValue = photArray;
                    cmd.Parameters.Add(p1);

                    cmd.ExecuteNonQuery();
                    lblStatus.ForeColor = System.Drawing.Color.Green;
                    lblStatus.Text = "Saved Succesfully";
                }





                con.Close();

                loadData();
            }
            catch (Exception er)
            {
                lblStatus.ForeColor = System.Drawing.Color.Red;
                lblStatus.Text = er.Message;
            }


        }

        private void loadData()
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = @"Data Source=.\MSSQLSERVER20;Initial Catalog=Inventory;User ID=sa;Password=Sql123";
            con.Open();

            DataSet ds = new DataSet();
            SqlDataAdapter dt = new SqlDataAdapter(" select Id,Photo,Name,Address,MobileNo,Email,IsActive from tblVender", con);
            dt.Fill(ds);



            venderGrid.DataSource = ds.Tables[0];
            venderGrid.DataBind();



            con.Close();

        }

        protected void venderGrid_SelectedIndexChanged(object sender, EventArgs e)
        {

            int Vid = Convert.ToInt32(venderGrid.SelectedValue.ToString());
            if (Vid > 0)
            {
                SqlConnection con = new SqlConnection();
                con.ConnectionString = @"Data Source=.\MSSQLSERVER20;Initial Catalog=Inventory;User ID=sa;Password=Sql123";
                con.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;

                cmd.CommandText = "select Id,Photo, Name,Address,MobileNo,Email,IsActive from tblVender where Id= " + Vid + "";
                var dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    txtId.Text = dr["ID"].ToString();
                    txtName.Text = dr["Name"].ToString();
                    txtAddress.Text = dr["Address"].ToString();
                    txtEmail.Text = dr["Email"].ToString();
                    TxtMobileno.Text = dr["MobileNo"].ToString();


                    if (Convert.ToBoolean(dr["IsActive"].ToString()) == true)
                    {
                        cmbActive.SelectedIndex = 0;

                    }
                    else
                    {
                        cmbActive.SelectedIndex = 1;
                    }


                }


                con.Close();
                lblStatus.Text = "";
                loadData();

            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int Vid = Convert.ToInt32(venderGrid.SelectedValue.ToString());
            if (Vid > 0)
            {
                try
                {
                    SqlConnection con = new SqlConnection();
                    con.ConnectionString = @"Data Source=.\MSSQLSERVER20;Initial Catalog=Inventory;User ID=sa;Password=Sql123";
                    con.Open();

                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;

                    cmd.CommandText = "Delete from tblVender where Id= " + Vid + "";
                    cmd.ExecuteNonQuery();


                    lblStatus.Text = "Deleted Succesfully";

                    con.Close();



                    loadData();

                }
                catch (Exception er)
                {
                    lblStatus.ForeColor = System.Drawing.Color.Red;
                    lblStatus.Text = er.Message;
                }

            }


        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {

        }

        protected void Unnamed1_Click1(object sender, EventArgs e)
        {

            Session["UID"] = null;
        }
    }
}



