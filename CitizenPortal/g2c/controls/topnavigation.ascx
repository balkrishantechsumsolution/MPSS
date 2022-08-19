<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="topnavigation.ascx.cs" Inherits="WebApplication1.lokaseba_adhikar.controls.topnavigation" %>
<div class="row">
    <nav class="navbar navbar-default navbar-static-top">
        <div class="container-fluid topnav_shadow">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Menu</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav pleft10">
                    <li><a href="/g2c/forms/index.aspx"><i class="fa fa-home"></i> HOME</a></li>
                    <li><a href="/g2c/forms/act.aspx"><i class="fa fa-gavel"></i> ACT</a></li>
                    <li><a href="/g2c/forms/whos_who.aspx"><i class="fa fa-bullhorn"></i> WHO'S WHO</a></li>
                    <li><a href="/g2c/forms/forms.aspx"><i class="fa fa-columns"></i> FORMS</a></li>
                    <li><a href="/g2c/forms/departments.aspx"><i class="fa fa-university"></i> DEPARTMENTS</a></li>
                    <li><a href="/g2c/forms/services.aspx"><i class="fa fa-cogs"></i> SERVICES</a></li>
                    <li><a href="/g2c/forms/pmu_cell.aspx"><i class="fa fa-desktop"></i> PMU</a></li>
                    <li><a href="/g2c/forms/faq.aspx"><i class="fa fa-joomla"></i> FAQ</a></li>
                    <li><a href="/g2c/forms/testimonials.aspx"><i class="fa fa-certificate"></i> TESTIMONIALS</a></li>
                    <li><a href="/g2c/forms/contact_us.aspx"><i class="fa fa-map-marker"></i> CONTACTS</a></li>
                    <li><a href="/g2c/forms/circulars.aspx"><i class="fa fa-paste"></i> CIRCULARS</a></li>
                </ul>
                <!--<div class="ptop5">
                    <label for="searchbar"></label>
                        <input name="searchbar" type="text" class="box" id="searchbar" value="search" required autofocus>
                    </div>-->
            </div>
            <!--/.nav-collapse -->
        </div>
    </nav>
</div>
