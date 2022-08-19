<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/G2G/Master/G2GMaster.Master" AutoEventWireup="true" CodeBehind="CollegeMaster.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.SU.CollegeMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/WebApp/Login/js/jquery-1.12.3.js"></script>
    
    <script src="/WebApp/Login/js/jquery.dataTables.min.js"></script>
    <script src="/WebApp/Citizen/Forms/Js/jqueryDataTableButtons-1.2.4.js"></script>
    <link href="/WebApp/Citizen/Forms/Css/jQueryDataTableButtons.css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {


            debugger;
            var table = $("table[id$='grdView']").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable
                ({
                    dom: 'Bfrtip',
                    buttons: ['pageLength', 'excel', 'print'],
                    "lengthMenu": [[10, 50, 100,-1], [10, 50, 100, 'All']],
                    "iDisplayLength": 100
                });
            
        });
        </script>

    <style>
    table.dataTable thead .sorting, table.dataTable thead .sorting_asc, table.dataTable thead .sorting_desc, table.dataTable thead .sorting_asc_disabled, table.dataTable thead .sorting_desc_disabled {
            background-color: #2f4e6c !important;
        }

        div.dataTables_wrapper div.dataTables_info {
            color: #2f4e6c !important;
        }

        #grdView .current {
            background-color: #2f4e6c !important;
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
    <div id="page-wrapper" style="min-height: 500px !important;">
        <div class="row">
            <div class="col-lg-12 cscPgehd">
                <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>College Master</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">Upload College in Bulk (through Excel)
                    </h4>
                </div>
                <div class="box-body box-body-open">                    
                    <div class="col-xs-12 col-sm-2 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="" for="FU1">
                                Select College Master Excel File to Upload
                            </label>
                            <asp:FileUpload ID="FU1" runat="server" TabIndex="3" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label>&nbsp;</label>
                            <asp:Button ID="btnSave" runat="server" CssClass="btn btn-success" Text="Upload Excel" OnClick="btnSave_Click" OnClientClick="javascript:return ValidateUploadFile();" />
                            &nbsp;<asp:Button ID="btnInsert" runat="server" CssClass="btn btn-primary" Text="Insert Data" OnClick="btnInsert_Click" />
                        </div>
                    </div>                    
                    <div class="col-xs-12 col-sm-2 col-md-6 col-lg-4 text-right">
                        <div class="form-group">
                            <label class="" for="ddlBranch">
                                Check Sample Excel File</label>
                            <asp:LinkButton ID="lbtnSample" ToolTip="Download Sample Template" runat="server"  Text="College Master Excel File" OnClientClick="return downloadSample();" CssClass="btn btn-grey"></asp:LinkButton>
                        </div>
                    </div>

                    <div class="clearfix">
                    </div>
                </div>
                
            </div>

            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container" runat="server" id="divCollege">
                <div class="box-heading">
                    <h4 class="box-title register-num">Insert College Details
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">College Code</label>
                            <asp:TextBox ID="txtCollegeCode" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory">College Name</label>
                            <asp:TextBox ID="txtCollege" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">District</label>
                            <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="form-control">
                                <asp:ListItem Value="0">--Select District--</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">Affiliation Type</label>
                            <asp:DropDownList ID="ddlType" runat="server" CssClass="form-control">
                                <asp:ListItem Value="0">--Select Affilation Type--</asp:ListItem>
                                <asp:ListItem Value="Y">Approved</asp:ListItem>
                                <asp:ListItem Value="A">AUTONOMOUS</asp:ListItem>
                                <asp:ListItem Value="U">UNITARY UNIVERSITY</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory">Email ID</label>
                            <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" MaxLength="70" placeholder="College Email ID"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory">Mobile No.</label>
                            <asp:TextBox ID="txtMobile" CssClass="form-control" runat="server" MaxLength="10" placeholder="Mobile No."></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                        <div class="form-group">
                            <label>Phone No.</label>
                            <asp:TextBox ID="txtPhone" CssClass="form-control" runat="server" MaxLength="15" placeholder="Phone No."></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
                        <div class="form-group">
                            <label>Address</label>
                            <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server" MaxLength="100" placeholder="Full Address"></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
                        <div class="form-group">
                            <label>Attachment (Approval Letter)</label>
                            <asp:FileUpload ID="fileAffilation" runat="server" CssClass="form-control" />
                        </div>
                    </div>

                    <div class="clearfix"></div>
                </div>
                </div>
            <%---Start of Button----%>
            <div class="col-md-12 box-container" runat="server" id="divBtn">
                <div class="box-body box-body-open" style="text-align: center;">
                    <asp:Button ID="btnSubmit" runat="server" CausesValidation="True" ToolTip=" Proceed to Payment"
                        CssClass="btn btn-success" Text="Submit" OnClick="btnSubmit_Click" />
                    <asp:Button ID="btnCancel" runat="server" CausesValidation="True" CommandName="Cancel" ToolTip="Refresh the page"
                        CssClass="btn btn-danger" PostBackUrl=""
                        Text="Cancel" />
                    <asp:Button ID="btnCollege" runat="server"
                        CssClass="btn btn-primary" PostBackUrl="" ToolTip="Show All College List"
                        Text="College List" OnClick="btnCollege_Click" />
                </div>
            </div>
            <div class="clearfix">
            </div>
            <%---End of Button----%>

            <div class="col-md-12 box-container" id="divGrid" visible="false" runat="server">
                <div class="box-body box-body-open" style="overflow: scroll; height: 500px;">
                    <div class="row col-xs-12 col-sm-12 col-md-12 col-lg-12" style="overflow-y: auto;">
                        <asp:GridView ID="grdView" runat="server" CssClass="table table-striped table-bordered"  Width="100%"></asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
