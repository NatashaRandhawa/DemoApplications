<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LawnHedgeMaintenance.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="Myloginpage">
        <br />
        <table>
            <tr>
                <td colspan="3" class="MyLoginPgtitles">Login </td>
            </tr>
            <tr>
                <td>Username</td>
                <td>
                    <asp:TextBox ID="TxtLoginUname" runat="server"></asp:TextBox>
                    &nbsp;
                    <asp:RequiredFieldValidator ID="RFVLoginID" runat="server" ErrorMessage="Please enter your username" ForeColor="Red" ControlToValidate="TxtLoginUname"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Password</td>
                <td>
                    <asp:TextBox ID="TxtLoginPwd" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
                    &nbsp;
                     <asp:RequiredFieldValidator ID="RFVLoginPwd" runat="server" ErrorMessage="Please enter your password" ForeColor="Red" ControlToValidate="TxtLoginPwd"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="3" class="MyLoginPgtitles"><a href="ForgotPwd.aspx">Forgot Password</a> | New user <a href="Register.aspx">Register</a> !</td>
            </tr>
            <tr>
                <td colspan="3" class="MyLoginPgtitles">
                    <asp:Button ID="BtnLogin" runat="server" Text="Submit" OnClick="BtnLogin_Click" />
                </td>
            </tr>
        </table>
        <br />
        <br />
&nbsp;&nbsp;
        <asp:Label ID="lbluserAuth" runat="server" ForeColor="Red"></asp:Label>
&nbsp;<asp:ValidationSummary ID="ValidationSummaryLogin" runat="server" ForeColor="Red" />
        <br /><br />
    </div>
</asp:Content>
