<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdminHeader.ascx.cs" Inherits="CitizenPortal.Sambalpur.controls.AdminHeader" %>
<header class="header-shadow">
    <style>
        #Label1 {
            padding: 2px 2px;
            border-radius: 20px;
            text-align: center;
            font-weight: bold;
            float: right;
            font-size: 2.6em;
            display: block;
        }
    </style>
    <script src="/WebApp/Scripts/ServiceLanguage.js?ver=1.1"></script>
    <script type="text/javascript">
        function ChangeLanguage(p_Lang) {


            var t_Lang = p_Lang;

            if (p_Lang == null) t_Lang = document.getElementById('HFCurrentLang').value;



            if (t_Lang == "1") t_Lang = "2";
            else t_Lang = "1";

            document.getElementById('HFCurrentLang').value = t_Lang;
            document.forms[0].submit();
            return true;
        }
    </script>
    <div class="container-fluid whitebg">

        <div class="row tophead">
            <div class="col-xs-12 col-sm-3 col-md-1 col-lg-1">
                <a href="../../../Default.aspx">
                    <img src="/../../PortalImages/MPLogo.png" class="img-responsive small-view" width="141" height="124" alt="Maharshi Patanjali Sanskrit Sansthan, Bhopal" /></a>
            </div>
            <div class="col-xs-12 col-sm-9 col-md-5 col-lg-7">
                <h2 style="margin: 10px auto; font-size: 23px; font-weight: bolder">MAHARSHI PATANJALI SANSKRIT SANSTHAN</h2>
                <h2 style="margin: 10px auto; font-size: 25px; font-weight: bolder">महर्षि पतंजलि संस्कृत संस्थान, भोपाल</h2>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-4 pleft0 pull-right">
                <div class="row">
                    <div class="col-xs-12 col-sm-5 col-md-5 col-lg-3 text-right pull-right">
                        <img src="/Sambalpur/img/DigiVarsity.png" class="img-responsive small-view" style="height: 85px !important; text-align: right" alt="DigiUarsity (A complete University Module)" />
                    </div>
                    <div class="col-xs-12 col-sm-7 col-md-7 col-lg-7" style="margin-top: -10px;">
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

                            <ul class="nav navbar-nav navbar-right">
                                <li class="dropdown">

                                    <span style="font-weight: bold; color: #B65838;"><span id="lblUser" runat="server"></span></span><%--<b class="caret"></b></a>--%>


                                </li>
                            </ul>


                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-5 col-md-5 col-lg-5 text-right pull-right mtop20" id="divLogin">
                        <% if (Session["LoginID"] == null || (string)Session["LoginID"] == "")
                            {%>
                        <a href="/Account/Login" class="btn-grey"><i class="fa fa-user fa-fw"></i>LOGIN</a>
                        <% } %>
                        <% else
                            { %>
                        <% if (Session["Id"] != null && Session["Id"].ToString() == "GuestUser")
                            {%>
                        <a href="/Account/Login" class="btn-grey"><i class="fa fa-user fa-fw"></i>GUEST USER</a>
                        <% } %>
                        <% else
                            { %>
                        <a href="Default.aspx" class="btn-darkgrey" runat="server" onserverclick="lnkbtnLogOut_Click"><i class="fa fa-lock fa-fw"></i>LOGOUT</a>
                        <div class="clearfix"></div>

                        <div class="col-md-12 box-container" runat="server" id="div5">


                            <span class="col-lg-12 p0 pull-right " style="font-size: 15px; margin-top:10px ">Choose Language:
                           
                                <input type="button" id="btnLang" clientidmode="Static" class="btn-link" style="height: 25px; color: #820000;" runat="server" onclick="javascript: return ChangeLanguage();" /><i class="fa fa-hand-o-up"></i>
                            </span>
                            <span class="clearfix"></span>

                        </div>
                        <%-- <div class="col-lg-12">
                                <div class="alert alert-success">
                                    <p><b>{{resourcesData.lblInstruction}}</b></p>

                                </div>
                            </div>--%>


                        <% }%>
                        <% }%>
                        <br />


                    </div>

                </div>
            </div>
        </div>

    </div>
    <asp:HiddenField ID="HFCurrentLang" runat="server" ClientIDMode="Static" />

</header>
