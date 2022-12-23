<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllPhotosWeb.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.MPSS.AllPhotosWeb" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
    <title></title>
    <link href="/Sambalpur/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="/Sambalpur/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
    <link href="/Sambalpur/css/homestyle.css" type="text/css" rel="stylesheet" />
    <link href="/Sambalpur/css/normalize.min.css" rel="stylesheet" />

    <script src="/Sambalpur/js/jquery-2.2.3.min.js" type="text/javascript"></script>

    <!-- IE10 viewport hack START for Surface/desktop Windows 8 bug -->
    <link href="/Sambalpur/css/ie10-viewport-bug-workaround.css" type="text/css" rel="stylesheet" />
    <script src="/Sambalpur/js/ie-emulation-modes-warning.js" type="text/javascript"></script>
    <script src="/Sambalpur/js/SHA256.js"></script>
    <script src="../../Scripts/sha512.js"
    <!-- IE10 viewport hack END for Surface/desktop Windows 8 bug -->
    <script src="../../WebApp/Scripts/DisableBackButton.js"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="/Sambalpur/js/html5shiv.js" type="text/javascript"></script>
        <script src="/Sambalpur/js/respond.min.js" type="text/javascript"></script>
    <![endif]-->
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

        #divElement {
            position: absolute;
            left: 70px;
            width: 96%;
            margin-left: -50px;
            background-color: #E3EAEB;
            color: #820000;
        }

            #divElement label {
                font-size: 22px;
                font-weight: bolder;
                font-family: 'Arial Unicode MS';
            }

        ​
    </style>

    </head>
    <body>
        <form id="form1" runat="server">
                 <header>
            <div class="container-fluid whitebg myheader">
                <div class="row tophead">
                    <div class="col-xs-12 col-sm-3 col-md-1 col-lg-1">
                        <img src="../../../PortalImages/MPLogo.png" class="img-responsive small-view" width="141" height="124" alt="Maharshi Patanjali Sanskrit Sansthan, Bhopal" />
                    </div>
                    <div class="col-xs-12 col-sm-9 col-md-5 col-lg-6 logo">
                        <h2 style="margin: 10px auto; font-size: 23px; font-weight: bolder">MAHARSHI PATANJALI SANSKRIT SANSTHAN</h2>
                        <h2 style="margin:10px auto;font-size:25px;font-weight:bolder">महर्षि पतंजलि संस्कृत संस्थान, भोपाल</h2>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-5 common-nav text-right ptop20">
                        <a href="../../../mpss/mpss/index.html" class="navtop-homebtn"><i class="fa fa-home fa-fw"></i>Home</a>


                    </div>
                </div>

            </div>
        </header>
            <div id="outer">
                <h2></h2>
                <br />            
                <div style="clear:both;">
                    <h4>महर्षि पतंजलि संस्कृत संस्थान, भोपाल</h4>
                    <p>चित्रदीर्घा</p>
                </div>
                <div style="clear:both;">
                <asp:Repeater ID="RepeaterImages" runat="server">
                    <ItemTemplate>
                        <asp:Image ID="Image" runat="server" ImageUrl='<%# Container.DataItem %>' />
                    </ItemTemplate>
                </asp:Repeater>
                </div>                
                <br />    
            </div>
        </form>
    </body>
    </html>