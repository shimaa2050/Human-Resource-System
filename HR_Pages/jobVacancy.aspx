<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="jobVacancy.aspx.cs" Inherits="shimaa11818WebApp.HR_Pages.jobVacancy"  MasterPageFile="~/Site.Master"  %>


<asp:Content ID="Content3" 
 ContentPlaceHolderID="MainContent" 
    runat="server">


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>



<div class="container mt-4" runat="server">

    <!-- Page Title -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="hr-section-title">Job Vacancies</h2>
    </div>

    <!-- Table -->
    <div class="table-responsive">

        <asp:Repeater ID="rptJobs" runat="server" OnItemCommand="rptJobs_ItemCommand">

            <HeaderTemplate>
                <table class="table table-modern-dark align-middle text-center">
                    <thead>
                        <tr>
                            <th>Job ID</th>
                            <th>Job Name</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
            </HeaderTemplate>

            <ItemTemplate>
                <tr>
                    <td><%# Eval("jobId") %></td>
                    <td><%# Eval("jobName") %></td>

                    <!-- Delete Button -->
                    <td>
                        <asp:Button ID="btnDelete"
                            runat="server"
                            Text="Delete"
                            CssClass="btn btn-sm btn-danger"
                            CommandName="DeleteJob"
                            CommandArgument='<%# Eval("jobId") %>'
                            OnClientClick="return confirm('Are you sure you want to delete this job?');" />
                    </td>
                </tr>
            </ItemTemplate>

            <FooterTemplate>
                    </tbody>
                </table>
            </FooterTemplate>

        </asp:Repeater>


        
        <asp:Label ID="lblNoData" runat="server"
            Text="No applications found."
            CssClass="text-center text-muted d-block mt-3"
            Visible="false" />

    </div>

</div>

        </asp:Content>
  

