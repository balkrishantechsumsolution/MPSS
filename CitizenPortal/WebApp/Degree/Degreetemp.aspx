<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Degreetemp.aspx.cs" Inherits="CitizenPortal.WebApp.Degree.Degreetemp" %>

<%@ Register Src="~/WebApp/Control/Infomation.ascx" TagPrefix="uc1" TagName="Infomation" %>
<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
	<link href="../../../Content/bootstrap.min.css" rel="stylesheet" />
	<script src="/WebApp/Scripts/CommonScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
</head>
<body>
	<form id="form1" runat="server">
		<div>
			<div class="box-body box-body-open">
				<asp:Panel ID="divPrint" runat="server" Style="margin: 0 auto; width: 800px; /*height: 1220px; overflow: auto; */">
					<div style="margin: 0 auto; height: 1128px; width: 794px; border: 1px solid #000; padding: 1px; font-family: Arial">
						<div style="margin: 3px auto;">
							<table style="width: 100%;" cellpadding="5" cellspacing="0">
								<tr>
									<td style="vertical-align: top; height: 924px;">
										<div style="margin: 15px auto; width: 708px; font-size: 13px;">
											<table style="width: 100%; height: 20px">
												<tr>
													<td style="text-align: left; white-space: nowrap; width: 250px">
														<div style="margin: 0px  0 0 110px;">
															<asp:Label ID="lblEnrollment" runat="server">AS0645</asp:Label>
														</div>
													</td>
													<td>&nbsp;</td>
													<td style="text-align: right; width: 270px">
														<div style="margin: 0px 0 0 120px;">
															<asp:Label ID="lblRollNo" runat="server">123456789012</asp:Label>
														</div>
													</td>
												</tr>
											</table>
											<table style="width: 100%; height: 170px; margin-top: 10px">
												<tr>
													<td style="text-align: center; font-size: 30px; font-weight: bold; color: #000435;">CHHATTISGARH SWAMI VIVEKANAD TECHNICAL UNIVERSITY </td>
												</tr>
												<tr>
													<td></td>
												</tr>
												<tr>
													<td style="text-align: center; font-size: 25px; font-weight: bold; color: #000000;">Bhilai, Chhattisgarh</td>
												</tr>
												<tr>
													<td style="text-align: center"></td>
												</tr>
												<tr>
													<td style="text-align: center;">
														<img alt="Logo" src="/Sambalpur/img/sambalpur-university-logo.png" style="width: 120px;" />
													</td>
												</tr>
											</table>
											<table style="width: 100%; height: 665px">
												<tr>
													<td style="text-align: center">
														<asp:Label ID="lblCertificateHindi" runat="server" Font-Bold="true" Font-Names="Arial Unicode MS" Font-Size="30px" Text="इंजीनिरिंग में पत्रोपाधि"></asp:Label>
													</td>
												</tr>
												<tr>
													<td style="">
														<table style="height: 300px; width: 100%; text-align: justify; font-family: 'Monotype Corsiva'; font-size: 25px;">
															<tr>
																<td style="width: 100%; text-align: center; font-family: 'Arial Unicode MS'; font-size: 25px;">&nbsp;प्रमाणित किया जात जाता है की
																
																	<br />
																	<asp:Label ID="lblNameH" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
																	&nbsp;<br />
																	ने
																
																	<asp:Label ID="lblSessionH" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
																	&nbsp;मैं इस विश्वविद्यालय की<br />
																	<asp:Label ID="lblBranchH1" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
																	&nbsp;<br />
																	में पत्रोपाधि की परीक्षा
																
																	<asp:Label ID="lblDivisionH" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
																	&nbsp;श्रेणी में उत्तीर्ण की|
																
																	<br />
																	उन्हे
																
																	<asp:Label ID="lblBranchH2" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
																	&nbsp;में पत्रोपाधि की उपाधि प्रदान की जाती है| </td>
															</tr>
															<tr>
																<td style="width: 100%; text-align: center;">&nbsp;</td>
															</tr>
															<tr>
																<td style="width: 100%; text-align: center;">
																	<asp:Label ID="lblCertificate" runat="server" Font-Bold="true" Font-Names="Arial" Font-Size="22px" Text="DIPLOMA IN ENGINEERING"></asp:Label>
																</td>
															</tr>
															<tr>
																<td style="width: 100%; text-align: center; font-family: 'Monotype Corsiva'; font-size: 25px;">This is to certify that
																
																	<br />
																	<asp:Label ID="lblName" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
																	&nbsp;<br />
																	having passed the examination for&nbsp;
																
																	<br />
																	<asp:Label ID="lblBranch" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
																	&nbsp;<br />
																	of this University in the &nbsp;
																
																	<asp:Label ID="lblSession" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
																	&nbsp;<br />
																	in the&nbsp;
																
																	<asp:Label ID="lblDivision" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
																	&nbsp;Division,
																
																	<br />
																	is awarded the&nbsp;
																
																	<br />
																	<asp:Label ID="lblBranchE" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
																	. </td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
											<br />
											<br />
											<table style="width: 100%">
												<tr>
													<td style="width: 33%">
														<table>
															<tr>
																<td>
																	<asp:Label ID="Label5" runat="server" Style="font-family: 'Arial Unicode MS'; font-weight: bold;" Text="भिलाई, छत्तीसगढ़ (भारत)"></asp:Label>
																</td>
															</tr>
															<tr>
																<td>
																	<asp:Label ID="Label17" runat="server" Text="Bhilai, Chhattisgarh (India)"></asp:Label>
																</td>
															</tr>
															<tr>
																<td>
																	<asp:Label ID="Label6" runat="server" Text="Date :"></asp:Label>
																	<asp:Label ID="lblAppDate" runat="server">02-08-2022</asp:Label>
																</td>
															</tr>
														</table>
													</td>
													<td style="width: 34%; text-align: right"><%--<uc1:QRCode ID="QRCode1" runat="server" />--%>
														<img src="../../PortalImages/QRCOde.png" style="width: 100px;" />
													</td>
													<td style="width: 33%;">
														<table style="width: 140px; float: right;">
															<tr>
																<td style="text-align: center">
																	<asp:Label ID="Label3" runat="server" Style="font-family: 'Arial Unicode MS'; font-weight: bold;" Text="कुलपति"></asp:Label>
																</td>
															</tr>
															<tr>
																<td style="text-align: center">
																	<asp:Label ID="Label16" runat="server" Style="font-weight: bold;" Text="Vice-Chancellor"></asp:Label>
																</td>
															</tr>
															<tr>
																<td style="text-align: center">
																	<asp:Label ID="Label4" runat="server" Text="Dr. M. K. VERMA"></asp:Label>
																</td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
										</div>
									</td>
								</tr>
							</table>
							<%----------End Document Section ---------%>
						</div>
					</div>
				</asp:Panel>
			</div>
			<div style="text-align: center; margin-bottom: 10px;">
				<input type="button" id="btnSubmit" class="btn btn-info" style="background-color: #0040FF !important;" value="Print" onclick="javascript: CallPrint('divPrint');" />
				<input type="submit" name="ctl00$ContentPlaceHolder1$btnCancel" value="Confirm" id="btnCancel" class="btn btn-success" style="display: none" />
			</div>
		</div>
	</form>
</body>
</html>
