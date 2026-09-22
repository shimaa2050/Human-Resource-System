<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SkillsLanguages.aspx.cs" Inherits="shimaa11818WebApp.SkillsLanguages"  MasterPageFile="~/Site.Master"  %>




<asp:Content ID="Content12" 
    ContentPlaceHolderID="MainContent" 
    runat="server">

    <div class="apply-card">

          <asp:Label ID="lbloutput" runat="server"  CssClass="red-label"></asp:Label>

<h2 class="text-center mb-5">Job Application</h2>


    <div class="apply-section-title mt-5">Skills<span class="required-star">*</span></div>

<div class="row mb-3">
    <div class="col-md-9">
        <asp:DropDownList ID="ddlSkills" runat="server" CssClass="form-select">
             <asp:ListItem Text="-- Select Skill --" Value="0"></asp:ListItem>
        </asp:DropDownList>
    </div>

    <div class="col-md-3">
       <asp:Button 
    ID="btnskl" 
    runat="server"
    CssClass="btn btn-primary w-100"
    Text="Add Skill"
    OnClick="btnskl_Click" />
    </div>
</div>

    
     <asp:RequiredFieldValidator
    ID="rfvSkills"
    runat="server"
    ControlToValidate="ddlSkills"
    InitialValue="0"
    ErrorMessage="Please select a skill"
    ForeColor="Red">
</asp:RequiredFieldValidator>


<table class="table table-bordered text-center" id="skillsTable">
    <thead class="table-light">
        <tr>
            <th>Skill</th>
        </tr>
    </thead>
  <tbody id="skillsTableBody" runat="server"></tbody>
</table>

 <div class="col-md-3">
       <asp:Button 
    ID="btnsv" 
    runat="server"
    CssClass="btn btn-primary w-200"
    Text="save all"
    OnClick="btnsv_Click" />
    </div>
    
    <br><br>
<div class="apply-section-title mt-3">
    Languages<span class="required-star">*</span>
</div>

<div class="row align-items-end mb-3">

    <!-- Language Dropdown -->
    <div class="col-md-5">
        <label class="form-label">Language</label>
        <asp:DropDownList 
            ID="ddlLanguages" 
            runat="server" 
            CssClass="form-select">
        </asp:DropDownList>
    </div>

    <!-- Level Dropdown -->
    <div class="col-md-4">
        <label class="form-label">Proficiency Level</label>
        <asp:DropDownList 
            ID="ddlLanguageLevel" 
            runat="server" 
            CssClass="form-select">
        </asp:DropDownList>
    </div>

    <!-- Button -->
    <div class="col-md-3">
        <asp:Button 
            ID="btnlang" 
            runat="server"
            CssClass="btn btn-primary w-100"
            Text="Add Language"
            OnClick="btnlang_Click" />
    </div>

        <asp:RequiredFieldValidator
    ID="rfvlang"
    runat="server"
    ControlToValidate="ddlLanguages"
    InitialValue="0"
    ErrorMessage="Please select a  Language"
    ForeColor="Red">
</asp:RequiredFieldValidator>


     <asp:RequiredFieldValidator
    ID="rfvlangl"
    runat="server"
    ControlToValidate="ddlLanguageLevel"
    InitialValue="0"
    ErrorMessage="Please select a  Level "
    ForeColor="Red">
</asp:RequiredFieldValidator>

</div>

<table class="table table-bordered text-center" id="languagesTable">
    <thead class="table-light">
        <tr>
            <th>Language</th>
            <th>Level</th>
        </tr>
    </thead>
 <tbody id="languagesTableBody" runat="server"></tbody>
</table>

    
    <div class="col-md-3">
      <asp:Button 
    ID="btnsv2" 
    runat="server"
    CssClass="btn btn-primary w-100"
    Text="save all"
    OnClick="btnsv2_Click" />
    </div>
        <br><br>

        <div class="apply-section-title mt-3">Job Information</div>
        
      <div class="col-md-6">
        <label class="form-label">Applying for<span class="required-star">*</span></label>
        <asp:DropDownList ID="ddljobs" runat="server" CssClass="form-select">
                
        </asp:DropDownList>
         
    </div>

       <asp:RequiredFieldValidator
    ID="rfvApplying"
    runat="server"
     InitialValue="0"
    ControlToValidate="ddljobs"
    ErrorMessage="Please fill  applying for field"
    ForeColor="Red">
</asp:RequiredFieldValidator>

        <br><br><br />    <br><br><br />


         <asp:Button ID="done"
        runat="server"
        Text="Done"
        CssClass="btn btn-apply w-100"   OnClick="done_Click" OnClientClick="return confirm ('Are you Sure you want to submit?')"/>

           <br><br><br />    <br><br><br />

          <asp:Button ID="Backhome"
        runat="server"
        Text="home"
        CssClass="btn btn-apply w-100"   PostBackUrl="~/home.aspx" />


   
</div>
       
 </asp:content>