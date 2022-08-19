<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VerifyUID.aspx.cs" Inherits="CitizenPortal.UIDValidation.VerifyUID" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>UID Verification</title>
	<meta http-equiv="X-UA-Compatible" content="IE=10" />
	<meta content="text/html;charset=utf-8" http-equiv="Content-Type">
	<meta content="utf-8" http-equiv="encoding">
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script type="text/vbscript" language="vbscript">
		Function vGetFeatureUIDAIData (sFingerID, txtTid,txtPid,txtencSesKey,txtHmac,txtCertExp,txtLSSesKey,txtTimeStamp)
	
		Dim Obj

		Set Obj = CreateObject ("BIOM_API.Legend")

		If (Obj Is Nothing) Then

			MsgBox "Unable To Create Instance For BIOM API, Check Dll Is Registered Properly", vbExclamation, "BIOM API"
		
		Else
			'MsgBox "Activex", vbExclamation, "BIOM API"
			Obj.EnableLog = 1
			'Obj.LocalFilePath = @"F:\iGATE\SVN\UID_AuaAsa_KuaKsa_DotNetClient\Mahaonline UIDAI Sample App";
			
			Obj.UIDAIXMLVersion = "1.0"

			Obj.GetFeatureUIDAIData cLng(sFingerID)
			
			txtTid.Value = Obj.TerminalID
			txtPid.Value = Obj.DataXML
			txtencSesKey.Value = Obj.UIDAIEncSessionKey
			txtHmac.Value = Obj.HmacXML
			txtCertExp.Value = Obj.UIDAICertExpiryDate
			txtLSSesKey.Value = Obj.LSEncSessionKey
			txtTimeStamp.Value = Obj.TimeStamp
			'MsgBox Obj.SerialNumber, vbInformation, "BIOM API"
			'MsgBox Obj.TimeStamp, vbInformation, "BIOM API"
			If txtPid.Value <> "" Then
				MsgBox "Fingerprint Captured Successfully", vbInformation, "BIOM API"
			Else
				MsgBox "Fingerprint Not Captured", vbExclamation, "BIOM API"
			End If

		End If
	End Function
	</script>
	<script type="text/javascript" language="javascript">
		$(document).ready(function ($) {
			if (document.getElementById("hftxtPid").value == "") {
				//GetFeatureAccrual('1', '2')
				GetFeatureUIDAIData('2');
			}
		});
		function GetFeatureUIDAIData(iFingerID) {
			if (navigator.appName == "Microsoft Internet Explorer") {
				vbscript: vGetFeatureUIDAIData(iFingerID, txtTid, txtPid, txtencSesKey, txtHmac, txtCertExp, txtLSSesKey, txtTimeStamp);
				//debugger;
				document.getElementById("hftxtTid").value = txtTid.defaultValue.toString();
				document.getElementById("hftxtPid").value = txtPid.defaultValue.toString();
				document.getElementById("hftxtencSesKey").value = txtencSesKey.defaultValue.toString();
				document.getElementById("hftxtHmac").value = txtHmac.defaultValue.toString();
				document.getElementById("hftxtCertExp").value = txtCertExp.defaultValue.toString();
				document.getElementById("hftxtLSSesKey").value = txtLSSesKey.defaultValue.toString();
				document.getElementById("hfTimeStamp").value = txtTimeStamp.defaultValue.toString();
				if (txtPid.defaultValue.toString() != "") {
					var UIDVal = getUrlVars()["UID"];
					//alert(UIDVal);
					document.getElementById("hdnfUIDValue").value = UIDVal;
					$('#GetData').click();
				}
				else {
					window.close();
				}

				//                if (txtTid.defaultValue.toString() != "") {
				//                    $('#GetData').click();
				//                }

			}
			else {
				//debugger;

				document.getElementsByName("TerminalID")[0].value = "";
				document.getElementsByName("DataXml")[0].value = "";
				document.getElementsByName("UidaiSessionKey")[0].value = "";
				document.getElementsByName("LSSessionKey")[0].value = "";
				document.getElementsByName("UidaiCertExpiryDate")[0].value = "";
				document.getElementsByName("HmacXml")[0].value = "";
				var lsTerminalID = null;
				var lsDataXml = null;
				var lsUidaiSessionKey = null;
				var lsLSSessionKey = null;
				var lsUidaiCertExpiryDate = null;
				var lsHmacXml = null;
				//                var Obj

				//                Obj = CreateObject("BIOM_API.Legend")
				Obj.UIDAIXMLVersion("1.0");
				Obj.GetFeatureUIDAIData(iFingerID);

				lsTerminalID = Obj.TerminalID();
				lsDataXml = Obj.DataXML();
				lsUidaiSessionKey = Obj.UIDAIEncSessionKey();
				lsLSSessionKey = Obj.LSEncSessionKey();
				lsUidaiCertExpiryDate = Obj.UIDAICertExpiryDate();
				lsHmacXml = Obj.HmacXML();
				alert(Obj.SerialNumber());
				alert(Obj.TimeStamp());

				if (lsDataXml != null && lsDataXml != null && lsUidaiSessionKey != null && lsUidaiCertExpiryDate != null && lsHmacXml != null) {
					document.getElementsByName("TerminalID")[0].value = lsTerminalID;
					document.getElementsByName("DataXml")[0].value = lsDataXml;
					document.getElementsByName("UidaiSessionKey")[0].value = lsUidaiSessionKey;
					document.getElementsByName("LSSessionKey")[0].value = lsLSSessionKey;
					document.getElementsByName("UidaiCertExpiryDate")[0].value = lsUidaiCertExpiryDate;
					document.getElementsByName("HmacXml")[0].value = lsHmacXml;
				}
				else {
					alert("Fingerprint not captured");
					window.close();
				}
			}
		}
		function getUrlVars() {
			var vars = [], hash;
			var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
			for (var i = 0; i < hashes.length; i++) {
				hash = hashes[i].split('=');
				vars.push(hash[0]);
				vars[hash[0]] = hash[1];
			}
			return vars;
		}
	</script>
	<style type="text/css">
		table, th, td {
			/* border: 1px solid #E0E0E0;*/
			font-size: 12px;
			vertical-align: top;
		}
	</style>
