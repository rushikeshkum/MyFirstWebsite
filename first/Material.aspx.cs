using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace first
{
    public partial class Material : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UID"] != null)
            {
                 Session["UID"].ToString();

            }
            else
            {
                Response.Redirect("Login.aspx");
            }
            if (Session["Password"] != null)
            {
                 Session["Password"].ToString();
            }

        }
    }
}