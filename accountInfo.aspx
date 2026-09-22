<%@ Page Title="My Account" Language="C#"
    AutoEventWireup="true" CodeBehind="accountInfo.aspx.cs"
    Inherits="shimaa11818WebApp.accountInfo"  MasterPageFile="~/Site.Master"  %>


<asp:Content ID="Content7" 
    ContentPlaceHolderID="MainContent" 
    runat="server">

  

<!-- ================= ACCOUNT CARD ================= -->

<div class="account-card">

    <h2 class="text-center mb-4">My Account</h2>

    <div class="container-fluid">

        <div class="row mb-3">
            <div class="col-md-5 fw-bold">English Name:</div>
            <div class="col-md-7">
                <asp:Label ID="lblEnglishName" runat="server"></asp:Label>
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-md-5 fw-bold">Arabic Name:</div>
            <div class="col-md-7">
                <asp:Label ID="lblArabicName" runat="server"></asp:Label>
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-md-5 fw-bold">Date of Birth:</div>
            <div class="col-md-7">
                <asp:Label ID="lblDOB" runat="server"></asp:Label>
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-md-5 fw-bold">National ID:</div>
            <div class="col-md-7">
                <asp:Label ID="lblNationalID" runat="server"></asp:Label>
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-md-5 fw-bold">Phone Number:</div>
            <div class="col-md-7">
                <asp:Label ID="lblPhone" runat="server"></asp:Label>
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-md-5 fw-bold">Email:</div>
            <div class="col-md-7">
                <asp:Label ID="lblEmail" runat="server"></asp:Label>
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-md-5 fw-bold">Major:</div>
            <div class="col-md-7">
                <asp:Label ID="lblMajor" runat="server"></asp:Label>
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-md-5 fw-bold">University:</div>
            <div class="col-md-7">
                <asp:Label ID="lblUniversity" runat="server"></asp:Label>
            </div>
        </div>

        <div class="row mb-4">
            <div class="col-md-5 fw-bold">Country:</div>
            <div class="col-md-7">
                <asp:Label ID="lblCountry" runat="server"></asp:Label>
            </div>
        </div>

        <div class="row mb-4">
            <div class="col-md-5 fw-bold">CV:</div>
            <div class="col-md-7">
                <asp:HyperLink ID="lnkCV"
                    runat="server"
                    CssClass="text-info fw-bold"
                    Text="View CV"
                    Target="_blank">
                </asp:HyperLink>
            </div>
        </div>

        <!-- CLEAR GLOW BUTTON -->
        <div class="text-center mt-4">
            <asp:Button ID="btnUpdate"
                runat="server"
                Text="Update My Info"
                CssClass="btn btn-apply"
                style ="color:white;"
                PostBackUrl="~/editAccount.aspx" />
        </div>




</div>


    <br><br>

            <div class="container mt-5">

        <h2 class="text-center mb-4">
            Applicant Applied Jobs
        </h2>

      <div class="card shadow-lg card-custom">
    <div class="card-body">

        <asp:Repeater ID="rptAppliedJobs" runat="server">

            <HeaderTemplate>
                <div class="modern-list">
            </HeaderTemplate>

            <ItemTemplate>
                <div class="modern-item d-flex justify-content-between align-items-center flex-wrap">

                    <div class="item-info">
                        <div class="job-id">Job Name: <%# Eval("jobName") %></div>

                        <div class="date">
                            <%# Eval(" applicationDate", "{0:yyyy-MM-dd}") %>
                        </div>
                    </div>

                    <div>
                        <span class='badge status-badge 
                            <%# Eval("statusId").ToString() == "1" ? "received" : 
                                Eval("statusId").ToString() == "2" ? "accepted" : 
                                "Rejected" %>'>

                            <%# Eval("statusId").ToString() == "1" ? "received" :
                                Eval("statusId").ToString() == "2" ? "accepted" :
                                "rejected" %>
                        </span>
                    </div>

                </div>
            </ItemTemplate>

            <FooterTemplate>
                </div>
            </FooterTemplate>

        </asp:Repeater>

        <asp:Label ID="lblNoData" runat="server"
            Text="No applications found."
            CssClass="text-center text-muted d-block mt-3"
            Visible="false" />

    </div>
</div>

    </asp:Content>