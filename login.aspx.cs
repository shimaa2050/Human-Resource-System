using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;
using System.Configuration;
using shimaa11818WebApp.App_Code;

namespace shimaa11818WebApp
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["Username"] = txtUserName.Text;
               // createAdminAndUserByDefault();
            }
        }
        /*
         *  // this is the stored procedure that should exist in  the database
                    create procedure[dbo].[p_doesUserExist]
                    @userName varchar(50), @appName varchar(50)
                     as 
                     declare @applicationId Nvarchar(100)
                      select @applicationId = applicationId from[dbo].[aspnet_Applications]
                            where applicationName = '/party'

                    --declare @applicationId varchar(50) = (select applicationId from aspnet_Applications where applicationName =@appName)
                    --select @applicationId as appId
                    select userName from[dbo].[aspnet_Users] where applicationId = @applicationId and userName = @userName
        */
        private void createAdminAndUserByDefault()
        {
            //....  emailManger myEmailMgr = new emailManger();
            try
            {
                string strExistingAdmin = "";
                string strAppName = "/shimaa11818WebApp";
                string strAdminUserName = "shimaa";  //txtUserName.Text;
                string strAdminPassword = "123"; //txtPassword.Text;
                string strRoleName = "admin";
                string strEmail = "shoshita2050@gmail.com";
                strAppName = Membership.ApplicationName.ToString();
                CRUD myCrud = new CRUD();
                Dictionary<string, object> myPara = new Dictionary<string, object>();
                myPara.Add("@userName", strAdminUserName);
                myPara.Add("@appName", strAppName);
                strExistingAdmin = myCrud.checkUserExist("p_doesUserExist", myPara);
                if (strExistingAdmin.Length == 0)
                {
                    if (!Roles.RoleExists(strRoleName))
                        Roles.CreateRole(strRoleName);
                    if (!Membership.ValidateUser(strAdminUserName, strAdminPassword))
                    {
                        Membership.CreateUser(strAdminUserName, strAdminPassword, strEmail);
                        if (!Roles.IsUserInRole(strAdminUserName, strRoleName))
                            Roles.AddUserToRole(strAdminUserName, strRoleName);
                    }
                }
                if (strExistingAdmin.Length > 0)
                {
                    if (!Roles.RoleExists(strRoleName))
                        Roles.CreateRole(strRoleName);
                    if (!Membership.ValidateUser(strAdminUserName, strAdminPassword))
                    {
                        Membership.DeleteUser(strAdminUserName);
                        Membership.CreateUser(strAdminUserName, strAdminPassword, strEmail);
                        if (!Roles.IsUserInRole(strAdminUserName, strRoleName))
                            Roles.AddUserToRole(strAdminUserName, strRoleName);
                    }
                }
            }
            catch (Exception ex)
            {
                lblOutput.Text = ex.Message.ToString();
                //.. restore  myEmailMgr.sendEmailWdbcs("aalhussein@yahoo.com", "mySubject:Track User Login  " + Session["Username"].ToString(), ex.Message.ToString());
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            bool blnAuthenticate = AuthenticateUser();

            if (blnAuthenticate)
            {
                // Create authentication cookie
                FormsAuthentication.SetAuthCookie(txtUserName.Text, false);

                // Redirect based on role
                if (Roles.IsUserInRole(txtUserName.Text, "admin"))
                {
                    Response.Redirect("~/Admin_Pages/adHome.aspx");
                }
                else if (Roles.IsUserInRole(txtUserName.Text, "HR"))
                {
                    Response.Redirect("~/HR_Pages/hrHomePage.aspx");
                }
               
                else {
                    Response.Redirect("Default.aspx");
                }
            }
            else
            {
                lblOutput.Text = "Your login was invalid, Please try again";
            }
        }

        protected bool AuthenticateUser()
        {
            string userName = txtUserName.Text;
            string password = txtPassword.Text;
            bool userFound = false;
            try
            {
                userFound = Membership.ValidateUser(userName, password);
                lblOutput.Text = Session["Username"].ToString();
            }
            catch (Exception ex)
            {
                lblOutput.Text = "Please take image snapshot and email it to support@wdbcs.com " + ex.Message.ToString();
            }
            return userFound;
        }

        // used if I use myUser table
        protected bool Authenticate(Dictionary<string, object> userNamePassword)
        {
            string mySql = "SELECT userId,userName,password,email  FROM myUsers where userName =@userName and password=@passWord";
            CRUD myCrud = new CRUD();
            bool userFound = myCrud.authenticateUser(mySql, userNamePassword); // pass the sql and the dic para
            return userFound;
        }

        protected void txtPassword_TextChanged(object sender, EventArgs e)
        {

        }
    }
}