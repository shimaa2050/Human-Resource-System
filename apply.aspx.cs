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
    public partial class apply : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                populateNationality();
                populateGender();
                populateMaritalStatus();
                populateUniversity();
                populateMajor();
                populateEducationLevel();
                populateJobCountry();
                populateJobType();
                populateExperienceYears();
                populateNoticePeriod();
            

            }
        }

        protected void populateNationality()
        {
         
            CRUD myCrud = new CRUD();
            string mySql = @"select * from nationality";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            ddlNationality.DataValueField = "nationalityId";
            ddlNationality.DataTextField = "nationality";
            ddlNationality.DataSource = dr;
            ddlNationality.DataBind();
            ddlNationality.Items.Insert(0, new ListItem("-- Select  --", "0"));


        }

        protected void populateGender()
        {

            CRUD myCrud = new CRUD();
            string mySql = @"select * from gender;";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            rblGender.DataValueField = "genderId";
            rblGender.DataTextField = "gender";
            rblGender.DataSource = dr;
            rblGender.DataBind();


        }

        protected void populateMaritalStatus()
        {

            CRUD myCrud = new CRUD();
            string mySql = @"select * from maritalStatus";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            rblMaritalStatus.DataValueField = "statusId";
            rblMaritalStatus.DataTextField = "maritalStatus";
            rblMaritalStatus.DataSource = dr;
            rblMaritalStatus.DataBind();


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

        protected void populateEducationLevel()
        {
      
            CRUD myCrud = new CRUD();
            string mySql = @"select * from educationLevel ";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            ddlEducationLevel.DataValueField = "eduId";
            ddlEducationLevel.DataTextField = "educationLevel";
            ddlEducationLevel.DataSource = dr;
            ddlEducationLevel.DataBind();
            ddlEducationLevel.Items.Insert(0, new ListItem("-- Select  --", "0"));

        }

       


        protected void populateJobCountry()
        {
            CRUD myCrud = new CRUD();
            string mySql = @"select * from  country";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            ddlJobCountry.DataValueField = "countryId";
            ddlJobCountry.DataTextField = "countryName";
            ddlJobCountry.DataSource = dr;
            ddlJobCountry.DataBind();

            ddlJobCountry.Items.Insert(0, new ListItem("-- Select  --", "0"));
        }


        protected void populateJobType()
        {

            CRUD myCrud = new CRUD();
            string mySql = @"select * from  jobType";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            cblJobType.DataValueField = "jobId";
            cblJobType.DataTextField = "jobType";
            cblJobType.DataSource = dr;
            cblJobType.DataBind();


        }


        protected void populateExperienceYears()
        {

            CRUD myCrud = new CRUD();
            string mySql = @"select * from experienceYears ";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            rblExperience.DataValueField = "expId";
            rblExperience.DataTextField = "experienceYears";
            rblExperience.DataSource = dr;
            rblExperience.DataBind();



        }


        protected void populateNoticePeriod()
        {

            CRUD myCrud = new CRUD();
            string mySql = @"select * from  noticePeriod";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            rblNoticePeriod.DataValueField = "noticeId";
            rblNoticePeriod.DataTextField = "noticePeriod";
            rblNoticePeriod.DataSource = dr;
            rblNoticePeriod.DataBind();

        }


        

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            if (!Page.IsValid)
                return;

            CRUD myCrud = new CRUD();

            string mySql = @"INSERT INTO applicant
    (applicantJobCountry, applicantUniversity, jobType, requestedSalary, lastSalary,
     noticePeriod, jobTitle, applicantEnglishName, applicantArabicName, dob,
     applicantNationalId, applicantGender, applicantNationality,
     applicantDependentsNum, maritalStatus, isSpecialNeeds,
     applicantPhoneNumber, applicantEmail, experienceYears,
     major, gpa, educationLevel, cv,userName)

     VALUES
    (@applicantJobCountry, @applicantUniversity, @jobType, @requestedSalary, @lastSalary,
     @noticePeriod, @jobTitle, @applicantEnglishName, @applicantArabicName, @dob,
     @applicantNationalId, @applicantGender, @applicantNationality,
     @applicantDependentsNum, @maritalStatus, @isSpecialNeeds,
     @applicantPhoneNumber, @applicantEmail, @experienceYears,
     @major, @gpa, @educationLevel, @cv,@userName);

     SELECT SCOPE_IDENTITY();";

            Dictionary<string, object> myPara = new Dictionary<string, object>();
            string username = User.Identity.Name;

            myPara.Add("@applicantJobCountry", ddlJobCountry.SelectedItem.Text);
            myPara.Add("@applicantUniversity", ddlUniversity.SelectedItem.Text);
            myPara.Add("@jobType", cblJobType.SelectedItem.Text);
            myPara.Add("@requestedSalary", decimal.Parse(txtRequestedSalary.Text));
            myPara.Add("@lastSalary", decimal.Parse(txtLastSalary.Text));
            myPara.Add("@noticePeriod", rblNoticePeriod.SelectedItem.Text);
            myPara.Add("@jobTitle", txtJobTitle.Text);
            myPara.Add("@applicantEnglishName", txtEnglishName.Text);
            myPara.Add("@applicantArabicName", txtArabicName.Text);
            myPara.Add("@dob", txtDOB.Text);
            myPara.Add("@applicantNationalId", txtNationalID.Text);
            myPara.Add("@applicantGender", rblGender.SelectedItem.Text);
            myPara.Add("@applicantNationality", ddlNationality.SelectedItem.Text);
            myPara.Add("@applicantDependentsNum", int.Parse(txtDependents.Text));
            myPara.Add("@maritalStatus", rblMaritalStatus.SelectedItem.Text);

            myPara.Add("@isSpecialNeeds",
                rblSpecialNeeds.SelectedValue == "Yes" ? 1 : 0);

            myPara.Add("@applicantPhoneNumber", txtPhone.Text);
            myPara.Add("@applicantEmail", txtEmail.Text);
            myPara.Add("@experienceYears", rblExperience.SelectedItem.Text);
            myPara.Add("@major", ddlMajor.SelectedItem.Text);
            myPara.Add("@gpa", decimal.Parse(txtGPA.Text));
            myPara.Add("@educationLevel", ddlEducationLevel.SelectedItem.Text);

            if (fuCV.HasFile)
            {
                string folderPath = Server.MapPath("~/CVs/");

                // Ensure folder exists
                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                string fileName = Guid.NewGuid().ToString() + "_" + Path.GetFileName(fuCV.FileName);
                string fullPath = Path.Combine(folderPath, fileName);

                fuCV.SaveAs(fullPath);

                myPara.Add("@cv", "~/CVs/" + fileName);
            }

            else
            {
                lbloutput.Text = "No file selected.";
                return;
            }
            myPara.Add("@userName", username);
            // Insert and get new applicantId
            int newApplicantId = Convert.ToInt32(
                myCrud.InsertUpdateDeleteViaSqlDicRtnIdentity(mySql, myPara)
            );

            if (newApplicantId > 0)
            {
                Session["ApplicantId"] = newApplicantId;   // store across pages
                Response.Redirect("SkillsLanguages.aspx"); // go to next page
            }
            else
            {
                lbloutput.Text = "Operation failed.";
            }
            
        }





        protected void cvJobType_ServerValidate(object source, ServerValidateEventArgs args)
        {
            bool isSelected = false;

            foreach (ListItem item in cblJobType.Items)
            {
                if (item.Selected)
                {
                    isSelected = true;
                    break;
                }
            }

            args.IsValid = isSelected;
        }
    }
}


