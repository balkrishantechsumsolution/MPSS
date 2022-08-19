<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="Processbar.aspx.cs" Inherits="CitizenPortal.WebApp.Enrollment.Processbar" %>

<%@ Register Src="~/WebApp/Control/EnrollmentSteps.ascx" TagPrefix="uc1" TagName="EnrollmentSteps" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../Scripts/CommonScript.js"></script>
    <link href="../../../g2c/css/formSteps.css" rel="stylesheet" />
    <link href="../../../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="/WebApp/Common/Styles/StyleSheet1.css" rel="stylesheet" />
    <link href="/WebApp/Common/Styles/StyleSheet3.css" rel="stylesheet" />
    <link href="/WebApp/Common/Styles/StyleSheet4.css" rel="stylesheet" />
     <link href="/WebApp/Common/Styles/style.admin.css" rel="stylesheet" />
    <style>
        .mtop10 {
            margin-top: 10px !important;
        }

        .mbtm20 {
            margin-bottom: 20px !important;
        }

        .wizard_inston {
            width: 95%;
            margin: 0 auto;
            padding: 0;
        }

            .wizard_inston p {
                text-align: left;
                line-height: 30.5px;
                font-family: Arial;
                color: #000 !important;
            }

                .wizard_inston p a {
                    color: #337ab7;
                    font-size: 15px;
                }

        p {
            color: #000 !important;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#side-menu').show();
            $("#divLogin").hide();
            $("#lblUser").hide();
            $('#divEvent').hide();
        });

    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        
        <div class="row">
            <uc1:EnrollmentSteps runat="server" id="EnrollmentSteps" />
            <div id="divPrint" class="container mtop10 hldshdw" style="padding-right: 0; padding-left: 0; width: 99%;">
                <div class="col-lg-12 wizard_hd">
                    <b style="font-size: 20px; margin-left:20px;">Application form for appearing in the Entrance Examination Ph.D. Programme, 2020 </b>
                </div>
                <div class="wizard_inston text-left">
                    <br />
                    <p style="margin-top:10px;">
                        1. Your Application is saved.<br />
                        &nbsp;&nbsp;&nbsp;
                        The Application Number  
                                     <b>
                                         <asp:Label ID="lblAppID" runat="server" Font-Bold="True" Font-Size="20px"></asp:Label></b>,
                        please note down the number for future use.
                        <br />
                        2. Make payment against the Application Number.<asp:Label ID="lblAppID1" runat="server" Font-Bold="True" Font-Size="20px"></asp:Label><br />
                        &nbsp;&nbsp;&nbsp; 
                        Payment can be done through Online (Payment Gateway)
                        <br />
                        3. Check your Application status after login through your Login ID :
                        <asp:Label ID="lblLoginID" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label>
&nbsp;&nbsp;&nbsp; Password :
                        <asp:Label ID="lblPassword" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label>
&nbsp;&nbsp; (detailed SMS and email)
                    </p>
                </div>
                <p style="color: maroon !important; width: 90%; margin: 0 auto; font-family: Arial; text-align: center; font-size: 20px;">
                    <b style="font-size: 20px;">Please Note: </b>Your Application is <b style="font-size: 20px;">NOT VALID</b> unless the application fees is paid
                        <br />
                    CSVTU Portal - <b style="font-size: 25px; color: maroon !important;">https://csvtu.ac.in/</b>
                </p>

                <div class="clearfix"></div>

            </div>
            <div id="divBtn" class="row">
                <div class="col-md-12 box-container" style="margin-top: 5px;">
                    <div class="box-body box-body-open" style="text-align: center;">
                        <asp:Button ID="btnSubmit" runat="server" CausesValidation="False" CssClass="btn btn-success"
                            Text="Make Payment" OnClick="btnSubmit_Click" />
                        <input type="button" id="print" class="btn btn-primary" value="Print" onclick="javascript: CallPrint('divPrint');" />
                        <%--<input type="submit" value="Home" id="Button1" class="btn btn-danger" onclick="javascript: return ReturnURL();" />--%>
                        <asp:Button ID="Button2" runat="server" Text="Home" class="btn btn-danger" OnClick="Button2_Click" />
                    </div>
                </div>
                <div class="clearfix">
                </div>
            </div>
        </div>
    </div>
</asp:Content>
