﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error403.aspx.cs" Inherits="LawnHedgeMaintenance.ErrorPages.Error403" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <!-- Custom StyleSheet -->
     <link rel="stylesheet" type="text/css" href="../CSS/MyStyle.css" />


</head>
<body  class="MyerrorPg">
    <form id="form1" runat="server">
       <div>
            <img src="../images/sorry.png" alt="sorry" height="350" /><br /><br />
             Forbidden<br />
             You don't have access to this page.<br /><br />
            <asp:Button ID="BtnGoHome" runat="server" BackColor="#6699FF" Font-Bold="True" ForeColor="White" PostBackUrl="../Default.aspx" Text="Go to Home" />
        </div>
    </form>
</body>
</html>