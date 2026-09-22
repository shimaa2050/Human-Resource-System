
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adManageRoles.aspx.cs" Inherits="shimaa11818WebApp.Admin_Pages.adManageRoles"  MasterPageFile="~/Site.Master" %>




<asp:Content ID="Content6" 
    ContentPlaceHolderID="MainContent" 
    runat="server">


    
    <div class="container mt-5">

    <h2 class="dashboard-heading text-center mb-5">Users Role Management</h2>

    <!-- MESSAGE -->
    <div class="text-center mb-4">
        <asp:Label ID="lblMsg" runat="server" CssClass="text-warning fw-bold fs-5"></asp:Label>
    </div>

    <!-- ================= USER & ROLE INPUT ================= -->
    <div class="card bg-dark text-light shadow-lg rounded-4 p-4 mb-5">

        <div class="row g-4">

            <div class="col-md-4">
                <label class="form-label">Username</label>
                <asp:TextBox ID="txtUser" runat="server" CssClass="form-control modern-input" />
            </div>

            <div class="col-md-4">
                <label class="form-label">Role</label>
                <asp:TextBox ID="txtRole" runat="server" CssClass="form-control modern-input" />
            </div>

            <div class="col-md-4">
                <label class="form-label">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control modern-input" />
            </div>


        </div>

        <div class="row mt-4 g-3">

            <div class="col-md-3">
                <asp:Button ID="btnCreateUser0" runat="server" Text="Create User"
                    CssClass="btn btn-success w-100" OnClick="btnCreateUser_Click" />
            </div>

            <div class="col-md-3">
                <asp:Button ID="btnDeleteUser0" runat="server" Text="Delete User"
                    CssClass="btn btn-danger w-100" OnClick="btnDeleteUser_Click"   OnClientClick="return confirm ('Are you Sure you want to delete user?')"/>
            </div>

            <div class="col-md-3">
                <asp:Button ID="btnCreateRole0" runat="server" Text="Create Role"
                    CssClass="btn btn-primary w-100" OnClick="btnCreateRole_Click" />
            </div>

            <div class="col-md-3">
                <asp:Button ID="btnDeleteRole1" runat="server" Text="Delete Role"
                    CssClass="btn btn-warning w-100" OnClick="btnDeleteRole_Click"  OnClientClick="return confirm ('Are you Sure you want to delete role?')" />
            </div>

            <div class="col-md-3">
                <asp:Button ID="btnLinkUserRole" runat="server" Text="Link User → Role"
                    CssClass="btn btn-info w-100" OnClick="btnLinkUserRole_Click" />
            </div>

            <div class="col-md-3">
                <asp:Button ID="btnUnLinkUserToRole" runat="server" Text="Unlink User → Role"
                    CssClass="btn btn-secondary w-100" OnClick="btnUnLinkUserToRole_Click" />
            </div>

        </div>

    </div>

    <!-- ================= CHECKBOX SECTION ================= -->
    <div class="card bg-dark text-light shadow-lg rounded-4 p-4 mb-5">

        <h4 class="mb-4 text-center">Bulk Role Management</h4>

        <div class="row">

            <div class="col-md-5">
                <h6>Roles</h6>
                <asp:CheckBoxList ID="cBLRoles" runat="server"  Style="align-items:center;" />
            </div>

            <div class="col-md-5">
                <h6>Users</h6>
                <asp:CheckBoxList ID="cBLUsers" runat="server"   Style="align-items:center;" />
            </div>

            <div class="col-md-2 d-flex flex-column gap-3">
                <asp:Button ID="btnUserRoleAssign" runat="server"
                    Text="Link"
                    CssClass="btn btn-success"
                    OnClick="btnUserRoleAssign_Click" />

                <asp:Button ID="btnUnlinkUserRoles" runat="server"
                    Text="Unlink"
                    CssClass="btn btn-danger"
                    OnClick="btnUnlinkUserRoles_Click" />

                <asp:Button ID="btnDeleteRoles" runat="server"
                    Text="Delete Roles"
                    CssClass="btn btn-warning"
                    OnClick="btnDeleteRoles_Click"  OnClientClick="return confirm ('Are you Sure you want to delete a role?')"/>

                <asp:Button ID="btnDeleteUsers" runat="server"
                    Text="Delete Users"
                    CssClass="btn btn-secondary"
                    OnClick="btnDeleteUsers_Click"  OnClientClick="return confirm ('Are you Sure you want to delete a user?')"/>
            </div>

        </div>

    </div>

    <!-- ================= DATABASE GRIDS ================= -->
    <div class="card bg-dark text-light shadow-lg rounded-4 p-4">

        <h4 class="mb-4 text-center">Database View</h4>

        <div class="table-responsive">

            <asp:GridView ID="gvUsers" runat="server"
                CssClass="table table-dark table-striped" />

            <asp:GridView ID="gvRoles" runat="server"
                CssClass="table table-dark table-striped mt-4" />

            <asp:GridView ID="gvInnerJoin" runat="server"
                CssClass="table table-dark table-striped mt-4" />

            <asp:GridView ID="gvLeftOuterJoin" runat="server"
                CssClass="table table-dark table-striped mt-4" />

            <asp:GridView ID="gvRightOuterJoin" runat="server"
                CssClass="table table-dark table-striped mt-4" />

        </div>

    </div>

</div>

      </asp:Content>