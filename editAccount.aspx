<%@ Page Title="My Account" Language="C#"
    AutoEventWireup="true" CodeBehind="editAccount.aspx.cs"
    Inherits="shimaa11818WebApp.editAccount"  MasterPageFile="~/Site.Master"  %>


<asp:Content ID="Content9" 
    ContentPlaceHolderID="MainContent" 
    runat="server">


  



    <div class="register-card">

    <h2 class="text-center mb-4">Edit Account</h2>

    <!-- English Name -->
    <div class="mb-3">
        <label class="form-label">English Name</label>
        <asp:TextBox ID="txtEnglishName" runat="server" CssClass="form-control"></asp:TextBox>
    </div>

        <asp:RequiredFieldValidator
    ID="rfvEnglishName"
    runat="server"
    ControlToValidate="txtEnglishName"
    ErrorMessage="Please fill English name field"
    ForeColor="Red">
</asp:RequiredFieldValidator>

    <!-- Arabic Name -->
    <div class="mb-3">
        <label class="form-label">Arabic Name</label>
        <asp:TextBox ID="txtArabicName" runat="server" CssClass="form-control"></asp:TextBox>
    </div>

         <asp:RequiredFieldValidator
    ID="rfvArabicName"
    runat="server"
    ControlToValidate="txtArabicName"
    ErrorMessage="Please fill Arabic name field"
    ForeColor="Red">
</asp:RequiredFieldValidator>

    <!-- Date of Birth -->
    <div class="mb-3">
        <label class="form-label">Date of Birth</label>
        <asp:TextBox ID="txtDOB" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
    </div>

           <asp:RequiredFieldValidator
    ID="rfvDOB"
    runat="server"
    ControlToValidate="txtDOB"
    ErrorMessage="Please fill DOB field"
    ForeColor="Red">
</asp:RequiredFieldValidator>

    <!-- National ID -->
    <div class="mb-3">
        <label class="form-label">National ID</label>
        <asp:TextBox ID="txtNationalID" runat="server" CssClass="form-control"></asp:TextBox>
    </div>

        
 <asp:RequiredFieldValidator
    ID="rfvNationalId"
    runat="server"
    ControlToValidate="txtNationalID"
    ErrorMessage="Please fill National Id field"
    ForeColor="Red">
</asp:RequiredFieldValidator>


    <!-- Phone -->
    <div class="mb-3">
        <label class="form-label">Phone Number</label>
        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"></asp:TextBox>
    </div>

         <asp:RequiredFieldValidator
    ID="rfvPhone_Number"
    runat="server"
    ControlToValidate="txtPhone"
    ErrorMessage="Please fill Phone Number  field"
    ForeColor="Red">
</asp:RequiredFieldValidator>

    <!-- Email -->
    <div class="mb-3">
        <label class="form-label">Email</label>
        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control"></asp:TextBox>
    </div>

                
 <asp:RequiredFieldValidator
    ID="rfvEmail"
    runat="server"
    ControlToValidate="txtEmail"
    ErrorMessage="Please fill Email field"
    ForeColor="Red">
</asp:RequiredFieldValidator>

    <!-- Major -->
    <div class="mb-3">
        <label class="form-label">Major</label>
        <asp:DropDownList ID="ddlMajor" runat="server" CssClass="form-select"></asp:DropDownList>
    </div>

        
     <asp:RequiredFieldValidator
    ID="rvfMajor"
    runat="server"
    InitialValue="0"
    ControlToValidate="ddlMajor"
    ErrorMessage="Please fill  Major field"
    ForeColor="Red">
</asp:RequiredFieldValidator>

    <!-- University -->
    <div class="mb-3">
        <label class="form-label">University</label>
        <asp:DropDownList ID="ddlUniversity" runat="server" CssClass="form-select"></asp:DropDownList>
    </div>

        
     <asp:RequiredFieldValidator
    ID="rfvUniversity"
    runat="server"
    InitialValue="0"
    ControlToValidate="ddlUniversity"
    ErrorMessage="Please fill University field"
    ForeColor="Red">
</asp:RequiredFieldValidator>

    <!-- Country -->
    <div class="mb-3">
        <label class="form-label">Country</label>
        <asp:DropDownList ID="ddlCountry" runat="server" CssClass="form-select"></asp:DropDownList>
    </div>

               <asp:RequiredFieldValidator
    ID="rfvJob_Country"
    runat="server"
      InitialValue="0"
    ControlToValidate="ddlCountry"
    ErrorMessage="Please fill Job Country  field"
    ForeColor="Red">
</asp:RequiredFieldValidator>

    <!-- Upload CV -->
        <div class="mb-3">
        <label class="form-label">Current CV</label>
<asp:HyperLink ID="lnkCV" runat="server" Target="_blank"></asp:HyperLink>

    <div class="mb-3">
        <label class="form-label">Upload New CV</label>
        <asp:FileUpload ID="fuCV" runat="server" CssClass="form-control" />
    </div>

 <%--<asp:RequiredFieldValidator
    ID="rfvCV"
    runat="server"
    ControlToValidate="fuCV"
    ErrorMessage="Please fill  CV field"
    ForeColor="Red">
</asp:RequiredFieldValidator>--%>
    <!-- Buttons -->
    <div class="d-flex justify-content-between mt-4">

        <asp:Button ID="btnCancel"
            runat="server"
            Text="Cancel"
            CssClass="btn btn-secondary"
            PostBackUrl="~/accountInfo.aspx" />

        <asp:Button ID="btnSave"
            runat="server"
            Text="Save Changes"
            CssClass="btn btn-apply" OnClick="btnSave_Click" OnClientClick="return confirm ('Are you Sure you want to submit?')"/>
           <br> <br><br>


    </div>


                
    <asp:Label ID="lbloutput" runat="server"  CssClass="red-label"></asp:Label>

</div>
    </asp:content>