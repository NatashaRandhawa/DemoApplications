<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PersonalWebsite.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="pageSynopsis">
		
				<!--<p>Synopsis :</p>-->
				<table class="theme">
				
				<!--<tr> <td colspan="6" align="center"> CV </td> </tr>-->
				<tr> <td> <a href="#open-modal" class="pic"><img src="images/thumbnail.jpg" alt="pic"></a> </td><!-- make pic as thumbnail to view in original size -->
				    <td><h2> Natasha </h2>
				        <div id="open-modal" class="modal-window">
				          <div>
					        <a href="#modal-close" title="Close" class="modal-close">close &times;</a>
					        <img src="images/pic.jpg" alt="profile thumbnail" />
				          </div>
				        </div>
                    </td>
                </tr>
				<!--<tr> <td colspan="8"> PGDIT, AIS </td></tr>
				<tr class="stuID"> <td>0</td> <td>9</td> <td>1</td> <td>9</td> <td>6</td> <td>5</td> <td>5</td> <td>1</td> </tr>
				<tr> <td> Address</td><td colspan="8">Auckland, New Zealand</td></tr>
				<tr><td>Hobbies</td><td colspan="8">Reading, writing, listening to music</td></tr>-->
				
				</table>
                <a href="https://www.linkedin.com/in/NatashaRandhawa" target="_blank">
                    <div class="Myquote">
                        "I believe in Innovation & Giving your best."<br /><br />
                        (Software Developer, Web Designer, Product Analyst, UI/UX Developer)
                    </div>
                </a>
			
			</div>
</asp:Content>
