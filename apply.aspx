<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="apply.aspx.cs"
    Inherits="shimaa11818WebApp.apply"  MasterPageFile="~/Site.Master"  %>

<asp:Content ID="Content8" 
    ContentPlaceHolderID="MainContent" 
    runat="server">



<!-- ================= APPLY CARD ================= -->

<div class="apply-card">

<h2 class="text-center mb-5">Job Application</h2>

<!-- ================= PERSONAL INFORMATION ================= -->

<div class="apply-section-title">Personal Information</div>
<div class="row g-4">

    <div class="col-md-6">
        <label class="form-label">English Name<span class="required-star">*</span></label>
        <asp:TextBox ID="txtEnglishName" runat="server" CssClass="form-control" />
    </div>

    <asp:RequiredFieldValidator
    ID="rfvEnglishName"
    runat="server"
    ControlToValidate="txtEnglishName"
    ErrorMessage="Please fill English name field"
    ForeColor="Red">
</asp:RequiredFieldValidator>

    <div class="col-md-6">
        <label class="form-label">Arabic Name<span class="required-star">*</span></label>
        <asp:TextBox ID="txtArabicName" runat="server" CssClass="form-control" />
    </div>


     <asp:RequiredFieldValidator
    ID="rfvArabicName"
    runat="server"
    ControlToValidate="txtArabicName"
    ErrorMessage="Please fill Arabic name field"
    ForeColor="Red">
</asp:RequiredFieldValidator>

    <div class="col-md-6">
        <label class="form-label">Date of Birth<span class="required-star">*</span></label>
        <asp:TextBox ID="txtDOB" runat="server" TextMode="Date" CssClass="form-control" />
    </div>

     <asp:RequiredFieldValidator
    ID="rfvDOB"
    runat="server"
    ControlToValidate="txtDOB"
    ErrorMessage="Please fill DOB field"
    ForeColor="Red">
</asp:RequiredFieldValidator>

    <div class="col-md-6">
        <label class="form-label">National ID<span class="required-star">*</span></label>
        <asp:TextBox ID="txtNationalID" runat="server" CssClass="form-control" />
    </div>

 <asp:RequiredFieldValidator
    ID="rfvNationalId"
    runat="server"
    ControlToValidate="txtNationalID"
    ErrorMessage="Please fill National Id field"
    ForeColor="Red">
</asp:RequiredFieldValidator>

    <div class="col-md-6">
        <label class="form-label">Gender<span class="required-star">*</span></label>
        <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal" CssClass="radio-spacing rbl-text">
        </asp:RadioButtonList>
    </div>

    
 <asp:RequiredFieldValidator
    ID="rfvGender"
    runat="server"
    ControlToValidate="rblGender"
    ErrorMessage="Please fill  Gender field"
    ForeColor="Red">
</asp:RequiredFieldValidator>

    <div class="col-md-6">
        <label class="form-label">Nationality<span class="required-star">*</span></label>
        <asp:DropDownList ID="ddlNationality" runat="server" CssClass="form-select">
    
        </asp:DropDownList>
        
    </div>


    
 <asp:RequiredFieldValidator
    ID="rvfNationality"
    runat="server"
      InitialValue="0"
    ControlToValidate="ddlNationality"
    ErrorMessage="Please fill  Nationality field"
    ForeColor="Red">
</asp:RequiredFieldValidator>

    <div class="col-md-6">
        <label class="form-label">Marital Status<span class="required-star">*</span></label>
        <asp:RadioButtonList ID="rblMaritalStatus" runat="server" RepeatDirection="Horizontal" CssClass="radio-spacing rbl-text">
        </asp:RadioButtonList>
    </div>

    
 <asp:RequiredFieldValidator
    ID="rfvMarital_Status"
    runat="server"
    ControlToValidate="rblMaritalStatus"
    ErrorMessage="Please fill Marital Status field"
    ForeColor="Red" >
