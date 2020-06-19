<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ShowCart.aspx.cs" Inherits="LawnHedgeMaintenance.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="MyShowCart">
        <h3>Your Cart</h3>
        <p>A detailed list of all the services you have added to your cart.</p>
        
            <asp:Button ID="BtnCheckout" runat="server" Class="MyCheckout" text="Checkout" OnClick="BtnCheckout_Click" />

        
        <div ID="MyBooking">
            
            <table class="Mytable">
                <tr>
                    <td>Date:</td>
                    <td>
                        <asp:TextBox ID="TxtBookDate" placeholder="dd-mm-yyyy" ValidationGroup="Booking" runat="server" TextMode="Date"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RFVDate" runat="server" ValidationGroup="Booking" ControlToValidate="TxtBookDate" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td>Time:</td>
                    <td>
                        <asp:TextBox ID="TxtBookTime" placeholder="HH:mm" runat="server" ValidationGroup="Booking" TextMode="Time" format="HH:mm"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RFVTime" runat="server" ValidationGroup="Booking" ControlToValidate="TxtBookTime" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td>Location:</td>
                    <td>
                        <asp:TextBox ID="TxtBookLoc" runat="server" ValidationGroup="Booking"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RFVLoc" runat="server" ValidationGroup="Booking" ControlToValidate="TxtBookLoc" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        <br />
                        <asp:Button ID="BtnBookServices" CssClass="MyBookingBtn" ValidationGroup="Booking" Enabled="false" runat="server" Text="Book" onclick="BtnBookServices_Click" />

                    </td>
                </tr>
            </table>
            
        </div>
        <br />
        <asp:Label ID="lblCartMsg" runat="server" ForeColor="Red"></asp:Label>
        <br />
        <asp:DataList ID="DataList1" runat="server" OnItemCommand = "DataList1_ItemCommand" BackColor="#CCFFCC" BorderColor="Gray" BorderWidth="2px" CellPadding="5" CellSpacing="5" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" ForeColor="Black" CssClass="MyServicesList" HorizontalAlign="Center">
                <ItemTemplate>
                    
                    <asp:Label ID="servNameLabel2" runat="server" Text='<%# Eval("servName") %>' Font-Size="X-Large" Font-Bold="True" Font-Italic="True" />
                    <br />
                    <br />
                    <asp:Image ID="servImageLabel2" runat="server" ImageUrl='<%# "images/" + Eval("servImg") %>' AlternateText="service image" ImageAlign="Left" width="400px" />
                    <br />
                    
                    <asp:Label ID="servDescLabel2" CssClass="MyServicesList" runat="server" Text='<%# Eval("servDesc") %>' />
                    <br />
                    <asp:Button ID="BtnDelcart" CssClass="delFromCart" runat="server" Text="Delete" CommandName="delFromCart" />
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;					
                </ItemTemplate>
               <SeparatorTemplate>
                   <hr />
               </SeparatorTemplate>
            </asp:DataList>
        <br /><br />
      </div>
</asp:Content>
