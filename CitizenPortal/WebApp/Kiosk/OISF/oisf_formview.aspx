<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="oisf_formview.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.OISF.oisf_formview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .hdbg{background-color:#383E4B; color:#fff;}
.sub_hdbg{background-color:#F8F8F8; color:#383E4B; font-weight:bold; }
/*.fom-Numbx {
    border: 2px solid #383E4B;
    font-size: 12px;
    color: #383E4B;
    padding: 0 5px 0 5px;
    margin-right:5px;
    position: initial;
    top: 14px;
}*/

    </style>
    <link href="../../../Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
            <div class="box-body box-body-open">

              <div id="divPrint" style="margin: 0 auto; width: 80%; /*height: 1220px; overflow: auto; */">
                    <div style="margin: 0 auto; height: auto; width: 100%; border: 3px solid #000; padding: 1px; font-family: Arial">
                        <div style="margin: 0 auto; height:auto; width: 100%; border: 1px solid #000; background-image: url('../images/bgLogo.png'); background-image: url('../images/bgLogo.png'); background-size: 590px; background-repeat: no-repeat; background-position: center center;">
                            <%---------Start Header section --------%>
                            <div style="height: 140px; width: 100%; border-bottom: 1px solid #999;">
                                <div style="width: 165px; margin: 5px 0 0 5px; float: left; height: 115px;">
                                    <img alt="Logo" src="../images/depLgog.png" style="width: 110px; margin: 25px 0px 0px 33px;" />
                                </div>
                                <div style="height: 47px; width: 283px; float: right; margin: 45px 31px 0 0; display: none;">
                                    <div style="height: 23px; width: 83px; padding-left: 7px; float: left; border: 1px solid #999; border-bottom: none; border-right: none;">
                                        Trans. No.
                                    </div>
                                    <div style="height: 23px; width: 183px; padding-left: 7px; float: right; border: 1px solid #999; border-bottom: none;">
                                        <asp:Label ID="lblAppID" runat="server" Font-Bold="True"></asp:Label>
                                    </div>
                                    <div style="height: 23px; width: 83px; padding-left: 7px; float: left; border: 1px solid #999; border-right: none;">
                                        Trans. Date
                                    </div>
                                    <div style="height: 23px; width: 183px; padding-left: 7px; float: right; border: 1px solid #999;">
                                        <asp:Label ID="lblappdate" runat="server" Font-Bold="True"></asp:Label>
                                    </div>
                                </div>
                                <div style="height: 47px; float: right; margin: 30px 31px 0 0;">
                                    <img src="../Images/QRCode.png" style="width: 100px" />
                                </div>
                            </div>
                            <%----------End Header section ---------%>
                            <%---------Start Title section --------%>
                            <div style="text-align: center; font-size: 20px; font-weight: bolder; padding: 5px; text-transform: uppercase; background-color: #808080; color: #fff;">
                                <asp:Label runat="server" ID="lblCertificateName" Style="font-size: 20px; font-weight: bolder; text-transform: uppercase;">APPLICATION FORM FOR RECRUITMENT OF CONSTABLE </asp:Label>
                                <br />
                                <span style="font-size: 15px">9TH INDIAN RESERVE BATALION(SPECIALISED)</span>

                            </div>
                            <%----------End title section ---------%>
                            <%---------Start Applicant Section --------%>
                            <div style="margin: 10px; width:100%; height:auto; font-size: 13px;">

                               
                                    <table width="600" cellpadding="5" cellspacing="0" class="table-bordered" style="border: 1px solid #999; width:98%; margin:0;">
                                        <tr>
                                            <td style="padding: 8px;  color:#fff; font-size:14px;border-right: 1px solid #999; border-left: 1px solid #999; text-align: left; background-color:#383E4B;" colspan="5">
                                                <b>Applicant Details</b></td>
                                        </tr>
                                        <tr>
                                          <td width="139" valign="top" rowspan="13" style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                              <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 135px;" id="ProfilePhoto" />
                                            </td>
                                          <td width="156" style="padding: 5px; border: 1px solid #999; background-color:#F8F8F8; color:#383E4B; text-align: left;"><b>First Name</b></td>
                                          <td width="244" style="padding: 5px; border: 1px solid #999; background-color:#F8F8F8; color:#383E4B; text-align: left;"><b>Middle Name</b></td>
                                          <td style="padding: 5px; border: 1px solid #999; background-color:#F8F8F8; color:#383E4B; text-align: left;"><b>Last Name</b></td>
                                          <td width="222" style="padding: 5px; border: 1px solid #999; background-color:#F8F8F8; color:#383E4B; text-align: left;"><b> Father's  Name</b></td>
                                        </tr>
                                        <tr>
                                          <td style="padding: 5px; border: 1px solid #999;  text-align: left;"><label id="FirstName"></label></td>
                                          <td style="padding: 5px; border: 1px solid #999;  text-align: left;"><label id="MiddleName"></label></td>
                                          <td style="padding: 5px; border: 1px solid #999;  text-align: left;"><label id="LastName"></label></td>
                                          <td style="padding: 5px; border: 1px solid #999; text-align: left;"><label id="FatherName"></label></td>
                                        </tr>
                                        <tr>
                                            <td colspan="4" style="padding: 5px; border: 1px solid #999; background-color:#F8F8F8; color:#383E4B; text-align: left;">
                                          <b>Date of Birth (As per HSC Certificate)</b>                                          <b>Religion</b></td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                DOB</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">Year</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">Month</td>
                                            <td style="padding: 5px; border: 1px solid #999;  text-align: left;">Day</td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;"><label id="DOBConverted"></label>
                                                
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;"><label id="AgeYear"></label>
                                                </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;"><label id="AgeMonth"></label>
                                                </td>
                                            <td style="padding: 0; border: 1px solid #999;  text-align: left;"><label id="AgeDay"></label></td>
                                        </tr>
                                        <tr>
                                          <td style="padding: 5px; border: 1px solid #999; background-color:#F8F8F8; color:#383E4B; text-align: left;"><b>Gender</b></td>
                                          <td style="padding: 5px; border: 1px solid #999; background-color:#F8F8F8; color:#383E4B; text-align: left; width: 120px;"><b>Religion</b></td>
                                          <td style="padding: 5px; border: 1px solid #999; background-color:#F8F8F8; color:#383E4B; text-align: left;"><b>Category</b></td>
                                          <td style="padding: 5px; border: 1px solid #999; background-color:#F8F8F8; color:#383E4B; text-align: left;"><b>Nationality</b></td>
                                        </tr>
                                        <tr>
                                          <td style="padding: 5px; border: 1px solid #999; text-align: left;"><label id="gender"></label></td>
                                          <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;"><label id="Religion"></label></td>
                                          <td style="padding: 5px; border: 1px solid #999; text-align: left;"><label id="Category"></label></td>
                                          <td style="padding: 5px; border: 1px solid #999; text-align: left;"><label id="Nationality"></label></td>
                                        </tr>
                                        <tr>
                                          <td colspan="2" style="padding: 5px; border: 1px solid #999; background-color:#F8F8F8; color:#383E4B;  text-align: left;"><b>Email</b></td>
                                          <td style="padding: 5px; border: 1px solid #999; background-color:#F8F8F8; color:#383E4B; text-align: left;"><b>Mobile</b></td>
                                          <td style="padding: 5px; border: 1px solid #999; background-color:#F8F8F8; color:#383E4B; text-align: left;"><b>Telephone</b></td>
                                        </tr>
                                        <tr>
                                          <td colspan="2" style="padding: 5px; border: 1px solid #999; text-align: left;"><label id="EmailID"></label></td>
                                          <td style="padding: 5px; border: 1px solid #999; text-align: left;"><label id="MobileNo"></label></td>
                                          <td style="padding: 5px; border: 1px solid #999; text-align: left;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                              <td width="24%"><label id="stdcode"></label></td>
                                              <td width="76%"><label id="phoneno"></label></td>
                                            </tr>
                                          </table></td>
                                        </tr>
                                    </table>
                                <br />
                              <table width="600" cellpadding="5" cellspacing="0" class="table-bordered" style="width:98%; border: 1px solid #999;">
                                    <tr>
                                        <td colspan="2" style="padding: 8px;  color:#fff; font-size:14px; text-align: left; border-left: 1px solid #999; background-color:#383E4B;"><b>Permanent Address</b></td>
                                        <td colspan="2" style="padding: 8px; border-left:2px solid #999; border-right: 1px solid #999;  color:#fff; font-size:14px; text-align: left; background-color:#383E4B;"><b>Present Address</b></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="padding: 5px; border: 1px solid #999; background-color:#F8F8F8; color:#383E4B; text-align: left; width: 135px;">
                                          <b> Address</b>
                                            
                                        </td>
                                        <td colspan="2" style="padding: 5px; border: 1px solid #999; background-color:#F8F8F8; color:#383E4B; text-align: left; width: 135px;">
                                          <b> Address</b>
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                      <td colspan="2" style="padding: 5px; border: 1px solid #999; text-align: left;"><label id="EmailID51"></label>                                     </td>
                                      <td colspan="2" style="padding: 5px; border: 1px solid #999; text-align: left;"><label id="EmailID52"></label></td>
                                    </tr>
                                    <tr>
                                      <td width="137" style="padding: 5px; border: 1px solid #999; background-color:#F8F8F8; color:#383E4B; text-align: left; width: 135px;"><b>Road/Street Name</b></td>
                                      <td width="195" style="padding: 5px; border: 1px solid #999; background-color:#F8F8F8; color:#383E4B; text-align: left; width: 190px;"><b>Landmark</b></td>
                                       <td width="137" style="padding: 5px; border: 1px solid #999; background-color:#F8F8F8; color:#383E4B; text-align: left; width: 135px;"><b>Road/Street Name</b></td>
                                      <td width="195" style="padding: 5px; border: 1px solid #999; background-color:#F8F8F8; color:#383E4B; text-align: left; width: 190px;"><b>Landmark</b></td>
                                    </tr>
                                    <tr>
                                      <td style="padding: 5px; border: 1px solid #999; text-align: left;"><label id="EmailID41"></label></td>
                                      <td style="padding: 5px; border: 1px solid #999; text-align: left;"><label id="EmailID42"></label></td>
                                      <td style="padding: 5px; border: 1px solid #999; text-align: left;"><label id="EmailID43"></label></td>
                                      <td style="padding: 5px; border: 1px solid #999; text-align: left;"><label id="EmailID44"></label></td>
                                    </tr>
                                    <tr>
                                      <td style="padding: 5px; border: 1px solid #999; background-color:#F8F8F8; color:#383E4B; text-align: left;"><b>District</b></td>
                                      <td style="padding: 5px; border: 1px solid #999; background-color:#F8F8F8; color:#383E4B; text-align: left;"><b>State</b></td>
                                      <td style="padding: 5px; border: 1px solid #999; background-color:#F8F8F8; color:#383E4B; text-align: left;"><b>District</b></td>
                                      <td style="padding: 5px; border: 1px solid #999; background-color:#F8F8F8; color:#383E4B; text-align: left;"><b>State</b></td>
                                    </tr>
                                    <tr>
                                      <td style="padding: 5px; border: 1px solid #999; text-align: left;"><label id="EmailID31"></label></td>
                                      <td style="padding: 5px; border: 1px solid #999; text-align: left;"><label id="EmailID32"></label></td>
                                      <td style="padding: 5px; border: 1px solid #999; text-align: left;"><label id="EmailID33"></label></td>
                                      <td style="padding: 5px; border: 1px solid #999; text-align: left;"><label id="EmailID34"></label></td>
                                    </tr>
                                    <tr>
                                      <td style="padding: 5px; border: 1px solid #999; background-color:#F8F8F8; color:#383E4B; text-align: left;"><b>Panchayat/Village/City</b></td>
                                      <td style="padding: 5px; border: 1px solid #999; background-color:#F8F8F8; color:#383E4B; text-align: left;"><b>Pincode</b></td>
                                      <td style="padding: 5px; border: 1px solid #999; background-color:#F8F8F8; color:#383E4B; text-align: left;"><b>Panchayat/Village/City</b></td>
                                      <td style="padding: 5px; border: 1px solid #999; background-color:#F8F8F8; color:#383E4B; text-align: left;"><b>Pincode</b></td>
                                    </tr>
                                    <tr>
                                      <td style="padding: 5px; border: 1px solid #999; text-align: left;"><label id="EmailID21"></label></td>
                                      <td style="padding: 5px; border: 1px solid #999; text-align: left;"><label id="EmailID22"></label></td>
                                      <td style="padding: 5px; border: 1px solid #999; text-align: left;"><label id="EmailID23"></label></td>
                                      <td style="padding: 5px; border: 1px solid #999; text-align: left;"><label id="EmailID24"></label></td>
                                    </tr>
                              </table>
                                <br />
                              <table cellpadding="0" cellspacing="0" width="600" style="width:98%;border: 1px solid #999;">
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; color:#fff; font-size:14px; text-align: left; background-color:#383E4B; border-bottom: none;" colspan="8"><b>Educational Qualification upto HSC:</b></td>
                                    </tr>
                                    <tr>
                                        <td width="6%" class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">State </td>
                                        <td width="31%" class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">Name of the Examination Passed (HSC & Equivalent)</td>
                                        <td width="8%" class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">Year of Passing</td>
                                        <td width="16%" class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">Name of the Board/Council</td>
                                        <td width="7%" class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">Division</td>
                                        <td width="8%" class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">Total Marks</td>
                                        <td width="10%" class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">Mark Secured</td>
                                        <td width="14%" class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">Percentage of Marks secured</td>
                                    </tr>
                                    <tr>
                                        <td  style="padding: 5px; border: 1px solid #999; text-align: left; "><label id="EmailID0"></label></td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;  white-space: nowrap;"><label id="EmailID1"></label></td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;  white-space: nowrap;"><label id="EmailID2"></label></td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;  white-space: nowrap;"><label id="EmailID3"></label></td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;  white-space: nowrap;"><label id="EmailID4"></label></td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;  white-space: nowrap;"><label id="EmailID5"></label></td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;  white-space: nowrap;"><label id="EmailID6"></label></td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;  white-space: nowrap;"><label id="EmailID7"></label></td>
                                    </tr>
                              </table>
                                
                                <br />
                              <table width="600" cellpadding="5" cellspacing="0" class="table-bordered" style="width: 98%; border: 1px solid #999;">
                                    <tr>
                                        <td colspan="2" class="hdbg" style="padding: 5px; text-align: left; font-size:14px; border-right: 1px solid #999;border-left: 1px solid #999;"><b>Other Details</b></td>
                                    </tr>
                                    <tr>
                                        <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;"><span class="fom-Numbx">1.</span>Has the Candidate passed Odia as one of the subject in HSC Examination or an examination in Odia language equivalent to M.E. Standard recognised or conducted by the School and Mass Education Department of Odisha. (photo copy with self attestation should be enclosed)</td>
                                        <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td><input type="radio" name="radio1" id="yes" value="yes" />Yes
                                            <label id="Section1_PassOdiaYes" for="yes"></label></td> 
                                          <td><input type="radio" name="radio1" id="no" value="no" />
                                                No
                                            <label id="Section1_PassOdiaNo" for="no"></label></td>
                                        </tr>
                                      </table></td>
                                    </tr>
                                    <tr>
                                        <td width="676" style="padding: 5px; border: 1px solid #999; text-align: left; ">
                                           Ability to Odia langugae
                                        </td>
                                        <td width="315" style="padding: 5px; border: 1px solid #999; text-align: left;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                          <tr>
                                            <td><input type="checkbox" name="readOdiya" id="readOdiya" />Read
                                    <label id="Section1_AbililtyRead" for="checkbox"></label></td>
                                            <td><input type="checkbox" name="writeOdiya" id="writeOdiya" />Write
                                            <label id="Section1_AbilityWrite" for="checkbox"></label></td>
                                            <td><input type="checkbox" name="spkOdiya" id="spkOdiya" />Speak
  											<label id="Section1_AbilitySpeak" for="checkbox"></label></td>
                                          </tr>
                                        </table></td>
                                    </tr>
                                    <tr>
                                      <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left; "><span class="fom-Numbx">2.</span> Whether the candidate is married?</td>
                                      <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left; "><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td width="52%"><input type="radio" name="radio1" id="yes" value="yes" />Yes
                                            <label id="Section2_MarriedYes" for="yes"></label></td> 
                                          <td width="48%"><input type="radio" name="radio1" id="no" value="no" />
                                                No
                                            <label id="Section2_MarriedNo" for="no"></label></td>
                                        </tr>
                                      </table></td>
                                    </tr>
                                    <tr>
                                      <td style="padding: 5px; border: 1px solid #999; text-align: left; ">If Married, whether he has more than one spouse living?</td>
                                      <td style="padding: 5px; border: 1px solid #999; text-align: left; "><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td> <input type="radio" name="radio2a" id="LvSpse" value="yes" />Yes
                                            <label id="Section2A_MoreThanOneSpouseYes" for="LvSpse"></label></td>
                                          <td><input type="radio" name="radio2a" id="NtLvSpse" value="no" />
                                                No
                                            <label id="Section2A_MoreThanOneSpouseNo" for="NtLvSpse"></label></td>
                                        </tr>
                                      </table></td>
                                    </tr>
                                    <tr>
                                      <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;"><span class="fom-Numbx">3.</span>Whether the Candidate Ex-Serviceman?</td>
                                      <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left; "><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td><input type="radio" name="radio3" id="exarmyyes" value="exarmyyes" />
                                                Yes
                                            <label id="Section3_ExServiceManYes" for="exarmyyes"></label></td>
                                          <td><input type="radio" name="radio3" id="exarmyno" value="exarmyno" />
                                                No
                                            <label id="Section3_ExServiceManNo" for="exarmyno"></label></td>
                                        </tr>
                                      </table></td>
                                    </tr>
                                    <tr>
                                      <td style="padding: 5px; border: 1px solid #999; text-align: left;">Qualifying Service Rendered in Defence (Duration)</td>
                                      <td style="padding: 5px; border: 1px solid #999; text-align: left;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td>From<label id="Section3B_ServiceDurationFrom"></label>
                                        <input id="txtRndDrtinstrt" class="form-control" name="txtRndDrtinstrt" type="text" placeholder="DD/MM/YY" value="" autofocus="" /></td>
                                          <td> To
                                                <input id="Section3B_ServiceDurationTo" class="form-control" name="txtRndDrtinend" type="text" placeholder="DD/MM/YY" value="" autofocus="" /></td>
                                        </tr>
                                      </table></td>
                                    </tr>
                                    <tr>
                                      <td style="padding: 5px; border: 1px solid #999; text-align: left;">No.of service years</td>
                                      <td style="padding: 5px; border: 1px solid #999; text-align: left; "><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td> <input id="SevsYear" class="form-control mtop0" placeholder="Year" name="SevsYear" value="" maxlength="3" autofocus="" readonly="readonly"/></td>
                                          <td><input id="SevsMonth" class="form-control mtop0" placeholder="Month" name="SevsMonth" value="" maxlength="3" autofocus="" readonly="readonly"/></td>
                                          <td><input id="SevsDay" class="form-control mtop0" placeholder="Day" name="SevsDay" value="" maxlength="3" autofocus="" readonly="readonly"/></td>
                                        </tr>
                                      </table></td>
                                    </tr>
                                    <tr>
                                      <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;"><span class="fom-Numbx">4.</span>Whether the candidate is a Sports Person ?</td>
                                      <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td><input type="radio" name="radio4" id="exarmy" value="exarmy" />
                                                Yes
                                            <label id="Section4_IsSportsPersonYes" for="exarmy"></label></td>
                                          <td> <input type="radio" name="radio4" id="sptprsn" value="sptprsn" />
                                                No
                                            <label id="Section4_IsSportsPersonNo" for="sptprsn"></label></td>
                                        </tr>
                                      </table></td>
                                    </tr>
                                    <tr>
                                      <td style="padding: 5px; border: 1px solid #999; text-align: left;">Please Select Sports Participated</td>
                                      <td style="padding: 5px; border: 1px solid #999; text-align: left;"><label id="Section4A_SportsParticipated"></label><select name="ddlSports" id="ddlSports" class="form-control" data-val="true" data-val-number="Board" data-val-required="Please select District.">
                                                    <option value="0">List of Sports</option>
                                                    <option value="200">Athletics</option>
                                                    <option value="201">Archery</option>
                                                    <option value="202">Badminton</option>
                                                    <option value="203">Basket Ball</option>
                                                    <option value="204">Body Building</option>
                                                    <option value="205">Boxing</option>
                                                    <option value="206">Cricket</option>
                                                    <option value="207">Cycling</option>
                                                    <option value="208">Equestrian</option>
                                                    <option value="209">Football</option>
                                                    <option value="210">Gymnastics</option>
                                                    <option value="211">Hockey</option>
                                                    <option value="212">Judo</option>
                                                    <option value="213">Kabaddi</option>
                                                    <option value="214">Karate Do</option>
                                                    <option value="215">Kayaking &amp; Canoeing</option>
                                                    <option value="216">Lawn Tennis</option>
                                                    <option value="217">Power Lifting</option>
                                                    <option value="218">Rowing</option>
                                                    <option value="219">Shooting</option>
                                                    <option value="220">Swimming</option>
                                                    <option value="221">Table Tennis</option>
                                                    <option value="222">Tae Kwon Do</option>
                                                    <option value="223">Volleyball</option>
                                                    <option value="224">Weight Lifting</option>
                                                    <option value="225">Wrestling</option>
                                                    <option value="226">Others</option>
                                                </select></td>
                                    </tr>
                                    <tr>
                                      <td style="padding: 5px; border: 1px solid #999; text-align: left;">Please Describe</td>
                                      <td style="padding: 5px; border: 1px solid #999; text-align: left;"><label id="Section4B_SportsOthers"></label><input id="txtOthrsport" class="form-control" name="txtOthrsport"  type="text" value="" autofocus=""/></td>
                                    </tr>
                                    <tr>
                                      <td style="padding: 5px; border: 1px solid #999; text-align: left;">Whether he wants to avail relaxation in height, weight & chest.</td>
                                      <td style="padding: 5px; border: 1px solid #999; text-align: left;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td><input type="radio" name="radio4b" id="wntavlrlxon" value="want relaxation" />
                                                Yes
                                            <label id="Section4B_WantsRelaxationYes" for="wntavlrlxon"></label></td>
                                          <td><input type="radio" name="radio4b" id="dntavlrlxon" value="Not want relaxation" />
                                                No
                                            <label id="Section4B_WantsRelaxationNo" for="dntavlrlxon"></label></td>
                                        </tr>
                                      </table></td>
                                    </tr>
                                    <tr>
                                      <td style="padding: 5px; border: 1px solid #999; text-align: left;">Physical Standards of Measurements</td>
                                      <td style="padding: 5px; border: 1px solid #999; text-align: left;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td>Height
                                                <select name="ddlRxlstnhgt" id="ddlRxlstnhgt" class="form-control" data-val="true" data-val-number="Board" data-val-required="">
                                                    <option value="0">Select</option>
                                                    <option value="400">1 cm</option>
                                                    <option value="401">2 cm</option>
                                                    <option value="402">3 cm</option>                                                    
                                                </select></td>
                                          <td>Chest
                                                <select name="ddlRxlstnchst" id="ddlRxlstnchst" class="form-control" data-val="true" data-val-number="Board" data-val-required="">
                                                    <option value="0">Select</option>
                                                    <option value="403">1 cm</option>
                                                    <option value="404">2 cm</option>
                                                                                                      
                                                </select></td>
                                          <td>Weight
                                                <select name="ddlRxlstnwght" id="ddlRxlstnwght" class="form-control" data-val="true" data-val-number="Board" data-val-required="">
                                                    <option value="0">Select</option>
                                                    <option value="405">1 kg</option>
                                                    <option value="406">2 kg</option>
                                                    <option value="407">3 kg</option> 
                                                    <option value="408">4 kg</option>
                                                    <option value="409">5 kg</option>                                       
                                                </select></td>
                                        </tr>
                                      </table></td>
                                    </tr>
                                    <tr>
                                      <td colspan="2" class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px;"><span class="fom-Numbx">5.</span>If Sports Person (candidate only indicate one sports event participatedin Open National Championship / International Championship and the same should be recognised and sponsored either by the recognised National Sports Federations / Associations or Indian Olympic Association, Odisha State Sports Association, Affiliated to the recognised National Sports Federation / Association)</td>
                                    </tr>
                                    <tr>
                                      <td style="padding: 5px; border: 1px solid #999; text-align: left;">(A) Participated in Sports Event</td>
                                      <td style="padding: 5px; border: 1px solid #999; text-align: left;"><label id="Section5A_ParticipateEvent"></label><select name="ddlSports2" id="ddlSports2" class="form-control" data-val="true" data-val-number="Board" data-val-required="Please select District.">
                                                    <option value="0">List of Sports</option>
                                                    <option value="227">Athletics</option>
                                                    <option value="228">Archery</option>
                                                    <option value="229">Badminton</option>
                                                    <option value="230">Basket Ball</option>
                                                    <option value="231">Boxing</option>
                                                    <option value="232">Cricket</option>
                                                    <option value="233">Cycling</option>
                                                    <option value="234">Equestrian</option>
                                                    <option value="235">Football</option>
                                                    <option value="236">Gymnastics</option>
                                                    <option value="237">Hockey</option>
                                                    <option value="238">Judo</option>
                                                    <option value="239">Kabaddi</option>
                                                    <option value="240">Karate Do</option>
                                                    <option value="241">Kayaking &amp; Canoeing</option>
                                                    <option value="242">Lawn Tennis</option>
                                                    <option value="243">Power Lifting</option>
                                                    <option value="244">Rowing</option>
                                                    <option value="245">Shooting</option>
                                                    <option value="246">Swimming</option>
                                                    <option value="247">Table Tennis</option>
                                                    <option value="248">Tae Kwon Do</option>
                                                    <option value="249">Volleyball</option>
                                                    <option value="250">Weight Lifting</option>
                                                    <option value="251">Wrestling</option>
                                                </select></td>
                                    </tr>
                                    <tr>
                                      <td style="padding: 5px; border: 1px solid #999; text-align: left;">(B) In which Sports and Category (National / International)</td>
                                      <td style="padding: 5px; border: 1px solid #999; text-align: left;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td><input type="radio" name="radio5b" id="Plyntonal" value="yes" />National
                                            <label id="Section5B_SportsCategoryNtnl" for="Plyntonal"></label></td>
                                          <td><input type="radio" name="radio5b" id="Plyintrnal" value="no" />
                                                International
                                            <label id="Section5B_SportsCategoryIntrnl" for="Plyintrnal"></label></td>
                                        </tr>
                                      </table></td>
                                    </tr>
                                    <tr>
                                      <td style="padding: 5px; border: 1px solid #999; text-align: left;">(C) Awarded any Medal (Gold/Silver/Bronze) Appreciation ( 1st / 2nd / 3rd )</td>
                                      <td style="padding: 5px; border: 1px solid #999; text-align: left;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td><input type="radio" name="radio5C" id="GldMdl" value="yes" />Gold (1st)
                                            <label id="Section5C_SportsMedalGld" for="GldMdl"></label></td>
                                          <td><input type="radio" name="radio5C" id="SlvrMdl" value="no" />
                                                Silver (2nd)
                                            <label id="Section5C_SportsMedalSlvr" for="SlvrMdl"></label></td>
                                          <td><input type="radio" name="radio5C" id="BrnzMdl" value="no" />
                                                Bronze (3rd)
                                            <label id="Section5C_SportsMedalBrnze" for="BrnzMdl"></label></td>
                                        </tr>
                                      </table></td>
                                    </tr>
                                    <tr>
                                      <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;"><span class="fom-Numbx">6.</span>Whether the candidate possess NCC Certificate? If possess NCC Certificate</td>
                                      <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td><input type="radio" name="radio6" id="HsCerfte" value="yes" />Yes
                                            <label id="Section6_NCCCertificateYes" for="HsCerfte"></label></td>
                                          <td><input type="radio" name="radio6" id="NtHvgCerfte" value="no" />No
                                            <label id="Section6_NCCCertificateNo" for="NtHvgCerfte"></label></td>
                                        </tr>
                                      </table></td>
                                    </tr>
                                    <tr>
                                      <td  style="padding: 5px; border: 1px solid #999; text-align: left;">Category of NCC Certificate</td>
                                      <td  style="padding: 5px; border: 1px solid #999; text-align: left;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td><input type="radio" name="radio6A" id="radio6A" value="ACrtfte" />
                                                A
                                            <label id="Section6A_NCCCertificateCategoryA" for="ACrtfte"></label></td>
                                          <td><input type="radio" name="radio6A" id="radio6B" value="BCrtfte" />
                                                B
                                            <label id="Section6A_NCCCertificateCategoryB" for="BCrtfte"></label></td>
                                          <td><input type="radio" name="radio6A" id="radio6C" value="CCrtfte" />
                                                C
                                            <label id="Section6A_NCCCertificateCategoryC" for="CCrtfte"></label></td>
                                        </tr>
                                      </table></td>
                                    </tr>
                                    <tr>
                                      <td colspan="2" class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;"><span class="fom-Numbx">7.</span>Registration No., Date and Name of Employment Exchange</td>
                                    </tr>
                                    <tr>
                                      <td  style="padding: 5px; border: 1px solid #999; text-align: left;">Registration No. & Date</td>
                                      <td  style="padding: 5px; border: 1px solid #999; text-align: left;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td><label id="Section7A_RegNo"></label>
                                          <input id="txtRegNo" class="form-control" name="txtRegNo" placeholder="Registration No." type="text" value="" autofocus="" /></td>
                                          <td><label id="Section7A_RegDate"></label>
                                          <input id="txtRegdte" class="form-control" name="txtRegdte" type="text" placeholder="DD/MM/YY" value="" autofocus="" /></td>
                                        </tr>
                                      </table></td>
                                    </tr>
                                    <tr>
                                      <td style="padding: 5px; border: 1px solid #999; text-align: left;">Name of Employment Exchange</td>
                                      <td style="padding: 5px; border: 1px solid #999; text-align: left;"><label id="Section7B_NameEmpExchg"></label> <input id="txtNmeEmpEx" class="form-control" name="txtNmeEmpEx" placeholder="Employment Ex.Name" type="text" value="" autofocus="" /></td>
                                    </tr>
                                    <tr>
                                      <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;"><span class="fom-Numbx">8.</span>Whether the candidate possess a Driving licenses having the validity for at least 1 year (Excluding the learning period) ?</td>
                                      <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td><input type="radio" name="radio8" id="rdoDLYesYes" value="yes" />Yes
                                            <label id="Section8_HasDLYes" for="HsCerfte"></label></td>
                                          <td><input type="radio" name="radio8" id="rdoDLYesNo" value="no" />
                                                No
                                            <label id="Section8_HasDLNo" for="NtHvgCerfte"></label></td>
                                        </tr>
                                      </table></td>
                                    </tr>
                                    <tr>
                                      <td style="padding: 5px; border: 1px solid #999; text-align: left;">(A) Whether the license is applicable for Heavy Vehicle or light vehicle (photo copy of such license with self attestation should be enclosed).</td>
                                      <td style="padding: 5px; border: 1px solid #999; text-align: left;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td><input type="radio" name="radio8A" id="hvyVeh" value="yes" />Heavy Vehicle
                                            <label id="Section8A_LicenseVehicleHvy" for="HsCerfte"></label></td>
                                          <td><input type="radio" name="radio8A" id="lgtVeh" value="no" />
                                                Light Vehicle
                                            <label id="Section8A_LicenseVehicleLght" for="NtHvgCerfte"></label></td>
                                        </tr>
                                      </table></td>
                                    </tr>
                                    <tr>
                                      <td style="padding: 5px; border: 1px solid #999; text-align: left; ">(B) Licenses No. and Date.</td>
                                      <td style="padding: 5px; border: 1px solid #999; text-align: left; "><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td><label id="Section8B_LicenseNo"></label>
                                           <input id="txtLicenseNo" class="form-control" name="txtLcseNo" placeholder="License No" type="text" value="" autofocus="" /></td>
                                          <td><label id="Section8B_LicenseDate"></label>
                                          <input id="txtLicenseDate" class="form-control" name="txtLcsedte" placeholder="DD/MM/YY" type="text" value="" autofocus="" /></td>
                                        </tr>
                                      </table></td>
                                    </tr>
                                    <tr>
                                      <td style="padding: 5px; border: 1px solid #999; text-align: left; ">(C) Name of the RTO Office from which license issued</td>
                                      <td style="padding: 5px; border: 1px solid #999; text-align: left; ">
                                      <label id="Section8C_NameRTOOffice"></label>
                                      <input id="txtLicenseOffice" class="form-control" name="txtLcseIss" type="text" value="" autofocus="" /></td>
                                    </tr>
                                    <tr>
                                      <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;"><span class="fom-Numbx">9.</span>Whether the candidate involved in any criminal case?</td>
                                      <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td><input type="radio" name="radio9" id="rdoCrmYes" value="yes" />Yes
                                            <label id="Section9_InvolvedCriminalYes" for="CrmnlInvlv"></label></td>
                                          <td><input type="radio" name="radio9" id="rdoCrmYesNo" value="no" />
                                                No
                                            <label id="Section9_InvolvedCriminalNo" for="NtCrmnlInvlv"></label></td>
                                        </tr>
                                      </table></td>
                                    </tr>
                                    <tr>
                                      <td style="padding: 5px; border: 1px solid #999; text-align: left; ">(If yes, the details of the criminal case and / or the details arrest be provided.)</td>
                                      <td style="padding: 5px; border: 1px solid #999; text-align: left; "><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td><input type="radio" name="radio9A" id="radio9A" value="yes" />Accuted
                                            <label id="Section9A_ArrestDetailAcctd" for="Actd"></label></td>
                                          <td><input type="radio" name="radio9A" id="radio9C" value="no" />
                                                Convicted
                                            <label id="Section9A_ArrestDetailCnvtd" for="Cnvtd"></label></td>
                                        </tr>
                                      </table></td>
                                    </tr>
                                    <tr>
                                      <td style="padding: 5px; border: 1px solid #999; text-align: left;">Police Station Name and Case Reference No.</td>
                                      <td style="padding: 5px; border: 1px solid #999; text-align: left;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td><label id="Section9D_PoliceStationNo"></label>
                                          <input id="txtPoliceStationNo" class="form-control" name="txtPlcestonNo" type="text" value="" autofocus="" /></td>
                                          <td><label id="Section9B_CaseRefNo"></label>
                                          <input id="txtCriminalRefNo" class="form-control" name="txtCrmnlRcd" type="text" value="" autofocus="" /></td>
                                        </tr>
                                      </table></td>
                                    </tr>
                                    <tr>
                                      <td style="padding: 5px; border: 1px solid #999; text-align: left;">Name of the District and IPC Section</td>
                                      <td style="padding: 5px; border: 1px solid #999; text-align: left;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td><label id="Section9C_District"></label>
                                          <select name="ddlArrestDistrict" id="ddlArrestDistrict" class="form-control" data-val="true" data-val-number="District." data-val-required="Please select District.">                                                    
                                                </select></td>
                                          <td><label id="Section9E_IPCSection"></label>
                                          <input id="txtIPCSection" class="form-control" name="txtIpcscton" type="text" value="" autofocus="" /></td>
                                        </tr>
                                      </table></td>
                                    </tr>
                              </table>
                          </div>
                            <%----------End Document Section ---------%>
                            <div style="clear: both; margin: 0; line-height: 0; padding: 0; width: 135px;">
                            </div>
                        </div>
                    </div>
                    <div class="clear" style="page-break-before: always;">
                        &nbsp;
                    </div>

                </div>
                <div style="text-align:center; margin-bottom:10px;"><input type="button" id="btnSubmit" class="btn btn-info" style="background-color:#0040FF !important;" value="Edit" />
              <input type="submit" name="ctl00$ContentPlaceHolder1$btnCancel" value="Confirm" id="btnCancel" class="btn btn-success"  /></div>
            </div>
        </div>
        </div>
        </div>
    </form>
</body>
</html>
