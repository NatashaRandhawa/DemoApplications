<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ServicesManagement.aspx.cs" Inherits="LawnHedgeMaintenance.Admin.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="MyServicesMngt">
        <br />
        SERVICES MANAGEMENT SYSTEM
        <br /><br />
    </div>
    <div class="MyServiceSrchBox">
            Search services by name:
            &ensp;&ensp;
            <asp:TextBox ID="TxtServSrchBox" runat="server" Width="180px" ValidationGroup="SearchService"></asp:TextBox>
            &ensp;&ensp;<asp:Button CssClass="MyServSrchbtn" ID="BtnServSrch" runat="server" ValidationGroup="SearchService" Text="Search" OnClick="BtnServSrch_Click" />

            &ensp;&ensp;<asp:Button ID="BtnShowAllServ" CssClass="MyServSrchbtn" runat="server" Text="Display all" OnClick="BtnShowAllServ_Click"  />

            <br />
            <asp:RequiredFieldValidator ID="RFVSearchService" runat="server" ValidationGroup="SearchService" ControlToValidate="TxtServSrchBox" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>

    </div>
    <br /><br />
    <asp:GridView ID="servicesMngt" runat="server" AutoGenerateColumns="false" ShowFooter="true" DataKeyNames="servID"
                ShowHeaderWhenEmpty="true" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3"

                OnRowCommand="servicesMngt_RowCommand" OnRowEditing="servicesMngt_RowEditing" OnRowCancelingEdit="servicesMngt_RowCancelingEdit"
                OnRowUpdating="servicesMngt_RowUpdating" OnRowDeleting="servicesMngt_RowDeleting" Width="100%" AllowPaging="True" AllowSorting="True">

                
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
                    <asp:TemplateField HeaderText="Service ID">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("servID") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtFirstName" Text='<%# Eval("servID") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtservIDFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Service Name">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("servName") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtLastName" Text='<%# Eval("servName") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtservNameFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Service Image">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("servImg") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtContact" Text='<%# Eval("servImg") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtservImgFooter" runat="server" />
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
            <asp:Label ID="lblSuccessMessage" Text=" " runat="server" ForeColor="Green" />
            <br />
            <asp:Label ID="lblErrorMessage" Text=" " runat="server" ForeColor="Red" />

</asp:Content>
