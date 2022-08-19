<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="initial_page.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.OISF.initial_page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<style>
		.w3-note {
			background: #99FFE5; /* For browsers that do not support gradients */
			background: -webkit-linear-gradient(#99FFE5, #4DA6FF); /* For Safari 5.1 to 6.0 */
			background: -o-linear-gradient(#99FFE5, #4DA6FF); /* For Opera 11.1 to 12.0 */
			background: -moz-linear-gradient(#99FFE5, #4DA6FF); /* For Firefox 3.6 to 15 */
			background: linear-gradient(#99FFE5, #4DA6FF); /* Standard syntax */
			border-left: 6px solid #ffeb3b;
			text-align: center;
			box-shadow: 0 15px 10px -10px rgba(31, 31, 31, 0.5);
		}

		.w3-panel {
			text-align: center;
			height: 100px;
			padding: 0.01em 16px;
			margin-top: 16px !important;
			margin-bottom: 16px !important;
		}

			.w3-panel p {
				font-size: 30px !important;
				font-weight: bold;
				color: #002CB2 !important;
				padding: 25px 0 0 0;
			}

			.w3-panel span {
				font-size: 18px !important;
				font-weight: bold;
				color: #002751 !important;
			}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div class="container" >
			
		<table width="758" border="0" align="center" cellpadding="2" cellspacing="2" class="inner-tb">
			 <tr>
				  <td align="center" class="redtext1">
					<h2><font color='red'>Last Date for the Application is Over</font></h2>
										<a href="/g2c/forms/index.aspx">Continue to Home Page</a>
										</td>
			  </tr>
		</table>
		   
	  </div>
	<div id="page-wrapper" style="min-height: 311px;">
		<div class="row">
			<div class="w95">
				<div class="col-lg-6 mtop10">
					<%--onclick="javascript: return alert('Filling of Form, shall be enable on 5th December 2016 at 5:00 PM');"--%>
				   <a href="/Account/Login"> 
					   <div class="w3-panel w3-note">
						<p >
							<%--<script src="~/Scripts/cscconnect.js"></script>
							<script src="../../../Scripts/cscconnect.js"></script>--%>
							For CSC Center<br />
							<span>Click here>></span>
						
						</p>
					</div>
					</a>
						<%--
						onclick="javascript: return alert('Filling of Form, shall be enable on 5th December 2016 at 5:00 PM');"--%>
				</div>
				<div class="col-lg-6 mtop10">
					<a href="/WebApp/Citizen/Forms/Geustuser.aspx?SvcID=388&Mode=C" >
						<div class="w3-panel w3-note">
							<p>
								Apply as a Citizen<br />
								<span>Click here>></span>
							</p>
						</div>
					</a>
				</div>
				<div class="col-lg-12" style="text-align:left; margin-top:20px;">
					<h2 style="color:#ce6d07;font-size:30px;font-weight:bold;text-shadow:0px 1px 3px #727272;">Application for Recruitment of Constables in 9th SIRB</h2>
					<p style="color:#337ab7;font-size:12px;"><i class="fa fa-hand-o-up"> </i> <a style="font-size:15px;" href="pdf/detailed_advertisement_in_english_version.pdf" target="_blank">Detailed Advertisement for recruitment of Constables in 9th India Reserve Battalion (Specialised).</a> <img src="img/blink_icon.gif" /></p>
																														 
					<p style="color:#337ab7;font-size:12px;"><i class="fa fa-hand-o-up"> </i> <a style="font-size:15px;" href="pdf/detailed_advertisement_in_odia_version.pdf" target="_blank">Detailed Advertisement for recruitment of Constables in 9th India Reserve Battalion (Specialised) in Odia Version.</a><img src="img/blink_icon.gif" /></p>
																														 
					<p style="color:#337ab7;font-size:12px;"><i class="fa fa-hand-o-up"> </i> <a style="font-size:15px;" href="pdf/odisha_groupC_and_groupD_posts_contractual_appointment_ru.pdf" target="_blank">Contractual appointment Rules 2013 (For Group-C & Group-D) Posts.</a><img src="img/blink_icon.gif" /></p>
																														 
					<p style="color:#337ab7;font-size:12px;"><i class="fa fa-hand-o-up"> </i> <a style="font-size:15px;" href="pdf/recruitment_rules_of_sepoys_constables_in_battalions.pdf" target="_blank">Method of Recruitment & Conditions of Service of Sepoys/Constables in Battalion Rules,2011. </a><img src="img/blink_icon.gif" /></p>
																														
					<p style="color:#337ab7;font-size:12px;"><i class="fa fa-hand-o-up"> </i> <a style="font-size:15px;" href="pdf/notice_for_recruitment_of_constables_in_9th_IRBn_specialised.pdf" target="_blank">Notice for Recruitment of Constables in 9th India Reserve Bn (Spl.)</a> <img src="img/blink_icon.gif" /></p>
																														
					<p style="color:#337ab7;font-size:12px;"><i class="fa fa-hand-o-up"> </i> <a style="font-size:15px;" href="pdf/battalion_office_of_the_supdt_of_police.pdf" target="_blank">Battalion Office of the superintendent of Police where Offline / Manual Forms will be distributed</a>  <img src="img/blink_icon.gif" /></p>
				</div>
				<%--<div class="col-lg-12 csccntr">
					<p style="color:#0000FF;">Detailed Advertisement for recruitment of Constables in 9th India Reserve Battalion (Specialised) <img src="img/blink_icon.gif" /></p>

					<p style="padding-left:5px; background-color:#4DA6FF; color:#fff; padding-top:5px;">The Applicants, who are unable to apply online due to such problem, may approach the Help Desk of

State Selection Board and also to the District Coordinator of CMGI in the Help Desk at the following

17 Battalion Hdqrs and the office of the Sudpt. Of Police, Kalahandi to assist them in applying online.<br />

Name of the Battalion / Office of the Supdt. Of Police.</p>
					<div class="col-md-6" style="border-right:1px solid #ddd;">
						<ul>
							<li><b>1)</b> OSAP 1<sup>st</sup> Battalion, Dhenkanal</li>

							<li><b>2)</b> OSAP 2<sup>nd</sup> Battalion, Jharsuguda</li>

							<li><b>3)</b> OSAP 3<sup>rd</sup> Battalion, Koraput</li>

							<li><b>4)</b> OSAP 4<sup>th</sup> Battalion, Rourkela</li>

							<li><b>5)</b> OSAP 5<sup>th</sup> Battalion, Baripada</li>

							<li><b>6)</b> OSAP 6<sup>th</sup> Battalion, Cuttack</li>

							<li><b>7)</b> OSAP 8<sup>th</sup> Battalion, Chatrapur, Ganjam</li>

							<li><b>8)</b> OSAP 1<sup>st</sup> (Special Security) Battalion, Sambalpur</li>

							<li><b>9)</b> OSAP 2<sup>nd</sup> (Special Security) Battalion, Keonjhar</li>

							
						</ul>
					</div>
					
					<div class="col-md-6" style="padding-left:50px; padding-bottom:20px;">
						<ul>
							<li><b>10)</b> OSAP 3<sup>rd</sup> (Special Security) Battalion, Gajapati</li>
							<li><b>11)</b> OSAP 4<sup>th</sup> (Special Security) Battalion, Malkangiri</li>

							<li><b>12)</b> 2<sup>nd</sup> India Reserve Battalion, Bhamini, Rayagada</li>

							<li><b>13)</b> 3<sup>rd</sup> India Reserve Battalion, Kalinga Nagar, Jajpur</li>

							<li><b>14)</b> 4<sup>th</sup> India Reserve Battalion, Bamparda, Deogarh</li>

							<li><b>15)</b> 5<sup>th</sup> India Reserve Battalion, Boudh</li>
							<li><b>16)</b> 6<sup>th</sup> India Reserve Battalion, Khordha</li>

							<li><b>17)</b> 8<sup>th</sup> India Reserve Battalion (Specialised), Kandhamal</li>

							<li><b>18)</b> Office of the Supdt. Of Police, Kalahandi, Bhawanipatna</li>
						</ul>
					</div>
				   
				</div>--%>
			   
			</div>
			
		</div>
	</div>
</asp:Content>
