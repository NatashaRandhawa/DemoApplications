<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="LawnHedgeMaintenance.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="MyServicesCover">
        <div class="MyServicesCoverCont">
            <p>Services</p>
        </div>
    </div>
    <br /><br /><br />
    <div class="MyServicesQuote">
        " Tend to your lawn with the help of our trained personnel and well maintained equipments. "
    </div>
     <br /> <br /> <br />

    <div class="slideshow-container">

        <div class="mySlides fade">
          <div class="numbertext">1 / 2</div>
          <img src="images/offer1.jpg">
        </div>

        <div class="mySlides fade">
          <div class="numbertext">2 / 2</div>
          <img src="images/offer2.jpg">
        </div>

        <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
        <a class="next" onclick="plusSlides(1)">&#10095;</a>

        </div>
        <br>

        <div style="text-align:center">
          <span class="dot" onclick="currentSlide(1)"></span> 
          <span class="dot" onclick="currentSlide(2)"></span> 
        </div>

    <br /><br /><br />

    <div class="MyServices">
        <div class="MyServiceSrchBox">
            Search services by name:
            &ensp;&ensp;
            <asp:TextBox ID="TxtServSrchBox" runat="server" Width="180px" ValidationGroup="SearchServ"></asp:TextBox>
            &ensp;&ensp;<asp:Button CssClass="MyServSrchbtn" ID="BtnServSrch" runat="server" Text="Search" OnClick="BtnServSrch_Click" ValidationGroup="SearchServ" />

            &ensp;&ensp;<asp:Button ID="BtnShowAllServ" CssClass="MyServSrchbtn" runat="server" Text="Display all" OnClick="BtnShowAllServ_Click" />

            <br />
            <asp:RequiredFieldValidator ID="RFVSrchServ" runat="server" ValidationGroup="SearchServ" ControlToValidate="TxtServSrchBox" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>

        </div>
        <br /><br />
        <asp:Label ID="lblSrchRes" runat="server" ForeColor="Red"></asp:Label>

        <asp:DataList ID="DataList1" runat="server" OnItemCommand = "DataList1_ItemCommand" BackColor="#CCFFCC" BorderColor="Gray" BorderWidth="2px" CellPadding="5" CellSpacing="5" DataSourceID="SqlDataSource1" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" ForeColor="Black" CssClass="MyServicesList" HorizontalAlign="Center">
                <ItemTemplate>
                    
                    <asp:Label ID="servIDLabel" runat="server" Text='<%# Eval("servID") %>' />
                    .&nbsp;&nbsp;
                    <asp:Label ID="servNameLabel" runat="server" Text='<%# Eval("servName") %>' Font-Size="X-Large" Font-Bold="True" Font-Italic="True" />
                    <br />
                    <br />
                    <asp:Image ID="servImageLabel" runat="server" ImageUrl='<%# "images/" + Eval("servImg") %>' AlternateText="service image" ImageAlign="Left" width="400px" />
                    <br />
                    
                    <asp:Label ID="servDescLabel" CssClass="MyServicesList" runat="server" Text='<%# Eval("servDesc") %>' />
                    <br />
                    <asp:Button ID="BtnAddtoCart" CssClass="addtocart" runat="server" Text="+ Add to Cart" CommandName="addToCart" />
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;					
                </ItemTemplate>
               <SeparatorTemplate>
                   <hr />
               </SeparatorTemplate>
            </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:lawnandhedgemaintenanceConnectionString %>" SelectCommand="SELECT * FROM [servicestable]"></asp:SqlDataSource>
        
        <%--Datalist to display search results--%>

        <asp:DataList ID="DataList2" runat="server" OnItemCommand = "DataList2_ItemCommand" BackColor="#CCFFCC" BorderColor="Gray" BorderWidth="2px" CellPadding="5" CellSpacing="5" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" ForeColor="Black" CssClass="MyServicesList" HorizontalAlign="Center">
                <ItemTemplate>
                    
                    <asp:Label ID="servIDLabel2" runat="server" Text='<%# Eval("servID") %>' />
                    .&nbsp;&nbsp;
                    <asp:Label ID="servNameLabel2" runat="server" Text='<%# Eval("servName") %>' Font-Size="X-Large" Font-Bold="True" Font-Italic="True" />
                    <br />
                    <br />
                    <asp:Image ID="servImageLabel2" runat="server" ImageUrl='<%# "images/" + Eval("servImg") %>' AlternateText="service image" ImageAlign="Left" width="400px" />
                    <br />
                    
                    <asp:Label ID="servDescLabel2" CssClass="MyServicesList" runat="server" Text='<%# Eval("servDesc") %>' />
                    <br />
                    <asp:Button ID="BtnAddtoCart2" CssClass="addtocart" runat="server" Text="+ Add to Cart" CommandName="addToCart" />
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
