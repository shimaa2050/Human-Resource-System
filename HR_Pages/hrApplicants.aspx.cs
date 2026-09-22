using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using shimaa11818WebApp.App_Code;
using System.Data.SqlClient;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.Configuration;


namespace shimaa11818WebApp.HR_Pages
{
    public partial class hrApplicants : System.Web.UI.Page
    {

        DataTable statusTable;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStatuses();
                populateApplicants();
                BindApplicantsGrid();


            }
        }



        public override void VerifyRenderingInServerForm(Control control)
        {

        }


        private void LoadStatuses()
        {
            CRUD myCrud = new CRUD();
            string sql = "SELECT statusId, statusName FROM Status";

            statusTable = myCrud.getDT(sql);

            // Store in ViewState so it survives postback
            ViewState["statusTable"] = statusTable;
        }




        protected void populateApplicants()
        {
            CRUD myCrud = new CRUD();

            string mySql = @"SELECT   
    a.applicantId,
    a.applicantJobCountry,
    a.applicantUniversity,
    a.jobType,
    a.requestedSalary,
    a.jobTitle,
    a.applicantEnglishName,
    a.applicantArabicName,
    YEAR(GETDATE()) - YEAR(a.dob) AS Age,
    a.applicantGender,
    a.applicantNationality,
    a.maritalStatus,
    a.applicantPhoneNumber,
    a.applicantEmail,
    a.experienceYears,
    a.major,
    a.gpa,
    a.educationLevel,
    STRING_AGG(l.languageName, ', ') AS Languages,
    a.cv
FROM applicant a
INNER JOIN applicantLanguages l 
    ON a.applicantId = l.applicantId
GROUP BY 
 a.applicantId,
    a.applicantJobCountry,
    a.applicantUniversity,
    a.jobType,
    a.requestedSalary,
    a.jobTitle,
    a.applicantEnglishName,
    a.applicantArabicName,
    a.dob,
    a.applicantGender,
    a.applicantNationality,
    a.maritalStatus,
    a.applicantPhoneNumber,
    a.applicantEmail,
    a.experienceYears,
    a.major,
    a.gpa,
    a.educationLevel,
    a.cv";



            DataTable dt = myCrud.Select(mySql, null);


            if (dt.Rows.Count > 0)
            {
                rptApplicants.DataSource = dt;   // ✅ bind full table
                rptApplicants.DataBind();
                lblNoData.Visible = false;
            }
            else
            {
                rptApplicants.DataSource = null;
                rptApplicants.DataBind();
                lblNoData.Visible = true;
            }



        }

        protected void rptApplicants_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item ||
                e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DropDownList ddl = (DropDownList)e.Item.FindControl("ddlStatus");

                if (ddl != null)
                {
                    DataTable dt = (DataTable)ViewState["statusTable"];

                    ddl.DataSource = dt;
                    ddl.DataTextField = "statusName";
                    ddl.DataValueField = "statusId";
                    ddl.DataBind();

                    ddl.Items.Insert(0, new System.Web.UI.WebControls.ListItem("-- Select --", ""));
                }
            }

        }



        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl = (DropDownList)sender;

            RepeaterItem item = (RepeaterItem)ddl.NamingContainer;

            HiddenField hf = (HiddenField)item.FindControl("hfApplicantId");

            if (hf != null)
            {
                string applicantId = hf.Value;
                string statusId = ddl.SelectedValue;

                CRUD myCrud = new CRUD();

                string mySql = @"UPDATE applicantAppliedJobs
                         SET statusId = @statusId
                         WHERE applicantId = @applicantId";

                Dictionary<string, object> myPara = new Dictionary<string, object>();

                myPara.Add("@statusId", statusId);
                myPara.Add("@applicantId", applicantId);

                int rtn = myCrud.InsertUpdateDeleteViaSqlDic(mySql, myPara);


            }
        }


        protected void rptApplicants_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "SendEmail")
            {
                int applicantId = Convert.ToInt32(e.CommandArgument);

                // Get applicant email from database
                CRUD myCrud = new CRUD();

                string mySql = "SELECT applicantEmail FROM applicant WHERE applicantId = " + applicantId;

                DataTable dt = myCrud.getDT(mySql);


                if (dt.Rows.Count > 0)
                {
                    string applicantEmail = dt.Rows[0]["applicantEmail"].ToString();

                    // 🔥 HERE you add the Redirect
                    Response.Redirect("~/HR_Pages/sendEmail.aspx?email=" + applicantEmail);
                    ;
                }
            }
        }








        public static void ExportGridToExcel(GridView myGv)
        {
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.Buffer = true;

            string FileName = "Applicants_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".xls";

            HttpContext.Current.Response.ContentType = "application/vnd.ms-excel";
            HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);

            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter htw = new HtmlTextWriter(sw))
                {
                    myGv.RenderControl(htw);
                    HttpContext.Current.Response.Write(sw.ToString());
                    HttpContext.Current.Response.Flush();
                    HttpContext.Current.Response.End();   // 🔥 THIS LINE IS THE KEY
                }
            }
        }








        protected void btnExportExcel_Click(object sender, EventArgs e)
        {

            CRUD myCrud = new CRUD();

            string mySql = @"SELECT *
                     FROM applicant";

            DataTable dt = myCrud.Select(mySql, null);

            if (dt.Rows.Count == 0)
            {
                lblNoData.Text = "No data to export.";
                return;
            }

            GridView cleanGrid = new GridView();
            cleanGrid.DataSource = dt;
            cleanGrid.DataBind();

            ExportGridToExcel(cleanGrid);
        }


    



        private void BindApplicantsGrid()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["shimaa11818"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"SELECT *
                         FROM applicant ";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        gvExport.DataSource = dt;
                        gvExport.DataBind();
                    }
                }
            }
        }

        private void ExportGridToPDF()
        {
            CRUD myCrud = new CRUD();

            string mySql = @"SELECT *
                     FROM applicant";

            DataTable dt = myCrud.Select(mySql, null);

            if (dt.Rows.Count == 0)
            {
                lblNoData.Text = "No data to export.";
                return;
            }

            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=Applicants.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);

            Document pdfDoc = new Document(PageSize.A4.Rotate(), 10f, 10f, 10f, 10f);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);

            pdfDoc.Open();

            PdfPTable table = new PdfPTable(dt.Columns.Count);
            table.WidthPercentage = 100;

            // 🔥 Header Row
            foreach (DataColumn column in dt.Columns)
            {
                PdfPCell cell = new PdfPCell(new Phrase(column.ColumnName));
                table.AddCell(cell);
        
            }

            // 🔥 Data Rows
            foreach (DataRow row in dt.Rows)
            {
                foreach (var item in row.ItemArray)
                {
                    table.AddCell(item.ToString());
                }
            }

            pdfDoc.Add(table);
            pdfDoc.Close();

            Response.End();
        }


        protected void btnExportPdf_Click(object sender, EventArgs e)
        {
            ExportGridToPDF();

        }



        private void ExportToWord()
        {
            CRUD myCrud = new CRUD();

            string mySql = @"SELECT *
                             FROM applicant";

            DataTable dt = myCrud.Select(mySql, null);

            if (dt.Rows.Count == 0)
            {
                lblNoData.Text = "No data to export.";
                return;
            }

            Response.Clear();
            Response.Buffer = true;
            Response.ContentType = "application/msword";
            Response.AddHeader("Content-Disposition",
                "attachment;filename=Applicants_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".doc");

            // 🔥 Build clean HTML manually (no Repeater, no Bootstrap)
            StringWriter sw = new StringWriter();
            sw.Write("<table border='1' style='border-collapse:collapse;'>");

            // Header row
            sw.Write("<tr>");
            foreach (DataColumn column in dt.Columns)
            {
                sw.Write("<th>" + column.ColumnName + "</th>");
            }
            sw.Write("</tr>");

            // Data rows
            foreach (DataRow row in dt.Rows)
            {
                sw.Write("<tr>");
                foreach (var item in row.ItemArray)
                {
                    sw.Write("<td>" + item.ToString() + "</td>");
                }
                sw.Write("</tr>");
            }

            sw.Write("</table>");

            Response.Write(sw.ToString());
            Response.End();   // 🔥 stops page rendering
        }


        protected void btnExportWord_Click(object sender, EventArgs e)
        {
            ExportToWord();
        }




    }






}







