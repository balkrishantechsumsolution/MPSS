<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="PGPHDEditMarks.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.OUAT.PGPhD.PGPHDEditMarks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
    <script src="/Scripts/fileupload/jquery.iframe-transport.js"></script>
    <script src="/Scripts/fileupload/jquery.fileupload.js"></script>
    <script src="/PortalScripts/ServiceLanguage.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script src="/WebApp/Scripts/CommonScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/ValidationScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/AddressScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Kiosk/OUAT/PGphd/PGPHDEditMarks.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Citizen/Script/ValidateUser.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper" class="pleft5 pright5" style="min-height: 500px !important;">
        <div class="col-md-12">
            <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>EDIT MARKS FOR PG/PHD APPLICATIONS</h2>
        </div>
        <div class="col-md-12 box-container">
            <div class="box-heading">
                <h4 class="box-title">Applicant Details</h4>
            </div>
            <div class="box-body box-body-open">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label>Name of the Candidate</label>
                            <input id="FirstName" class="form-control" placeholder="Full Name" type="text" readonly="readonly" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label>Application ID</label>
                            <input id="txtAppID" class="form-control" placeholder="Application ID" type="text" readonly="readonly" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory" for="MobileNo">Mobile Number</label>
                            <input id="MobileNo" class="form-control" maxlength="10" placeholder="Mobile Number" readonly="readonly" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label for="EmailID" class="">Email ID</label>
                            <input type="email" id="EmailID" class="form-control" placeholder="Email Id" name="Email Id" maxlength="30" readonly="readonly" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label>Programme</label>
                            <input type="text" id="txtProgramme" class="form-control" placeholder="Programme" readonly="readonly" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label>College Name</label>
                            <input type="text" id="txtCollegeName" class="form-control" placeholder="College Name" readonly="readonly" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label>Degree Name</label>
                            <input type="text" id="txtDegree" class="form-control" placeholder="College Name" readonly="readonly" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                        <div class="form-group">
                            <label>Subject</label>
                            <input type="text" id="txtSubject" class="form-control" placeholder="Subject" readonly="readonly" />
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container p0" id="divBsc">
            <div class="form-group" style="margin-bottom: 0;">
                <div class="table-responsive">
                    <table style="width: 98.5%; margin: 8px auto;" class="table-striped table-bordered table">
                        <tr>
                            <td colspan="6" style="background-color: #415670; color: #fff; font-size: 15px;">Educational Qualification of B.Sc (Ag)/B.sc.(Hort)B.V.Sc.& A.H/B.Tech (Ag.Engg.)/B.F.Sc/B.Sc(H.Sc)/B.Sc(Forestry)
                            </td>
                        </tr>
                        <tbody>
                            <tr>
                                <th style="width: 25%;">
                                    <label>Name of the Board/University</label>
                                </th>
                                <th style="width: 12%;">
                                    <label>Grade System</label>
                                </th>
                                <th style="width: 8%;">
                                    <label>Passing Year</label>
                                </th>
                                <th style="width: 8%;">
                                    <label id="lblBscTotalMarks">Total Marks</label>
                                </th>
                                <th style="width: 8%;">
                                    <label id="lblBscMarksGot">Marks Scored</label>
                                </th>
                                <th style="width: 8%;">
                                    <label>Percentage of Marks</label>
                                </th>
                            </tr>
                            <tr>
                                <td>
                                    <input id="BscName" class="form-control" placeholder="Name Of Board/University" type="text" maxlength="50" onkeypress="return IsAlphabet(event);" />
                                </td>
                                <td>
                                    <select name="BscDivision" id="BscDivision" class="form-control" onchange="ChangeDivision();">
                                        <option value="0">-Select-</option>
                                        <option value="501">OGPA - 10 Scale</option>
                                        <option value="502">Percentage</option>
                                    </select></td>
                                <td>
                                    <input id="BscPassingYear" class="form-control" placeholder="Year" type="text" maxlength="4" onkeypress="return isNumberKey(event);" onchange="isNumberAndYear('BscPassingYear');" />
                                </td>
                                <td>
                                    <input id="BscTotalMarks" class="form-control" placeholder="Marks" type="text" maxlength="4" onkeypress="return isNumberKeyDecimal(event,'BscTotalMarks'); " />
                                </td>
                                <td>
                                    <input id="BscMarksGot" class="form-control" placeholder="Marks" type="text" maxlength="4" onkeypress="return isNumberKeyDecimal(event,'BscMarksGot'); " />
                                </td>
                                <td>
                                    <input id="BscPercentage" class="form-control" placeholder="%" type="text" maxlength="3" readonly="readonly" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 p0" id="divMsc">
            <div class="form-group" style="margin-bottom: 0;">
                <div class="table-responsive">
                    <table style="width: 99%; margin: 8px auto;" class="table-striped table-bordered table">
                        <tr>
                            <td colspan="6" style="background-color: #415670; color: #fff; font-size: 15px;">Educational Qualification of M.Sc.(Ag.)/M.V. Sc./M.Tech (Agril,Engg.) M.F.Sc./Equivalent
                                                                <span class="pull-right" style="display: none">
                                                                    <input type="radio" name="MSCQUAL" value="P" checked />Passed |
                                                                    <input type="radio" name="MSCQUAL" value="A" />Appearing</span></td>
                        </tr>
                        <tbody>
                            <tr>
                                <th style="width: 25%;">
                                    <label>Name of the Board/University</label>
                                </th>
                                <th style="width: 12%;">
                                    <label>Grade System</label>
                                </th>
                                <th style="width: 8%;">
                                    <label>Passing Year</label>
                                </th>
                                <th style="width: 8%;">
                                    <label id="lblMscTotalMarks">Total Marks</label>
                                </th>
                                <th style="width: 8%;">
                                    <label id="lblMscMarksGot">Marks Scored</label>
                                </th>
                                <th style="width: 8%;">
                                    <label>Percentage of Marks</label>
                                </th>
                            </tr>
                            <tr>
                                <td>
                                    <input id="MscName" class="form-control" placeholder="Name Of Board/University" name="" type="text" maxlength="50" />
                                </td>
                                <td>
                                    <select name="MscDivision" id="MscDivision" class="form-control">
                                        <option value="0">-Select-</option>
                                        <option value="501">OGPA - 10 Scale</option>
                                        <%-- <option value="503">OGPA - 5.0 Scale</option>
                                                                <option value="504">OGPA - 4.0 Scale</option>--%>
                                        <option value="502">Percentage</option>
                                    </select></td>
                                <td>
                                    <input id="MscPassingYear" class="form-control" placeholder="Year" name="" type="text" maxlength="4" onkeypress="return isNumberKeyDecimal(event); " />
                                </td>
                                <td>
                                    <input id="MscTotalMarks" class="form-control" placeholder="Marks" name="" type="text" maxlength="4" onkeypress="return isNumberKeyDecimal(event,'MscTotalMarks'); " />
                                </td>
                                <td>
                                    <input id="MscMarksGot" class="form-control" placeholder="Marks" name="" type="text" maxlength="4" onkeypress="return isNumberKeyDecimal(event,'MscMarksGot'); " />
                                </td>
                                <td>
                                    <input id="MscPercentage" class="form-control" placeholder="%" readonly="true" type="text" maxlength="3" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <div class="clearfix"></div>
        <input id="ddlProgram" class="form-control" readonly="readonly" style="display: none" />
        <input id="Category" class="form-control" readonly="readonly" style="display: none" />

        <div class="col-md-12 box-container text-center">
            <div class="box-body box-body-open">
                <input type="button" class="btn btn-success " id="btnSubmit" value="SUBMIT" onclick="SubmitData();" />
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</asp:Content>
