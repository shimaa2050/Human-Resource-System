using System;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web.UI.WebControls;
using shimaa11818WebApp.App_Code;

namespace shimaa11818WebApp
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Context.User != null && Context.User.Identity.IsAuthenticated)
            {
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.Cache.SetNoStore();
                Response.Cache.SetExpires(DateTime.UtcNow.AddSeconds(-1));
            }
        }


        protected void btnLogout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Session.Clear();
            Session.Abandon();

            Response.Redirect("~/login.aspx");
        }
    }
}