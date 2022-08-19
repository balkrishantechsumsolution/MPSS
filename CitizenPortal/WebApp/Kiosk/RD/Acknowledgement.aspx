<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Acknowledgement.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.RD.Acknowledgement" %>

<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Acknowledgement For Senior Citizen</title>
    <script src="../../Scripts/CommonScript.js"></script>
    <link href="../../../Content/bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript">
        function printDiv(DIVID) {
            var divToPrint = document.getElementById('divPrint1');
            var htmlToPrint = "";
            var htmlToPrint = '' + '<style type="text/css">'
           + 'table th, table td {' + 'padding:0;' + '' + 'font-size:10px;' + '' + 'line-height:initial;' + ' }' +
      '</style>';

            htmlToPrint += divToPrint.outerHTML;
            newWin = window.open("");
            newWin.document.write(htmlToPrint);
            newWin.print();
            newWin.close();
        }
        function ShowIDCard() {
            debugger;
            var AppIDs = document.getElementById('<%= HdfAppId.ClientID %>').value;
            var Url = "/WebApp/Kiosk/RD/SeniorCitizenIDCard.aspx?AppID=" + AppIDs;
            window.open(Url);
        }
        function HomePage() {
            window.location.href = '/WebApp/Kiosk/Forms/Attachment.aspx?SvcID=424&AppID=' + obj.AppID;
        }
        function getQueryStrings() {
            var assoc = {};
            var decode = function (s) { return decodeURIComponent(s.replace(/\+/g, " ")); };
            var queryString = location.search.substring(1);
            var keyValues = queryString.split('&');

            for (var i in keyValues) {
                var key = keyValues[i].split('=');
                if (key.length > 1) {
                    assoc[decode(key[0])] = decode(key[1]);
                }
            }
            return assoc;
        }
       
        
    </script>
   <%-- <style type="text/css">
        .hdbg {
            background-color: #383E4B; 
            color: #fff; 
        }

        .sub_hdbg {
            background-color: #F8F8F8;
            color: #383E4B;
            font-weight: bold;
        }

        .t_trans {
            text-transform: capitalize;
        }

        .auto-style1 {
            width: 165px;
        }

        .auto-style2 {
            width: 487px;
        }
        
    </style>--%>
