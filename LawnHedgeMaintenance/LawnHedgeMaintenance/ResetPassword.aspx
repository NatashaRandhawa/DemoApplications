<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="LawnHedgeMaintenance.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br /><br /><br />
    <div class="MyResetPwd">
        <h2>Reset Password</h2>
        <br />
        <div>
            Enter New Password:&nbsp;
            <asp:TextBox ID="TxtNewPwd" runat="server" ValidationGroup="ResetPwd" TextMode="Password"></asp:TextBox>
            &nbsp;<span class="MyRequiredField">*</span>
            <span class="MyUnameRules" onclick="showPopUpPwd()">
                        <i class="fa fa-info-circle" aria-hidden="true">
                            <span class="popuptext" id="myPopup2">
                                A valid password must contain atleast one -
                                <br />
                                <br />number [0-9]
                                <br />lower case letter [a-z]
                                <br />upper case letter [A-Z]
                                <br />special char (.,@#$_)
                                <br />
                                <br />and must be between length 8 to 15
                            </span>
                        </i>
            </span>
            <br />&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
            <asp:RequiredFieldValidator ID="RFVPwd" runat="server" ValidationGroup="ResetPwd" ControlToValidate="TxtNewPwd" ErrorMessage="Please enter a password" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
            <asp:RegularExpressionValidator ID="REVNewPwd" runat="server" ValidationGroup="ResetPwd" ControlToValidate="TxtNewPwd" ErrorMessage="Please enter a valid password" ForeColor="Red" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\da-zA-Z]).{8,15}$"></asp:RegularExpressionValidator>
            <br />
            <br />
            Confirm Password:&nbsp;
            <asp:TextBox ID="TxtCnfmNewPwd" runat="server" ValidationGroup="ResetPwd" TextMode="Password"></asp:TextBox>
            &nbsp;<span class="MyRequiredField">*</span>
            <br />&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
            <asp:RequiredFieldValidator ID="RFVCnfmPwd" runat="server" ValidationGroup="ResetPwd" ControlToValidate="TxtCnfmNewPwd" ErrorMessage="Please re-enter the password" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
            <asp:CompareValidator ID="CVCnfmPwd" runat="server" ValidationGroup="ResetPwd" ControlToCompare="TxtNewPwd" ControlToValidate="TxtCnfmNewPwd" ErrorMessage="Password does not match" ForeColor="Red"></asp:CompareValidator>
            <br />
            <br />
            <asp:Button ID="BtnResetPwd" CssClass="MyResetPwdBtn" ValidationGroup="ResetPwd" runat="server" Text="Reset" OnClick="BtnResetPwd_Click" />
            <br />
            <br />

        </div>
        <br />
        <asp:Label ID="lblSuccessMsg" runat="server" ForeColor="#336600"></asp:Label>
        &emsp;|&emsp;<a href="Login.aspx">Login</a>
        <br />
    </div>
    <br /><br /><br />
</asp:Content>