</head>
<body>

	<div>
		<%--<script language="javascript" type="text/javascript" src="LegendScript.js"> </script>--%>
		<input type="hidden" id="txtTid" name="TerminalID" runat="server" />
		<input type="hidden" id="txtPid" name="DataXml" runat="server" />
		<input type="hidden" id="txtencSesKey" name="UidaiSessionKey" runat="server" />
		<input type="hidden" id="txtHmac" name="HmacXml" runat="server" />
		<input type="hidden" id="txtCertExp" name="UidaiCertExpiryDate" runat="server" />
		<input type="hidden" id="txtLSSesKey" name="LSSessionKey" />
		<input type="hidden" id="txtTimeStamp" name="txtTimeStamp" />
		<form id="Form1" runat="server">
			<asp:HiddenField ID="finalVal" runat="server" />
			<input type="button" id="btnUIDAI" value="Get Details" style="width: 150; display: none;"
				onclick="GetFeatureUIDAIData('2')" />
			<asp:HiddenField ID="hftxtTid" runat="server" />
			<asp:HiddenField ID="hftxtPid" runat="server" />
			<asp:HiddenField ID="hftxtencSesKey" runat="server" />
			<asp:HiddenField ID="hftxtHmac" runat="server" />
			<asp:HiddenField ID="hftxtCertExp" runat="server" />
			<asp:HiddenField ID="hftxtLSSesKey" runat="server" />
			<asp:HiddenField ID="hdnfUIDValue" runat="server" />
			<asp:HiddenField ID="hfTimeStamp" runat="server" />
			<asp:Button ID="GetData" runat="server" OnClick="GetData_OnClick" Text="Get Data"
				Style="display: none;" />
			<asp:Label ID="Label1" runat="server" Style="color: Red" Text="" />
			<asp:Literal ID="Literal1" runat="server" />
			<asp:Literal ID="ltrData" runat="server" />
			<br />
			<asp:Label ID="lblError" runat="server" Style="color: Red" Text="" />
			<asp:Label ID="lblPleaseWait" runat="server" Text="Please Wait Loading Data.." Style="font-size: large; font-style: italic; color: #666666" />
			<asp:Panel ID="pnlDetails" runat="server" Visible="false">
				<fieldset>
					<legend>Citizen Details:</legend>
					<table style="margin-top: 1%;" runat="server" id="tbl1" visible="false">
						<tr>
							<td rowspan="4">
								<asp:Image ID="img1" runat="server" Visible="false" />
							</td>
						</tr>
						<tr>
							<td style="width: 100px;">
								<b>CitizenName </b>
							</td>
							<td>:
							</td>
							<td style="width: 200px;">
								<asp:Label ID="lblCitizenName" runat="server" />
							</td>
							<td style="width: 100px;">
								<b>Birth Date</b>
							</td>
							<td>:
							</td>
							<td style="width: 200px;">
								<asp:Label ID="lblDOB" runat="server" />
							</td>
						</tr>
						<tr>
							<td>
								<b>Gender</b>
							</td>
							<td>:
							</td>
							<td>
								<asp:Label ID="lblGender" runat="server" />
							</td>
							<td>
								<b>Contacts</b>
							</td>
							<td>:
							</td>
							<td>
								<asp:Label ID="lblContacts" runat="server" />
							</td>
						</tr>
						<tr>
							<td>
								<b>Address 1</b>
							</td>
							<td>:
							</td>
							<td>
								<asp:Label ID="lblAddress1" runat="server" />
							</td>
							<td>
								<b>Address 2</b>
							</td>
							<td>:
							</td>
							<td>
								<asp:Label ID="lblAddress2" runat="server" />
							</td>
						</tr>
						<tr>
							<td colspan="7" align="center">
								<asp:Button ID="btnVerify" runat="server" Text="Proceed" Visible="false" OnClientClick="SetName();" />
								<asp:Button ID="btnClose" runat="server" Text="Close" Visible="false" OnClientClick="closePage();" />

							</td>
						</tr>
					</table>
				</fieldset>
			</asp:Panel>
		</form>
		<script type="text/javascript">
			function SetName() {
				if (window.opener != null && !window.opener.closed) {
					//                var txtUID = window.opener.document.getElementById("CPH_txtUIDNew");
					//                var txtEID = window.opener.document.getElementById("CPH_txtEIDNew");
					if (window.opener.document.getElementById("CPH_txtUIDNew") == null || window.opener.document.getElementById("CPH_txtUIDNew") == "")
						txtUID = window.opener.document.getElementById("CPH_Paas1_txtUIDNew");
					else
						txtUID = window.opener.document.getElementById("CPH_txtUIDNew");

					var txtEID = "";
					if (window.opener.document.getElementById("CPH_txtEIDNew") == null || window.opener.document.getElementById("CPH_txtEIDNew") == "")
						txtEID = window.opener.document.getElementById("CPH_Paas1_txtEIDNew");
					else
						txtEID = window.opener.document.getElementById("CPH_txtEIDNew")
					txtUID.value = getUrlVars()["UID"];
					txtEID.value = getUrlVars()["EID"];
					window.close();
					window.opener.ParentWindowFunction();
					return false;
				}
				window.close();
			}

			function closePage() {
				window.close();
			}

		</script>
	</div>
</body>
</html>
