<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="LawnHedgeMaintenance.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="MyServicesCover">
        <div class="MyServicesCoverCont">
            <p>Contact</p>
        </div>
    </div>
    <br /><br /><br />
    <div class="MyContactpg">
        <h2>Contact Details :</h2>        
        <table class="MyContactForm">
            <tr>
                <td>Name:</td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="TxtCntfrmName" runat="server" ValidationGroup="ContactForm" Width="200px"></asp:TextBox>
                &nbsp;
                    <asp:RequiredFieldValidator ID="RFVName" runat="server" ValidationGroup="ContactForm" ControlToValidate="TxtCntfrmName" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Your Email Address:</td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="TxtCntfrmEmail" runat="server" ValidationGroup="ContactForm" TextMode="Email" Width="300px"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RFVemail" runat="server" ValidationGroup="ContactForm" ControlToValidate="TxtCntfrmEmail" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Subject:</td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="TxtCntfrmSubj" runat="server" Width="300px"></asp:TextBox>
                &nbsp;</td>
            </tr>
            <tr>
                <td>Message:</td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="TxtCntfrmMsg" runat="server"  ValidationGroup="ContactForm" TextMode="MultiLine" Width="300px"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RFVMsg" ValidationGroup="ContactForm" runat="server" ControlToValidate="TxtCntfrmMsg" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="MyContactfrmBtn">
                    <asp:Button ID="BtnContfrmsubmit" CssClass="Mybtn" ValidationGroup="ContactForm" runat="server" Text="Submit" OnClick="BtnContfrmsubmit_Click" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblCntfrmMsg" runat="server" ForeColor="White"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <br />
        Mobile No: 0212640040<br />
        Email: <a href="mailto:jamalunlimited6@gmail.com">jamalunlimited6@gmail.com</a>
        <br />
        <br />    
    </div>
</asp:Content>
