<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeftPanel.ascx.cs" Inherits="CitizenPortal.WebApp.Profile.Control.LeftPanel" %>
<style type="text/css">
    .navbar-brand > img {
        width: 188px;
        margin-top: -13px;
    }

    .title {
        margin: 10px auto 0 50px;
        font-size: 2em;
        font-weight: bold;
        display: block;
        text-align: center;
    }

    .camera {
        display: block;
        margin: -60px auto 0;
        width: 1px;
        border-radius: 50px;
        position: relative;
        border: 4px solid #f2f2f2;
        background: #ccc;
        padding: 10px;
        width: 75px;
        height: 75px;
        background-image: url('../Images/camera.png');
        cursor: pointer;
    }

        .camera:hover {
            box-shadow: 0 -4px 18px 0 rgba(0, 0, 0, 0.2), 0 6px 5px 0 rgba(0, 0, 0, 0.2);
            width: 74px;
            height: 74px;
        }

    .panel-success {
        margin-top: -2px;
    }

    .panel {
        background-color: #f6f6f6;
    }

    .profile-wapper {
        height: 150px;
        font-weight: 700;
        color: Maroon;
    }

    .profile {
        border-radius: 50px;
        width: 105px;
        height: 105px;
        margin: 20px auto 10px;
        border: 3px solid #b1b1b1;
        display: block;
        background: #ccc;
    }

        .profile > img {
            border-radius: 50px;
            width: 100px;
            height: 100px;
            margin: 0 auto 10px;
            border: 2px solid #cfcfcf;
            display: block;
        }

    #wrapper {
        margin-bottom: 50px;
    }

    .modalBackground {
        background-color: #F4F4F4;
        filter: alpha(opacity=90);
        opacity: 0.9;
        height: 100%;
        left: 0;
        position: absolute;
        top: 0;
        width: 100%;
        z-index: 10000;
    }

    #divSteps {
        position: relative;
        top: 0;
        z-index: 10;
        display: block;
        margin: 0 auto;
    }

    .register-num {
        padding: 0;
    }
</style>

    <div class="navbar-default sidebar" role="navigation">
        <div class="sidebar-nav navbar-collapse">
            <ul class="nav" id="side-menu">
                <li>
                    <center class="profile-wapper">
                                <div class="profile">                            
                                <img src="../Images/user.jpg" alt="Name of the Agent"/>                                                         
                                </div>
                                <p>Niraj Gupta [MPO337]</p>   
                            </center>
                </li>
                <li>
                    <a href="#"><i class="fa fa-dashboard fa-fw"></i>Dashboard</a>
                </li>
                <li>
                    <a class="active" href="Dashboard.html"><i class="fa fa-money fa-fw"></i>TopUp / Recharge</a>
                </li>
                <li class="">
                    <a href="#"><i class="fa fa-wrench fa-fw"></i>Services<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse" aria-expanded="false" style="height: 0px;">
                        <li>
                            <a href="#">Menu-I</a>
                        </li>
                        <li>
                            <a href="#">Menu-II</a>
                        </li>
                        <li>
                            <a href="#">Menu-III</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>


