<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hrApplicants.aspx.cs" Inherits="shimaa11818WebApp.HR_Pages.hrApplicants"
    
    EnableEventValidation="false" ValidateRequest="false"   MasterPageFile="~/Site.Master" 
%>


<asp:Content ID="Content2"  ContentPlaceHolderID="MainContent" 
    runat="server">



 


<div class="container-fluid mt-4">

    <!-- Page Title -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="hr-section-title">All Applicants</h2>
    </div>

    <!-- Table -->
    <div class="table-responsive"  runat="server" >
     

        <asp:Repeater ID="rptApplicants" runat="server"    OnItemCommand="rptApplicants_ItemCommand"
    OnItemDataBound="rptApplicants_ItemDataBound">

            <HeaderTemplate>
         <table class="table table-modern-dark align-middle text-center">
                    <thead>
                        <tr> 
                            <th>Applicant Id</th>
                            <th>Job Country</th>
                            <th>University</th>
                            <th>Job Type</th>
                            <th>requested Salary</th>
                            <th>Job Title</th>
                            <th>English Name</th>
                            <th>Arabic Name</th>
                            <th>Age</th>
                            <th>Gender</th>
                            <th>Nationality</th>
                            <th>Marital</th>
                            <th>Phone</th>
                            <th>Email</th>
                            <th>Experience</th>
                            <th>Major</th>
                            <th>GPA</th>
                            <th>Education Level</th>
                            <th>Languages</th>
                            <th>CV</th>
                            <th>Decision</th>
                            <th>Send Email</th>
                        </tr>
                    </thead>
                    <tbody>
            </HeaderTemplate>

            <ItemTemplate>
                <tr>
                    <td><%# Eval("applicantId") %></td>
                    <td><%# Eval("applicantJobCountry") %></td>
                    <td><%# Eval("applicantUniversity") %></td>
                    <td><%# Eval("jobType") %></td>
                    <td><%# Eval("requestedSalary") %></td>
                    <td><%# Eval("jobTitle") %></td>
                    <td><%# Eval("applicantEnglishName") %></td>
                    <td><%# Eval("applicantArabicName") %></td>
                    <td><%# Eval("Age") %></td>
                    <td><%# Eval("applicantGender") %></td>
                    <td><%# Eval("applicantNationality") %></td>
                    <td><%# Eval("maritalStatus") %></td>
                    <td><%# Eval("applicantPhoneNumber") %></td>

                    <!-- Email clickable -->
                    <td>
                        <a href='mailto:<%# Eval("applicantEmail") %>'>
                            <%# Eval("applicantEmail") %>
                        </a>
                    </td>

                    <td><%# Eval("experienceYears") %></td>
                    <td><%# Eval("major") %></td>
                    <td><%# Eval("gpa") %></td>
                    <td><%# Eval("educationLevel") %></td>
                    <td><%# Eval("languages") %></td>

                    <!-- CV -->
                    <td>
                        <a href='<%# ResolveUrl(Eval("cv").ToString()) %>' 
                              target="_blank"
                           class="btn btn-sm btn-outline-primary">
                            View CV
                        </a>
                    </td>
                    <td>
                  <asp:DropDownList ID="ddlStatus"
    runat="server"
    CssClass="form-select"
    AutoPostBack="true"
    OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged"
    DataValueField="statusId"
    DataTextField="statusName">
</asp:DropDownList></td>

              



                    <!-- Send Email -->
                    <td>
                        <asp:Button ID="btnSendEmail"
                            runat="server"
                            Text="Send"
                            CssClass="btn btn-sm btn-success"
                            CommandName="SendEmail"

                            CommandArgument='<%# Eval("applicantId") %>' 
                             />
                    </td>


                          <td>
                        <asp:HiddenField ID="hfApplicantId"
    runat="server"
    Value='<%# Eval("applicantId") %>' /></td>

                 
                </tr>

            </ItemTemplate>

            <FooterTemplate>
                    </tbody>
                </table>
            </FooterTemplate>

        </asp:Repeater>




        <asp:Label ID="lblNoData" runat="server"
            Text="No Job Vacancy found."
            CssClass="text-center text-muted d-block mt-3"
            Visible="false" />
    </div>
    <br><br><br>

    <!-- Export Button at Bottom -->
    <div align="center">
        <asp:Button ID="btnExportPdf"
            runat="server"
            Text="Export All To PDF"
            CssClass="btn btn-apply w-25" OnClick="btnExportPdf_Click" Width="100px" 
            /> 
        <asp:Button ID="btnExportExcel"
            runat="server"
            Text="Export All To Excel"
            CssClass="btn btn-apply w-25" OnClick="btnExportExcel_Click" Width="100px" 
            />

        <asp:Button ID="btnExportWord"
            runat="server"
            Text="Export All To Word"
            CssClass="btn btn-apply w-25" OnClick="btnExportWord_Click" Width="100px" 
            />
    </div>



    <br><br><br>

    <!-- Export Button at Bottom -->
    <div align="center">
    </div>
</div>
    <asp:GridView ID="gvExport"
    runat="server"
    Visible="false"
    AutoGenerateColumns="true">
</asp:GridView>

      </asp:Content>