</asp:RequiredFieldValidator>

    <div class="col-md-6">
        <label class="form-label">Number of Dependents<span class="required-star">*</span></label>
        <asp:TextBox ID="txtDependents" runat="server" CssClass="form-control" />
    </div>

        
 <asp:RequiredFieldValidator
    ID="rfvdep"
    runat="server"
    ControlToValidate="txtDependents"
    ErrorMessage="Please fill Dependents field"
    ForeColor="Red">
</asp:RequiredFieldValidator>

    <div class="col-md-6">
        <label class="form-label">Special Needs?<span class="required-star">*</span></label>
        <asp:RadioButtonList ID="rblSpecialNeeds" runat="server" RepeatDirection="Horizontal" CssClass="radio-spacing rbl-text">
            <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
        </asp:RadioButtonList>
    </div>

        
 <asp:RequiredFieldValidator
    ID="rfvSpecial_Needs"
    runat="server"
    ControlToValidate="rblSpecialNeeds"
    ErrorMessage="Please fill Special Needs  field"
    ForeColor="Red">
</asp:RequiredFieldValidator>

    <div class="col-md-6">
        <label class="form-label">Phone Number<span class="required-star">*</span></label>
        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" />
    </div>

        
 <asp:RequiredFieldValidator
    ID="rfvPhone_Number"
    runat="server"
    ControlToValidate="txtPhone"
    ErrorMessage="Please fill Phone Number  field"
    ForeColor="Red">
</asp:RequiredFieldValidator>

    <div class="col-md-6">
        <label class="form-label">Email<span class="required-star">*</span></label>
        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control" />
    </div>


        
 <asp:RequiredFieldValidator
    ID="rfvEmail"
    runat="server"
    ControlToValidate="txtEmail"
    ErrorMessage="Please fill Email field"
    ForeColor="Red">
</asp:RequiredFieldValidator>

</div>

<!-- ================= EDUCATION ================= -->

<div class="apply-section-title mt-5">Education</div>
<div class="row g-4">

    <div class="col-md-6">
        <label class="form-label">University<span class="required-star">*</span></label>
        <asp:DropDownList ID="ddlUniversity" runat="server" CssClass="form-select">  
       
        </asp:DropDownList>
    </div>

     <asp:RequiredFieldValidator
    ID="rfvUniversity"
    runat="server"
    InitialValue="0"
    ControlToValidate="ddlUniversity"
    ErrorMessage="Please fill University field"
    ForeColor="Red">
</asp:RequiredFieldValidator>

    <div class="col-md-6">
        <label class="form-label">Major<span class="required-star">*</span></label>
        <asp:DropDownList ID="ddlMajor" runat="server" CssClass="form-select"> </asp:DropDownList>
    </div>

     <asp:RequiredFieldValidator
    ID="rvfMajor"
    runat="server"
    InitialValue="0"
    ControlToValidate="ddlMajor"
    ErrorMessage="Please fill  Major field"
    ForeColor="Red">
</asp:RequiredFieldValidator>

    <div class="col-md-6">
        <label class="form-label">Education Level<span class="required-star">*</span></label>
        <asp:DropDownList ID="ddlEducationLevel" runat="server" CssClass="form-select">
         
        </asp:DropDownList>
    </div>

     <asp:RequiredFieldValidator
    ID="rfvEducation_Level"
    runat="server"
    InitialValue="0"
    ControlToValidate="ddlEducationLevel"
    ErrorMessage="Please fill Education Level field"
    ForeColor="Red">
</asp:RequiredFieldValidator>

    <div class="col-md-6">
        <label class="form-label">GPA<span class="required-star">*</span></label>
        <asp:TextBox ID="txtGPA" runat="server" CssClass="form-control" />
    </div>


     <asp:RequiredFieldValidator
    ID="rfvGPA"
    runat="server"
    ControlToValidate="txtGPA"
    ErrorMessage="Please fill GPA field"
    ForeColor="Red">
</asp:RequiredFieldValidator>

</div>

   


   


<!-- ================= JOB INFORMATION ================= -->

    

