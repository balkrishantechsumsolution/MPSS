<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="DMASForm.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.DTE.DMASForm" EnableEventValidation="false" %>

<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <script src="../../../Scripts/angular.min.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
    <script src="/Scripts/fileupload/jquery.iframe-transport.js"></script>
    <script src="/Scripts/fileupload/jquery.fileupload.js"></script>
    <script src="/PortalScripts/ServiceLanguage.js"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script src="../../Scripts/ValidationScript.js"></script>
    <script src="/Scripts/jquery-2.2.3.min.js"></script>
    <link href="../../Styles/bootstrap.min.css" rel="stylesheet" />
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <link href="../../Styles/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="../../Styles/style.admin.css" rel="stylesheet" />
    <link href="../../bootstrap.min.css" rel="stylesheet" />
    <link href="../../Styles/sb-admin-2.css" rel="stylesheet" />
    <link href="../../Styles/StyleSheet1.css" rel="stylesheet" />
    <link href="../../Styles/timeline.css" rel="stylesheet" />
    <link href="../../Styles/StyleSheet1.css" rel="stylesheet" />
    <link href="../../Styles/StyleSheet3.css" rel="stylesheet" />
    <link href="../../Styles/StyleSheet4.css" rel="stylesheet" />
    <link href="../../Styles/style.admin.css" rel="stylesheet" />
    <link href="../../Styles/bootstrap.min.css" rel="stylesheet" />
    <script src="DAMSForm.js"></script>
    <style type="text/css">
        .form-heading {
            text-transform: none !important;
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
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="intrnlContent" ng-app="appmodule">
            <div ng-controller="ctrl">
                <div style="min-height: 500px !important;margin:20px;">
                    <div class="row">
                        <div class="col-lg-12">
                        </div>
                    </div>
                    <div class="clearfix">
                        <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i> {{titleData.lblTitle}}
                    </h2>
                    </div>
                    <div class="row" id="divDetail" runat="server">
                        <%---Start of DeceasedDetails----%>
                        <div class="col-md-12 box-container mTop15">
                            <div class="box-heading">
                                <h4 class="box-title register-num">Application Details
                                </h4>
                            </div>
                            <div class="box-body box-body-open">
                                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-3">
                                    <div class="form-group">
                                        <label class="manadatory" for="txtRegistration">
                                            Registration No. (State Council)</label>
                                        <input runat="server" id="txtRegistration" class="form-control" placeholder="Registration Number as a student of State Council" name=" txtRegistration" type="text" value=""
                                            autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlSession">
                                            Session</label>
                                        <asp:DropDownList ID="ddlSession" runat="server" CssClass="form-control" ToolTip="Select Session">
                                            <asp:ListItem Value="0">Select Session</asp:ListItem>
                                            <asp:ListItem Value="101">Summer Session</asp:ListItem>
                                            <asp:ListItem Value="102">Winter Session</asp:ListItem>
                                            <asp:ListItem Value="103">Special Session</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlDivision">
                                            Division</label>
                                        <asp:DropDownList ID="ddlDivision" runat="server" CssClass="form-control" ToolTip="Select Division">
                                            <asp:ListItem Value="0">Select Division</asp:ListItem>
                                            <asp:ListItem Value="First (Hons.)">First (Hons.)</asp:ListItem>
                                            <asp:ListItem Value="First">First</asp:ListItem>
                                            <asp:ListItem Value="Second">Second</asp:ListItem>
                                            <asp:ListItem Value="Third">Third</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlAdmission">
                                            Year of Admission</label>
<%--                                        <select class="form-control" data-val="true" data-val-number="Session"
                                            data-val-required="Please select Session" id="ddlAdmission" name="ddlAdmission" runat="server">
                                            <option value="0">Select Year of Admission</option>
                                            <option value="2016">2016</option>
                                            <option value="2015">2015</option>
                                            <option value="2014">2014</option>
                                            <option value="2013">2013</option>
                                            <option value="2012">2012</option>
                                            <option value="2011">2011</option>
                                            <option value="2010">2010</option>
                                            <option value="2009">2009</option>
                                            <option value="2008">2008</option>
                                            <option value="2007">2007</option>
                                            <option value="2006">2006</option>
                                            <option value="2005">2005</option>
                                            <option value="2004">2004</option>
                                            <option value="2003">2003</option>
                                            <option value="2002">2002</option>
                                            <option value="2001">2001</option>
                                        </select>--%>
                                        <asp:DropDownList ID="ddlAdmission" runat="server" CssClass="form-control" ToolTip="Select Admission">
                                            <asp:ListItem Value="0">Select Year of Admission</asp:ListItem>
                                            <asp:ListItem Value="2017">2017</asp:ListItem>
                                            <asp:ListItem Value="2016">2016</asp:ListItem>
                                            <asp:ListItem Value="2015">2015</asp:ListItem>
                                            <asp:ListItem Value="2014">2014</asp:ListItem>
                                            <asp:ListItem Value="2013">2013</asp:ListItem>
                                            <asp:ListItem Value="2012">2012</asp:ListItem>
                                            <asp:ListItem Value="2011">2011</asp:ListItem>
                                            <asp:ListItem Value="2010">2010</asp:ListItem>
                                            <asp:ListItem Value="2009">2009</asp:ListItem>
                                            <asp:ListItem Value="2008">2008</asp:ListItem>
                                            <asp:ListItem Value="2007">2007</asp:ListItem>
                                            <asp:ListItem Value="2006">2006</asp:ListItem>
                                            <asp:ListItem Value="2005">2005</asp:ListItem>
                                            <asp:ListItem Value="2004">2004</asp:ListItem>
                                            <asp:ListItem Value="2003">2003</asp:ListItem>
                                            <asp:ListItem Value="2002">2002</asp:ListItem>
                                            <asp:ListItem Value="2001">2001</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlPassing">
                                            Year of Passing</label>
<%--                                        <select class="form-control" data-val="true" data-val-number="Session"
                                            data-val-required="Please select Session" id="ddlPassing" name="ddlPassing" runat="server">
                                            <option value="0">Select Year of Passing</option>
                                            <option value="2016">2016</option>
                                            <option value="2015">2015</option>
                                            <option value="2014">2014</option>
                                            <option value="2013">2013</option>
                                            <option value="2012">2012</option>
                                            <option value="2011">2011</option>
                                            <option value="2010">2010</option>
                                            <option value="2009">2009</option>
                                            <option value="2008">2008</option>
                                            <option value="2007">2007</option>
                                            <option value="2006">2006</option>
                                            <option value="2005">2005</option>
                                            <option value="2004">2004</option>
                                            <option value="2003">2003</option>
                                            <option value="2002">2002</option>
                                            <option value="2001">2001</option>
                                        </select>--%>
                                        <asp:DropDownList ID="ddlPassing" runat="server" CssClass="form-control" ToolTip="Select Passing Year">
                                            <asp:ListItem Value="0">Select Year of Passing</asp:ListItem>
                                            <asp:ListItem Value="2017">2017</asp:ListItem>
                                            <asp:ListItem Value="2016">2016</asp:ListItem>
                                            <asp:ListItem Value="2015">2015</asp:ListItem>
                                            <asp:ListItem Value="2014">2014</asp:ListItem>
                                            <asp:ListItem Value="2013">2013</asp:ListItem>
                                            <asp:ListItem Value="2012">2012</asp:ListItem>
                                            <asp:ListItem Value="2011">2011</asp:ListItem>
                                            <asp:ListItem Value="2010">2010</asp:ListItem>
                                            <asp:ListItem Value="2009">2009</asp:ListItem>
                                            <asp:ListItem Value="2008">2008</asp:ListItem>
                                            <asp:ListItem Value="2007">2007</asp:ListItem>
                                            <asp:ListItem Value="2006">2006</asp:ListItem>
                                            <asp:ListItem Value="2005">2005</asp:ListItem>
                                            <asp:ListItem Value="2004">2004</asp:ListItem>
                                            <asp:ListItem Value="2003">2003</asp:ListItem>
                                            <asp:ListItem Value="2002">2002</asp:ListItem>
                                            <asp:ListItem Value="2001">2001</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlBranch">
                                            Branch Name</label>
<%--                                        <select name="ddlBranch" id="ddlBranch" class="form-control" data-val="true" data-val-number="" data-val-required="Please select Branch Name" runat="server">
                                            <option value="0">Select Branch Name</option>
                                        </select>--%>
                                        <asp:DropDownList ID="ddlBranch" runat="server" CssClass="form-control" ToolTip="Select Branch">
                                            <asp:ListItem Value="0">Select Branch</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-7" id="divApplicant">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlInstitute" id="lblApplicant">
                                            Name of Institue</label>
                                        <%--<select runat="server" name="ddlInstitute" id="ddlInstitute" class="form-control" data-val="true" data-val-number="" data-val-required="Please select Institute Name">
                                            <option value="0">Select Institute Name</option>
                                        </select>--%>
                                        <asp:DropDownList ID="ddlInstitute" runat="server" CssClass="form-control" ToolTip="Select Institute">
                                            <asp:ListItem Value="0">Select Institute</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory" for="txtInstitute">
                                            Name of the Student</label>
                                        <input runat="server" id="txtName" class="form-control" placeholder="Enter Name of the Student" name=" txtInstitute" type="text" value=""
                                            autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory" for="txtInstitute">
                                            Student's Father Name</label>
                                        <input id="txtFather" class="form-control" placeholder="Enter Name of the Student" name=" txtInstitute" type="text" value="" runat="server"
                                            autofocus />
                                    </div>
                                </div>
                                <div class="clearfix">
                                </div>
                            </div>

                        </div>
                        <%----End of DeceasedDetails-----%>
                    </div>

                    <%---Start of Button----%>
                    <div class="row" id="divButton" runat="server">
                        <div class="col-md-12 box-container" id="divBtn">
                            <div class="box-body box-body-open" style="text-align: center;">
                                <%--<input type="button" id="btnSubmit" class="btn btn-success" value="Submit" />--%>
                                <asp:Button ID="btnSubmit" runat="server" CausesValidation="True"
                                    CssClass="btn btn-success" Text="Submit" OnClick="btnSubmit_Click" />
                                <asp:Button ID="btnCancel" runat="server" CausesValidation="True" CommandName="Cancel"
                                    CssClass="btn btn-danger" PostBackUrl=""
                                    Text="Cancel" />
                            </div>
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                    <%---End of Button----%>
                </div>
            </div>
        </div>
        <asp:HiddenField ID="HFServiceID" runat="server" Value="" />
        <input type="text" ng-show="false" id="ngServiceID" name="ServiceID" ng-value="ServiceID" value="100" ng-model="ServiceID" runat="server" visible="false" />

    </form>
</body>
</html>
