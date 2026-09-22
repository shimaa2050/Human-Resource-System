using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using shimaa11818WebApp.App_Code;
using System.Data;

namespace shimaa11818WebApp
{
    public partial class SkillsLanguages : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["ApplicantId"] == null)
            {
                Response.Redirect("apply.aspx");
            }

            if (!IsPostBack)
            {

                populateSkills();
                populateLanguages();
                populateLanguagesLevels();
                populateJobVacancy();

            }
        }

        protected void populateSkills()
        {

            CRUD myCrud = new CRUD();
            string mySql = @"select * from skills ";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            ddlSkills.DataValueField = "skillId";
            ddlSkills.DataTextField = "skill";
            ddlSkills.DataSource = dr;
            ddlSkills.DataBind();
            ddlSkills.Items.Insert(0, new ListItem("-- Select  --", "0"));


        }


        protected void populateLanguages()
        {

            CRUD myCrud = new CRUD();
            string mySql = @"select * from  languages";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            ddlLanguages.DataValueField = "languageId";
            ddlLanguages.DataTextField = "language";
            ddlLanguages.DataSource = dr;
            ddlLanguages.DataBind();
            ddlLanguages.Items.Insert(0, new ListItem("-- Select  --", "0"));

        }



        protected void populateLanguagesLevels()
        {

            CRUD myCrud = new CRUD();
            string mySql = @"select * from languagesLevel ";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            ddlLanguageLevel.DataValueField = "levelId";
            ddlLanguageLevel.DataTextField = "level";
            ddlLanguageLevel.DataSource = dr;
            ddlLanguageLevel.DataBind();
            ddlLanguageLevel.Items.Insert(0, new ListItem("-- Select  --", "0"));


        }

        protected void populateJobVacancy()
        {
            ddljobs.Items.Insert(0, new ListItem("-- Select --", "0"));
            CRUD myCrud = new CRUD();
            string mySql = @"select * from  jobVacancy";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            ddljobs.DataValueField = "jobId";
            ddljobs.DataTextField = "jobName";
            ddljobs.DataSource = dr;
            ddljobs.DataBind();
            ddljobs.Items.Insert(0, new ListItem("-- Select  --", "0"));




        }




        protected void done_Click(object sender, EventArgs e)
        {
            if (Session["ApplicantId"] != null)
            {
                int Id = (int)Session["ApplicantId"];

                CRUD myCrud = new CRUD();

                string mySql = @"INSERT INTO applicantAppliedJobs
                         (jobId, applicantId)
                         VALUES (@jobId, @applicantId)";

                Dictionary<string, object> myPara = new Dictionary<string, object>();
                myPara.Add("@jobId", ddljobs.SelectedValue);
                myPara.Add("@applicantId", Id);

                int rtn = myCrud.InsertUpdateDelete(mySql, myPara);   // ✅ FIXED

                if (rtn > 0)
                    lbloutput.Text = "Operation Successful.";
                else
                    lbloutput.Text = "Operation failed.";
            }
        }



        protected void btnlang_Click(object sender, EventArgs e)
            {


                if (Session["ApplicantId"] != null)
                {
                    int Id = (int)Session["ApplicantId"];

                    CRUD myCrud = new CRUD();

                    string mySql = @"INSERT INTO applicantLanguages
                        (applicantId, languageName, languageLevel)
                        VALUES (@applicantId, @languageName, @languageLevel)";

                    Dictionary<string, object> myPara = new Dictionary<string, object>();
                    myPara.Add("@applicantId", Id);
                    myPara.Add("@languageName", ddlLanguages.SelectedItem.Text);
                    myPara.Add("@languageLevel", ddlLanguageLevel.SelectedItem.Text);

                    myCrud.InsertUpdateDelete(mySql, myPara);
                }
            }


            protected void btnskl_Click(object sender, EventArgs e)
            {
                if (Session["ApplicantId"] != null)
                {
                    int Id = (int)Session["ApplicantId"];

                    CRUD myCrud = new CRUD();

                    string mySql = @"INSERT INTO applicantSkills
                        (applicantId, skillName)
                        VALUES (@applicantId, @skillName)";

                    Dictionary<string, object> myPara = new Dictionary<string, object>();
                    myPara.Add("@applicantId", Id);
                    myPara.Add("@skillName", ddlSkills.SelectedItem.Text);

                    myCrud.InsertUpdateDelete(mySql, myPara);
                }
            }

            protected void btnsv_Click(object sender, EventArgs e)
            {
                if (Session["ApplicantId"] != null)
                {
                    int Id = (int)Session["ApplicantId"];

                    CRUD myCrud = new CRUD();

                    string mySql = @"SELECT skillName 
                         FROM ApplicantSkills 
                         WHERE applicantId = @Id";

                    Dictionary<string, object> myPara = new Dictionary<string, object>();
                    myPara.Add("@Id", Id);

                    DataTable dt = myCrud.Select(mySql, myPara);

                    // Clear previous rows
                    skillsTableBody.InnerHtml = "";

                    // Loop through DataTable
                    foreach (DataRow row in dt.Rows)
                    {
                        string skillName = row["skillName"].ToString();

                        skillsTableBody.InnerHtml +=
                            "<tr><td>" + skillName + "</td></tr>";
                    }
                }
            }


            protected void btnsv2_Click(object sender, EventArgs e)
            {

                if (Session["ApplicantId"] != null)
                {
                    int Id = (int)Session["ApplicantId"];

                    CRUD myCrud = new CRUD();

                    string mySql = @"select languageName ,languageLevel from applicantLanguages where applicantId = @Id";

                    Dictionary<string, object> myPara = new Dictionary<string, object>();
                    myPara.Add("@Id", Id);

                    DataTable dt = myCrud.Select(mySql, myPara);

                    // Clear previous rows
                    languagesTableBody.InnerHtml = "";

                    // Loop through DataTable
                    foreach (DataRow row in dt.Rows)
                    {
                        string languageName = row["languageName"].ToString();

                        string languageLevel = row["languageLevel"].ToString();

                        languagesTableBody.InnerHtml += $@"
                  <tr>
                       <td>{languageName}</td>
                         <td>{languageLevel}</td>
                                 </tr>";
                    }
                }

            }



        }
    }