<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adDashboard.aspx.cs" Inherits="shimaa11818WebApp.Admin_Pages.adDashboard"   MasterPageFile="~/Site.Master" %>



      

<asp:Content ID="Content4" 
    ContentPlaceHolderID="MainContent" 
    runat="server">





<div class="container mt-5">

    <h2 class="hr-section-title">Admin Dashboard</h2>

    <div class="row g-4">

        <!-- Total Applicants -->
        <div class="col-lg-3 col-md-6">
            <div class="stat-card applicants">
                <div class="stat-label">Total Applicants 👔</div>
                <asp:Label ID="lblTotalApplicants" runat="server" CssClass="stat-number" />
            </div>
        </div>

        <!-- Total Jobs -->
        <div class="col-lg-3 col-md-6">
            <div class="stat-card jobs">
                <div class="stat-label">Total Jobs 💼</div>
                <asp:Label ID="lblTotalJobs" runat="server" CssClass="stat-number" />
            </div>
        </div>

        <!-- Total HR Users -->
        <div class="col-lg-3 col-md-6">
            <div class="stat-card hr">
                <div class="stat-label">Total HR Users 🧑🏻‍💼</div>
                <asp:Label ID="lblTotalHR" runat="server" CssClass="stat-number" />
            </div>
        </div>

        <!-- Total Applications -->
        <div class="col-lg-3 col-md-6">
            <div class="stat-card applications">
                <div class="stat-label">Total Applications 👨🏻‍💻</div>
                <asp:Label ID="lblTotalApplications" runat="server" CssClass="stat-number" />
            </div>
        </div>

    </div>

</div>
  </asp:Content>
