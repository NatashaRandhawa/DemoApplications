<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="CustomerManagement.aspx.cs" Inherits="LawnHedgeMaintenance.Admin.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="MyServicesMngt">
        <br />
        CUSTOMER MANAGEMENT SYSTEM
        <br /><br />
    </div>
    <div class="MyServiceSrchBox">
            Search customers by:&nbsp;
            <asp:DropDownList ID="DdlSrchCategory" runat="server">
                <asp:ListItem>name</asp:ListItem>
                <asp:ListItem>email</asp:ListItem>
                <asp:ListItem>username</asp:ListItem>
                <asp:ListItem>address_street</asp:ListItem>
                <asp:ListItem>address_suburb</asp:ListItem>
                <asp:ListItem>address_city</asp:ListItem>
            </asp:DropDownList>
            &ensp;&ensp;
            <asp:TextBox ID="TxtServSrchBox" runat="server" Width="180px" ValidationGroup="SrchCust"></asp:TextBox>
            &ensp;&ensp;<asp:Button ID="BtnServSrch" CssClass="MyServSrchbtn" ValidationGroup="SrchCust"  runat="server" Text="Search" OnClick="BtnServSrch_Click" />

            &ensp;&ensp;<asp:Button ID="BtnShowAllServ" CssClass="MyServSrchbtn" runat="server" Text="Display all" OnClick="BtnShowAllServ_Click"/>

            <br />
            <asp:RequiredFieldValidator ID="RFVSrchCust" runat="server" ValidationGroup="SrchCust" ControlToValidate="TxtServSrchBox" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>

    </div>
    <br /><br />
    <asp:GridView ID="customerMngt" CssClass="MyCustMngtGrid" runat="server" AutoGenerateColumns="false" ShowFooter="true" DataKeyNames="username"
                ShowHeaderWhenEmpty="true" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3"

                OnRowCommand="customerMngt_RowCommand" OnRowEditing="customerMngt_RowEditing" OnRowCancelingEdit="customerMngt_RowCancelingEdit"
                OnRowUpdating="customerMngt_RowUpdating" OnRowDeleting="customerMngt_RowDeleting" Width="100%" AllowPaging="True" AllowSorting="True">

                
                <%-- Theme Properties --%>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
                
                <Columns>
                    <asp:TemplateField HeaderText="ID">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("id") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtID" Text='<%# Eval("id") %>' runat="server"  />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtIDFooter" runat="server" width="95%" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("name") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtName" Text='<%# Eval("name") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtNameFooter" runat="server" width="95%"/>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Phone">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("phone") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtContact" Text='<%# Eval("phone") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtContactFooter" runat="server" width="95%"/>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("email") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtcustemail" Text='<%# Eval("email") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtcustemailFooter" runat="server" width="95%"/>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Username">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("username") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtUname" Text='<%# Eval("username") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtUnameFooter" runat="server" width="95%"/>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Password">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("password") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPwd" Text='<%# Eval("password") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtPwdFooter" runat="server" width="95%"/>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Street No.">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("address_street") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtStreet" Text='<%# Eval("address_street") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtStreetFooter" runat="server" width="95%"/>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Suburb">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("address_suburb") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtSuburb" Text='<%# Eval("address_suburb") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtSuburbFooter" runat="server" width="95%"/>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="City">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("address_city") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtCity" Text='<%# Eval("address_city") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtCityFooter" runat="server" width="95%"/>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ImageUrl="../images/edit.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="20px" Height="20px"/>
                            <asp:ImageButton ImageUrl="../images/delete.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px"/>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton ImageUrl="../images/save.png" runat="server" CommandName="Update" ToolTip="Update" Width="20px" Height="20px"/>
                            <asp:ImageButton ImageUrl="../images/cancel.png" runat="server" CommandName="Cancel" ToolTip="Cancel" Width="20px" Height="20px"/>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:ImageButton ImageUrl="../images/addnew.png" runat="server" CommandName="AddNew" ToolTip="Add New" Width="20px" Height="20px"/>
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            <br />
            <asp:Label ID="lblErrorMessage" Text=" " runat="server" ForeColor="Red" />

</asp:Content>
