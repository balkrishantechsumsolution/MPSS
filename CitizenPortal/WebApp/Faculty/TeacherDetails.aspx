<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/G2G/Master/G2GMaster.Master" AutoEventWireup="true" CodeBehind="TeacherDetails.aspx.cs" Inherits="CitizenPortal.WebApp.Faculty.TeacherDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Faculty Detail</title>
    <script src="/WebApp/Login/js/jquery-1.12.3.js"></script>
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/WebApp/Login/js/jquery.dataTables.min.js"></script>
    <script src="/WebApp/Citizen/Forms/Js/jqueryDataTableButtons-1.2.4.js"></script>
       
    <script src="/WebApp/Scripts/CommonScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/ValidationScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="TeacherDetails.js"></script>

    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <link href="/WebApp/G2G/OISF/css/allocationCenterStylesheet.css" rel="stylesheet" />
    <link href="/WebApp/Login/css/bootstrap.css" rel="stylesheet" />
    <link href="/g2c/css/hmepge.bootstrap.css" rel="stylesheet" />
    <link href="/WebApp/Citizen/Forms/Css/jQueryDataTableButtons.css" rel="stylesheet" />
    
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

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="Manager1" runat="server"></asp:ScriptManager>
    <div class="container-fluid">
        <div id="page-wrapper" style="min-height: 500px !important;">
            <div class="row">
                <div class="col-lg-12 cscPgehd">
                    <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>Faculty Profile</h2>
                </div>
            </div>
            <div class="row" runat="server" id="divSearch">

                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Faculty Details
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-md-12 box-container">

                            <div class="clearfix"></div>
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="overflow-y: auto;" id="divGrid" runat="server">
                                <asp:GridView ID="grdView" runat="server" Width="100%" OnRowDataBound="grdView_RowDataBound" OnPreRender="grdView_PreRender" 
                                    OnSelectedIndexChanged="grdView_SelectedIndexChanged" AutoGenerateSelectButton="True"></asp:GridView>
                            </div>


                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
            <div class="row" runat="server" id="divSubject">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Subject Details
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">College</label>
                                <asp:DropDownList ID="ddlCollege" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlCollege" InitialValue="0" Display="Dynamic"
                                    ErrorMessage="Please select College" ValidationGroup="A" ForeColor="Red" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-8 col-lg-8" style="text-align: right;">
                            <div class="box-body box-body-open">        
                                <label>&nbsp;</label>                        
                                <asp:Button ID="btnAdd" runat="server" CausesValidation="true" CssClass="btn btn-success"
                                    Text="Add Faculty" OnClick="btnAdd_Click" ValidationGroup="A" />
                                &nbsp;
                                    <asp:Button ID="btnEdit" runat="server" CausesValidation="true" CssClass="btn btn-danger"
                                        Text="Edit Faculty" ValidationGroup="E" OnClick="btnEdit_Click" />
                                &nbsp;
                                    <asp:Button ID="btnSearch" runat="server" CausesValidation="true" CssClass="btn btn-primary"
                                        Text="Faculty List" OnClick="btnSearch_Click" />
                                <asp:Button ID="btnRemove" runat="server" CausesValidation="true" CssClass="btn btn-default" Visible="false"
                                    Text="Remove" ValidationGroup="A" />
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>

        </div>
        <%---Start of Button----%>
        <div class="row" runat="server" id="div1">
            <div class="col-md-12 box-container">
                
            </div>
            <div class="clearfix">
            </div>
        </div>
        <%---End of Button----%>
        <div runat="server" id="divTeacher">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Faculty Details
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                         <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="ddlDepartment">
                                    Department 
                                </label>
                                <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>                                    
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" InitialValue="0" ControlToValidate="ddlDepartment" Display="Dynamic"
                                    ErrorMessage="Please select Department." ValidationGroup="G" ForeColor="Red" SetFocusOnError="true" EnableClientScript="true" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">Faculty's Designation</label>
                                
                                    <asp:DropDownList ID="ddlDesignation" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="0">--Select Designation--</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlDesignation" InitialValue="0" Display="Dynamic"
                                        ErrorMessage="Enter Faculty Designation" ValidationGroup="G" ForeColor="Red" />
                                
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">Faculty's Name</label>
                                
                                    <asp:TextBox ID="txtFaculty" CssClass="form-control" runat="server" placeholder="Faculty's Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFaculty" Display="Dynamic"
                                        ErrorMessage="Please enter Name of the Faculty" ValidationGroup="G" ForeColor="Red" />
                                
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory">Gender</label>
                                
                                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="0">--Select Gender--</asp:ListItem>
                                        <asp:ListItem Value="M">Male</asp:ListItem>
                                        <asp:ListItem Value="F">Female</asp:ListItem>
                                        <asp:ListItem Value="T">Transgender</asp:ListItem>
                                    </asp:DropDownList>
                                
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="ddlGender" InitialValue="0" Display="Dynamic"
                                        ErrorMessage="Please select Gender" ValidationGroup="G" ForeColor="Red" />
                                
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3" style="">
                            <div class="form-group">
                                <label class="manadatory" for="DOB">
                                    Date of Birth<span style="font-size: 11px;"></span>
                                </label>
                                
                                    <asp:TextBox ID="DOB" CssClass="form-control" runat="server" MaxLength="10" placeholder="dd/MM/YYYY"></asp:TextBox>
                                
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ControlToValidate="DOJ" Display="Dynamic"
                                        ErrorMessage="Please select Service Joining Date" ValidationGroup="G" ForeColor="Red" />
                                
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory">Faculty ID</label>
                                
                                    <asp:TextBox ID="txtRedgNo" CssClass="form-control" runat="server" MaxLength="10" placeholder="Faculty ID" ToolTip="University Registration No. as College Faculty"></asp:TextBox>
                                
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ControlToValidate="txtRedgNo" Display="Dynamic"
                                        ErrorMessage="Please enter Faculty ID" ValidationGroup="G" ForeColor="Red" />
                                
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-2">
                            <div class="form-group">
                                <label class="">Evaluator ID</label>
                                
                                    <asp:TextBox ID="txtEvaluator" CssClass="form-control" runat="server" MaxLength="10" placeholder="Evaluator Id" ToolTip="Evaluator Id"></asp:TextBox>
                                
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-2">
                            <div class="form-group">
                                <label class="">Have Statue 19 No.</label>
                                <asp:DropDownList ID="ddlStatue" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="0">--Select Statue 19--</asp:ListItem>
                                    <asp:ListItem Value="Y">Yes</asp:ListItem>
                                    <asp:ListItem Value="N">No</asp:ListItem>
                                </asp:DropDownList>
                                    
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3" style="">
                            <div class="form-group">
                                <label class="manadatory" for="DOJ">
                                    Date of Joining in the Service <span style="font-size: 11px;"></span>
                                </label>
                                
                                    <asp:TextBox ID="DOJ" CssClass="form-control" runat="server" MaxLength="10" placeholder="dd/MM/YYYY" onkeypress="return ValidateAlpha(event);"
                                        onkeydown=" return allowBackspace(event);" onchange="CalculateExperiance();"></asp:TextBox>
                               
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DOJ" Display="Dynamic"
                                        ErrorMessage="Please select Date of Birth" ValidationGroup="G" ForeColor="Red" />
                               
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                            <div class="form-group">
                                <label class="" id="lbldate" runat="server" for="DOJ">
                                </label>                                
                                    <asp:TextBox ID="txtExperiance" CssClass="form-control" runat="server" disabled="disabled"></asp:TextBox>                                
                            </div>
                        </div>                        
                        
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">Aadhar Number</label>
                               
                                    <asp:TextBox ID="txtAadhar" CssClass="form-control" runat="server" placeholder="Faculty's Aadhar No" onkeypress="return isNumberKey(event);" MaxLength="12"></asp:TextBox>
                                
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ControlToValidate="txtAadhar" Display="Dynamic"
                                        ErrorMessage="Please enter Aadhar No." ValidationGroup="G" ForeColor="Red" />
                                
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">PAN No.</label>                                
                                    <asp:TextBox ID="txtPAN" CssClass="form-control" runat="server" placeholder="Faculty's PAN No" MaxLength="10"></asp:TextBox>                               
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ControlToValidate="txtPAN" Display="Dynamic" ErrorMessage="Please enter Faculty PAN No" ValidationGroup="G" ForeColor="Red" />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtPAN" ValidationGroup="G" ForeColor="Red" Display="Dynamic" ErrorMessage="Please enter valid PAN No" ValidationExpression="[A-Z]{5}[0-9]{4}[A-Z]{1}"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">Mobile No.</label>                                
                                    <asp:TextBox ID="txtMobile" CssClass="form-control" runat="server" MaxLength="10" placeholder="Mobile No." onkeypress="return isNumberKey(event);"></asp:TextBox>                                
                                    <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ControlToValidate="txtMobile" Display="Dynamic"
                                        ErrorMessage="Please enter Faculty Mobile No" ValidationGroup="G" ForeColor="Red" />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtMobile" ValidationGroup="G" ForeColor="Red" Display="Dynamic" ErrorMessage="Please enter valid Mobile No" ValidationExpression="\d{10}" EnableTheming="True"></asp:RegularExpressionValidator>
                               
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                            <div class="form-group">
                                <label>WhatsApp No.</label>
                                <asp:TextBox ID="txtWhatsApp" CssClass="form-control" runat="server" MaxLength="10" onkeypress="return isNumberKey(event);" placeholder="WhatsApp No."></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtWhatsApp" ValidationGroup="G" ForeColor="Red" Display="Dynamic" ErrorMessage="Please enter valid WhatsApp No" ValidationExpression="\d{10}" EnableTheming="True"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                        
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory">Email ID</label>
                                <div class="col-xs-12 pleft0">
                                    <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" MaxLength="70" placeholder="Email ID"></asp:TextBox>
                                </div>
                                <div class="col-xs-12 pleft0 p5">
                                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Please enter Email ID." ValidationGroup="G" ForeColor="Red" />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ValidationGroup="G" ForeColor="Red" Display="Dynamic" ErrorMessage="Please enter valid email id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                </div>

                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-2" id="divStatus" runat="server">
                            <div class="form-group">
                                <label for="ddlStatus">
                                    Faculty Status
                                </label>
                                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="">--Select Status--</asp:ListItem>
                                    <asp:ListItem Value="P">Permanent</asp:ListItem>
                                    <asp:ListItem Value="T">Temporary</asp:ListItem>
                                    <asp:ListItem Value="G">Guest</asp:ListItem>  
                                    <asp:ListItem Value="1">Active</asp:ListItem>
                                    <asp:ListItem Value="0">InActive</asp:ListItem>                                  
                                </asp:DropDownList>
                                <div class="col-xs-12 pleft0 p5">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddlStatus" InitialValue="0" Display="Dynamic"
                                        ErrorMessage="Please select Status." ValidationGroup="G" ForeColor="Red" />
                                </div>
                            </div>
                        </div>


                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="display:none">
                            <div class="form-group">
                                <label>Remark</label>
                                <div class="col-xs-12 pleft0 pright0">
                                    <asp:TextBox ID="txtRemark" CssClass="form-control" runat="server" MaxLength="300" placeholder="Remark if any"></asp:TextBox>
                                </div>
                                <div class="col-xs-12 pleft0 p5">
                                </div>

                            </div>
                        </div>

                        <div class="clearfix"></div>
                    </div>
                </div>

                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Qualification & Experiance Detail
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">Specialization</label>                                
                                    <asp:TextBox ID="txtSpecilization" CssClass="form-control" runat="server" placeholder="Faculty's Specilization"></asp:TextBox>                               
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtSpecilization" Display="Dynamic"
                                        ErrorMessage="Enter Faculty Specialization" ValidationGroup="G" ForeColor="Red" />                                
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="ddlQualGraduation">Qualification in Graduation</label>                                
                                    <asp:DropDownList ID="ddlQualGraduation" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                                        <asp:ListItem Value="ADVANCED DESIGN AND MANUFACTURING">ADVANCED DESIGN AND MANUFACTURING</asp:ListItem>
                                        <asp:ListItem Value="Agriculture Engineering">Agriculture Engineering</asp:ListItem>
                                        <asp:ListItem Value="APPLIED ELECTRONICS & COMMUNICATION SYSTEM">APPLIED ELECTRONICS & COMMUNICATION SYSTEM</asp:ListItem>
                                        <asp:ListItem Value="APPLIED PHYSICS">APPLIED PHYSICS</asp:ListItem>
                                        <asp:ListItem Value="Architecture">Architecture</asp:ListItem>
                                        <asp:ListItem Value="Bio Medical">Bio Medical</asp:ListItem>
                                        <asp:ListItem Value="Bio-Technology">Bio-Technology</asp:ListItem>
                                        <asp:ListItem Value="BSC IN BIOLOGY">BSC IN BIOLOGY</asp:ListItem>
                                        <asp:ListItem Value="BSC IN COMPUTERS">BSC IN COMPUTERS</asp:ListItem>
                                        <asp:ListItem Value="BSC IN ELECTRONICS">BSC IN ELECTRONICS</asp:ListItem>
                                        <asp:ListItem Value="BSC IN MATHS">BSC IN MATHS</asp:ListItem>
                                        <asp:ListItem Value="Chemical Engineering">Chemical Engineering</asp:ListItem>
                                        <asp:ListItem Value="Civil Engineering">Civil Engineering</asp:ListItem>
                                        <asp:ListItem Value="Computer Application">Computer Application</asp:ListItem>
                                        <asp:ListItem Value="COMPUTER SCIENCE">COMPUTER SCIENCE</asp:ListItem>
                                        <asp:ListItem Value="COMPUTER SCIENCE & TECHNOLOGY">COMPUTER SCIENCE & TECHNOLOGY</asp:ListItem>
                                        <asp:ListItem Value="COMPUTER SCIENCE AND ENGINEERING (CYBER SECURITY)">COMPUTER SCIENCE AND ENGINEERING (CYBER SECURITY)</asp:ListItem>
                                        <asp:ListItem Value="Electrical & Electronics Engineering">Electrical & Electronics Engineering</asp:ListItem>
                                        <asp:ListItem Value="Electrical Engineering">Electrical Engineering</asp:ListItem>
                                        <asp:ListItem Value="Electronics & Telecommunication Engineering">Electronics & Telecommunication Engineering</asp:ListItem>
                                        <asp:ListItem Value="Electronics and Communication Engineering">Electronics and Communication Engineering</asp:ListItem>
                                        <asp:ListItem Value="Electronics and Instrumentation Engineering">Electronics and Instrumentation Engineering</asp:ListItem>
                                        <asp:ListItem Value="Fashion Engineering/Diploma">Fashion Engineering/Diploma</asp:ListItem>
                                        <asp:ListItem Value="GENERAL CHEMISTRY">GENERAL CHEMISTRY</asp:ListItem>
                                        <asp:ListItem Value="GENERAL MATHEMATICS">GENERAL MATHEMATICS</asp:ListItem>
                                        <asp:ListItem Value="GENERAL PHYSICS">GENERAL PHYSICS</asp:ListItem>
                                        <asp:ListItem Value="Human Resource Management">Human Resource Management</asp:ListItem>
                                        <asp:ListItem Value="Humanities (Language)">Humanities (Language)</asp:ListItem>
                                        <asp:ListItem Value="INDUSTRIAL AND  PRODUCTION ENGINEERING">INDUSTRIAL AND  PRODUCTION ENGINEERING</asp:ListItem>
                                        <asp:ListItem Value="INDUSTRIAL ENGINEERING">INDUSTRIAL ENGINEERING</asp:ListItem>
                                        <asp:ListItem Value="Information Technology">Information Technology</asp:ListItem>
                                        <asp:ListItem Value="MACHINE DESIGN AND ROBOTICS">MACHINE DESIGN AND ROBOTICS</asp:ListItem>
                                        <asp:ListItem Value="Marketing Management">Marketing Management</asp:ListItem>
                                        <asp:ListItem Value="Mechanical Engineering">Mechanical Engineering</asp:ListItem>
                                        <asp:ListItem Value="Metallurgical Engineering">Metallurgical Engineering</asp:ListItem>
                                        <asp:ListItem Value="Mining Engineering">Mining Engineering</asp:ListItem>
                                        <asp:ListItem Value="OTHERS">OTHERS</asp:ListItem>
                                        <asp:ListItem Value="Pharmaceutical Analysis and Quality Assurance">Pharmaceutical Analysis and Quality Assurance</asp:ListItem>
                                        <asp:ListItem Value="Pharmaceutical Chemistry">Pharmaceutical Chemistry</asp:ListItem>
                                        <asp:ListItem Value="Pharmaceutics">Pharmaceutics</asp:ListItem>
                                        <asp:ListItem Value="Pharmacognosy">Pharmacognosy</asp:ListItem>
                                        <asp:ListItem Value="Pharmacology">Pharmacology</asp:ListItem>
                                        <asp:ListItem Value="PRODUCTION ENGINEERING">PRODUCTION ENGINEERING</asp:ListItem>
                                        <asp:ListItem Value="Quality Assurance">Quality Assurance</asp:ListItem>
                                        <asp:ListItem Value="STRUCTURAL ENGINEERING AND CONSTRUCTION">STRUCTURAL ENGINEERING AND CONSTRUCTION</asp:ListItem>

                                    </asp:DropDownList>                                
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="ddlQualGraduation" InitialValue="0" Display="Dynamic"
                                        ErrorMessage="Select Graduation Equalification" ValidationGroup="G" ForeColor="Red" />                                
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                            <div class="form-group">
                                <label class="" for="ddlQualPostGraduation">
                                    Qualification in Post Graduation
                                </label>
                                <asp:DropDownList ID="ddlQualPostGraduation" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                    <asp:ListItem Value="ADVANCED ELECTRICAL POWER SYSTEM">ADVANCED ELECTRICAL POWER SYSTEM</asp:ListItem>
                                    <asp:ListItem Value="ANALYTICAL CHEMISTRY">ANALYTICAL CHEMISTRY</asp:ListItem>
                                    <asp:ListItem Value="APPLIED ELECTRONICS & COMMUNICATION SYSTEM">APPLIED ELECTRONICS & COMMUNICATION SYSTEM</asp:ListItem>
                                    <asp:ListItem Value="APPLIED PHYSICS">APPLIED PHYSICS</asp:ListItem>
                                    <asp:ListItem Value="Architecture">Architecture</asp:ListItem>
                                    <asp:ListItem Value="AYSTROPHYSICS">AYSTROPHYSICS</asp:ListItem>
                                    <asp:ListItem Value="Bio-Technology">Bio-Technology</asp:ListItem>
                                    <asp:ListItem Value="CAD/CAM">CAD/CAM</asp:ListItem>
                                    <asp:ListItem Value="Chemical Engineering">Chemical Engineering</asp:ListItem>
                                    <asp:ListItem Value="CIVIL & ENVIRONMENTAL ENGINEERING">CIVIL & ENVIRONMENTAL ENGINEERING</asp:ListItem>
                                    <asp:ListItem Value="CIVIL AND WATER MANAGEMENT ENGINEERING">CIVIL AND WATER MANAGEMENT ENGINEERING</asp:ListItem>
                                    <asp:ListItem Value="Civil Engineering">Civil Engineering</asp:ListItem>
                                    <asp:ListItem Value="CIVIL ENGINEERING (CONSTRUCTION TECHNOLOGY)">CIVIL ENGINEERING (CONSTRUCTION TECHNOLOGY)</asp:ListItem>
                                    <asp:ListItem Value="CIVIL ENGINEERING ENVIRONMENT & POLLUTION CONTROL">CIVIL ENGINEERING ENVIRONMENT & POLLUTION CONTROL</asp:ListItem>
                                    <asp:ListItem Value="COMMUNICATION & SIGNAL PROCESS">COMMUNICATION & SIGNAL PROCESS</asp:ListItem>
                                    <asp:ListItem Value="COMMUNICATION NETWORKS">COMMUNICATION NETWORKS</asp:ListItem>
                                    <asp:ListItem Value="Computer Application">Computer Application</asp:ListItem>
                                    <asp:ListItem Value="COMPUTER NETWORKING">COMPUTER NETWORKING</asp:ListItem>
                                    <asp:ListItem Value="COMPUTER SCIENCE">COMPUTER SCIENCE</asp:ListItem>
                                    <asp:ListItem Value="COMPUTER SCIENCE & TECHNOLOGY">COMPUTER SCIENCE & TECHNOLOGY</asp:ListItem>
                                    <asp:ListItem Value="COMPUTER SCIENCE AND ENGINEERING (CYBER SECURITY)">COMPUTER SCIENCE AND ENGINEERING (CYBER SECURITY)</asp:ListItem>
                                    <asp:ListItem Value="CONTROL & INSTRUMENT">CONTROL & INSTRUMENT</asp:ListItem>
                                    <asp:ListItem Value="CONTROL ENGINEERING">CONTROL ENGINEERING</asp:ListItem>
                                    <asp:ListItem Value="DESIGN ENGINEERING">DESIGN ENGINEERING</asp:ListItem>
                                    <asp:ListItem Value="Design of Process Machines">Design of Process Machines</asp:ListItem>
                                    <asp:ListItem Value="DIGITAL COMMUNICATION">DIGITAL COMMUNICATION</asp:ListItem>
                                    <asp:ListItem Value="DIGITAL ELECTRONICS">DIGITAL ELECTRONICS</asp:ListItem>
                                    <asp:ListItem Value="Electrical & Electronics Engineering">Electrical & Electronics Engineering</asp:ListItem>
                                    <asp:ListItem Value="ELECTRICAL DEVICES AND POWER SYSTEMS">ELECTRICAL DEVICES AND POWER SYSTEMS</asp:ListItem>
                                    <asp:ListItem Value="ELECTRICAL ENGG (INSTRUMENTATION & CONTROL)">ELECTRICAL ENGG (INSTRUMENTATION & CONTROL)</asp:ListItem>
                                    <asp:ListItem Value="Electrical Engineering">Electrical Engineering</asp:ListItem>
                                    <asp:ListItem Value="ELECTRONICS">ELECTRONICS</asp:ListItem>
                                    <asp:ListItem Value="Electronics & Telecommunication Engineering">Electronics & Telecommunication Engineering</asp:ListItem>
                                    <asp:ListItem Value="Electronics and Communication Engineering">Electronics and Communication Engineering</asp:ListItem>
                                    <asp:ListItem Value="Electronics and Instrumentation Engineering">Electronics and Instrumentation Engineering</asp:ListItem>
                                    <asp:ListItem Value="ENERGY AND ENVIRONMENTAL MANAGEMENT">ENERGY AND ENVIRONMENTAL MANAGEMENT</asp:ListItem>
                                    <asp:ListItem Value="Fashion Engineering/Diploma">Fashion Engineering/Diploma</asp:ListItem>
                                    <asp:ListItem Value="Financial Management">Financial Management</asp:ListItem>
                                    <asp:ListItem Value="GENERAL CHEMISTRY">GENERAL CHEMISTRY</asp:ListItem>
                                    <asp:ListItem Value="GENERAL MATHEMATICS">GENERAL MATHEMATICS</asp:ListItem>
                                    <asp:ListItem Value="GENERAL PHYSICS">GENERAL PHYSICS</asp:ListItem>
                                    <asp:ListItem Value="HIGH VOLTAGE AND POWER SYSTEMS ENGINEERING">HIGH VOLTAGE AND POWER SYSTEMS ENGINEERING</asp:ListItem>
                                    <asp:ListItem Value="Human Resource Management">Human Resource Management</asp:ListItem>
                                    <asp:ListItem Value="Humanities (Language)">Humanities (Language)</asp:ListItem>
                                    <asp:ListItem Value="INDUSTRIAL AND  PRODUCTION ENGINEERING">INDUSTRIAL AND  PRODUCTION ENGINEERING</asp:ListItem>
                                    <asp:ListItem Value="INDUSTRIAL ENGINEERING">INDUSTRIAL ENGINEERING</asp:ListItem>
                                    <asp:ListItem Value="INDUSTRIAL INSTRUMENTATION AND CONTROL">INDUSTRIAL INSTRUMENTATION AND CONTROL</asp:ListItem>
                                    <asp:ListItem Value="Information Technology">Information Technology</asp:ListItem>
                                    <asp:ListItem Value="INORGANIC CHEMISTRY">INORGANIC CHEMISTRY</asp:ListItem>
                                    <asp:ListItem Value="MACHINE DESIGN AND ROBOTICS">MACHINE DESIGN AND ROBOTICS</asp:ListItem>
                                    <asp:ListItem Value="MANUFACTURING SYSTEMS ENGINEERING MANUFACTURING TECHNOLOGY">MANUFACTURING SYSTEMS ENGINEERING MANUFACTURING TECHNOLOGY</asp:ListItem>
                                    <asp:ListItem Value="Marketing Management">Marketing Management</asp:ListItem>
                                    <asp:ListItem Value="MATERIAL ENGINEERING">MATERIAL ENGINEERING</asp:ListItem>
                                    <asp:ListItem Value="Mechanical Engineering">Mechanical Engineering</asp:ListItem>
                                    <asp:ListItem Value="Metallurgical Engineering">Metallurgical Engineering</asp:ListItem>
                                    <asp:ListItem Value="MICROWAVE AND COMMUNICATION ENGINEERING">MICROWAVE AND COMMUNICATION ENGINEERING</asp:ListItem>
                                    <asp:ListItem Value="Mining Engineering">Mining Engineering</asp:ListItem>
                                    <asp:ListItem Value="NANO TECHNOLOGY">NANO TECHNOLOGY</asp:ListItem>
                                    <asp:ListItem Value="OPERATION RESEARCH">OPERATION RESEARCH</asp:ListItem>
                                    <asp:ListItem Value="OPTICAL ENGINEERING">OPTICAL ENGINEERING</asp:ListItem>
                                    <asp:ListItem Value="ORGANIC CHEMISTRY">ORGANIC CHEMISTRY</asp:ListItem>
                                    <asp:ListItem Value="OTHERS">OTHERS</asp:ListItem>
                                    <asp:ListItem Value="Pharmaceutical Analysis and Quality Assurance">Pharmaceutical Analysis and Quality Assurance</asp:ListItem>
                                    <asp:ListItem Value="Pharmaceutical Chemistry">Pharmaceutical Chemistry</asp:ListItem>
                                    <asp:ListItem Value="Pharmaceutics">Pharmaceutics</asp:ListItem>
                                    <asp:ListItem Value="Pharmacognosy">Pharmacognosy</asp:ListItem>
                                    <asp:ListItem Value="Pharmacology">Pharmacology</asp:ListItem>
                                    <asp:ListItem Value="PHYSICAL CHEMISTRY">PHYSICAL CHEMISTRY</asp:ListItem>
                                    <asp:ListItem Value="Plastic Engineering">Plastic Engineering</asp:ListItem>
                                    <asp:ListItem Value="POWER AND ENERGY ENGINEERING">POWER AND ENERGY ENGINEERING</asp:ListItem>
                                    <asp:ListItem Value="POWER ELECTRONICS">POWER ELECTRONICS</asp:ListItem>
                                    <asp:ListItem Value="POWER SYSTEM AND CONTROL">POWER SYSTEM AND CONTROL</asp:ListItem>
                                    <asp:ListItem Value="POWER SYSTEMS AND AUTOMATION">POWER SYSTEMS AND AUTOMATION</asp:ListItem>
                                    <asp:ListItem Value="PRODUCTION ENGINEERING">PRODUCTION ENGINEERING</asp:ListItem>
                                    <asp:ListItem Value="Quality Assurance">Quality Assurance</asp:ListItem>
                                    <asp:ListItem Value="SIGNAL PROCESSING AND EMBEDDED SYSTEMS">SIGNAL PROCESSING AND EMBEDDED SYSTEMS</asp:ListItem>
                                    <asp:ListItem Value="SOFTWARE ENGINEERING">SOFTWARE ENGINEERING</asp:ListItem>
                                    <asp:ListItem Value="STRUCTURAL DESIGN">STRUCTURAL DESIGN</asp:ListItem>
                                    <asp:ListItem Value="STRUCTURAL ENGINEERING AND CONSTRUCTION">STRUCTURAL ENGINEERING AND CONSTRUCTION</asp:ListItem>
                                    <asp:ListItem Value="TRANSPORTATION ENGINEERING AND MANAGEMENT">TRANSPORTATION ENGINEERING AND MANAGEMENT</asp:ListItem>
                                    <asp:ListItem Value="URBAN AND REGIONAL PLANNING">URBAN AND REGIONAL PLANNING</asp:ListItem>
                                    <asp:ListItem Value="VLSI">VLSI</asp:ListItem>
                                    <asp:ListItem Value="VLSI AND EMBEDDED">VLSI AND EMBEDDED</asp:ListItem>
                                    <asp:ListItem Value="VLSI AND MICROELECTRONICS">VLSI AND MICROELECTRONICS</asp:ListItem>
                                    <asp:ListItem Value="WATER AND ENVIRONMENTAL TECHNOLOGY">WATER AND ENVIRONMENTAL TECHNOLOGY</asp:ListItem>

                                </asp:DropDownList>
                                <div class="col-xs-12 pleft0 p5">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="ddlQualPostGraduation" InitialValue="0" Display="Dynamic"
                                        ErrorMessage="Select Post Graduation Qualification" ValidationGroup="G" ForeColor="Red" />
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                            <div class="form-group">
                                <label class="text-nowrap" for="ddlQualDoctorate">
                                    Qualification in Doctorate
                                </label>
                                <asp:DropDownList ID="ddlQualDoctorate" runat="server" CssClass="form-control">

                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                    <asp:ListItem Value="ALGEBRA">ALGEBRA</asp:ListItem>
                                    <asp:ListItem Value="ANALYTICAL CHEMISTRY">ANALYTICAL CHEMISTRY</asp:ListItem>
                                    <asp:ListItem Value="APPLIED PHYSICS">APPLIED PHYSICS</asp:ListItem>
                                    <asp:ListItem Value="Bio-Technology">Bio-Technology</asp:ListItem>
                                    <asp:ListItem Value="CELESTIAL MECHANICS">CELESTIAL MECHANICS</asp:ListItem>
                                    <asp:ListItem Value="Chemical Engineering">Chemical Engineering</asp:ListItem>
                                    <asp:ListItem Value="CIVIL & ENVIRONMENTAL ENGINEERING">CIVIL & ENVIRONMENTAL ENGINEERING</asp:ListItem>
                                    <asp:ListItem Value="CIVIL AND WATER MANAGEMENT ENGINEERING">CIVIL AND WATER MANAGEMENT ENGINEERING</asp:ListItem>
                                    <asp:ListItem Value="Civil Engineering">Civil Engineering</asp:ListItem>
                                    <asp:ListItem Value="Computer Application">Computer Application</asp:ListItem>
                                    <asp:ListItem Value="COMPUTER SCIENCE">COMPUTER SCIENCE</asp:ListItem>
                                    <asp:ListItem Value="COMPUTER SCIENCE & TECHNOLOGY">COMPUTER SCIENCE & TECHNOLOGY</asp:ListItem>
                                    <asp:ListItem Value="CONTROL ENGINEERING">CONTROL ENGINEERING</asp:ListItem>
                                    <asp:ListItem Value="DESIGN ENGINEERING">DESIGN ENGINEERING</asp:ListItem>
                                    <asp:ListItem Value="Electrical & Electronics Engineering">Electrical & Electronics Engineering</asp:ListItem>
                                    <asp:ListItem Value="ELECTRICAL DEVICES AND POWER SYSTEMS">ELECTRICAL DEVICES AND POWER SYSTEMS</asp:ListItem>
                                    <asp:ListItem Value="Electrical Engineering">Electrical Engineering</asp:ListItem>
                                    <asp:ListItem Value="ELECTRONICS">ELECTRONICS</asp:ListItem>
                                    <asp:ListItem Value="Electronics & Telecommunication Engineering">Electronics & Telecommunication Engineering</asp:ListItem>
                                    <asp:ListItem Value="Electronics and Communication Engineering">Electronics and Communication Engineering</asp:ListItem>
                                    <asp:ListItem Value="ENVIRONMENTAL CHEMISTRY">ENVIRONMENTAL CHEMISTRY</asp:ListItem>
                                    <asp:ListItem Value="Financial Management">Financial Management</asp:ListItem>
                                    <asp:ListItem Value="FIXED POINT THEORY">FIXED POINT THEORY</asp:ListItem>
                                    <asp:ListItem Value="GENERAL CHEMISTRY">GENERAL CHEMISTRY</asp:ListItem>
                                    <asp:ListItem Value="GENERAL MATHEMATICS">GENERAL MATHEMATICS</asp:ListItem>
                                    <asp:ListItem Value="GENERAL PHYSICS">GENERAL PHYSICS</asp:ListItem>
                                    <asp:ListItem Value="Human Resource Management">Human Resource Management</asp:ListItem>
                                    <asp:ListItem Value="Humanities (Language)">Humanities (Language)</asp:ListItem>
                                    <asp:ListItem Value="INDUSTRIAL ENGINEERING">INDUSTRIAL ENGINEERING</asp:ListItem>
                                    <asp:ListItem Value="Information Technology">Information Technology</asp:ListItem>
                                    <asp:ListItem Value="LASER PHYSICS">LASER PHYSICS</asp:ListItem>
                                    <asp:ListItem Value="Marketing Management">Marketing Management</asp:ListItem>
                                    <asp:ListItem Value="Mechanical Engineering">Mechanical Engineering</asp:ListItem>
                                    <asp:ListItem Value="Metallurgical Engineering">Metallurgical Engineering</asp:ListItem>
                                    <asp:ListItem Value="Mining Engineering">Mining Engineering</asp:ListItem>
                                    <asp:ListItem Value="NETWORK SECURITY AND MANAGEMENT">NETWORK SECURITY AND MANAGEMENT</asp:ListItem>
                                    <asp:ListItem Value="NUCLEAR PHYSICS">NUCLEAR PHYSICS</asp:ListItem>
                                    <asp:ListItem Value="OPERATION RESEARCH">OPERATION RESEARCH</asp:ListItem>
                                    <asp:ListItem Value="ORGANIC CHEMISTRY">ORGANIC CHEMISTRY</asp:ListItem>
                                    <asp:ListItem Value="OTHERS">OTHERS</asp:ListItem>
                                    <asp:ListItem Value="Pharmaceutical Analysis and Quality Assurance">Pharmaceutical Analysis and Quality Assurance</asp:ListItem>
                                    <asp:ListItem Value="Pharmaceutical Chemistry">Pharmaceutical Chemistry</asp:ListItem>
                                    <asp:ListItem Value="Pharmaceutics">Pharmaceutics</asp:ListItem>
                                    <asp:ListItem Value="Pharmacognosy">Pharmacognosy</asp:ListItem>
                                    <asp:ListItem Value="Pharmacology">Pharmacology</asp:ListItem>
                                    <asp:ListItem Value="Plastic Engineering">Plastic Engineering</asp:ListItem>
                                    <asp:ListItem Value="POWER SYSTEM AND CONTROL">POWER SYSTEM AND CONTROL</asp:ListItem>
                                    <asp:ListItem Value="PRODUCTION ENGINEERING">PRODUCTION ENGINEERING</asp:ListItem>
                                    <asp:ListItem Value="Quality Assurance">Quality Assurance</asp:ListItem>
                                    <asp:ListItem Value="SOLID STATE PHYSICS">SOLID STATE PHYSICS</asp:ListItem>
                                    <asp:ListItem Value="STRUCTURAL DESIGN">STRUCTURAL DESIGN</asp:ListItem>
                                    <asp:ListItem Value="STRUCTURAL ENGINEERING AND CONSTRUCTION">STRUCTURAL ENGINEERING AND CONSTRUCTION</asp:ListItem>
                                    <asp:ListItem Value="URBAN AND REGIONAL PLANNING">URBAN AND REGIONAL PLANNING</asp:ListItem>

                                </asp:DropDownList>

                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                            <div class="form-group">
                                <label class="text-nowrap" for="ddlQualPostDoctorate">
                                    Qualification in Post Doctorate
                                </label>
                                <asp:DropDownList ID="ddlQualPostDoctorate" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                    <asp:ListItem Value="Bio-Technology">Bio-Technology</asp:ListItem>
                                    <asp:ListItem Value="CIVIL AND WATER MANAGEMENT ENGINEERING">CIVIL AND WATER MANAGEMENT ENGINEERING</asp:ListItem>
                                    <asp:ListItem Value="Electrical Engineering">Electrical Engineering</asp:ListItem>
                                    <asp:ListItem Value="Mechanical Engineering">Mechanical Engineering</asp:ListItem>
                                    <asp:ListItem Value="OTHERS">OTHERS</asp:ListItem>
                                    <asp:ListItem Value="Pharmaceutics">Pharmaceutics</asp:ListItem>
                                    <asp:ListItem Value="Pharmacognosy">Pharmacognosy</asp:ListItem>
                                </asp:DropDownList>

                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="txtUGExperiance">
                                    UG Experiance (in months)
                                </label>
                                <asp:TextBox ID="txtUGExperiance" CssClass="form-control" runat="server" MaxLength="6" placeholder="UG Experiance (in months)" onkeypress="return isNumberKey(event);"></asp:TextBox>
                                <div class="col-xs-12 pleft0 p5">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="txtUGExperiance" Display="Dynamic"
                                        ErrorMessage="Please enter UG Experiance" ValidationGroup="G" ForeColor="Red" />
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="" for="txtPGExperiance">
                                    PG Experiance (in months)
                                </label>
                                <asp:TextBox ID="txtPGExperiance" CssClass="form-control" runat="server" MaxLength="6" onkeypress="return isNumberKey(event);" placeholder="PG Experiance (in months)"></asp:TextBox>

                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="txtTotalExperiance">
                                    Total Teaching Experiance (in months)
                                </label>
                                <asp:TextBox ID="txtTotalExperiance" CssClass="form-control" runat="server" MaxLength="6" onkeypress="return isNumberKey(event);" placeholder="Total Teaching Experiance (in months)"></asp:TextBox>
                                <div class="col-xs-12 pleft0 p5">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" ControlToValidate="txtTotalExperiance" Display="Dynamic"
                                        ErrorMessage="Please Total Experiance" ValidationGroup="G" ForeColor="Red" />
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="" for="txtTotalExperiance">
                                    Industry/Research Experiance (in months)
                                </label>
                                <asp:TextBox ID="txtResExp" CssClass="form-control" runat="server" MaxLength="6" onkeypress="return isNumberKey(event);" placeholder="Insustry/Research Experiance (in months)"></asp:TextBox>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>

                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Address Detail
                        </h4>
                    </div>
                    <div class="box-body box-body-open">

                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="form-group">
                                <label class="manadatory">Address</label>
                                
                                    <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server" MaxLength="100" placeholder="Full Address"></asp:TextBox>
                                
                                    <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress" Display="Dynamic"
                                        ErrorMessage="Please Enter Address of the Faculty" ValidationGroup="G" ForeColor="Red" />
                                

                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory">District</label>
                                
                                    <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged" AutoPostBack="true">
                                        <asp:ListItem Value="0">--Select District--</asp:ListItem>
                                    </asp:DropDownList>
                                
                                    <asp:RequiredFieldValidator ID="rfvDistrict" runat="server" ControlToValidate="ddlDistrict" InitialValue="0" Display="Dynamic"
                                        ErrorMessage="Please select District." ValidationGroup="G" ForeColor="Red" />
                               
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                            <div class="form-group">
                                <label for="ddlTaluka">
                                    Block/Taluka
                                </label>
                                <asp:DropDownList ID="ddlBlock" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlBlock_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem Value="0">--Select District--</asp:ListItem>
                                </asp:DropDownList>
                                
                                    <asp:RequiredFieldValidator ID="rfvBlock" runat="server" ControlToValidate="ddlBlock" InitialValue="0" Display="Dynamic"
                                        ErrorMessage="Please select Block." ValidationGroup="G" ForeColor="Red" />
                                
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory text-nowrap" for="ddlVillage">
                                    Panchayat/Village/City
                                </label>
                                <asp:DropDownList ID="ddlVillage" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="0">--Select District--</asp:ListItem>
                                </asp:DropDownList>
                                
                                    <asp:RequiredFieldValidator ID="rfvVillage" runat="server" ControlToValidate="ddlVillage" InitialValue="0" Display="Dynamic"
                                        ErrorMessage="Please select Village/City." ValidationGroup="G" ForeColor="Red" />
                                
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                            <div class="form-group">
                                <label class="manadatory" for="txtPin">
                                    Pin Code
                                </label>
                                <asp:TextBox ID="txtPin" CssClass="form-control" runat="server" MaxLength="6" placeholder="Pin No." onkeypress="return isNumberKey(event);"></asp:TextBox>
                                
                                    <asp:RequiredFieldValidator ID="rfvPin" runat="server" ControlToValidate="txtPin" Display="Dynamic"
                                        ErrorMessage="Please enter Pin Code." ValidationGroup="G" ForeColor="Red" />
                                
                            </div>
                        </div>

                        <div class="clearfix"></div>
                    </div>
                </div>

                <div class="" runat="server" id="divBank">

                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Bank Detail
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory">Account Holder's Name</label>
                                    
                                        <asp:TextBox ID="txtName" CssClass="form-control" runat="server" placeholder="Name of Account Holder"></asp:TextBox>
                                    
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtName" Display="Dynamic"
                                            ErrorMessage="Please enter Name of Account Holder" ValidationGroup="G" ForeColor="Red" />
                                    
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory">Bank Account No.</label>
                                    <div class="col-xs-12 pleft0">
                                        <asp:TextBox ID="txtAccount" CssClass="form-control" runat="server" placeholder="Bank Acount No." TextMode="Password" onkeypress="return isNumberKey(event);"
                                            ncopy="return false;" oncut="return false;" onpaste="return false;" autocomplete="new-password"></asp:TextBox>
                                    
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtAccount" Display="Dynamic"
                                            ErrorMessage="Please enter Bank Account No." ValidationGroup="G" ForeColor="Red" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory">Re Enter Bank Account No.</label>
                                    
                                        <asp:TextBox ID="txtReAccount" CssClass="form-control" runat="server" placeholder="Bank Acount No." onkeypress="return isNumberKey(event);"
                                            ncopy="return false;" oncut="return false;" onpaste="return false;"></asp:TextBox>
                                    
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtReAccount" Display="Dynamic"
                                            ErrorMessage="Please Re-enter Bank Account No." ValidationGroup="G" ForeColor="Red" />
                                   
                                </div>
                            </div>


                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
                                <div class="form-group">
                                    <label class="manadatory">Name of the Bank</label>
                                        <asp:DropDownList ID="ddlBank" runat="server" CssClass="form-control">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="ddlBank" InitialValue="0" Display="Dynamic"
                                            ErrorMessage="Please select Bank" ValidationGroup="G" ForeColor="Red" />
                                </div>
                            </div>

                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory">IFSC Code</label>
                                    
                                        <asp:TextBox ID="txtIFSCCode" CssClass="form-control" runat="server" MaxLength="11" placeholder="IFSC Code"></asp:TextBox>
                                    
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtIFSCCode" Display="Dynamic"
                                            ErrorMessage="Please enter IFSC Code" ValidationGroup="G" ForeColor="Red" />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtIFSCCode" ValidationGroup="G" ForeColor="Red" Display="Dynamic" ErrorMessage="Please enter valid IFSC Code" ValidationExpression="^[A-Za-z]{4}0[A-Z0-9a-z]{6}$" EnableTheming="True"></asp:RegularExpressionValidator>

                                </div>

                            </div>                            
                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
                                <div class="form-group">
                                    <label class="manadatory">Bank Address</label>                                    
                                        <asp:TextBox ID="txtBankAddress" CssClass="form-control" runat="server" MaxLength="100" placeholder="Full Address"></asp:TextBox>                                    
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="txtBankAddress" Display="Dynamic"
                                            ErrorMessage="Please Enter Address of the Bank" ValidationGroup="G" ForeColor="Red" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="txtPin">
                                        Pin Code
                                    </label>
                                    <asp:TextBox ID="txtBankPin" CssClass="form-control" runat="server" MaxLength="6" placeholder="Pin No." onkeypress="return isNumberKey(event);"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="txtBankPin" Display="Dynamic"
                                            ErrorMessage="Please select Bank Pin Code." ValidationGroup="G" ForeColor="Red" />
                                </div>
                            </div>

                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>

            </div>
            <%---Start of Button----%>
            <div class="row" runat="server" id="divBtn">
                <div class="col-md-12 box-container">
                    <div class="box-body box-body-open" style="text-align: center;">
                        <asp:Button ID="btnSubmit" runat="server" CausesValidation="True" ToolTip=" Proceed to Payment"
                            CssClass="btn btn-success" Text="Submit" OnClick="btnSubmit_Click" ValidationGroup="G" />
                        <asp:Button ID="btnCancel" runat="server" CausesValidation="True" CommandName="Cancel" ToolTip="Refresh the page"
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

    <asp:HiddenField ID="hdnProfileID" runat="server" />
    <asp:HiddenField ID="hdnTeacherID" runat="server" />
    <asp:HiddenField ID="hdnExperience" runat="server" />
    <asp:HiddenField ID="hdnFlag" runat="server" />

    </div>
</asp:Content>