</head>
<body>
    <form id="form1" runat="server">
       
         <div style="text-align: center; margin-bottom: 20px; margin-top:20px;">
            <input type="button" id="btnSubmit" class="btn btn-info" style="background-color: #0040FF !important;" value="Print" onclick="printDiv('divPrint1')" />
            <input type="submit" name="Confirm" value="Confirm" id="btnCancel" class="btn btn-success" style="display: none" />
            <asp:Button ID="btnHome" runat="server" CssClass="btn btn-success" OnClick="btnHome_Click" ToolTip="Back to Home Page"
                Text="Home" />
            <asp:Button ID="BtnViewIdCard" runat="server" CssClass="btn btn-success" ToolTip="View ID Card" OnClientClick="javascript:return ShowIDCard();"
                Text="View ID Card" />
        </div>   
          <div id="divPrint1">
                <asp:Panel ID="divPrint" runat="server" Style="margin: 0 auto; width: 800px;">
                    <div style="margin: 0 auto;height:0 auto; min-height:100%; width: 794px; border: 3px solid #000; padding: 1px; font-family: Arial;">
                        <div style="width: 785px;height:0 auto; font-family: Arial;border: 1px solid #000;background-image: url(../Images/odisha_police_bg.png); background-size: 590px; background-repeat: no-repeat; background-position: center center;">
                        
                            <div style="height: 140px; width: 100%; border-bottom: 1px solid #999;">
                                <div style="width: 165px; margin: 5px 0 0 5px; float: left; height: 115px;">
                                    <img alt="Logo" src="../images/depLgog.png" style="width: 110px; margin: 25px 0px 0px 33px;" />
                                     
                                </div>
                                <div style="width: 165px; float: right;margin: 16px 0px 0px 33px;">
                                    <%--<img alt="Logo" src="/webApp/kiosk/Images/OUAT.png" style="width: 100px; margin: 16px 0px 0px 33px;" />--%>
                                     <uc1:QRCode runat="server" ID="QRCode" />
                                </div>
                                <div style="height: 47px; width: 283px; float: right; margin: 45px 31px 0 0; display: none;">
                                    <div style="height: 23px; width: 83px; padding-left: 7px; float: left; border: 1px solid #999; border-bottom: none; border-right: none;">
                                        Trans. No.
                                    </div>
                                    <div style="height: 23px; width: 183px; padding-left: 7px; float: right; border: 1px solid #999; border-bottom: none;">
                                    </div>
                                    <div style="height: 23px; width: 83px; padding-left: 7px; float: left; border: 1px solid #999; border-right: none;">
                                        Trans. Date
                                    </div>
                                    <div style="height: 23px; width: 183px; padding-left: 7px; float: right; border: 1px solid #999;">
                                        <asp:Label ID="lblappdate" runat="server" Font-Bold="True"></asp:Label>
                                    </div>
                                </div>
                                <div style="height: 47px; float: right; margin: 30px 31px 0 0;">
                                  <%--  <uc1:QRCode runat="server" ID="QRCode" />--%>
                                </div>
                            </div>
                            <div style="text-align: center; font-size: 20px; font-weight: bolder; padding: 5px; text-transform: uppercase; background-color: #808080; color: #fff; -webkit-print-color-adjust: exact;">
                                <span style="font-size: 20px">ACKNOWLEDGEMENT FOR SENIOR CITIZEN</span>
                            </div>
                            <div style="margin: 10px;font-size: 13px;">
                                <br />
                                <%--Applicant Table--%>
                                <table style="width: 98%; margin: 0 auto;">
                                    <tr>
                                        <td>
                                            <table class="table-bordered" style="width: 99%;">
                                                <tr>
                                                    <td colspan="2" style="padding: 8px; color: #fff; font-size: 14px; border-right: 1px solid #999; border-left: 1px solid #999; text-align: left; background-color: #383E4B; -webkit-print-color-adjust: exact;"><b>Applicant Details</b></td>
                                                </tr>
                                                <tr>
                                                    <td style="vertical-align: top;">
                                                        <table border="0" cellspacing="0" cellpadding="0">
                                                            <tr>
                                                                <td style="padding: 5px; border: 1px solid #999; font-size: 10px; text-align: center; width: 135px; vertical-align: top;">
                                                                    <img runat="server" src="/webApp/kiosk/Images/photo.png" style="margin: 1px; width: 118px;" id="ProfilePhoto" />
                                                                    <b>Applicant Photo</b>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding: 5px; border-top: 1px solid #999; font-size: 10px; text-align: center; width: 135px;">
                                                                    <img runat="server" src="img/signature.png" id="ProfileSignature" style="width: 118px; height: 50px;" />
                                                                    <b>Applicant Sign.</b>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td>
                                                        <table border="0" class="table-bordered" style="width: 100%;">

                                                            <tr>

                                                                <td valign="top">
                                                                    <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; margin: 0;">
                                                                        <tr>
                                                                            <td width="194" style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;"><b>District</b></td>
                                                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;" class="auto-style2">
                                                                                <asp:Label ID="lblpsdistrict" runat="server"></asp:Label></td>
                                                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;" class="auto-style1"><b>Name of Police Station</b></td>
                                                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                                                <asp:Label ID="PoliceStationName" runat="server"></asp:Label></td>
                                                                        </tr>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="194" style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;"><b>Applicant Name</b></td>
                                                                <td width="263" style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                                    <asp:Label ID="FullName" runat="server"></asp:Label></td>
                                                                <td width="194" style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;"><b>Blood Group</b></td>
                                                                <td width="263" style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;"><asp:Label ID="lblbloodgroup" runat="server"></asp:Label></td>

                                                            </tr>
                                                            <tr>
                                                                <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;" class="auto-style1"><b>Aadhaar Number</b></td>
                                                                <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                                    <asp:Label ID="lblAadhaarNo" runat="server"></asp:Label></td>
                                                                <td width="194" style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;"><b>Spouse/Father Name</b></td>
                                                                <td width="224" style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                                    <asp:Label ID="SpouceName" runat="server"></asp:Label></td>
                                                            </tr>
                                                            <tr>
                                                                <td width="194" style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                                    <b>Date of Birth
                                                                    </b></td>
                                                                <td width="263" style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                                    <asp:Label ID="DOBConverted" runat="server"></asp:Label></td>
                                                                <td width="194" style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;"><b>
                                                                    <span style="font-size: 11px;">(Age as on <asp:Label ID="lblasondate" runat="server" />)</span></b></td>
                                                                <td width="224" style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                                    <asp:Label ID="AgeYear" runat="server"></asp:Label>
                                                                    <asp:Label ID="AgeMonth" runat="server"></asp:Label>
                                                                    <asp:Label ID="AgeDay" runat="server"></asp:Label></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;" class="auto-style1"><b>Gender</b></td>
                                                                <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; width: 120px;">
                                                                    <asp:Label ID="gender" runat="server"></asp:Label></td>
                                                                <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;" class="auto-style1"><b>Mobile Number</b></td>
                                                                <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                                    <asp:Label ID="MobileNo" runat="server"></asp:Label></td>
                                                            </tr>

                                                            <tr>
                                                                <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;" class="auto-style1">
                                                                    <b>Nationality</b></td>
                                                                <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;">
                                                                    <asp:Label ID="Nationality" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                                    <b>Email</b>
                                                                </td>
                                                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                                    <asp:Label ID="EmailID" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2" style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;" class="auto-style1"><b>Is any of your relative staying in same city?</b></td>
                                                                <td colspan="2" style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                                    <asp:Label ID="RelativeStatus" runat="server"></asp:Label></td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2" style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;" class="auto-style1"><b>Do you have any medical history?</b></td>
                                                                <td colspan="2" style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                                    <asp:Label ID="MedicalHistoryStatus" runat="server"></asp:Label></td>
                                                            </tr>
                                                        </table>
                                                    </td>

                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>

                                <br />
                                <%--Applicant Address Table--%>
                                <table width="600" cellpadding="5" cellspacing="0" class="table-bordered" style="width: 99%; border: 1px solid #999;">
                                    <tr>
                                        <td colspan="2" style="padding: 8px; color: #fff; font-size: 14px; text-align: left; border-left: 1px solid #999; background-color: #383E4B; -webkit-print-color-adjust: exact;"><b>Permanent Address</b></td>
                                        <td colspan="2" style="padding: 8px; border-left: 1px solid #fff; border-right: 1px solid #999; color: #fff; font-size: 14px; text-align: left; background-color: #383E4B; -webkit-print-color-adjust: exact;"><b>Present Address</b></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999;  color: #383E4B; text-align: left; width: 135px;">
                                            <b>Address</b>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; width: 135px;">
                                            <asp:Label ID="PAddressLine1" runat="server"></asp:Label>&nbsp;<asp:Label ID="PAddressLine2" runat="server"></asp:Label></td>
                                        <td style="padding: 5px; border: 1px solid #999;  color: #383E4B; text-align: left; width: 135px;">
                                            <b>Address</b>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; width: 135px;">
                                            <asp:Label ID="CAddressLine1" runat="server"></asp:Label>&nbsp;<asp:Label ID="CAddressLine2" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td width="146" style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; width: 135px;"><b>Road/Street Name</b></td>
                                        <td width="339" style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; width: 190px;">
                                            <asp:Label ID="PRoadStreetName" runat="server"></asp:Label></td>
                                        <td width="210" style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; width: 135px;"><b>Road/Street Name</b></td>
                                        <td width="276" style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; width: 190px;">
                                            <asp:Label ID="CRoadStreetName" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999;  color: #383E4B; text-align: left; width: 190px;">
                                            <b>Landmark</b>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="PLandMark" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                            <b>Landmark</b></td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="CLandMark" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;"><b>Locality</b></td>
                                        <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                            <asp:Label ID="PLocality" runat="server"></asp:Label></td>
                                        <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;"><b>Locality</b></td>
                                        <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                            <asp:Label ID="CLocality" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;"><b>Panchayat/Village/City</b></td>
                                        <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                            <asp:Label ID="PddlVillage" runat="server"></asp:Label></td>
                                        <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;"><b>Panchayat/Village/City</b></td>
                                        <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                            <asp:Label ID="CddlVillage" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;"><b>Block/Taluka</b></td>
                                        <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                            <asp:Label ID="PBlock" runat="server"></asp:Label></td>
                                        <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;"><b>Block/Taluka</b></td>
                                        <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                            <asp:Label ID="CBlock" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;"><b>District</b></td>
                                        <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                            <asp:Label ID="PddlDistrict" runat="server"></asp:Label></td>
                                        <td style="padding: 5px; border: 1px solid #999;color: #383E4B; text-align: left;"><b>District</b></td>
                                        <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                            <asp:Label ID="CddlDistrict" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                            <b>State</b>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="PddlState" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999;color: #383E4B; text-align: left;">
                                            <b>State</b>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="CddlState" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;"><b>Pincode</b></td>
                                        <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                            <asp:Label ID="PPinCode" runat="server"></asp:Label></td>
                                        <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;"><b>Pincode</b></td>
                                        <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                            <asp:Label ID="CPinCode" runat="server"></asp:Label></td>
                                    </tr>
                                </table>

                                <br />
                                <%--Applicant Address Table--%>

                              
                                <div id="MedicalPanel" runat="server">
                                <table class="table-bordered" cellspacing="0" style="width: 99%; border: 0;">
                                    <tbody>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; color: #fff; font-size: 14px; text-align: left; background-color: #383E4B; border-bottom: none; -webkit-print-color-adjust: exact;" colspan="12"><b>Medical History</b></td>
                                        </tr>
                                        <tr>
                                            <%--<td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;"><b>Blood Group</b>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                                <asp:Label ID="hh" runat="server"></asp:Label>
                                            </td>--%>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;"><b>Arthritis</b>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                                <asp:Label ID="lblArthritis" runat="server"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;"><b>Heart Disease</b>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                                <asp:Label ID="lblHeart" runat="server"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;"><b>Cancer</b>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                                <asp:Label ID="lblCancer" runat="server"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;"><b>Respiratory Diseases</b>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                                <asp:Label ID="lblRespiratory" runat="server"></asp:Label>
                                            </td>
                                            <td colspan="3" style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;"><b>Alzheimer's Disease</b>
                                            </td>
                                            <td  style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                                <asp:Label ID="lblAlzheimer" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;"><b>Osteoporosis</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                                <asp:Label ID="lblOsteoporosis" runat="server"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;"><b>Diabetes</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                                <asp:Label ID="lblDiabetes" runat="server"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;"><b>Influenza and Pneumonia</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                                <asp:Label ID="lblInfluenza" runat="server"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;"><b>Others</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                                <asp:Label ID="lblOthers" runat="server"></asp:Label>
                                            </td>
                                            <td colspan="4" style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="3" style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;"><b>Name of Family Doctor</b>
                                            </td>

                                            <td colspan="3" style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                                 <asp:Label ID="lblFDrName" runat="server"></asp:Label>
                                            </td>

                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;"><b>Mobile No</b>
                                            </td>
                                            <td colspan="5" style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                                 <asp:Label ID="lblDrMobile" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;"><b>Address of Family Doctor</b></td>
                                            <td colspan="8" style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;
                                                 <asp:Label ID="lblDrAddress" runat="server"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;"><b>Pincode</b>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;
                                                 <asp:Label ID="lblDrPinCode" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                    </div>
                               
                                <asp:Repeater ID="RptRelative" runat="server">
                                    <HeaderTemplate>
                                        <table class="table-bordered" cellspacing="0" style="width: 99%; border: 0;">
                                            <tbody>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; color: #fff; font-size: 14px; text-align: left; background-color: #383E4B; border-bottom: none; -webkit-print-color-adjust: exact;" colspan="12"><b>Relative Details (In case of Emergency)</b></td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 45px;"><b>S.No</b>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;"><b>Name of Relative</b>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 65px;"><b>Relation</b>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;"><b>Address</b>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 45px;"><b>Mobile No</b>
                                                    </td>
                                                </tr>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;
                                              <%#(((RepeaterItem)Container).ItemIndex+1).ToString()%>
                                              
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">&nbsp;
                                                <%# DataBinder.Eval(Container, "DataItem.NameOfRelative")%>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;
                                                <%# DataBinder.Eval(Container, "DataItem.Relation")%>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">&nbsp;
                                                <%# DataBinder.Eval(Container, "DataItem.Address")%>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;
                                                <%# DataBinder.Eval(Container, "DataItem.Mobile")%>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </tbody>
                                </table>
                                    </FooterTemplate>

                                </asp:Repeater>
                                <br />
                               
                                <asp:Repeater ID="RptServant" runat="server">
                                    <HeaderTemplate>
                                        <table class="table-bordered" cellspacing="0" style="width: 99%; border: 0;">
                                            <tbody>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; color: #fff; font-size: 14px; text-align: left; background-color: #383E4B; border-bottom: none; -webkit-print-color-adjust: exact;" colspan="12"><b>Servant / Driver / Watchman / Tenant Details</b></td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 45px;"><b>S.No</b>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 55px;"><b>Person Type</b>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;"><b>Name of Person</b>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;"><b>Address</b>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 45px;"><b>Mobile No</b>
                                                    </td>
                                                </tr>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;
                                                 <%#(((RepeaterItem)Container).ItemIndex+1).ToString()%>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;
                                                  <%# DataBinder.Eval(Container, "DataItem.PersonType")%>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">&nbsp;
                                                  <%# DataBinder.Eval(Container, "DataItem.NameOfPerson")%>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">&nbsp;
                                                  <%# DataBinder.Eval(Container, "DataItem.Address")%>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;
                                                  <%# DataBinder.Eval(Container, "DataItem.Mobile")%>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </tbody>
                                </table>
                                    </FooterTemplate>
                                </asp:Repeater>

                                <br />
                                <table cellpadding="0" cellspacing="0" width="99%">
                                    <tbody>
                                        <tr>
                                            <td style="background-color: #383E4B;color: #fff; padding: 5px; border: 1px solid #999; text-align: left; -webkit-print-color-adjust: exact; border-bottom: none;" colspan="3"><b>List of essential documents (enclosed with the application)</b></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div>
                                    <asp:GridView ID="grdView" runat="server" CellPadding="5" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" Style="margin-bottom: 0;" ClientIDMode="Static" Width="99%">
                                    </asp:GridView>
                                </div>
                                <br />
                               
                                    <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 99%; border: 0;display:none;">
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; color: #fff; font-size: 14px; text-align: left; background-color: #383E4B; border-bottom: none; -webkit-print-color-adjust: exact;" colspan="4"><b>Payment Details</b></td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                                <asp:Label ID="Label26" runat="server" CssClass="lbl_property" Text="Application Number"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                                <asp:Label ID="lblAppID" runat="server" Font-Bold="True"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                                <asp:Label ID="Label31" runat="server" CssClass="lbl_property" Text="Application Date"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                                <asp:Label ID="AppDate" runat="server" CssClass="lbl_value"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="border: 1px solid #999; text-align: left;">Transaction ID</td>
                                            <td><span id="lblTrnsID" runat="server" style="font-weight: bold;"></span></td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Transaction Date</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;"><span id="lblTrnsDate" runat="server" style="font-weight: bold;">wrwe</span></td>
                                        </tr>
                                        <!-------hide Kiosk details as discussed with Niraj Sir on 21 july--------->
                                        <tr style="display:none;">
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                                <asp:Label ID="TokenNo0" runat="server">Kiosk Name (ID)</asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                                <asp:Label ID="lblKiosk" runat="server"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                                <asp:Label ID="TokenNo3" runat="server">Kiosk Mobile No.</asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                                <asp:Label ID="lblKioskMob" runat="server" CssClass="lbl_value"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr style="display: none">
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Transaction Amount</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;"><i class="fa fa-rupee"></i>
                                                <asp:Label ID="lblAppFee" runat="server"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; white-space: nowrap;">Portal Fee + Service Tax</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;"><i class="fa fa-rupee"></i>
                                                Rs.
                                            <asp:Label ID="lblPortalFee" runat="server" Text="Rs. 02.75"></asp:Label>
                                                + <i class="fa fa-rupee"></i>
                                                <asp:Label ID="lblServTax" runat="server" Text="Rs. 02.75"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Total Amount</td>
                                            <td colspan="3" style="padding: 5px; border: 1px solid #999; text-align: left;"><i class="fa fa-rupee"></i>
                                                Rs.
                                            <asp:Label ID="lblTotalFee" runat="server"></asp:Label>
                                                <%--<asp:Label ID="lblAmtWord" runat="server" Text="(Thirty Two Rupees and Ninety Paise)"></asp:Label>--%>
                                                <asp:HiddenField ID="HdfAppId" runat="server" />
                                            </td>
                                        </tr>

                                    </table>
                              <!--------DISPLAY ACTION HISTORY DETAILS-------------->
                                 <table cellpadding="0" cellspacing="0" width="99%" style="margin-bottom:50px;">
                                    <tbody>
                                        <tr>
                                            <td style="background-color: #383E4B;color: #fff; padding: 5px; border: 1px solid #999; text-align: left; border-bottom: none; -webkit-print-color-adjust: exact;" colspan="3">
                                                <b>Application Status</b></td>
                                        </tr>
                                    </tbody>
                                     <tr>
                                         <td>
                                             <asp:PlaceHolder ID="PLHActionHistory" runat="server"></asp:PlaceHolder>
                                         </td>
                                     </tr>
                                </table>
                                
                                <br />
                           
                            </div>
                        </div>
                    </div>
                
                </asp:Panel>
              
            </div>
       
         
        
  </form>
</body>
</html>

 
          