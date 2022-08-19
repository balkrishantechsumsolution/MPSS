<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="CitizenPortal.g2c.index" %>



<!DOCTYPE html>
<html lang="en">

<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
    <title>Lokaseba Adhikar</title>
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="css/font-awesome.min.css" rel="stylesheet" />
    <script src="ajax/jquery_3.1.0min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.min.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
</head>

<body>
    <header>
        <div class="row">
            <div class="col-md-12 col-lg-12 outertop">
                <div class="col-xs-12 col-md-8 ptop10">
                    <p class="support"><span class="fa fa-headphones"></span>For Queries and Customer Support <span class="tollfree">1800 3000 3468</span>     </p>
                </div>

                <div class="col-md-4 ptop10 pull-right">
                    <div class="col-xs-3 col-sm-3">
                        <div class="tsize"><a href="#">-A</a> <a href="#">A=</a> <a href="#">A+</a></div>
                    </div>
                    <div class=" col-xs-6 col-sm-6 talgnright">
                        <div class="langbxhld">
                            <label for="chooselang"></label>
                            <select name="chooselang" id="chooselang" class="searchbox">
                                <option>English</option>
                                <option>Odiya</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-3 col-sm-3 ptop5 pleft0"><a href="/Account/Login"><span class="lgnbtn">LOGIN <i class="fa fa-unlock-alt"></i></span></a></div>
                </div>
            </div>
        </div>

        <div class="row lightwhite">
            <div class="col-lg-12">
                <div class="col-md-6 pleft0 ptop10">
                    <div class="logo">
                        <img src="img/lokaseba_logo1.png" class="ptop5" /></div>

                </div>
                <div class="col-md-6">
                    <img src="img/tophead_rght.png" class="pull-right"></div>
            </div>
        </div>

        <nav class="navbar navbar-default navbar-static-top">
            <div class="container-fluid">
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
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="http://g2cservices.in/g2c/index.html" target="_blank"><span class="fa fa-home"></span>HOME</a></li>
                        <li><a href="http://ortpsa.in/about_act.php" target="_blank"><span class="fa fa-gavel"></span>ACT</a></li>
                        <li><a href="http://ortpsa.in/forms.php" target="_blank"><span class="fa fa-clone"></span>FORMS</a></li>
                        <li><a href="http://ortpsa.in/departments.php" target="_blank"><span class="fa fa-university"></span>DEPARTMENTS</a></li>
                        <li><a href="http://ortpsa.in/faq-english.php" target="_blank"><span class="fa fa-joomla"></span>FAQ</a></li>
                        <li><a href="http://ortpsa.in/contact_us.php" target="_blank"><span class="fa fa-briefcase"></span>CONTRACTS</a></li>
                        <li><a href="http://ortpsa.in/circulars.php" target="_blank"><span class="fa fa-paste"></span>CIRCULARS</a></li>
                    </ul>
                    <!--<div class="ptop5">
                                        <label for="searchbar"></label>
                                            <input name="searchbar" type="text" class="box" id="searchbar" value="search" required autofocus>
                                        </div>-->
                </div>
                <!--/.nav-collapse -->
            </div>
        </nav>
    </header>

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-10 p0">
                <img src="img/slider.jpg" style="vertical-align: top;" /></div>
            <div class="col-md-2 p0">
                <a href="#" target="_blank">
                    <div class="col-xs-12 p0">
                        <div class="citi_reg">
                            <div class="citi_regtxt">
                                <b><span class="fsize34">CITIZEN </span></b>
                                <span class="fsize18" style="display: block">Registration</span>
                            </div>
                            <div class="citi_symbl"><i class="fa fa-group"></i></div>

                        </div>
                    </div>
                </a>

                <a href="#" target="_blank">
                    <div class="col-xs-12 p0">
                        <div class="csc_reg">
                            <div class="citi_regtxt">
                                <b><span class="fsize34">CSC </span></b>
                                <span class="fsize18" style="display: block">Registration</span>
                            </div>
                            <div class="csc_symbl"><i class="fa fa-institution"></i></div>

                        </div>
                    </div>
                </a>

                <a href="http://gis.csc.gov.in/locator/csc.aspx" target="_blank">
                    <div class="col-xs-12 p0">
                        <div class="locatecntr">
                            <div class="citi_regtxt ptop5">
                                <b><span class="fsize34">LOCATE </span></b>
                                <span class="fsize18" style="display: block">CSC Center</span>
                            </div>
                            <div class="locate_symbl"><i class="fa fa-map-marker"></i></div>

                        </div>
                    </div>
                </a>

                <a href="/webapp/kiosk/forms/applicationstatus.aspx" target="_blank">
                    <div class="col-xs-12 p0">
                        <div class="trackapp">
                            <div class="citi_regtxt">
                                <b><span class="fsize34">TRACK </span></b>
                                <span class="fsize18" style="display: block">Application</span>
                            </div>
                            <div class="track_symbl"><i class="fa fa-street-view"></i></div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>


    <section>
        <div class="col-lg-12 mtop10">
            <div class="col-xs-12 col-md-3 p0">
                <div class="citiz_cornerhold">
                    <div class="citiz_hd">CITIZEN CORNER’S <i class="fa fa-cogs"></i></div>
                    <div class="citiz_txtbox">
                        <div class="citiz_list">
                            <ul>
                                <li><a href="#"><i class="fa fa-caret-right"></i>Citizen Registration</a></li>
                                <li><a href="#"><i class="fa fa-caret-right"></i>Track Application Status</a> </li>
                                <li><a href="#"><i class="fa fa-caret-right"></i>Register Grievance</a></li>
                            </ul>
                        </div>
                        <div class="citiz_list">
                            <ul>
                                <li><a href="#"><i class="fa fa-caret-right"></i>Forgot ID/Password</a></li>
                                <li><a href="#"><i class="fa fa-caret-right"></i>Check your Entitlement</a></li>
                                <li><a href="#"><i class="fa fa-caret-right"></i>Check Grievance Status</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>


            <div class="col-xs-12 col-md-9">
                <p><b class="fsize18">Welcome to Odisha Right to Public Services Act</b></p>
                <p>
                    Odisha Right to Public Services Act, 2012 in Odisha is an exemplary initiative by the State Government to check corruption in public service delivery. The law enables the citizens to demand public services as a right and also includes a provision for penal action against officials failing to provide the services within the stipulated time.
        The idea is to generate a demand for services, and to provide citizens with a platform for getting their grievances redressed in a time bound manner.
                </p>
            </div>
            <div class="clearfix"></div>
            <div class="col-xs-12 col-md-3 p0 mtop15">
                <div class="citiz_cornerhold">
                    <div class="faq_bx_hd">NEWS <i class="fa fa-rocket"></i></div>
                    <marquee direction="up" onmouseover="this.stop();" onmouseout="this.start();">
                             <div class="newswrap">
                                        
                                                        <div class="newshld">
                                                 <div class="newspc"><img src="img/news1.jpg"></div>
                                                    <div class="newstxt">
                                                    Citizen gets computerized acknowledgement. Citizen can check the status of application at any time and any where (24x7)<br>
                 <b><a href="#">more...</a></b></div>
                                            </div>
                                            
                                            <div class="newshld">
                                                 <div class="newspc"><img src="img/news1.jpg"></div>
                                                    <div class="newstxt">
                                                    Citizen gets computerized acknowledgement. Citizen can check the status of application at any time and any where (24x7)<br>
                 <b><a href="#">more...</a></b></div>
                                            </div>
                                            
                                            <div class="newshld">
                                                 <div class="newspc"><img src="img/news1.jpg"></div>
                                                    <div class="newstxt">
                                                    Citizen gets computerized acknowledgement. Citizen can check the status of application at any time and any where (24x7)<br>
                 <b><a href="#">more...</a></b></div>
                                            </div>
                                            
                                            <div class="newshld bdrnone">
                                                 <div class="newspc"><img src="img/news1.jpg"></div>
                                                    <div class="newstxt">
                                                    Citizen gets computerized acknowledgement. Citizen can check the status of application at any time and any where (24x7)<br>
                 <b><a href="#">more...</a></b></div>
                                            </div>
                                            
                            
                                    </div>
                                    </marquee>
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="col-md-9 ptop15">
                <div class="services_box">
                    <div class="services_box_hd w100 m0">ONLINE SERVICES <i class="fa fa-cubes"></i></div>
                    <div class="services_txt ptop10">
                        <div class="col-md-4">
                            <div id="department" runat="server" class="sub_serviceshd">Department</div>
                            <div class="services_txtboxhold">
                                <ul>
                                    Fdi
                                            <li><a href="#"><i class="fa fa-caret-right"></i>.</a></li>
                                    <li><a href="#"><i class="fa fa-caret-right"></i>Finance Dept.</a></li>
                                    <li><a href="#"><i class="fa fa-caret-right"></i>Fisheries & Animal Resources Dev.Dept.</a></li>
                                    <li><a href="#"><i class="fa fa-caret-right"></i>Health & Family Welfare Dept.</a></li>
                                    <li><a href="#"><i class="fa fa-caret-right"></i>Home Dept.</a></li>
                                    <li><a href="#"><i class="fa fa-caret-right"></i>Housing & Urban Development Dept.</a></li>
                                    <li><a href="#"><i class="fa fa-caret-right"></i>Revenue & Disaster Management Dept.</a></li>
                                    <li><a href="#"><i class="fa fa-caret-right"></i>ST & SC Developement, Minoritie & Backward Classes Welfare Dept.</a></li>
                                    <li><a href="#"><i class="fa fa-caret-right"></i>Panchavati Raj Dept.</a></li>
                                    <!--<li><a href="#"><i class="fa fa-caret-right"></i>Work Dept.</a></li>
                                            <li><a href="#"><i class="fa fa-caret-right"></i>Excise Dept.</a></li>
                                            <li><a href="#"><i class="fa fa-caret-right"></i>General Administration Dept.</a></li>
                                            <li><a href="#"><i class="fa fa-caret-right"></i>Agriculture Dept.</a></li>
                                            <li><a href="#"><i class="fa fa-caret-right"></i>Employment, Technical Education & Training Dept.</a></li>
                                            <li><a href="#"><i class="fa fa-caret-right"></i>Cooperation Dept.</a></li>
                                            <li><a href="#"><i class="fa fa-caret-right"></i>Forest & Environment Dept.</a></li>
                                           <li><a href="#"><i class="fa fa-caret-right"></i>School & Mass Education Dept.</a></li>
                                            <li><a href="#"><i class="fa fa-caret-right"></i>Industries Dept.</a></li>
                                           <li><a href="#"><i class="fa fa-caret-right"></i>Micro, Small & Medium Enterprises Dept.</a></li>
                                           <li><a href="#"><i class="fa fa-caret-right"></i>WCD (Social Security & Empowerment of Persons with Disabilities) Dept.</a></li>-->
                                </ul>
                            </div>

                        </div>
                        <div class="col-md-4">
                            <div id="services" runat="server" class="sub_serviceshd">Services</div>
                            <div class="services_txtboxhold">
                                <ul>
                                    <li><a href="#"><i class="fa fa-caret-right"></i>Copy of FIR to the complainant</a></li>
                                    <li><a href="#"><i class="fa fa-caret-right"></i>Disposal of Application</a></li>
                                    <li><a href="#"><i class="fa fa-caret-right"></i>Disposal of application for NOC for fairs</a></li>
                                    <li><a href="#"><i class="fa fa-caret-right"></i>Supply of copy of fire report</a></li>
                                    <li><a href="#"><i class="fa fa-caret-right"></i>Fire Certificate for Fire incident without Insurance</a></li>
                                    <li><a href="#"><i class="fa fa-caret-right"></i>Fire of Certificate for Fire incident in insured premises</a></li>
                                    <li><a href="#"><i class="fa fa-caret-right"></i>Fire incident without Damage of property</a></li>
                                    <li><a href="#"><i class="fa fa-caret-right"></i>Registration of Ex-servicemen</a></li>
                                    <!-- <li><a href="#"><i class="fa fa-caret-right"></i>Registration for Employment of ESM</a></li>
                                         <li><a href="#"><i class="fa fa-caret-right"></i>Issue of Bonafide Cert. for exemption fo holding Tax</a></li>-->
                                </ul>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="sub_serviceshd">Application</div>
                            <div class="services_txtboxhold">
                                <ul>
                                    <li><a href="#"><i class="fa fa-caret-right"></i>Copy of FIR to the complainant</a></li>
                                    <li><a href="#"><i class="fa fa-caret-right"></i>Disposal of Application</a></li>
                                    <li><a href="#"><i class="fa fa-caret-right"></i>Disposal of application for NOC for fairs</a></li>
                                    <li><a href="#"><i class="fa fa-caret-right"></i>Supply of copy of fire report</a></li>
                                    <li><a href="#"><i class="fa fa-caret-right"></i>Fire Certificate for Fire incident without Insurance</a></li>
                                    <li><a href="#"><i class="fa fa-caret-right"></i>Fire of Certificate for Fire incident in insured premises</a></li>
                                    <li><a href="#"><i class="fa fa-caret-right"></i>Fire incident without Damage of property</a></li>
                                    <li><a href="#"><i class="fa fa-caret-right"></i>Registration of Ex-servicemen</a></li>
                                    <!-- <li><a href="#"><i class="fa fa-caret-right"></i>Registration for Employment of ESM</a></li>
                                         <li><a href="#"><i class="fa fa-caret-right"></i>Issue of Bonafide Cert. for exemption fo holding Tax</a></li>-->
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <a href="../WebApp/Kiosk/HBTA/HSBT.aspx">../WebApp/Kiosk/HBTA/HSBT.aspx</a>

    </section>
    <div class="clearfix"></div>
    <section>
        <div class="row">
            <div class="col-lg-12">
                <footer id="bottom">
                    <div class="row">
                        <div class="col-lg-12  ptop10">
                            <nav class="bottomnavbar">
                                <ul>
                                    <li><a href="#">HOME</a>|</li>
                                    <li><a href="#">ACT</a>| </li>
                                    <li><a href="#">FORMS</a>| </li>
                                    <li><a href="#">DEPARTMENTS</a>|</li>
                                    <li><a href="#">FAQ’S</a>|</li>
                                    <li><a href="#">CONTRACTS</a>|</li>
                                    <li><a href="#">CONTACT US</a></li>
                                </ul>
                            </nav>


                        </div>
                        <div class="clearfix"></div>
                        <div class="col-xs-12 col-lg-12">
                            <div class="col-md-10 ptop15">
                                <p class="copyrght">
                                    Site is designed, hosted and maintained by Citizen Services Portal.
                                    <br>
                                    Contents on this website is owned, updated and managed by the Citizen Services Portal. © 2016 - CSP
                                </p>
                            </div>
                            <div class="col-md-2 copyrght">
                                <img src="img/csc_logo.png">
                            </div>

                        </div>
                    </div>
           
        </footer>
                 </div>
        </div>
    </section>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../js/jquery.min.js"><\/script>')</script>
    <script src="js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>

</body>
</html>

