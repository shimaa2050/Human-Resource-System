using shimaa11818WebApp.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shimaa11818WebApp.Admin_Pages
{
    public partial class adDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {   


            if(!IsPostBack)
            {
                populate_Applications_and_Applicants();
                populateJobs();
                populateHRNum();
            }
        }



        protected void populate_Applications_and_Applicants()
        {

            CRUD myCrud = new CRUD();

            string mySql = @"select count(jobId) as totalApplications, count(applicantId) as totalApplicant from  applicantAppliedJobs";


            DataTable dt = myCrud.Select(mySql, null);

            if (dt.Rows.Count > 0)
            {
                DataRow row = dt.Rows[0];

                lblTotalApplications.Text = row["TotalApplications"].ToString();
                lblTotalApplicants.Text = row["totalApplicant"].ToString();


            }
        }



        protected void populateJobs()
        {

            CRUD myCrud = new CRUD();

            string mySql = @"select count(jobId) As numberOfJobs from jobVacancy;";

    

            DataTable dt = myCrud.Select(mySql, null);

            if (dt.Rows.Count > 0)
            {
                DataRow row = dt.Rows[0];

                lblTotalJobs.Text = row["numberOfJobs"].ToString();



            }




        }



        protected void populateHRNum()
        {

            CRUD myCrud = new CRUD();

            string mySql = @"select Count(ApplicationId) as 'NumberofHR' from [dbo].[aspnet_Roles] where RoleName ='HR' ";



            DataTable dt = myCrud.Select(mySql, null);

            if (dt.Rows.Count > 0)
            {
                DataRow row = dt.Rows[0];

                lblTotalHR.Text = row["NumberofHR"].ToString();



            }




        }
    }
}