<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/HomeMaster.Master" AutoEventWireup="true" CodeBehind="AdmitCard.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.OISF.AdmitCard" %>

<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
	<script src="/Scripts/jquery.msgBox.js"></script>
	<link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
	<script src="/Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
	<script src="/Scripts/fileupload/jquery.iframe-transport.js"></script>
	<link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
	<script src="/PortalScripts/ServiceLanguage.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
	<script src="/WebApp/Scripts/ValidationScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
	<style>
		.ui-widget-header {
			color: #333 !important;
			font-weight: normal !important;
		}

		.form-heading {
			color: #820000;
			text-align: left;
			border-left: 15px solid #ce6d07;
			border-right: 2px solid #ce6d07;
			border-top: 1px solid #d8d8d8;
			border-bottom: 1px solid #d8d8d8;
			background: rgba(0, 0, 0, .075);
			padding: 10px 20px 10px 15px;
			border-top-right-radius: 2px;
			border-top-left-radius: 2px;
			text-transform: uppercase;
			font-weight: bold;
			font-size: x-large;
		}

		.divError {
			font-family: Arial;
			font-size: 20px;
			text-align: center;
			margin: 10px auto;
		}

			.divError img {
				float: left;
				width: 50px;
				margin: 0 20px 0 10px;
			}

			.divError div {
				float: left;
				color: red;
				font-size: .8em;
			}

			.divError h1 {
				float: left;
				margin: 0;
				padding: 0;
				font-size: .9em;
				color: maroon;
			}

		.info, .success, .warning, .error, .validation {
			/*border: 1px solid;*/
			margin: 10px 0px;
			padding: 15px 10px 15px 15px;
			background-repeat: no-repeat;
			background-position: 10px left;
			text-align: left;
			font: 13px Tahoma,sans-serif;
		}

		.success {
			color: #4F8A10;
			background-color: #DFF2BF;
		}

		.error {
			color: #D8000C;
			background-color: #FFBABA;
		}
	</style>
	<script type="text/javascript">

		$(document).ready(function () {

			$('#txtBirthDate').datepicker({
				dateFormat: "dd/mm/yy",
				changeMonth: true,
				changeYear: true,
				yearRange: "-150:+0",
				maxDate: '0',

			});

		});

		function ValidateForm() {
			debugger;
			var text = "";
			var opt = "";
			var RollNo = $('#txtRollNO');
			var MobileNo = $('#txtMobile');
			var AppID = $('#txtAppID');
			var DOB = $('#txtBirthDate');
			var LoginID = $('#txtLogin');

			if (MobileNo.val() == '' || DOB.val() == "") {
				text += "<br /> -Please enter Date of Birth, Registered 10 digit mobile number of Applicant.";
				MobileNo.attr('style', 'border:1px solid #d03100 !important;');
				MobileNo.css({ "background-color": "#fff2ee" });
				//RollNo.attr('style', 'border:1px solid #d03100 !important;');
				//RollNo.css({ "background-color": "#fff2ee" });
				DOB.attr('style', 'border:1px solid #d03100 !important;');
				DOB.css({ "background-color": "#fff2ee" });
				opt = 1;
			} else {
				MobileNo.attr('style', 'border:1px solid #cdcdcd !important;');
				MobileNo.css({ "background-color": "#ffffff" });
				DOB.attr('style', 'border:1px solid #cdcdcd !important;');
				DOB.css({ "background-color": "#ffffff" });
				//RollNo.attr('style', 'border:1px solid #cdcdcd !important;');
				//RollNo.css({ "background-color": "#ffffff" });
			}

			if (RollNo.val() == '' && AppID.val() == "" && RollNo.val() == "" && LoginID.val() == "") {
				text += "<br /> -Please enter either one of the Roll Number or Reference ID OR Login ID";
				opt = 1;
			}

			if (MobileNo.val() != '') {
				var mobmatch1 = /^[789]\d{9}$/;
				if (!mobmatch1.test(MobileNo.val())) {
					text += "<br /> -Please enter valid 10 digit mobile Number.";
					MobileNo.attr('style', 'border:1px solid #d03100 !important;');
					MobileNo.css({ "background-color": "#fff2ee" });
					opt = 1;
				} else {
					MobileNo.attr('style', 'border:1px solid #cdcdcd !important;');
					MobileNo.css({ "background-color": "#ffffff" });
				}
			}
			if (RollNo.val() != '') {
				if (RollNo.val().length != 7) {
					text += "<br /> -Please enter valid Roll No.";
					RollNo.attr('style', 'border:1px solid #d03100 !important;');
					RollNo.css({ "background-color": "#fff2ee" });
					opt = 1;
				} else {
					RollNo.attr('style', 'border:1px solid #cdcdcd !important;');
					RollNo.css({ "background-color": "#ffffff" });
				}
			}
			if (AppID.val() != '') {
			   
				if (AppID.val().length != 12) {
					text += "<br /> -Please enter valid 12 digit Reference ID.";
					AppID.attr('style', 'border:1px solid #d03100 !important;');
					AppID.css({ "background-color": "#fff2ee" });
					opt = 1;
				} else {
					AppID.attr('style', 'border:1px solid #cdcdcd !important;');
					AppID.css({ "background-color": "#ffffff" });
				}
			}

			if (opt == "1") {
				alertPopup("Please fill following information.", text);

				return false;
			}

			return true;
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<%--	<div class="container" >
			
		<table width="758" border="0" align="center" cellpadding="2" cellspacing="2" class="inner-tb">
			 <tr>
				  <td align="center" class="redtext1">
					<h2><font color='red'>Written Examination for Recruitment of Constables in 9th SIRB is postponed till further notice.</font></h2>
										<a href="/g2c/forms/index.aspx">Continue to Home Page</a>
										</td>
			  </tr>
		</table>
		   
	  </div>--%>
	
	<div id="intrnlContent" ng-app="appmodule">
		<div ng-controller="ctrl">
			<div id="page-wrapper" style="min-height: 311px;width:80%;margin:0 auto;">
				<div class="row">
					<div class="col-lg-12">
					</div>
				</div>
				<%--<uc1:FormTitle runat="server" ID="FormTitle" />--%>
				<div class="clearfix">
					<%--<uc1:FormTitle runat="server" ID="FormTitle" />--%>
					<h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>
						Download Admit Card for Written Exam. Recruitment of Constables in 9TH SIRB
					</h2>
				</div>
				<div class="row" id="divCitizenProfile">
					<div id="" class="col-md-12">
						<div runat="server" class="success" id="div1" style="line-height: 11px;display:none;">
							 <b style="text-transform: uppercase;">Announcment of Written Examination Date-</b><b>Sunday 26th March 2017 </b>&nbsp;<br />
							<br /><b>1. KOEL Campus, Campus-1, KIIT University, Bhubaneswar </b>&nbsp;for Roll No. between <b>SC00010</b> to <b>SC01270<br />
							</b>
							<br />
							<b>2. KIIT, Polytechnic, KOLAB Campus, Campus-2, KIIT University, Bhubaneswar </b>&nbsp;for Roll No. between <b>SC01271</b> to <b>SC03504<br />
							</b>
							<br />
							<b>3. KATHAJORI Campus, Campus-3, KIIT University, Bhubaneswar </b>&nbsp;for Roll No. between <b>SC03506</b> to <b>SC11303<br />
							</b>
							<br />
							<b>4. School Of Management(KSOM), Krishna Campus, Campus-7, KIIT University, Bhubaneswar </b>&nbsp;for Roll No. between <b>SC11304</b> to <b>SC13962<br />
							</b>
							<br />
							<b>5. School of Rural Management,(KSRM), Krishna Campus, Campus-7, KIIT University, Bhubaneswar </b>&nbsp;for Roll No. between <b>SC13964</b> to <b>SC17069<br />
							</b>
							<br />
							<b>6. School Of Mechanical Engineering, Campus-8, KIIT University, Bhubaneswar </b>&nbsp;for Roll No. between <b>SC17074</b> to <b>SE03724<br />
							</b>
							<br />
							<b>7. School of Biotechnology, Campus-11, KIIT University, Bhubaneswar </b>&nbsp;for Roll No. between <b>SE03727</b> to <b>SE05944<br />
							</b>
							<br />
							<b>8. School Of Electronics, Engineering, Campus-12, KIIT University, Bhubaneswar </b>&nbsp;for Roll No. between <b>SE05954</b> to <b>SE13551<br />
							</b>
							<br />
							<b>9. KIIT ITI, Campus-14, KIIT University, Bhubaneswar </b>&nbsp;for Roll No. between <b>SE13553</b> to <b>SE16033<br />
							</b>
							<br />
							<b>10. School of Computer Engineering, Campus-15, KIIT University, Bhubaneswar </b>&nbsp;for Roll No. between <b>SE16034</b> to <b>SE22405<br />
							</b>
							<br />
							<b>11. School of Law, Campus-16, KIIT University, Bhubaneswar </b>&nbsp;for Roll No. between <b>SE22418</b> to <b>ST01364<br />
							</b>
							<br />
							<b>12. Kalinga Institute of Medical Sciences(KIMS), Campus-5, KIIT University, Bhubaneswar </b>&nbsp;for Roll No. between <b>ST01365</b> to <b>ST03675<br />
							</b>
							<br />
							<b>13. Kalinga Institute of Dental Sciences(KIDS), Campus-5, KIIT University, Bhubaneswar </b>&nbsp;for Roll No. between <b>ST03677</b> to <b>ST05455<br />
							</b>
							<br />
							<b>14. Kalinga Institute of Nursing Sciences(KINS), Campus-5, KIIT University, Bhubaneswar </b>&nbsp;for Roll No. between <b>ST05457</b> to <b>ST06505<br />
							</b>
							<br />
							<b>15. KIIT International School, Campus-9, KIIT University, Bhubaneswar </b>&nbsp;for Roll No. between <b>ST06510</b> to <b>ST08490<br />
							</b>
							<br />
							<b>16. School Of Mechanical Engineering, Campus-8, KIIT University, Bhubaneswar </b>&nbsp;for Roll No. between <b>ST08728</b> to <b>ST08728<br />
							</b>
							<br />
							<b>17. Kalinga Institute of Social Sciences(KISS), Campus-10,(KISS-1), KIIT University, Bhubaneswar </b>&nbsp;for Roll No. between <b>ST08496</b> to <b>ST18710<br />
							</b>
							<br />
							<b>18. Kalinga Institute of Social Sciences(KISS), Campus-10,(KISS-3), KIIT University, Bhubaneswar </b>&nbsp;for Roll No. between <b>UR3252    </b> to <b>UR07512<br />
							</b>
							<br />
							<%--<b style="color:#c0392b;">Candidates having problem for downloading e-Pass and not received SMS related to Roll No. for Physical Measurement & Efficiency Test. <br />
Please contact below numbers for Assistance<br />
Call Centre at 06746580111/6580222/6580333, Shri.Naba Das (+91 8895856633), Shri.Narayana Dora (+91 9437905270).</b>--%>
						</div>
						<div runat="server" class="danger error bg-warning" id="divErr">
							Please enter Date of Birth, Mobile Number (Mandatory) and any one of Roll Number or Reference ID or Login ID fields to download Admit Card for written Examination. ion.
						</div>
						<div class="row">
							<div class="col-md-12 box-container">
								<div class="box-heading">
									<h4 class="box-title">Applicant Details 
									</h4>
								</div>

								<div class="box-body box-body-open">
									<div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
										<div class="form-group">
											<label class="manadatory" for="DOB">
												Date of Birth</label>
											
											<asp:TextBox runat="server" ID="txtBirthDate" CssClass="form-control" placeholder="DD/MM/YYYY" name="txtBirthDate" value="" maxlength="10"></asp:TextBox>
										</div>
									</div>
									<div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
										<div class="form-group">
											<label class="manadatory" for="txtMobile">
												Mobile Number</label>
											<asp:TextBox runat="server" id="txtMobile" class="form-control" placeholder="Registered mobile no" name="txtMobile" value="" maxlength="10" onkeypress="return isNumberKey(event);"></asp:TextBox>

										</div>
									</div>
									<div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
										<div class="form-group">
											<label class="" for="txtRollNO">
												Roll Number</label>                                            
											<asp:TextBox runat="server" ID="txtRollNO" CssClass="form-control" placeholder="Enter Roll No" name="txtBirthDate" value="" maxlength="7"></asp:TextBox>
										</div>
									</div>                                    
									<div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
										<div class="form-group">
											<label class="" for="txtAppID">
												Reference ID</label>
											<asp:TextBox runat="server" id="txtAppID" class="form-control" placeholder="Reference ID" name="txtAppID" maxlength="12" onkeypress="return isNumberKey(event);"
												type="text" value="" ></asp:TextBox>
										</div>
									</div>                                   
									
									<div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
										<div class="form-group">
											<label class="" for="txtLogin">
												Login ID</label>
											<asp:TextBox runat="server" id="txtLogin" class="form-control" placeholder="Enter Login ID" name="txtLogin" value=""  onkeypress="return AlphaNumeric(event);"></asp:TextBox>

										</div>
									</div>
									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-2">
							<div style="    margin-top: -12px;">
								<label>    
								<img src="/Account/GetCaptcha" alt="verification code" class=".gov.inform-control" />
							</label>
								<asp:TextBox runat="server" ID="captcha" MaxLength="6" CssClass="form-control" placeholder="Enter Captcha" />
							</div>
						</div>
									
									<div class="form-group col-lg-2 text-right">
										<label class="" for="">
											&nbsp;
										</label>
										<asp:Button ID="btnSubmit" runat="server" CausesValidation="False" CssClass="btn btn-primary" OnClientClick="isJavaScriptEnabled:return ValidateForm();"
											Text="Submit"  OnClick="btnSubmit_Click" />
										<input id="btnHome" type="button" class="btn btn-danger"
											value="Close" onclick="window.close();" />

									</div>
									<div class="clearfix"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</asp:Content>
