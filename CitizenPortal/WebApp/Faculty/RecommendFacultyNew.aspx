<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/G2G/Master/G2GMaster.Master" AutoEventWireup="true" CodeBehind="RecommendFacultyNew.aspx.cs" Inherits="CitizenPortal.WebApp.Faculty.RecommendFacultyNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Data Entry Report View</title>
    <script src="/WebApp/Login/js/jquery-1.12.3.js"></script>
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/WebApp/Login/js/jquery.dataTables.min.js"></script>
    <script src="/WebApp/Citizen/Forms/Js/jqueryDataTableButtons-1.2.4.js"></script>

    <script src="/WebApp/Scripts/CommonScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/ValidationScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>


    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <link href="/WebApp/G2G/OISF/css/allocationCenterStylesheet.css" rel="stylesheet" />
    <link href="/WebApp/Login/css/bootstrap.css" rel="stylesheet" />
    <link href="/g2c/css/hmepge.bootstrap.css" rel="stylesheet" />
    <link href="/WebApp/Citizen/Forms/Css/jQueryDataTableButtons.css" rel="stylesheet" />

    <script type="text/javascript">

        $(document).ready(function () {
            var table = $("table[id$='gvDetail']").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable
            ({
                dom: 'Bfrtip',
                buttons: ['pageLength', 'excel', 'print'],
                "lengthMenu": [[10, 50, 100, -1], [10, 50, 100, 'All']],
                "iDisplayLength": 100
            });


        });
    </script>
    <script type="text/javascript">

        function TakeAction(p_URL, p_ServiceID, p_AppID) {
            //alert(p_URL, p_ServiceID, p_AppID);
            //var t_URL = ResolveUrl(p_URL);
            var t_URL = "/WebApp/Faculty/FacultyPage.aspx";
            t_URL = t_URL + "?ProfileID=" + p_AppID;
            window.open(t_URL, 'ViewDoc', 'height=' + screen.height + ',width=1000,titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes');
            return false;
        }

    </script>
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

        table.dataTable thead .sorting, table.dataTable thead .sorting_asc, table.dataTable thead .sorting_desc, table.dataTable thead .sorting_asc_disabled, table.dataTable thead .sorting_desc_disabled {
            background-color: #4879a9 !important;
        }

        div.dataTables_wrapper div.dataTables_info {
            color: #4879a9 !important;
        }

        #DataGridView .current {
            background-color: #4879a9 !important;
            color: #fff !important;
        }

        #tamt {
            display: inline-block;
            font-size: 1.2em;
            color: #fff;
            vertical-align: middle;
        }
    </style>

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



    <%-- <script type="text/javascript">
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
    </script>--%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:scriptmanager id="Manager1" runat="server"></asp:scriptmanager>
    <div class="container-fluid">
        <div id="page-wrapper" style="min-height: 500px !important;">
            <div class="row">
                <div class="col-lg-12 cscPgehd">
                    <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>Faculty Recommendation</h2>
                </div>
            </div>
            <div class="row" runat="server" id="divSubject">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Subject Details
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="ddlSession">
                                    Exam Session
                                </label>
                                <asp:dropdownlist id="ddlSession" runat="server" cssclass="form-control">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                    <asp:ListItem Value="Apr-May 2022" Text="Apr-May 2022"></asp:ListItem>
                                    <asp:ListItem Value="Nov-Dec 2021" Text="Nov-Dec 2021"></asp:ListItem>
                                </asp:dropdownlist>
                                <asp:requiredfieldvalidator id="RequiredFieldValidator9" runat="server" initialvalue="0" controltovalidate="ddlSession" display="Dynamic"
                                    errormessage="Please select Session" validationgroup="A" forecolor="Red" setfocusonerror="true" enableclientscript="true" />
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="ddlDepartment">
                                    Department 
                                </label>
                                <asp:dropdownlist id="ddlDepartment" runat="server" cssclass="form-control">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                </asp:dropdownlist>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" InitialValue="0" ControlToValidate="ddlDepartment" Display="Dynamic"
                                    ErrorMessage="Please select Department." ValidationGroup="A" ForeColor="Red" SetFocusOnError="true" EnableClientScript="true" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="ddlCourse">
                                    Course 
                                </label>
                                <asp:dropdownlist id="ddlCourse" runat="server" cssclass="form-control" onselectedindexchanged="ddlCourse_SelectedIndexChanged" autopostback="true">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                </asp:dropdownlist>
                                <asp:requiredfieldvalidator id="RequiredFieldValidator6" runat="server" initialvalue="0" controltovalidate="ddlCourse" display="Dynamic"
                                    errormessage="Please select Course" validationgroup="G" forecolor="Red" setfocusonerror="true" enableclientscript="true" />
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="ddlProgram">
                                    Program
                                </label>
                                <asp:dropdownlist id="ddlProgram" runat="server" cssclass="form-control" onselectedindexchanged="ddlProgram_SelectedIndexChanged" autopostback="true">
                                    <asp:ListItem Value="0">Select Program</asp:ListItem>
                                </asp:dropdownlist>
                                <asp:requiredfieldvalidator id="RequiredFieldValidator29" runat="server" initialvalue="0" controltovalidate="ddlProgram" display="Dynamic"
                                    errormessage="Please select Program" validationgroup="G" forecolor="Red" setfocusonerror="true" enableclientscript="true" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="ddlSemester">
                                    Semester
                                </label>
                                <asp:dropdownlist id="ddlSemester" runat="server" cssclass="form-control" onselectedindexchanged="ddlSemester_SelectedIndexChanged" autopostback="true">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>                                    
                                </asp:dropdownlist>
                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" InitialValue="0" ControlToValidate="ddlSemester" Display="Dynamic" Style="white-space: nowrap"
                                    ErrorMessage="Please select Semester" ValidationGroup="A" ForeColor="Red" SetFocusOnError="true" EnableClientScript="true" />--%>
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">QP Subject</label>
                                <div class="col-xs-12 pleft0 pright0">
                                    <asp:dropdownlist id="ddlSubject" runat="server" cssclass="form-control">
                                        <asp:ListItem Value="0">--Select Subject--</asp:ListItem>
                                    </asp:dropdownlist>
                                    <asp:requiredfieldvalidator id="rfv" runat="server" controltovalidate="ddlSubject" initialvalue="0" display="Dynamic"
                                        errormessage="Please select Subject" validationgroup="G" forecolor="Red" />
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="" for="ddlStatus">
                                    Status
                                </label>
                                <asp:dropdownlist id="ddlStatus" runat="server" appenddatabounditems="True"
                                    cssclass="form-control" tooltip="Select Status">
                                    <asp:ListItem Value="0">-Select Status-</asp:ListItem>
                                    <asp:ListItem Value="P">Nominated List by Principal</asp:ListItem>
                                    <asp:ListItem Value="A">Recommended List by Committee</asp:ListItem>
                                </asp:dropdownlist>
                                <asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server" initialvalue="0" controltovalidate="ddlStatus" display="Dynamic"
                                    errormessage="Please select Status" validationgroup="A" forecolor="Red" setfocusonerror="true" enableclientscript="true" />
                            </div>
                        </div>
                        
                        <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="ddlProgram">
                                    Faculty Program
                                </label>
                                <asp:dropdownlist id="ddlFacultyProg" runat="server" cssclass="form-control" autopostback="true" OnSelectedIndexChanged="ddlFacultyProg_SelectedIndexChanged">
                                    <asp:ListItem Value="0">Select Program</asp:ListItem>
                                </asp:dropdownlist>
                                <asp:requiredfieldvalidator id="RequiredFieldValidator3" runat="server" initialvalue="0" controltovalidate="ddlFacultyProg" display="Dynamic"
                                    errormessage="Please select Program" validationgroup="G" forecolor="Red" setfocusonerror="true" enableclientscript="true" />
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">Faculty Subject</label>
                                <div class="col-xs-12 pleft0 pright0">
                                    <asp:dropdownlist id="ddlFacultySubject" runat="server" cssclass="form-control">
                                        <asp:ListItem Value="0">--Select Subject--</asp:ListItem>
                                    </asp:dropdownlist>
                                    <%--<asp:requiredfieldvalidator id="Requiredfieldvalidator2" runat="server" controltovalidate="ddlFacultySubject" initialvalue="0" display="Dynamic"
                                        errormessage="select Faculty Subject" validationgroup="G" forecolor="Red" />--%>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-1 text-right pull-right" style="margin:0 auto !important;padding:0 !important;">
                            <div class="form-group">
                                <label>&nbsp; </label>
                                    <asp:button id="btnSearch" runat="server" causesvalidation="true" cssclass="btn btn-primary"
                                        text="Faculty List" onclick="btnSearch_Click" validationgroup="A" />
                            </div>
                        </div>
                       
                        
                        
 <div class="clearfix"></div>
                    </div>
                </div>
            </div>

            <div class="row">

                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Faculties Detail
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-md-12 box-container">

                            <asp:panel id="Panel1" runat="server" scrollbars="Auto" width="100%" style="margin: 0 auto">
                                <asp:GridView ID="gvDetail" CssClass="table table-striped table-bordered" runat="server" 
                                    Style="margin: 0 auto;" DataKeyNames="rowid" EmptyDataText="There is no data to display" 
                                    Width="100%" AutoGenerateColumns="False"
                                    OnRowCreated="gvDetail_RowCreated"
                                    OnRowDataBound="gvDetail_RowDataBound" ClientIDMode="Static">
                                    
                                </asp:GridView>
                            </asp:panel>

                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="row" runat="server" id="divSearch">
                        <div class="col-md-12 box-container" style="margin-top: 20px;">
                            <div class="box-heading">
                                <h4 class="box-title register-num">Action
                                </h4>
                            </div>
                            <div class="box-body box-body-open">
                                <div class="col-md-12 box-container">
                                    <table width="100%">
                                        <tr>
                                            <td colspan="2" style="text-align: left"><b class="manadatory">Acceptance</b>
                                            </td>
                                            <td>
                                                <asp:radiobutton id="rbt_Approve" runat="server" groupname="grp_approval" validationgroup="G" causesvalidation="true" />
                                                Recommended&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <asp:radiobutton id="rbt_Rejected" runat="server" groupname="grp_approval" validationgroup="G" causesvalidation="true" />
                                                Not Recommended<br />
                                            </td>
                                            <td rowspan="2" style="text-align: right">

                                                <asp:button id="btnSubmit" runat="server" causesvalidation="True" tooltip=" Submit Detail" validationgroup="G"
                                                    cssclass="btn btn-success" text="Submit" onclick="btn_Submit_Click" />
                                            </td>
                                        </tr>
                                        <tr style="display: none">
                                            <td><b class="manadatory">Remark</b>
                                            </td>
                                            <td colspan="2">
                                                <asp:textbox id="txt_Remarks" runat="server" cssclass="lbl_value cmntbox" height="55px" maxlength="250"
                                                    textmode="MultiLine" width="100%" tooltip="Enter remark" rows="2"></asp:textbox>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <%---Start of Button----%>
            <div class="row" runat="server" id="divBtn">
                <div class="col-md-12 box-container">
                    <div class="box-body box-body-open" style="text-align: center;">
                        <asp:button id="btnAdd" runat="server" cssclass="btn btn-primary" PostBackUrl="~/WebApp/Faculty/SpecialFaculty.aspx"
                            text="Special Faculty"/>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:button id="btnPrint" runat="server" causesvalidation="true" cssclass="btn btn-success" tooltip="Print Acknowledgement"
                            text="Print Acknowledgement" validationgroup="A" onclick="btnPrint_Click" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:button id="btnCancel" runat="server" causesvalidation="True" commandname="Cancel" tooltip="Refresh the page"
                                cssclass="btn btn-danger" postbackurl="" text="Cancel" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </div>
                </div>
                <div class="clearfix">
                </div>
            </div>
            <%---End of Button----%>
        </div>

        <asp:hiddenfield id="hdnProfileID" runat="server" />
        <asp:hiddenfield id="hdnTeacherID" runat="server" />
        <asp:hiddenfield id="hdnExperience" runat="server" />
        <asp:hiddenfield id="hdnFlag" runat="server" />

    </div>
</asp:Content>
