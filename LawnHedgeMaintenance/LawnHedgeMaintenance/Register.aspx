<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="LawnHedgeMaintenance.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <br />
        <table class="MyCustRegister">
            <tr>
                <td colspan="2" class="MyRegister">New Register</td>
            </tr>
            <tr>
                <td><br /><br />Name</td>
                <td><span class="MyRequiredField">(all fields are mandatory)</span><br />
                    <asp:TextBox ID="TxtRegName" ValidationGroup="Registeration" runat="server"></asp:TextBox> 
                    <%--<span class="MyRequiredField">&nbsp;*</span>--%>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:RequiredFieldValidator ID="RFVName" runat="server" ValidationGroup="Registeration" ControlToValidate="TxtRegName" ErrorMessage="Please enter your name" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Mobile</td>
                <td>
                    <asp:TextBox ID="TxtRegMob" runat="server" ValidationGroup="Registeration" TextMode="Phone"></asp:TextBox>
                    <%--<span class="myrequiredfield">&nbsp;*</span>--%>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:RegularExpressionValidator ID="REVMobile" runat="server" ValidationGroup="Registeration" ControlToValidate="TxtRegMob" ErrorMessage="Please enter a valid number (10 digit)" ForeColor="Red" ValidationExpression="^([0-9]{10})$"></asp:RegularExpressionValidator>
                    <br />
                    <asp:RequiredFieldValidator ID="RFVCustMob" runat="server" ValidationGroup="Registeration" ControlToValidate="TxtRegMob" ErrorMessage="Please enter your mobile number" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                </td>
            </tr>
            <tr>
                <td>Email</td>
                <td>
                    <asp:TextBox ID="TxtRegEmail" runat="server" ValidationGroup="Registeration" TextMode="Email"></asp:TextBox>
                    <%--<span class="MyRequiredField">&nbsp;*</span>--%>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:RequiredFieldValidator ID="RFVEmail" runat="server" ValidationGroup="Registeration" ControlToValidate="TxtRegEmail" ErrorMessage="Please enter your email-id" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>            
            </tr>
            <tr>
                <td rowspan="3">Address</td>
                <td>
                    <asp:TextBox ID="TxtRegAddrStreet" runat="server" ValidationGroup="Registeration" placeholder="street no."></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RFVstreet" runat="server" ValidationGroup="Registeration" ControlToValidate="TxtRegAddrStreet" ErrorMessage="Please enter street address" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="TxtRegAddrSuburb" runat="server" ValidationGroup="Registeration" placeholder="suburb"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RFVsuburb" runat="server" ValidationGroup="Registeration" ControlToValidate="TxtRegAddrSuburb" ErrorMessage="Please enter suburb " ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="TxtRegAddrCity" runat="server" ValidationGroup="Registeration" placeholder="city"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RFVcity" runat="server" ValidationGroup="Registeration" ControlToValidate="TxtRegAddrCity" ErrorMessage="Please enter city" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td><br />Username
                    </td>
                <td>
                    <br />
                    <asp:TextBox ID="TxtRegUname" runat="server" ValidationGroup="Registeration" OnTextChanged="CheckUname_Click" AutoPostBack="True"></asp:TextBox>
                    <%--<span class="MyRequiredField">&nbsp;*</span>--%>
                    <span class="MyUnameRules" onclick="showPopUpUname()">
                        <i class="fa fa-info-circle" aria-hidden="true">
                            <span class="popuptext" id="myPopup">
                                A valid username can contain -
                                <br />
                                <br />numbers [0-9]
                                <br />letters [a-z] or [A-Z]
                                <br />special chars . and _
                                <br />
                                <br />and must be between length 6 to 15
                            </span>
                        </i>
                    </span>
                    &nbsp;<asp:Label ID="lblUNavail" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>

                    <asp:RequiredFieldValidator ID="RFVUname" ValidationGroup="Registeration" runat="server" ControlToValidate="TxtRegUname" ErrorMessage="Please enter a username" ForeColor="Red"></asp:RequiredFieldValidator><br />
                    <asp:RegularExpressionValidator ID="REVUname" ValidationGroup="Registeration" runat="server" ControlToValidate="TxtRegUname" ErrorMessage="enter a valid username" ForeColor="Red" ValidationExpression="[A-Za-z0-9._]{6,15}"></asp:RegularExpressionValidator>
                    <br />
                </td>
            </tr>
            <tr>
                <td>Password</td>
                <td>
                    <asp:TextBox ID="TxtRegPwd" runat="server" ValidationGroup="Registeration" TextMode="Password"></asp:TextBox>
                    <%--<span class="MyRequiredField">&nbsp;*</span>--%>
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
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:RequiredFieldValidator ID="RFVPwd" runat="server" ValidationGroup="Registeration" ControlToValidate="TxtRegPwd" ErrorMessage="Please enter a password" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br /><asp:RegularExpressionValidator ID="REVPwd" runat="server" ValidationGroup="Registeration" ControlToValidate="TxtRegPwd" ErrorMessage="please enter a valid password" ForeColor="Red" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\da-zA-Z]).{8,15}$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>Confirm Password</td>
                <td>
                    <asp:TextBox ID="TxtRegCPwd" runat="server" ValidationGroup="Registeration" TextMode="Password"></asp:TextBox>
                    <%--<span class="MyRequiredField">&nbsp;*</span>--%>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:RequiredFieldValidator ID="RFVCPwd" runat="server" ValidationGroup="Registeration" ControlToValidate="TxtRegCPwd" ErrorMessage="Please confirm your password" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br /><asp:CompareValidator ID="CompValCpwd" runat="server" ValidationGroup="Registeration" ControlToCompare="TxtRegPwd" ControlToValidate="TxtRegCPwd" ErrorMessage="Passwords does not match" ForeColor="Red"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="MyRegister">
                    <asp:Button ID="BtnSaveRegForm" CssClass="MySaveRegister" ValidationGroup="Registeration" runat="server" Text="Save" OnClick="BtnSaveRegForm_Click" />
                </td>
            </tr>
        </table>
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblDBerrormsg" runat="server" ForeColor="Red"></asp:Label>
        <asp:ValidationSummary ID="ValidationSummaryRegister" runat="server" ForeColor="Red" />
        <br /><br />
    </div>
</asp:Content>
