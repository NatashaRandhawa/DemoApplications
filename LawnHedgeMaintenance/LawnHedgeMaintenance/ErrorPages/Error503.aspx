<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error503.aspx.cs" Inherits="LawnHedgeMaintenance.ErrorPages.Error503" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <!-- Custom StyleSheet -->
     <link rel="stylesheet" type="text/css" href="../CSS/MyStyle.css" />

</head>
<body class="MyerrorPg">
    <form id="form1" runat="server">
        <div>
            <img src="../images/sorry.png" alt="sorry" height="350"/>
            <br /><br />
             Service unavailable<br />
             Server is busy at this moment, please try again after some time.<br /><br />
            <asp:Button ID="BtnGoHome" runat="server" BackColor="#6699FF" Font-Bold="True" ForeColor="White" PostBackUrl="../Default.aspx" Text="Go to Home" />
        </div>
    </form>
</body>
</html>