<div class="apply-section-title mt-3">Job Information</div>
<div class="row g-4">

    <div class="col-md-6">
        <label class="form-label">Job Country<span class="required-star">*</span></label>
        <asp:DropDownList ID="ddlJobCountry" runat="server" CssClass="form-select">
             
        </asp:DropDownList>

    </div>
       <asp:RequiredFieldValidator
    ID="rfvJob_Country"
    runat="server"
      InitialValue="0"
    ControlToValidate="ddlJobCountry"
    ErrorMessage="Please fill Job Country  field"
    ForeColor="Red">
</asp:RequiredFieldValidator>


    <div class="col-md-6">
        <label class="form-label">Job Title<span class="required-star">*</span></label>
        <asp:TextBox ID="txtJobTitle" runat="server" CssClass="form-control" />
    </div>

      <asp:RequiredFieldValidator
    ID="rfvJob_Title"
    runat="server"
    ControlToValidate="txtJobTitle"
    ErrorMessage="Please fill Job Title  field"
    ForeColor="Red">
</asp:RequiredFieldValidator>

    <div class="col-md-6">
        <label class="form-label">Job Type<span class="required-star">*</span></label>
        <asp:CheckBoxList ID="cblJobType" runat="server" RepeatDirection="Horizontal" CssClass="radio-spacing rbl-text">
        </asp:CheckBoxList>
    </div>

<asp:CustomValidator
    ID="cvJobType"
    runat="server"
    ErrorMessage="Please select at least one Job Type"
    ForeColor="Red"
    OnServerValidate="cvJobType_ServerValidate">
</asp:CustomValidator>

    <div class="col-md-6">
        <label class="form-label">Experience Years<span class="required-star">*</span></label>
        <asp:RadioButtonList ID="rblExperience" runat="server" RepeatDirection="Horizontal" CssClass="radio-spacing rbl-text">
        </asp:RadioButtonList>
    </div>

    
      <asp:RequiredFieldValidator
    ID="rfvExperience_Years"
    runat="server"
    ControlToValidate="rblExperience"
    ErrorMessage="Please fill  Experience Years field"
    ForeColor="Red">
</asp:RequiredFieldValidator>

    <div class="col-md-6">
        <label class="form-label">Notice Period<span class="required-star">*</span></label>
        <asp:RadioButtonList ID="rblNoticePeriod" runat="server" RepeatDirection="Horizontal" CssClass="radio-spacing rbl-text">
           
        </asp:RadioButtonList>
    </div>
    
      <asp:RequiredFieldValidator
    ID="rfvNotice_Period"
    runat="server"
    ControlToValidate="rblNoticePeriod"
    ErrorMessage="Please fill  Notice Period field"
    ForeColor="Red">
</asp:RequiredFieldValidator>

    
    <div class="col-md-6">
        <label class="form-label">Last Salary</label>
        <asp:TextBox ID="txtLastSalary" runat="server" CssClass="form-control" />
    </div>

    <div class="col-md-6">
        <label class="form-label">Requested Salary</label>
        <asp:TextBox ID="txtRequestedSalary" runat="server" CssClass="form-control" />
    </div>



    <div class="col-md-6">
        <label class="form-label">Upload CV<span class="required-star">*</span></label>
        <asp:FileUpload ID="fuCV" runat="server" CssClass="form-control" />
    </div>

      <asp:RequiredFieldValidator
    ID="rfvCV"
    runat="server"
     
    ControlToValidate="fuCV"
    ErrorMessage="Please fill  CV field"
    ForeColor="Red">
</asp:RequiredFieldValidator>

</div>

<!-- ================= SUBMIT BUTTON ================= -->

<div class="text-center mt-5">
    <asp:Button ID="btnSubmit"
        runat="server"
        Text="Submit Application"
        CssClass="btn btn-apply" OnClick="btnSubmit_Click" OnClientClick="return confirm ('Are you Sure you want to submit?')" />
    <br> <br><br>

    
    <asp:Label ID="lbloutput" runat="server"  CssClass="red-label"></asp:Label>
</div>

 

</div>

   </asp:Content>