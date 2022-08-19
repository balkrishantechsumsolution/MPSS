<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/G2G/Master/G2GMaster.Master" AutoEventWireup="true" CodeBehind="NominateFaculty.aspx.cs" Inherits="CitizenPortal.WebApp.Faculty.NominateFaculty" %>

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

            .GridPager a:hover {
                background-color: #37495f;
                color: #fff;
            }

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

            var table = $("table[id$='grdView']").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable
        ({
            dom: 'Bfrtip',
            buttons: ['pageLength', 'excel', 'print'],
            "lengthMenu": [[10, 50, 100,-1], [10, 50, 100, 'All']],
            "iDisplayLength": 10
        });

        });

        function TakeAction(p_URL, p_ServiceID, p_AppID) {

            //var t_URL = ResolveUrl(p_URL);
            var t_URL = "/WebApp/Faculty/FacultyPage.aspx";
            t_URL = t_URL + "?ProfileID=" + p_AppID;
            window.open(t_URL, 'ViewDoc', 'height=' + screen.height + ',width=1000,titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes');
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
        <div class="row" id="page-wrapper" style="min-height: 500px !important;">
            <div class="row" id="div1" runat="server">
                <div class="row">
                    <div class="col-lg-12 cscPgehd">
                        <h2 class="form-heading">Nominate Faculty</h2>
                    </div>
                </div>
                <%---Start of Filter----%>
                <div class="row">
                    <div class="col-md-12 box-container">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Search Filter
                            </h4>
                        </div>
                        <div class="box-body box-body-open">                            
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="category">
                                        College</label>
                                    <asp:DropDownList ID="ddlCollege" runat="server" CssClass="form-control">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" InitialValue="0" ControlToValidate="ddlCollege" Display="Dynamic" Style="white-space: nowrap"
                                        ErrorMessage="Please select College" ValidationGroup="A" ForeColor="Red" SetFocusOnError="true" EnableClientScript="true" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlDepartment">
                                        Department 
                                    </label>
                                    <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>                                        
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" InitialValue="0" ControlToValidate="ddlDepartment" Display="Dynamic" Style="white-space: nowrap"
                                        ErrorMessage="Please select Department" ValidationGroup="A" ForeColor="Red" SetFocusOnError="true" EnableClientScript="true" />

                                </div>
                            </div>                            
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlCourse">
                                        Course 
                                    </label>
                                    <asp:DropDownList ID="ddlCourse" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlCourse_SelectedIndexChanged" AutoPostBack="true">
                                        <asp:ListItem Value="" Text="--Select--"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" InitialValue="0" ControlToValidate="ddlCourse" Display="Dynamic"
                                        ErrorMessage="Please select Course" ValidationGroup="A" ForeColor="Red" SetFocusOnError="true" EnableClientScript="true" />
                                </div>
                            </div>
                            
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlProgram">
                                        Program
                                    </label>
                                    <asp:DropDownList ID="ddlProgram" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlProgram_SelectedIndexChanged" AutoPostBack="true">
                                        <asp:ListItem Value="0">Select Program</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" InitialValue="0" ControlToValidate="ddlProgram" Display="Dynamic"
                                        ErrorMessage="Please select Program" ValidationGroup="A" ForeColor="Red" SetFocusOnError="true" EnableClientScript="true" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlSession">
                                        Exam Session
                                    </label>
                                    <asp:DropDownList ID="ddlSession" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                        <asp:ListItem Value="Apr-May 2021" Text="Apr-May 2021"></asp:ListItem>
                                        <asp:ListItem Value="Nov-Dec 2021" Text="Nov-Dec 2021"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" InitialValue="0" ControlToValidate="ddlSession" Display="Dynamic"
                                        ErrorMessage="Please select Session" ValidationGroup="A" ForeColor="Red" SetFocusOnError="true" EnableClientScript="true" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlSemester">
                                        Semester
                                    </label>
                                    <asp:DropDownList ID="ddlSemester" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlSemester_SelectedIndexChanged" AutoPostBack="true">
                                        <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                        <asp:ListItem Value="1" Text="1st Semester"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="2nd Semester"></asp:ListItem>
                                        <asp:ListItem Value="3" Text="3rd Semester"></asp:ListItem>
                                        <asp:ListItem Value="4" Text="4th Semester"></asp:ListItem>
                                        <asp:ListItem Value="5" Text="5th Semester"></asp:ListItem>
                                        <asp:ListItem Value="6" Text="6th Semester"></asp:ListItem>
                                        <asp:ListItem Value="7" Text="7th Semester"></asp:ListItem>
                                        <asp:ListItem Value="8" Text="8th Semester"></asp:ListItem>
                                        <asp:ListItem Value="9" Text="9th Semester"></asp:ListItem>
                                        <asp:ListItem Value="10" Text="10th Semester"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" InitialValue="0" ControlToValidate="ddlSemester" Display="Dynamic" Style="white-space: nowrap"
                                        ErrorMessage="Please select Semester" ValidationGroup="A" ForeColor="Red" SetFocusOnError="true" EnableClientScript="true" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory">Subject</label>
                                    <div class="col-xs-12 pleft0 pright0">
                                        <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-control">
                                            <asp:ListItem Value="0">--Select Subject--</asp:ListItem>
                                        </asp:DropDownList>
                                        <%--<asp:RequiredFieldValidator ID="rfv" runat="server" ControlToValidate="ddlSubject" InitialValue="0" Display="Dynamic"
                                            ErrorMessage="Please select Subject" ValidationGroup="A" ForeColor="Red" />--%>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlStatus">
                                        Status
                                    </label>
                                    <asp:DropDownList ID="ddlStatus" runat="server" AppendDataBoundItems="True"
                                        CssClass="form-control" ToolTip="Select Status">
                                        <asp:ListItem Value="0">-Select Status-</asp:ListItem>
                                        <asp:ListItem Value="P">Facualties for Nomination</asp:ListItem>
                                        <asp:ListItem Value="A">Nominated Faculty</asp:ListItem>
                                        <%--<asp:ListItem Value="R">Rejected</asp:ListItem>--%>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" InitialValue="0" ControlToValidate="ddlStatus" Display="Dynamic" Style="white-space: nowrap"
                                        ErrorMessage="Please select Status" ValidationGroup="A" ForeColor="Red" SetFocusOnError="true" EnableClientScript="true" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display: none">
                                <div class="form-group">
                                    <label class="" for="txtFacultyID">Faculty ID</label>
                                    <asp:TextBox runat="server" ID="txtFacultyID" class="form-control" placeholder="Application No" name="txtAppID" MaxLength="12" onkeypress="return isNumberKey(event);"
                                        type="text" value=""></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display: none">
                                <div class="form-group">
                                    <label class="" for="txtFromDate">
                                        From Date
                                    </label>
                                    <asp:TextBox ID="txtFromDate" runat="server" CssClass="form-control" placeholder="DD/MM/YYYY"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display: none">
                                <div class="form-group">
                                    <label class="" for="txtToDate">
                                        To Date
                                    </label>
                                    <asp:TextBox ID="txtToDate" runat="server" CssClass="form-control" placeholder="DD/MM/YYYY"></asp:TextBox>

                                </div>
                            </div>

                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-1 text-right">
                                <div class="form-group"><label class="" for="txtToDate">
                                        &nbsp;</label><asp:Button ID="btnSearch" runat="server" CausesValidation="true" CssClass="btn btn-success" ValidationGroup="A"
                                Text="Search" OnClick="btnSearch_Click" />
                                </div>
                            </div>
                            <div class="clearfix"></div>

                        </div>
                    </div>

                    <%---Start of Button----%>

                    <div class="col-md-12 box-container" style="display:none">
                        <div class="box-body box-body-open" style="text-align: center;">
                            
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
                <%---End of Button----%>
                <div class="row">
                    <div class="col-md-12 box-container">

                        <div id="divApp" class="row" runat="server">
                            <div class="col-md-12 box-container mtop20">
                                <div class="box-heading">
                                    <h4 class="box-title register-num">List of Applications
                                    </h4>
                                </div>
                                <div class="box-body box-body-open">
                                    <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto" Width="99%" Style="margin: 0 auto">
                                        <asp:GridView ID="gvDetail" CssClass="table table-striped table-bordered" runat="server" AllowPaging="true"
                                            Style="margin: 0 auto;" DataKeyNames="rowid" EmptyDataText="There is no data to display" PageSize="50"
                                            Width="100%" AutoGenerateColumns="False"
                                            OnPageIndexChanging="gvDetail_PageIndexChanging" OnRowCreated="gvDetail_RowCreated"
                                            OnRowDataBound="gvDetail_RowDataBound" ClientIDMode="Static">
                                            <PagerStyle CssClass="GridPager" />
                                        </asp:GridView>
                                    </asp:Panel>
                                </div>
                                <asp:HiddenField ID="HFRowID" runat="server" />
                                <asp:HiddenField ID="HFTabID" runat="server" />
                                <div class="clearfix"></div>
                            </div>



                        </div>
                    </div>
                </div>
                <asp:Panel ID="pnlApproval" CssClass="row" runat="server" Visible="True">

                    <div class="col-md-12 box-container">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Action
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="table-responsive">
                                <table width="100%">
                                    <tr>
                                        <td style="text-align: left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                        <td colspan="2" style="text-align: center"><b class="manadatory">Acceptance</b> </td>
                                        <td style="text-align: left">
                                            <asp:RadioButton ID="rbt_Approve" runat="server" GroupName="grp_approval" ValidationGroup="G" />
                                            Nominate&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <asp:RadioButton ID="rbt_Rejected" runat="server" GroupName="grp_approval" ValidationGroup="G" Visible="false" Text="Remove Nomination"/>
                                            
                                        </td>
                                        <td rowspan="2" style="text-align: center">
                                            <asp:Button ID="btn_Submit" runat="server" CausesValidation="True" CommandName="Insert" CssClass="btn btn-success" OnClick="btn_Submit_Click" Text="Submit" />
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:Button ID="btn_Cancel" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-danger" PostBackUrl="" Text="Cancel" />
                                        </td>
                                        <td rowspan="2" style="text-align: right">&nbsp;</td>
                                    </tr>
                                    <tr style="display: none">
                                        <td>&nbsp;</td>
                                        <td><b class="manadatory">Remark</b> </td>
                                        <td colspan="2">
                                            <asp:TextBox ID="txt_Remarks" runat="server" CssClass="lbl_value cmntbox" Height="55px" MaxLength="250"
                                                TextMode="MultiLine" ToolTip="Enter remark" Rows="2"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>                                
                            </div>
                        </div>
                    </div>

                    
                </asp:Panel>

            </div>

            <%----END of Filter-----%>
        </div>
    </div>
</asp:Content>
