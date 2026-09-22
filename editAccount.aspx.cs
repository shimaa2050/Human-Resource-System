using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using shimaa11818WebApp.App_Code;
using System.Data;
using System.IO;

namespace shimaa11818WebApp
{
    public partial class editAccount : System.Web.UI.Page
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



                populateMajor();
                populateUniversity();
                populateJobCountry();
                LoadApplicantData();


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

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Session["ApplicantId"] != null)
            {
                int Id = (int)Session["ApplicantId"];
                CRUD myCrud = new CRUD();

                string mySql = @"UPDATE applicant 
                         SET applicantEnglishName=@applicantEnglishName,
                             applicantArabicName=@applicantArabicName,
                             dob=@dob,
                             applicantNationalId=@applicantNationalId,
                             applicantPhoneNumber=@applicantPhoneNumber,
                             applicantEmail=@applicantEmail,
                             major=@major,
                             applicantUniversity=@applicantUniversity,
                             applicantJobCountry=@applicantJobCountry,
                             cv=@cv
                         WHERE applicantId=@Id";

                Dictionary<string, object> myPara = new Dictionary<string, object>();

                myPara.Add("@applicantEnglishName", txtEnglishName.Text);
                myPara.Add("@applicantArabicName", txtArabicName.Text);
                myPara.Add("@dob", txtDOB.Text);
                myPara.Add("@applicantNationalId", txtNationalID.Text);
                myPara.Add("@applicantPhoneNumber", txtPhone.Text);
                myPara.Add("@applicantEmail", txtEmail.Text);
                myPara.Add("@major", ddlMajor.SelectedItem.Text);
                myPara.Add("@applicantUniversity", ddlUniversity.SelectedItem.Text);
                myPara.Add("@applicantJobCountry", ddlCountry.SelectedItem.Text);
                myPara.Add("@Id", Id);

                string cvPath = null;

                if (fuCV.HasFile)
                {
                    string folderPath = Server.MapPath("~/CVs/");

                    if (!Directory.Exists(folderPath))
                    {
                        Directory.CreateDirectory(folderPath);
                    }

                    string fileName = Guid.NewGuid().ToString() + "_" + Path.GetFileName(fuCV.FileName);
                    string fullPath = Path.Combine(folderPath, fileName);

                    fuCV.SaveAs(fullPath);
                    cvPath = "~/CVs/" + fileName;
                }

                else
                {
                    // Keep old CV from database
                    cvPath = lnkCV.NavigateUrl;
                }

                myPara.Add("@cv", cvPath);


                int rows = myCrud.InsertUpdateDeleteViaSqlDic(mySql, myPara);

                if (rows > 0)
                {
                    lbloutput.Text = "Account updated successfully.";
                }
                else
                {
                    lbloutput.Text = "Update failed.";
                }
            }
        }


        protected void populateMajor()
        {
            CRUD myCrud = new CRUD();
            string mySql = @"select * from major ";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            ddlMajor.DataValueField = "majorId";
            ddlMajor.DataTextField = "majorName";
            ddlMajor.DataSource = dr;
            ddlMajor.DataBind();

            ddlMajor.Items.Insert(0, new ListItem("-- Select  --", "0"));


        }

        protected void populateUniversity()
        {

            CRUD myCrud = new CRUD();
            string mySql = @"select * from university";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            ddlUniversity.DataValueField = "uniId";
            ddlUniversity.DataTextField = "uniName";
            ddlUniversity.DataSource = dr;
            ddlUniversity.DataBind();
            ddlUniversity.Items.Insert(0, new ListItem("-- Select  --", "0"));



        }


        protected void populateJobCountry()
        {
            CRUD myCrud = new CRUD();
            string mySql = @"select * from  country";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            ddlCountry.DataValueField = "countryId";
            ddlCountry.DataTextField = "countryName";
            ddlCountry.DataSource = dr;
            ddlCountry.DataBind();

            ddlCountry.Items.Insert(0, new ListItem("-- Select  --", "0"));
        }


        private void LoadApplicantData()
        {
            if (Session["ApplicantId"] != null)
            {
                int Id = (int)Session["ApplicantId"];

                CRUD myCrud = new CRUD();
                string sql = "SELECT * FROM applicant WHERE applicantId=@Id";

                Dictionary<string, object> para = new Dictionary<string, object>();
                para.Add("@Id", Id);

                SqlDataReader dr = myCrud.getDrPassSqlDic(sql, para);

                if (dr.Read())
                {
                    txtEnglishName.Text = dr["applicantEnglishName"].ToString();
                    txtArabicName.Text = dr["applicantArabicName"].ToString();
                    txtDOB.Text = Convert.ToDateTime(dr["dob"]).ToString("yyyy-MM-dd");
                    txtNationalID.Text = dr["applicantNationalId"].ToString();
                    txtPhone.Text = dr["applicantPhoneNumber"].ToString();
                    txtEmail.Text = dr["applicantEmail"].ToString();

                    ddlMajor.SelectedValue = dr["major"].ToString();
                    ddlUniversity.SelectedValue = dr["applicantUniversity"].ToString();
                    ddlCountry.SelectedValue = dr["applicantJobCountry"].ToString();
                    lnkCV.NavigateUrl = dr["cv"].ToString();
                    lnkCV.Text = "View Current CV";
                }

                dr.Close();
            }
        }



    }
}