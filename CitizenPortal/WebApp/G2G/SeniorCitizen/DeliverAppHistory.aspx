<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeliverAppHistory.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.SeniorCitizen.DeliverAppHistory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   <script src="/Scripts/jquery-2.2.3.min.js"></script>
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <link href="../../Styles/bootstrap.min.css" rel="stylesheet" />
    <link href="../PortalStyles/jquery-ui.min.css" rel="stylesheet" />
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
    <link href="../../Styles/sb-admin-2.css" rel="stylesheet" />
     <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
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
            margin: 1.5%;
            float: left;
            padding: .5%;
            overflow: auto;
            font-size: 18px;
            border-radius: 5px;
            border-left: solid 5px #438bc8;
        }

            .SrvDiv a {
                color: #000;
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

        .table > tbody > tr > th {
            padding: 5px !important;
            text-align: center;
            vertical-align: middle !important;
        }

        .table > tbody > tr > td {
            padding: 5px !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
   <div id="page-wrapper" style="min-height: 500px !important;">
        <div class="row">
            <div class="col-lg-12">
            </div>
        </div>
       
        <div class="row mt20" style="">
           
           <%-- <div class="col-md-12 box-container">
                
                <div class="box-heading">
                    <h4 class="box-title register-num">Delivery History
                    </h4>
                </div>
            </div>--%>
        </div>     
        <div class="mt10"></div>
        <%----END of Filter-----%>
        <%---Start of Application Details----%>
        <div class="row">
            <div class="col-md-12 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">Application History Details
                    </h4>
                </div>
                <div class="box-body box-body-open p0" style="height: 550px; overflow: auto;">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12 p0">
                        <div class="form-group p0">
                            <asp:GridView ID="grdView" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered"
                                 OnRowDataBound="grdView_RowDataBound">
                                <RowStyle HorizontalAlign="Center" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Sr. No">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex+1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Tracking No">
                                        <ItemTemplate>
                                           <asp:Label ID="lbltrack" runat="server" Text='<%#Eval("DeliveredId") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Reference ID">
                                        <ItemTemplate>
                                           <asp:Label ID="lblAppID" runat="server" Text='<%#Eval("AppID") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Date">
                                        <ItemTemplate>
                                           <asp:Label ID="lblappdate" runat="server" Text='<%#Eval("CreatedOn") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <%-- <asp:TemplateField HeaderText="Applicant Name">
                                        <ItemTemplate>
                                           <asp:Label ID="lblappname" runat="server" Text='<%#Eval("appname") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                                    <asp:TemplateField HeaderText="Police Station">
                                        <ItemTemplate>
                                           <asp:Label ID="lblps" runat="server" Text='<%#Eval("PoliceStation") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Status">
                                        <ItemTemplate>
                                           <asp:Label ID="lblsts" runat="server" Text='<%#Eval("Status") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Remarks">
                                        <ItemTemplate>
                                          <asp:Label ID="TXTRemarksNodal" runat="server" Text='<%#Eval("Remarks") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
            <%--<div class="text-center col-md-12 col-sm-12 col-xs-12">
                <ul class="pagination">
                    <li class="col-md-2 col-sm-2 text-center">
                        <label for="TotalRecords">Total Records</label>
                        <label id="lblTotalRecords" runat="server" for="TotalRecords"></label>
                        <input type="hidden" id="TotalRecords" name="TotalRecords" value="2" /></li>
                    <li class="col-md-2 col-sm-2 text-center">
                        <label for="CurrentPage">Page:</label>
                        1
                                <input type="hidden" id="CurrentPage" name="CurrentPage" value="1" />
                        <label for="TotalPages">of</label>
                        1
                    </li>
                    <li class="col-md-4 col-sm-4 text-center">
                        <input type="hidden" id="TotalPages" name="TotalPages" value="1" />
                        <button class="btn btn-primary " type="submit" id="btnFirst" name="Command" value="First" disabled="disabled">
                            First</button>
                        <button class="btn btn-default " type="submit" id="btnPrevious" name="Command" value="Previous" disabled="disabled">
                            Previous</button>
                        <button class="btn btn-default " type="submit" id="btnNext" name="Command" value="Next" disabled="disabled">
                            Next</button>
                        <button class="btn btn-primary " type="submit" id="btnLast" name="Command" value="Last" disabled="disabled">
                            Last</button>
                        <button class="btn btn-success " type="submit" id="btnRefresh" name="Command" style="display: none" value="Refresh">
                            Refresh</button>
                    </li>
                    <li class="col-md-2 col-sm-2">
                        <input class="form-control text-align-center" data-val="true" data-val-number="The field PageSize must be a number." placeholder="Search..." data-val-required="The PageSize field is required." id="PageSize" name="PageSize" type="text" value="" autocomplete="off" />
                        <div class="clearfix"></div>
                    </li>
                    <li class="col-md-2 col-sm-2">
                        <button class="btn btn-success " type="submit" id="btnExcel" name="Command" value="Last" disabled="disabled">
                            Export to Excel</button>
                        <div class="clearfix"></div>
                    </li>
                    <div class="clearfix"></div>
                </ul>
            </div>--%>
        </div>
        <div style="margin-bottom: 100px;"></div>
        <%----END of Application Details-----%>
        
    </div>
    </form>
</body>
</html>
