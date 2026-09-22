using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using shimaa11818WebApp.App_Code;

namespace shimaa11818WebApp.HR_Pages
{
    public partial class jobVacancy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                populateJobVacancy();
            }
        }


        protected virtual void populateJobVacancy()
        {
            CRUD myCrud = new CRUD();
            string mySql = "select * from jobVacancy"; 

            Dictionary<string, object> myPara = new Dictionary<string, object>();
         

            DataTable dt = myCrud.Select(mySql, myPara);


            if (dt.Rows.Count > 0)
            {
                rptJobs.DataSource = dt;   
                rptJobs.DataBind();
                lblNoData.Visible = false;
            }
            else
            {
                rptJobs.DataSource = null;
                rptJobs.DataBind();
                lblNoData.Visible = true;
            }
            










        }

        protected void rptJobs_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "DeleteJob")
            {
                int jobId = Convert.ToInt32(e.CommandArgument);

                CRUD myCrud = new CRUD();
                string sql = "DELETE FROM jobVacancy WHERE jobId=@jobId";

                Dictionary<string, object> para = new Dictionary<string, object>();
                para.Add("@jobId", jobId);

                int rows = myCrud.InsertUpdateDeleteViaSqlDic(sql, para);

                if (rows > 0)
                {
                    lblNoData.Text = "Job deleted successfully.";
                    populateJobVacancy(); // reload repeater
                }
                else
                {
                    lblNoData.Text = "Delete failed.";
                }
            }
        }
    }
}
