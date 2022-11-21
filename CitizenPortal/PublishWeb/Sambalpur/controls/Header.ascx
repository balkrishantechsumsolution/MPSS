<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="CitizenPortal.Sambalpur.controls.Header" %>
<header>
    <%--<div class="container-fluid">
        <div class="row" style="background-color: #fd3535; clear: both; color: #fff;">
            <div class="col-lg-12" style="padding-top: 7px;font-weight:bold">
                <marquee>
                        " Unregister Existing Student : Candidate who has not created thier Login ID & Passowrd, please click to generate Login Id & Password <b><a href ="/WebApp/Examination/SearchStudent.aspx#!" style="color:yellow">GENERATE LOGIN ID & PASSWORD</a></b> "
                    </marquee>
            </div>
        </div>
    </div>--%>
    <div class="container-fluid whitebg myheader">
        
        <div class="row tophead">
            <div class="col-xs-12 col-sm-3 col-md-1 col-lg-1">
                <a href="../../../Default.aspx"><img src="/Sambalpur/img/sambalpur-university-logo.png" class="img-responsive small-view"  height="124" alt="Chhattisgarh Swami Vivekanad Technical University,Bhilai" /></a>
            </div>
            <div class="col-xs-12 col-sm-9 col-md-5 col-lg-7">
                <h1>CHHATTISGARH SWAMI VIVEKANAND TECHNICAL UNIVERSITY, BHILAI</h1>
                <%--<span>(State Government Owned)</span>--%>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-4 common-nav pull-right">
                <div class="row">
                    <div class="col-xs-12 col-sm-5 col-md-5 col-lg-3 text-right pull-right">
                        <img src="/Sambalpur/img/DigiVarsity.png" class="img-responsive small-view" style="height: 80px !important; text-align: right" alt="DigiUarsity (A complete University Module)" />
                    </div>
                    <div class="col-xs-12 col-sm-7 col-md-7 col-lg-7 text-right ptop20 pull-right" id="divLogin" style="">
                        <a href="/CSVTU/index.aspx" class="navtop-homebtn"><i class="fa fa-home fa-fw"></i>Home</a>

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
                        <a href="/Account/LogOff" class="btn-grey"><i class="fa fa-lock fa-fw"></i>LOGOUT</a>
                        <% }%>
                        <% }%>
                    </div>
                </div>
                <div class="clearfix"></div>
                
            </div>
        </div>
        
    </div>
</header>
