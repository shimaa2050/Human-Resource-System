<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="shimaa11818WebApp.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>

      <link href="~/Content/Site.css"  rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
 <link rel="icon" runat="server"  type="image/x-icon" href="~/favicon.ico" /> 


</head>
<body>

    <form id="form1" runat="server">
   

      <%--   <a href="#">--%>
      <img src="images\Hr logo 2.png" alt="HR logo" height="250" class="logo2"/>
  <%--  </a>--%>

         <div class="login-card">



    <h2>Login</h2>

         <asp:Label ID="lblOutput" runat="server"  CssClass="emailtext" ></asp:Label>


    <div class="form-group">
        <asp:Label Text="Username" runat="server" CssClass="form-label" />
        <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" />
    </div>
            <br><br>

    <div class="form-group mt-3">
        <asp:Label Text="Password" runat="server" CssClass="form-label" />
        <asp:TextBox ID="txtPassword"
            runat="server"
            TextMode="Password"
            CssClass="form-control" />
    </div>

    <br /><br>

    <asp:Button
        ID="btnLogin"
        runat="server"
        Text="Login"
         CssClass="btn btn-apply"
        width ="400"
        onClick="btnLogin_Click"/>

    <br /><br />

              
    

</div>

 </form>

</body>
</html>