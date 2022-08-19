<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/G2G/Master/G2GMaster.Master" AutoEventWireup="true" CodeBehind="BulkApproval.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.SU.BulkApproval" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />

    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />

    <style>
        .ui-widget-header {
            color: #333 !important;
            font-weight: normal !important;
        }

        .pagination {
            color: #000 !important;
            display: block !important;
            margin: 0 !important;
            padding: 10px;
        }

            .pagination label {
                display: inline-block;
                max-width: 100%;
                margin-bottom: 5px;
                font-weight: bold;
            }

        .SrvDiv {
            background-color: #fff;
            border: solid 1px #ddd;
            color: #045abc;
            width: 32.1%;
            margin: .5%;
            float: left;
            padding: .5%;
            overflow: auto;
            font-size: 18px;
            border-radius: 5px;
            border-left: solid 5px #B65838;
        }

            .SrvDiv a {
                color: #472A26;
                font-size: .9em;
                text-decoration: none;
                font-weight: bold;
            }

                .SrvDiv a:hover {
                    color: #5AB1D0;
                    font-size: .9em;
                    text-decoration: none;
                    font-weight: bolder;
                }

            .SrvDiv img {
                margin-right: 10px;
                border: none;
            }

            .SrvDiv span {
                line-height: 20px;
                margin: 10px 0 0 0;
                color: #767676;
                font-size: .65em;
            }

        .GridPager a, .GridPager span {
            display: block;
            padding: 5px 15px;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
        }

        .GridPager a {
            background-color: #f0f0f0;
            color: #545454;
            border: 1px solid #ddd;
        }
         .GridPager a:hover{ background-color:#37495f; color:#fff;}

        .GridPager span {
            background-color: #B65838;
            color: #fff;
            border: 1px solid #B65838;
        }
    </style>

    <script type="text/javascript">
        $(document).ready(function () {
            debugger;
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

        });

        function TakeAction(p_URL, p_ServiceID, p_AppID) {
            //var t_URL = ResolveUrl(p_URL);
            var t_URL = "/WebApp/Kiosk/CBCS/Acknowledgement.aspx";
            t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID;
            window.open(t_URL, 'ViewDoc', 'height=' + screen.height + ',width=' + screen.width + ',titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes');
            return false;
        }

        function ViewAdmitCard(p_URL, p_ServiceID, p_AppID) {
            //var t_URL = ResolveUrl(p_URL);
            var t_URL = p_URL;
            t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID;
            window.open(t_URL, 'ViewDoc', 'height=' + screen.height + ',width=' + screen.width + ',titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes');
            return false;
        }

    </script>
    <script type="text/javascript">
        $("[id*=RowID_ChkHdr]").live("click", function () {
            var chkHeader = $(this);
            var grid = $(this).closest("table");
            $("input[type=checkbox]", grid).each(function () {
                if (chkHeader.is(":checked")) {
                    $(this).attr("checked", "checked");
                    $("td", $(this).closest("tr")).addClass("selected");
                } else {
                    $(this).removeAttr("checked");
                    $("td", $(this).closest("tr")).removeClass("selected");
                }
            });
        });
        $("[id*=CheckBox1]").live("click", function () {
            var grid = $(this).closest("table");
            var chkHeader = $("[id*=RowID_ChkHdr]", grid);
            if (!$(this).is(":checked")) {
                $("td", $(this).closest("tr")).removeClass("selected");
                chkHeader.removeAttr("checked");
            } else {
                $("td", $(this).closest("tr")).addClass("selected");
                if ($("[id*=CheckBox1]", grid).length == $("[id*=CheckBox1]:checked", grid).length) {
                    chkHeader.attr("checked", "checked");
                }
            }
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" ClientIDMode="Static">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
    <div class="container-fluid">
        <div id="page-wrapper" style="min-height: 500px !important;">
            <div class="row">
                <div class="col-lg-12 cscPgehd">
                    <h2 class="form-heading">Bulk Approval</h2>
                </div>
            </div>
            <%---Start of Filter----%>
            <div style="">
                <div class="col-md-12 box-container">
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
                                <asp:TextBox ID="txtFromDate" runat="server" CssClass="form-control" placeholder="DD/MM/YYYY"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="txtToDate">
                                    To Date
                                </label>
                                <asp:TextBox ID="txtToDate" runat="server" CssClass="form-control" placeholder="DD/MM/YYYY"></asp:TextBox>

                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory" for="category">
                                    Application Type</label>
                                <asp:DropDownList ID="ddlServices" runat="server" Width="95%" CssClass="form-control">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                            <div class="form-group">
                                <label class="" for="category">
                                    College</label>
                                <asp:DropDownList ID="ddlCollege" runat="server" Width="95%" CssClass="form-control">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label class="" for="ddlGender">
                                    Branch/Cource Name
                                </label>
                                <asp:DropDownList ID="ddlBranch" runat="server" CssClass="form-control">
                                    <asp:ListItem>Select Branch</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>


                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="" for="ddlStatus">
                                    Application Status
                                </label>
                                <asp:DropDownList ID="ddlStatus" runat="server" AppendDataBoundItems="True"
                                    CssClass="form-control" ToolTip="Select Status">
                                    <asp:ListItem>-Select Status-</asp:ListItem>
                                    <asp:ListItem Value="P">Pending</asp:ListItem>
                                    <asp:ListItem Value="A">Approved</asp:ListItem>
                                    <asp:ListItem Value="R">Rejected</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="" for="txtAppID">Application No.</label>
                                <asp:TextBox runat="server" ID="txtAppID" class="form-control" placeholder="Application No" name="txtAppID" MaxLength="12" onkeypress="return isNumberKey(event);"
                                    type="text" value=""></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5 text-right">
                            <div class="form-group">
                                <label>
                                    &nbsp;</label><asp:Button ID="btnSearch" runat="server" CausesValidation="False" CssClass="btn btn-success"
                                        Text="Search" OnClick="btnSearch_Click" />
                            </div>
                        </div>
                        <div class="clearfix"></div>

                    </div>
                    <div id="divApp" runat="server">
                        <div class="col-md-12 box-container mtop20">
                            <div class="box-heading">
                                <h4 class="box-title register-num">List of Applications
                                </h4>
                            </div>

                            <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto" Width="100%" Style="margin: 0 auto">
                                <asp:GridView ID="gvDetail" CssClass="table table-striped table-bordered" runat="server" AllowPaging="true" AlternatingRowStyle-BackColor="#C2D69B"
                                    Style="margin: 0 auto;" DataKeyNames="rowid" EmptyDataText="There is no data to display" PageSize="50"
                                    Width="100%" AutoGenerateColumns="False"
                                    OnPageIndexChanging="gvDetail_PageIndexChanging" OnRowCreated="gvDetail_RowCreated"
                                    OnRowDataBound="gvDetail_RowDataBound" ClientIDMode="Static">
                                    <PagerStyle CssClass="GridPager" />
                                </asp:GridView>
                            </asp:Panel>

                            <asp:HiddenField ID="HFRowID" runat="server" />
                            <asp:HiddenField ID="HFTabID" runat="server" />

                        </div>

                        <asp:Panel ID="pnlApproval" runat="server" Visible="True">

                            <div class="col-md-12 box-container" style="margin-top: 20px;">
                                <div class="box-heading">
                                    <h4 class="box-title register-num">Comment :
                                    </h4>
                                </div>
                                <div class="box-body box-body-open">
                                    <div class="table-responsive">
                                        <table cellpadding="0" cellspacing="0" style="width: 100%; margin: 0 auto;">
                                            <tr>
                                                <td class="lbl_property" valign="middle" style="padding-left: 20px; width: 100px;"><b class="manadatory">Acceptance</b>
                                                </td>
                                                <td align="center" width="2%">:
                                                </td>
                                                <td class="lbl_Validator" width="2%">&nbsp;
                                                </td>
                                                <td align="left">
                                                    <table style="float: left">
                                                        <tr>
                                                            <td style="width: 120px">
                                                                <asp:RadioButton ID="rbt_Approve" runat="server" CssClass="lbl_value CheckBox" GroupName="grp_approval" Style="display: inline;"
                                                                    Text="Approved" Checked="True" />
                                                            </td>
                                                            <td></td>
                                                            <td style="width: 120px">
                                                                <asp:RadioButton ID="rbt_Rejected" runat="server" CssClass="lbl_value CheckBox" GroupName="grp_approval" Style="display: inline;"
                                                                    Text="Rejected" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" class="lbl_property" valign="top">&nbsp;
                                                </td>
                                                <td align="center" width="2%">&nbsp;
                                                </td>
                                                <td align="center" width="2%"></td>
                                                <td align="left">&nbsp;&nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lbl_property" valign="middle" style="padding-left: 20px;"><b class="manadatory">Comments</b>
                                                </td>
                                                <td align="center" width="2%">:
                                                </td>
                                                <td align="center" class="lbl_Validator" width="2%">&nbsp;
                                                </td>
                                                <td align="left">
                                                    <asp:TextBox ID="txt_Remarks" runat="server" CssClass="lbl_value cmntbox" Height="55px" MaxLength="250"
                                                        TabIndex="20" TextMode="MultiLine" Width="95%" ToolTip="Enter remark" Rows="4"
                                                        Columns="50"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" class="lbl_property"></td>
                                                <td align="center" width="2%"></td>
                                                <td align="center" width="2%"></td>
                                                <td align="left">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_Remarks"
                                                        CssClass="lbl_Validator" ErrorMessage="Comments are mandatory"></asp:RequiredFieldValidator>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>

                            <%---Start of Button----%>
                            <div class="row" id="divButton" runat="server">
                                <div class="col-md-12 box-container" id="divBtn">
                                    <div class="box-body box-body-open" style="text-align: center;">
                                        <asp:Button ID="btn_Submit" runat="server" CausesValidation="True" CommandName="Insert"
                                            CssClass="btn btn-success" TabIndex="40"
                                            Text="Submit" OnClick="btn_Submit_Click" />

                                        <asp:Button ID="btn_Cancel" runat="server" CausesValidation="False" CommandName="Cancel"
                                            CssClass="btn btn-danger" TabIndex="41"
                                            Text="Cancel" Width="120px" PostBackUrl="SUDashboard.aspx" />
                                    </div>
                                </div>
                                <div class="clearfix">
                                </div>
                            </div>
                            <%---End of Button----%>
                        </asp:Panel>
                    </div>
                </div>
            </div>


            <%----END of Filter-----%>
        </div>
    </div>
</asp:Content>
