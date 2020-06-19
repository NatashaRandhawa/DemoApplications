<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ForgotPwd.aspx.cs" Inherits="LawnHedgeMaintenance.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br /><br />
    <div class="MyForgotPwdDiv">
        <div class="MyForgotPwd">
            Enter your email address:&nbsp;
            <asp:TextBox ID="TxtEmail" runat="server" ValidationGroup="ForgotPassword"  TextMode="Email" Width="300px"></asp:TextBox>
            &nbsp;<span class="MyRequiredField">*</span>
            <br />&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
            <asp:RequiredFieldValidator ID="RFVEmail" runat="server" ControlToValidate="TxtEmail" ValidationGroup="ForgotPassword"  ErrorMessage="Please enter your email address" ForeColor="Red"></asp:RequiredFieldValidator>
            <br /><br /><br />
            <asp:Button class="MySendLinkbtn" ID="BtnResetPwd" runat="server" Text="Send" ValidationGroup="ForgotPassword" OnClick="BtnResetPwd_Click" />
            <br /><br /><br />
            <asp:Label ID="lblResetPwdmsg" runat="server" ForeColor="#336600"></asp:Label>
        </div>
     </div>
     <br /><br />   
</asp:Content>
