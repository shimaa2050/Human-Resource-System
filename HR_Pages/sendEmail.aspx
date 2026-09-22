<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="sendEmail.aspx.cs"
    Inherits="shimaa11818WebApp.HR_Pages.sendEmail"  MasterPageFile="~/Site.Master"  %>


<asp:Content ID="Content10" 
    ContentPlaceHolderID="MainContent" 
    runat="server">


  

        <div class="container" style="max-width:700px; margin:auto;">


              <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script> 
            <div class="card shadow-lg p-4 account-card ">

                <h3 class="mb-4 text-center page-title">Send Email</h3>

                <asp:Label ID="lblMsg" runat="server"  CssClass="emailtext"></asp:Label>

                <!-- From Email -->
                <div class="mb-3">
                    <label class="form-label fw-semibold">to  Email</label>
                    <asp:TextBox ID="txtRecieverEmail" runat="server"
                        CssClass="form-control"></asp:TextBox>
                </div>

                <!-- Subject -->
                <div class="mb-3">
                    <label class="form-label fw-semibold">Subject</label>
                    <asp:TextBox ID="txtSubject" runat="server"
                        CssClass="form-control"
                        OnLoad="lblOutputClear_txtSubject"></asp:TextBox>
                </div>

                <!-- Attachments -->
                <div class="mb-3">
                    <label class="form-label fw-semibold">File Attachments</label>
                    <asp:FileUpload ID="fuAttachment" runat="server"
                        CssClass="form-control"
                        AllowMultiple="true" />
                </div>

                <!-- Message -->
                <div class="mb-3">
                    <label class="form-label fw-semibold">Message</label>
                    <asp:TextBox ID="txtBody" runat="server"
                        CssClass="form-control"
                        TextMode="MultiLine"
                        Height="120px"></asp:TextBox>
                </div>

                <!-- Buttons -->
                <div class="text-center mt-4">
                    <asp:Button ID="btnSendMailViaMailMgr" runat="server"
                        CssClass="btn btn-apply"
                        OnClick="btnSendMailViaMailMgr_Click"
                        Text="Send" />

                    <asp:Button ID="btnSendViaCode" runat="server"
                        CssClass="btn btn-secondary px-4 ms-2"
                        Text="Send email via Code"
                        OnClick="btnSendViaCode_Click"
                        Visible="false" />
                </div>

            </div>
        </div>

  

  </asp:Content>
