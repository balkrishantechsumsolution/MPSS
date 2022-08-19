<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="Scrutiny.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.OISF.Scrutiny" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--<script src="../../Scripts/CommonScript.js"></script>--%>
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />

    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script src="/WebApp/Scripts/CommonScript.js"></script>
    <script src="/WebApp/Scripts/AddressScript.js"></script>
    <style>
        * {
            font-family: Arial !important;
            font-size: inherit;
        }
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
        .box-body label {
        display:inline !important;}
    </style>
    <script type="text/javascript">
        function ViewDetail(p_AppID, p_ServiceID) {
            var t_ServiceID = '388';

            if (p_ServiceID != "") t_ServiceID = p_ServiceID;

            var t_URL = "/WebApp/G2G/G2GAction.aspx";
            t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + t_ServiceID;
            window.open(t_URL, 'ViewDoc', 'height=' + screen.height + ',width=' + screen.width + ',titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes');
            return false;
        }

        $(document).ready(function () {
            $('#txtFromDate').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                yearRange: "-150:+0",
                maxDate: '0',

            });

            $('#txtToDate').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                yearRange: "-150:+0",
                maxDate: '0',

            });

            //var DistrictControl = "ddlDistrict";
            //GetDistrict("", "21", DistrictControl);
        });

        function CheckComment(p_RowID, p_i) {
            debugger;
            var ddlComment = $("#" + p_RowID + "_ddl_" + p_i + " option:selected").val();
            var CommentControl = $("#" + p_RowID + "_ddl_" + p_i);
            if (ddlComment == 0) {
                CommentControl.attr('style', 'border:1px solid #d03100 !important;width: 115px;height:20px;');
                CommentControl.css({ "background-color": "#fff2ee" });                
                alert('Please select the Reason for rejection');
                $("#" + p_RowID + "_rej_" + p_i).prop('checked', false);
                return false;
            }
            else {
                CommentControl.attr('style', 'border:1px solid #cdcdcd !important;width: 115px;height:20px;');
                CommentControl.css({ "background-color": "#ffffff" });
            }
        }

        function CheckCommentHold(p_RowID, p_i) {
            debugger;
            var ddlComment = $("#" + p_RowID + "_ddl_" + p_i + " option:selected").val();
            var CommentControl = $("#" + p_RowID + "_ddl_" + p_i);
            if (ddlComment == 0) {
                CommentControl.attr('style', 'border:1px solid #d03100 !important;width: 115px;height:20px;');
                CommentControl.css({ "background-color": "#fff2ee" });
                alert('Please select the Reason for Hold');
                $("#" + p_RowID + "_hold_" + p_i).prop('checked', false);
                return false;
            }
            else {
                CommentControl.attr('style', 'border:1px solid #cdcdcd !important;width: 115px;height:20px;');
                CommentControl.css({ "background-color": "#ffffff" });
            }
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" ClientIDMode="Static">
    <div id="page-wrapper" style="min-height: 311px;">
        <div class="row">
            <div class="col-lg-12">
            </div>
        </div>
        <div class="clearfix">
            <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>
                Scrutiny of Application for Recruitment Constable
            </h2>
        </div>
                <%---Start of Filter----%>
        <div class="row mt20" style="">
            <div class="col-md-12 box-container">
                <div runat="server" class="danger error bg-warning" id="divErr">
                            Please Select Payment Type to continue                            
                </div>
                <div class="box-heading">
                    <h4 class="box-title register-num">Search Filter
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory" for="txtFromDate">
                                From Date
                            </label>
                            <%--<input id="txtFromDate" class="form-control" placeholder="DD/MM/YYYY" name="DeceasedDOB" type="text" value="" />--%>
                            <asp:TextBox ID="txtFromDate" runat="server" CssClass="form-control" placeholder="DD/MM/YYYY"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory" for="txtToDate">
                                To Date
                            </label>
                            <%--<input id="txtToDate" class="form-control" placeholder="DD/MM/YYYY" name="DeceasedDOD" type="text" value="" />--%>
                            <asp:TextBox ID="txtToDate" runat="server" CssClass="form-control" placeholder="DD/MM/YYYY"></asp:TextBox>

                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory" for="category">
                                Category</label>
                            <%--<select class="form-control" data-val="true" data-val-number="Category" data-val-required="Please select your Category" id="category" name="Category">
                                <option value="Select Category">Select</option>
                                <option value="SC">SC</option>
                                <option value="ST">ST</option>
                                <option value="SEBC">SEBC</option>
                                <option value="UR">UR</option>
                            </select>--%>
                            <asp:DropDownList ID="ddlCategory" runat="server" Width="95%" CssClass="form-control">
                                <asp:ListItem Selected="True" Text="-Select-" Value="0"></asp:ListItem>
                                <asp:ListItem Text="SC" Value="SC"></asp:ListItem>
                                <asp:ListItem Text="ST" Value="ST"></asp:ListItem>
                                <asp:ListItem Text="SEBC" Value="SEBC"></asp:ListItem>
                                <asp:ListItem Text="UR" Value="UR"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" style="display: none">
                        <div class="form-group">
                            <label class="" for="ddlGender">
                                Service Name
                            </label>
                            <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" AutoPostBack="True"
                                CssClass="form-control" ToolTip="Select City or Town name (if doesnot exist select other)">
                                <asp:ListItem>Select Service</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" style="display: none">
                        <div class="form-group">
                            <label class="" for="state">
                                State
                            </label>
                            <asp:DropDownList ID="ddlState" runat="server" AutoPostBack="True" CssClass="form-control"
                                ToolTip="Select the State name (mandatory)">
                                <asp:ListItem Text="Select State" Value="0"> </asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory" for="ddlDistrict">
                                District</label>
                            <%--<select name="ddlDistrict" id="ddlDistrict" class="form-control" data-val="true" data-val-number="District." data-val-required="Please select District.">
                                <option value="0">Select District</option>
                            </select>--%>
                            <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="form-control">
                            </asp:DropDownList>
                        </div>
                    </div>                    
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display:none">
                        <div class="form-group">
                            <label class="manadatory" for="ddlVenue">
                                Venue</label>
                            <select name="ddlVenue" id="ddlVenue" class="form-control" data-val="true" data-val-number="Venue." data-val-required="Please select Venue.">
                                <option value="0">Select Venue</option>
                                <option value="103">Irrigation Ground, Naraj, Cuttuck</option>
                                <option value="104">Reserve Police Lines Grounds, Baxi Bazar, Cuttack</option>
                                <option value="101">OSAP 6th Battalions, OMP Square (Ground -I), Cuttack</option>
                                <option value="102">OSAP 6th Battalions, OMP Square (Ground -II), Cuttack</option>
                                
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" style="display: none">
                        <div class="form-group">
                            <label class="" for="Village">
                                Subdistrict
                            </label>
                            <asp:DropDownList ID="ddlTaluka" runat="server" AppendDataBoundItems="True" CssClass="form-control"
                                AutoPostBack="True" ToolTip="Select Subdistrict name (mandatory)">
                                <asp:ListItem>Select Subdistrict</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" style="display: none">
                        <div class="form-group">
                            <label class="" for="ddlGender">
                                Village
                            </label>
                            <asp:DropDownList ID="ddlVillage" runat="server" AppendDataBoundItems="True" AutoPostBack="True"
                                CssClass="form-control" ToolTip="Select City or Town name (if doesnot exist select other)">
                                <asp:ListItem>Select Village / City / Town</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display: none">
                        <div class="form-group">
                            <label class="" for="ddlGender">
                                Application ID
                            </label>
                            <asp:TextBox ID="txt_AppID" runat="server" CssClass="form-control" ToolTip=""></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" style="display: none">
                        <div class="form-group">
                            <label class="" for="ddlGender">
                                Applicant's Name
                            </label>
                            <asp:TextBox ID="txtApplicant" runat="server" CssClass="form-control" ToolTip=""></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" style="display: none">
                        <div class="form-group">
                            <label class="" for="ddlGender">
                                VLE Name (VLE ID)
                            </label>
                            <asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="True" AutoPostBack="True"
                                CssClass="form-control" ToolTip="Select VLE Name (VLE ID)">
                                <asp:ListItem>Select VLE Name (VLE ID)</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" style="display: none">
                        <div class="form-group">
                            <label class="" for="ddlGender">
                                Filter Count/Total Count
                            </label>
                            <label class="form-control" for="ddlGender" style="width: 160px; float: left;">
                                55 / 300
                            </label>
                            <a class="btn btn-darkorange green" style="float: right;" href="javascript:void(0);" title="Click to search the filtered record"><i class="fa fa-search"></i></a>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2 text-right">
                        <div class="form-group">
                            <label class="" for="">
                                &nbsp;</label>
                            <asp:Button ID="btnSearch" runat="server" CausesValidation="False" CssClass="btn btn-success" 
                                 Text="Search" OnClick="btnSearch_Click" />
                            </div>
                    </div>
                    <div class="clearfix">
                    </div>
                    
                </div>
            </div>
        </div>
        <%----END of Filter-----%>

        <div class="row">
            <div class="col-md-12 box-container" id="">
                <div class="box-body box-body-open p0">
                    <asp:Panel ID="divPrint" runat="server" Style="margin: 0 auto;">
                        <asp:Panel ID="pnlGrid" runat="server" style="margin: 0 auto;border:1px solid black;width:800px; ">
                            <div style="width: 385px; margin: 2px; padding: 2px; border: 1px solid #ccc; float: left;">
                                <div style="width: 95px; float: left;">
                                    <img style="width: 90px; height: 110px; border: 1px solid #dcdcdc; margin: 1px;" src="../Images/photo.png" />
                                </div>
                                <div style="width: 185px; float: left; margin: 1px 2px; border: 1px solid #ccc; padding: 2px; height: 110px;">
                                    <div style="font-family: Arial !important; font-size: 11px; padding-bottom: 1px;">
                                        Roll No.: G001001                
                                    </div>
                                    <div style="font-family: Arial !important; font-size: 11px; padding-bottom: 1px;">
                                        Name:                
                                    </div>
                                    <div style="font-family: Arial !important; font-size: 11px;">DOB (Age): </div>
                                    <div style="font-family: Arial !important; font-size: 11px; padding-bottom: 1px;">
                                        Religion (Category):                
                                    </div>
                                    <div style="font-family: Arial !important; font-size: 11px; padding-bottom: 1px;">
                                        Mobile No.:                
                                    </div>
                                    <div style="font-family: Arial !important; font-size: 11px; padding-bottom: 1px;">
                                        Payment: Rs.258.00 (SBI-Connect)                
                                    </div>
                                </div>
                                <div style="width: 95px; float: right; height: 50px;">
                                    <img style="width: 90px; height: 57px; border: 1px solid #ccc; margin: 1px;" src="../Images/photo.png" />
                                    <div style="padding: 5px; margin-top: 2px; border: 1px solid #ccc; font-family: Arial; font-size: 11px;">
                                        <input id="Checkbox1" type="radio" name="grpApp" /><span>Approved</span>
                                        <br />
                                        <input id="Checkbox2" type="radio" name="grpApp" /><span>Reject</span>
                                    </div>
                                </div>
                                <div style="clear: both"></div>
                            </div>
                            <div style="width: 385px; margin: 2px; padding: 2px; border: 1px solid #ccc; float: left;">
                                <div style="width: 95px; float: left;">
                                    <img style="width: 90px; height: 110px; border: 1px solid #dcdcdc; margin: 1px;" src="../Images/photo.png" />
                                </div>
                                <div style="width: 180px; float: left; margin: 1px 2px; border: 1px solid #ccc; padding: 2px; height: 110px;">
                                    <div style="font-family: Arial !important; font-size: 12px; padding-bottom: 1px;">
                                        Roll No.: G001001                
                                    </div>
                                    <div style="font-family: Arial !important; font-size: 12px; padding-bottom: 1px;">
                                        Name:                
                                    </div>
                                    <div style="font-family: Arial !important; font-size: 12px;">DOB (Age): </div>
                                    <div style="font-family: Arial !important; font-size: 12px; padding-bottom: 1px;">
                                        Religion (Category):                
                                    </div>
                                    <div style="font-family: Arial !important; font-size: 12px; padding-bottom: 1px;">
                                        Mobile No.:                
                                    </div>
                                    <div style="font-family: Arial !important; font-size: 12px; padding-bottom: 1px;">
                                        Payment: Rs.258.00 (SBI-Connect)                
                                    </div>
                                </div>
                                <div style="width: 95px; float: right; height: 50px;">
                                    <img style="width: 90px; height: 57px; border: 1px solid #ccc; margin: 1px;" src="../Images/photo.png" />
                                    <div style="padding: 5px; margin-top: 2px; border: 1px solid #ccc; font-family: Arial; font-size: 11px;">
                                        <input id="Checkbox1" type="radio" name="grpApp" /><span>Approved</span>
                                        <br />
                                        <input id="Checkbox2" type="radio" name="grpApp" /><span>Reject</span>
                                    </div>
                                </div>
                                <div style="clear: both"></div>
                            </div>
                        </asp:Panel>
                        <div class="clearfix">
                        </div>
                       
                        
                    </asp:Panel>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
        </div>
        <%---Start of Button----%>
        <div class="row">
            <div class="col-md-12 box-container" id="divBtn">
                <div class="box-body box-body-open" style="text-align: center;">
<asp:Button ID="btnSubmit" runat="server" CausesValidation="False" CssClass="btn btn-success" 
                                 Text="Submit" OnClick="btnSubmit_OnClick"  />
                    <input type="button" id="btnPrint" class="btn btn-success" value="Print" onclick="javascript: CallPrint('divPrint');" />
                </div>
            </div>
            <div class="clearfix">
            </div>
        </div>
        <%----END of Button-----%>
    </div>

    <%--<div style="width: 450px; margin: 5px auto; font-size: 11px;padding:2px;border:1px solid #ccc;">
        <div style="width: 100px; float: left;">
            <img style="width: 98px; height: 110px; border: 1px solid #dcdcdc; margin: 1px;" src="../Images/photo.png" />
        </div>
        <div style="width: 210px; float: left;margin:2px 7px;">
            <div>
                Roll No.: G001001                
            </div>
            <div>
                Name:                
            </div>
            <div>DOB (Age): </div>
            <div>
                Religion (Category):                
            </div>
            <div>
                Roll No.:                
            </div>
        </div>
        <div style="width: 100px; float: right">
            <img style="width: 98px; height: 55px; border: 1px solid #fcfcfc; margin: 1px;" src="../Images/photo.png" />
            <div style="width: 100px; float: right">
                <input id="Checkbox1" type="radio" name="grpApp"/><span> Approved</span>
                <br />
                <input id="Checkbox2" type="radio" name="grpApp" /><span> Reject</span>
            </div>
        </div>
        <div style="clear: both"></div>
    </div>--%>
    <div>
    </div>
</asp:Content>
