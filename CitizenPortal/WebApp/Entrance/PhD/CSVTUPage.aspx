<%@ Page Title="" Language="C#" MasterPageFile="~/Sambalpur/master/Home.Master" AutoEventWireup="true" CodeBehind="CSVTUPage.aspx.cs" Inherits="CitizenPortal.WebApp.Entrance.PhD.CSVTUPage" %>

<%@ Register Src="~/WebApp/Control/EventDate.ascx" TagPrefix="uc1" TagName="EventDate" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
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

            .form-heading span {
                font-size: 25px;
                padding-left: 0;
            }

        .w3-note {
            background: #99FFE5; /* For browsers that do not support gradients */
            background: -webkit-linear-gradient(#99FFE5, #4DA6FF); /* For Safari 5.1 to 6.0 */
            background: -o-linear-gradient(#99FFE5, #4DA6FF); /* For Opera 11.1 to 12.0 */
            background: -moz-linear-gradient(#99FFE5, #4DA6FF); /* For Firefox 3.6 to 15 */
            background: linear-gradient(#99FFE5, #4DA6FF); /* Standard syntax */
            border-left: 6px solid #ffeb3b;
            text-align: center;
            box-shadow: 0 15px 10px -10px rgba(31, 31, 31, 0.5);
        }

        .w3-panel {
            text-align: center;
            height: 100px;
            padding: 0.01em 16px;
            margin-top: 16px !important;
            margin-bottom: 16px !important;
        }

            .w3-panel p {
                font-size: 30px !important;
                font-weight: bold;
                color: #002CB2 !important;
                padding: 25px 0 0 0;
            }

            .w3-panel span {
                font-size: 18px !important;
                font-weight: bold;
                color: #002751 !important;
            }

        #container {
            width: 100%;
        }

        @media only screen and (max-width: 768px) {
            #container {
                width: 100%;
                margin: 0 auto;
            }
        }

        .SrvDiv {
            background-color: #fff;
            border: solid 1px #ddd;
            color: #045abc;
            width: 49%;
            margin: .5%;
            float: left;
            padding: .5%;
            overflow: auto;
            font-size: 18px;
            border-radius: 5px;
            border-left: solid 5px #438bc8;
        }

            .SrvDiv a {
                color: #337ab7;
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

        .form-heading {
            color: #820000 !important;
            text-align: left;
            border-left: 15px solid #ce6d07;
            border-right: 2px solid #ce6d07;
            border-top: 1px solid #d8d8d8;
            border-bottom: 1px solid #d8d8d8;
            background: rgba(0, 0, 0, .075);
            padding: 10px 20px 10px 15px !important;
            border-top-right-radius: 2px;
            border-top-left-radius: 2px;
            font-weight: bold;
        }
    </style>
    <script>
        $(document).ready(function () {
            $('#divLogin').hide();
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <div class="rows" style="min-height: 500px;">
            <div class="col-lg-2 p0">
            <uc1:EventDate runat="server" ID="EventDate" />
                </div>
            <div class="col-lg-10">
                <%--<div id="page-wrapper" style="min-height: 311px;">--%>
                <h2 class="form-heading">
                    <span class="col-lg-12 p0"><i class="fa fa-pencil-square-o"></i> CHHATTISGARH SWAMI VIVEKANAD TECHNICAL UNIVERSITY, BHILAI</span>
                    <span class="clearfix"></span>
                </h2>                                
                <div class="">
                    <div class="resp-tabs-container ver_1">
                        <div style="margin-top: 10px;">
                            <div style="min-height: 4.66em; z-index: -760;" class="SrvDiv" id="101">
                                <a href="/WebApp/Citizen/Forms/Geustuser.aspx?SvcID=1466">
                                    <img src="/Sambalpur/img/sambalpur-university-logo.png" alt="" align="left" style="height: 60px;margin-top:5px;" />
                                </a>
                                <a href="/WebApp/Citizen/Forms/Geustuser.aspx?SvcID=1466" onclick="javascript:return RedirectToService('/WebApp/Citizen/Forms/Geustuser.aspx?SvcID=1466');">
                                    Application form for appearing in the Entrance Examination for Ph.D. Programme, 2022 </a>
                                <br />
                                <span style="font-size: 12px !important; font-weight: bold !important; color: black !important;">(FOR ADMISSION INTO CSVTU, Bhilai, Ph.D Programme, 2022)</span><br />
                                <%--<span>Candidate applying directly Click here</span>--%>

                            </div>
                            <div style="min-height: 4.66em; z-index: -760;" class="SrvDiv" id="102">
                                <a href="/Account/Login" onclick="javascript:return RedirectToService('/WebApp/Entrance/Login/Login.aspx');">
                                    <img src="/Sambalpur/img/DigiVarsity.png" alt="" align="left" style="height: 70px;" />
                                </a><a href="/WebApp/Entrance/Login/Login.aspx">Applicant Login </a>
                                <br />
                                <span style="font-size: 12px !important; font-weight: bold !important; color: black !important;">Click to Login</span><br />
                                <span>for Online Applicant</span>
                            </div>

                           
                        </div>

                    </div>

                </div>
            </div>
        </div>
    
</asp:Content>
