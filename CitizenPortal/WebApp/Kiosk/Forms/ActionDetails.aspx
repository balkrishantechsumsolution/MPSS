<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="ActionDetails.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.Forms.ActionDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .applicantbox {
            text-align: left;
            margin-top: 1em;
        }

        .tbleapplcnt {
            -webkit-box-shadow: 0 0 20px 0 rgba(0,0,0,.3);
            box-shadow: 0 0 20px 0 rgba(0,0,0,.3);
        }

            .tbleapplcnt p {
                color: #bbb !important;
                font-size: 1em;
                margin-bottom:2px;
            }

            .tbleapplcnt h5 {
                font-size: 1.1em;
                color:#444 !important;
                margin:7px 0;
            }

            .tbleapplcnt > tbody > tr > td, .tbleapplcnt > tbody > tr > th, .tbleapplcnt > tfoot > tr > td, .tbleapplcnt > tfoot > tr > th, .tbleapplcnt > thead > tr > td, .tbleapplcnt > thead > tr > th {
                padding: 3px 10px !important;
                line-height: 1.42857143;
                vertical-align: top;
                border-top: 1px solid #ddd;
            }

        .actioncontainer .header {
            background-color: #6595EB;
            padding: 10px 15px 0 0;
            border-top-left-radius: 2px;
            border-top-right-radius: 2px;
        }

        .actioncontainer h4 {
            margin: 0 !important;
            font-size: 1.7em;
            color: #fff !important;
            padding-left: 0.6em;
            font-weight: 300;
        }

        .actioncontainer .category {
            font-size: 14px;
            font-weight: 400;
            color: #f9f9f9;
            padding-left: 0.9em;
            margin-bottom: 0px;
        }

        .actionhstrybox {
            text-align: left;
            margin-top: 1em;
        }

            .actionhstrybox .header {
                background-color: #5E9D9F;
                padding: 10px 15px 0 0;
                border-top-left-radius: 2px;
                border-top-right-radius: 2px;
            }

            .actionhstrybox h4 {
                margin: 0 !important;
                font-size: 1.7em;
                color: #fff !important;
                padding-left: 0.6em;
                font-weight: 300;
            }

            .actionhstrybox .category {
                font-size: 14px;
                font-weight: 400;
                color: #f9f9f9;
                padding-left: 0.9em;
                margin-bottom: 0px;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper" style="min-height: 500px !important;">
        <div class="row">
            <div class="col-md-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title">Applicant Details</h4>
                   <%-- <p class="category">As per filled records</p>--%>
                </div>
                <div class="table-responsive">
                    <table class="tbleapplcnt table-bordered" style="width: 100%; margin: 0 auto;">
                        <tbody>
                            <tr>
                                <%--<td>
                                    <p>Current Status</p>
                                    <h5>Send Back</h5>
                                </td>--%>
                                <td>
                                    <p>Application No.</p>
                                    <%--<h5>65765675765</h5>--%>
                                    <asp:Label ID="lblApplicationNo" runat="server" ></asp:Label>
                                </td>
                                <td style="width: 33%;">
                                    <p>Application Date</p>
                                    <%--<h5>05/09/2017 12:10:22</h5>--%>
                                     <asp:Label ID="lblApplicationDate" runat="server" ></asp:Label>
                                </td>

                            </tr>
                            <tr>
                                <td style="width: 33%;">
                                    <p>Applicant Name</p>
                                    <%--<h5>Sumit Singh Sabharwal</h5>--%>
                                     <asp:Label ID="lblApplicationName" runat="server" ></asp:Label>
                                </td>
                                <%--<td>
                                    <p>Email Id</p>
                                    <h5>s.singh.sabharwal@gmail.com</h5>
                                </td>--%>
                                <td>
                                    <p>Service Name</p>
                                    <%--<h5>9855844854</h5>--%>
                                    <asp:Label ID="lblServiceName" runat="server" ></asp:Label>
                                </td>
                            </tr>

                            <%--<tr>
                                <td colspan="3">
                                    <p>Applicant Address</p>
                                    <h5>WZ-300, 2nd Floor, Opposite Axis Bank, Jail Road, Tilak Nagar, Delhi-110058</h5>
                                </td>

                            </tr>--%>

                        </tbody>
                    </table>
                    <br />
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title">Action History</h4>
                    <%--<p class="category">Action take place from starting to till date.</p>--%>
                </div>
                <div class="table-responsive">
                    <table class="tbleapplcnt table-bordered" style="width: 100%; margin: 0 auto;">
                        <asp:GridView runat="server" ID="gvActionHistory" ShowHeaderWhenEmpty="true" AutoPostBack="true" 
                            CssClass="table table-striped table-bordered" EmptyDataText="No records found!!!.">

                        </asp:GridView>
                        <%--<tbody>
                            <tr>
                                <td>
                                    <p>Reference Id</p>
                                    <h5>055000004330</h5>
                                </td>
                                <td style="width: 33%;">
                                    <p>Application Date</p>
                                    <h5>05/09/2017 12:10:22</h5>
                                </td>
                                <td style="width: 33%;">
                                    <p>Last Action Placed</p>
                                    <h5>15/09/2017 02:37:52</h5>
                                </td>
                            </tr>

                            <tr>
                                <td colspan="3">
                                    <p>Department Remarks</p>
                                    <h5>Application Submitted in System and sent to Designated Officer.</h5>
                                </td>
                            </tr>
                        </tbody>--%>
                    </table>
                    <br />
                </div>
                <div class="clearfix"></div>
            </div>


             <div class="col-lg-12 text-center mt10 mb20">
                <%--<input type="button" class="btn btn-success" value="Acknowledgement" />--%>
                <asp:Button ID="btnAcknowledgement" runat="server" Text="Acknowledgement" OnClick="btnAcknowledgement_Click" CssClass="btn btn-success" />
                <asp:Button ID="btnUploadFile" class="btn btn-info ml10"  runat="server" Text="Upload File" OnClick="btnUploadFile_Click" style="margin-right:10px;" />
                <%--<input type="button" class="btn btn-info ml10" value="Upload File" style="min-width: 142px;" style="margin-right:10px;" />--%>

               <asp:Button ID="btnHome" runat="server" 
                                CssClass="btn btn-primary" PostBackUrl="" ToolTip="Back to Home Page" style="min-width: 142px;"
                                Text="Home" />
            </div>

        </div>

       
    </div>
</asp:Content>
