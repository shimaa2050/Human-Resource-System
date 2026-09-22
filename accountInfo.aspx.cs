using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using shimaa11818WebApp.App_Code;

namespace shimaa11818WebApp
{
    public partial class accountInfo : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                EnsureApplicantSession();

                if (Session["ApplicantId"] == null)
                {
                    Response.Redirect("apply.aspx");
                    return;
                }

                populateinfo();
                populateappliedjobs();
            }
        }




        private void EnsureApplicantSession()
        {
            if (Session["ApplicantId"] != null)
                return;

            if (!User.Identity.IsAuthenticated)
                return;

            string username = User.Identity.Name;

            CRUD myCrud = new CRUD();
            string sql = "SELECT applicantId FROM applicant WHERE userName = @username";

            Dictionary<string, object> para = new Dictionary<string, object>();
            para.Add("@username", username);

            DataTable dt = myCrud.Select(sql, para);

            if (dt != null && dt.Rows.Count > 0)
            {
                Session["ApplicantId"] = dt.Rows[0]["applicantId"];
            }
        }

        protected void populateinfo()
        {
            if (Session["ApplicantId"] != null)
            {
                int Id = (int)Session["ApplicantId"];

                CRUD myCrud = new CRUD();

                string mySql = @"SELECT * FROM applicant WHERE applicantId = @Id";

                Dictionary<string, object> myPara = new Dictionary<string, object>();
                myPara.Add("@Id", Id);

                DataTable dt = myCrud.Select(mySql, myPara);

                if (dt.Rows.Count > 0)
                {
                    DataRow row = dt.Rows[0];

                    lblEnglishName.Text = row["applicantEnglishName"].ToString();
                    lblArabicName.Text = row["applicantArabicName"].ToString();
                    lblDOB.Text = Convert.ToDateTime(row["dob"]).ToString("yyyy-MM-dd");
                    lblNationalID.Text = row["applicantNationalId"].ToString();
                    lblPhone.Text = row["applicantPhoneNumber"].ToString();
                    lblEmail.Text = row["applicantEmail"].ToString();
                    lblMajor.Text = row["major"].ToString();
                    lblUniversity.Text = row["applicantUniversity"].ToString();
                    lblCountry.Text = row["applicantJobCountry"].ToString();

                    // CV Link
                    if (row["cv"] != DBNull.Value)
                    {
                        lnkCV.NavigateUrl = row["cv"].ToString();
                        lnkCV.Visible = true;
                    }
                    else
                    {
                        lnkCV.Visible = false;
                    }
                }
            }
        }

        protected void populateappliedjobs()
        {

            if (Session["ApplicantId"] != null)
            {
                int Id = (int)Session["ApplicantId"];

                CRUD myCrud = new CRUD();

                string mySql = @"select jv.jobName , aj.applicationDate,  aj.statusId  from applicantAppliedJobs aj inner join  jobVacancy jv  on aj.jobId = jv.jobId where applicantId= @Id;";

                Dictionary<string, object> myPara = new Dictionary<string, object>();
                myPara.Add("@Id", Id);

                DataTable dt = myCrud.Select(mySql, myPara);


                if (dt.Rows.Count > 0)
                {
                    rptAppliedJobs.DataSource = dt;   // ✅ bind full table
                    rptAppliedJobs.DataBind();
                    lblNoData.Visible = false;
                }
                else
                {
                    rptAppliedJobs.DataSource = null;
                    rptAppliedJobs.DataBind();
                    lblNoData.Visible = true;
                }
            }
        }
    }
}






