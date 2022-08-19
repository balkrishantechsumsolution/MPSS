<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/G2G/Master/G2GMaster.Master" AutoEventWireup="true" CodeBehind="DispatchAndDeliver.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.SeniorCitizen.DispatchAndDeliver" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />

    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script src="/WebApp/Scripts/CommonScript.js"></script>
    <script src="/WebApp/Scripts/AddressScript.js"></script>
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper" style="min-height: 500px !important;">
        <div class="row">
            <div class="col-lg-12">
            </div>
        </div>
        <%--<uc1:G2GInfomation runat="server" ID="G2GInfomation" />--%>
        <%---Start of Filter----%>
        <div class="row mt20" style="">
           
            <div id="DivPs" runat="server" class="col-md-12 box-container">
                
                <div class="box-heading">
                    <h4 class="box-title register-num">Search Filter
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div  class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                         <div class="form-group">
                            <label class="manadatory" for="txtFromDate">
                                Police Station
                            </label>
                            <asp:DropDownList ID="ddlPS" runat="server" CssClass="form-control" required="true"></asp:DropDownList>
                        </div>
                        </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display: none;">
                        <div class="form-group">
                            <label class="manadatory" for="txtFromDate">
                                From Date
                            </label>
                            <%--<input id="txtFromDate" class="form-control" placeholder="DD/MM/YYYY" name="DeceasedDOB" type="text" value="" />--%>
                            <asp:TextBox ID="txtFromDate" runat="server" CssClass="form-control" placeholder="DD/MM/YYYY"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display: none;">
                        <div class="form-group">
                            <label class="manadatory" for="txtToate">
                                To Date
                            </label>
                            <%--<input id="txtToDate" class="form-control" placeholder="DD/MM/YYYY" name="DeceasedDOD" type="text" value="" />--%>
                            <asp:TextBox ID="txtToDate" runat="server" CssClass="form-control" placeholder="DD/MM/YYYY"></asp:TextBox>

                        </div>
                    </div>

                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display: none;">
                        <div class="form-group">
                            <label class="manadatory" for="ddlDistrict">District</label>
                            <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="form-control">
                            </asp:DropDownList>
                        </div>
                    </div>
                 
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" style="display: none;">
                        <div class="form-group">
                            <label class="" for="txtAppID">Application No.</label>
                            <asp:TextBox runat="server" ID="txtAppID" class="form-control" placeholder="Application No" name="txtAppID" MaxLength="12" onkeypress="return isNumberKey(event);"
                                type="text" value=""></asp:TextBox>
                        </div>
                    </div>
                   
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" style="display: none">
                        <div class="form-group">
                            <label class="" for="ddlGender">Filter Count/Total Count</label>
                            <label class="form-control" for="ddlGender" style="width: 160px; float: left;">
                                55 / 300
                            </label>
                            <a class="btn btn-darkorange green" style="float: right;" href="javascript:void(0);" title="Click to search the filtered record"><i class="fa fa-search"></i></a>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 text-right">
                        <div class="form-group">
                            <label class="" for="">
                                &nbsp;
                            </label>
                            <asp:Button ID="btnSearch" runat="server" CausesValidation="False" CssClass="btn btn-success"
                                Text="Search" OnClick="btnSearch_Click" />
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
        </div>
        <div>
           
        </div>
        <div class="mt10"></div>
        <%----END of Filter-----%>
        <%---Start of Application Details----%>
        <div class="row">
            <div class="col-md-12 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">List of Application <asp:Label ID="lblHeading" runat="server"></asp:Label>
                        
                    </h4>
                </div>
                <div class="box-body box-body-open p0" style="height: 350px; overflow: auto;">
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
                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkapp" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Reference ID">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="HPLAppHistory" runat="server" NavigateUrl='<%# string.Format("~/WebApp/G2G/SeniorCitizen/SCG2GAction.aspx?AppId={0}&SvcID={1}",
                                                      HttpUtility.UrlEncode(Eval("AppID").ToString()),HttpUtility.UrlEncode("424")) %>'  Text='<%#Eval("AppID") %>'
                                              onclick="window.open (this.href, 'popupwindow',  'width=600,height=500,scrollbars,resizable'); return false;"   target="_blank" Font-Underline="true" ToolTip="View Action"></asp:HyperLink>                                       
                                       
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Application Date">
                                        <ItemTemplate>
                                           <asp:Label ID="lblappdate" runat="server" Text='<%#Eval("CreatedDate") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Applicant Name">
                                        <ItemTemplate>
                                           <asp:Label ID="lblappname" runat="server" Text='<%#Eval("appname") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Status">
                                        <ItemTemplate>
                                           <asp:DropDownList ID="ddlStatusNodal" runat="server" CssClass="form-control">
                                               <asp:ListItem Text="--Select--" Value="Select" Selected="True"></asp:ListItem>
                                               <asp:ListItem Text="Delivered" Value="Delivered"></asp:ListItem>
                                               <asp:ListItem Text="Not Received" Value="Not Received"></asp:ListItem>
                                               <%--<asp:ListItem Text="Reattempt" Value="Reattempt"></asp:ListItem>--%>
                                               <asp:ListItem Text="Senior Citizen Not Available" Value="Senior Citizen Not Available"></asp:ListItem>
                                           </asp:DropDownList>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Remarks">
                                        <ItemTemplate>
                                          <asp:TextBox ID="TXTRemarksNodal" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                        <asp:TemplateField HeaderText="History">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="HPLAppHistoryPage" runat="server" NavigateUrl='<%# string.Format("~/WebApp/G2G/SeniorCitizen/DeliverAppHistory.aspx?AppId={0}",
                                                      HttpUtility.UrlEncode(Eval("AppID").ToString())) %>'  Text="View" CssClass="btn btn-info btn-sm"
                                              onclick="window.open (this.href, 'popupwindow',  'width=1000,height=800,scrollbars,resizable'); return false;"   target="_blank" Font-Underline="false" ToolTip="View History"></asp:HyperLink>                                       
                                         &nbsp <asp:LinkButton ID="BtnDispatchIndv" runat="server" Text="Dispatch" OnClick="BtnDispatchIndv_Click"
                                            CssClass="btn btn-primary btn-sm"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <!-------------Modal Pop Box Content------------------->
                          <%--  <div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Modal Header</h4>
      </div>
      <div class="modal-body">
        <p>Some text in the modal.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>--%>
                            <!-----------------End Here----------------------->
                            <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
            <div class="text-center col-md-12 col-sm-12 col-xs-12">
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
               <div class="ptop15">
                            <asp:Button ID="BtnDispatch" runat="server" Text="Dispatch Checked Rows" Visible="false"
                                 CssClass="btn btn-primary" OnClick="BtnDispatch_Click" />
                        </div>
            </div>
             
        </div>
        <div style="margin-bottom: 100px;"></div>
        <%----END of Application Details-----%>
        
    </div>
</asp:Content>
