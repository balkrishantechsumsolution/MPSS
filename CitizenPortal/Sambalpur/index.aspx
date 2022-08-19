<%@ Page Title="" Language="C#" MasterPageFile="~/Sambalpur/master/Home.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="CitizenPortal.Sambalpur.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            window.location.href = '/CSVTU/Index.aspx';
            $("#seemorelinks").click(function () {
                $("#morequick-link").toggle(900);
            });
        });
    </script>
    <script type="text/javascript">
        $(window).on('load', function () {
            $('#costumModal4').modal('show');
        });
        function TakeAction(T_URL, ID) {
            //var t_URL = ResolveUrl(p_URL);
            var t_URL = "/WebApp/Kiosk/MigrationSU/MigrationSU.aspx";
            t_URL = t_URL + "?UID=" + ID;
            //window.open(t_URL, 'ViewDoc', 'height=500px,width=700px,titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes');
            //return false;
            window.location.href = t_URL;
        }
    </script>
    <style type="text/css">
        #morequick-link {
            display: none;
        }

        .navbar-toggler {
            z-index: 1;
        }

        .enrollment-txt {
            position: absolute;
            background-color: #16a96c;
            width: 100%;
            max-width: 395px;
            color: #fff;
            height: auto;
            font-family: 'Heebo-Bold', Helvetica, Arial, sans-serif;
            border-top-left-radius: 2px;
            border-top-right-radius: 2px;
            top: 19.5em;
            right: 0;
            /* bottom: 0; */
            /* left: 20px; */
            left: 47%;
            font-size: 1.6em;
            padding: 5px 15px 15px;
        }

        .techcallno {
            position: absolute;
            right: 1em;
            top: 2em;
            background-color: #efdd04;
            padding: 10px;
            color: #671c1c;
            font-size: 1em;
            line-height: 22px;
            font-family: 'Heebo-Bold', Helvetica, Arial, sans-serif;
            border-radius: 3px;
        }

        @media (max-width: 576px) {
            nav > .container {
                width: 100%;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--Modal START Here-->
    <%--<div id="costumModal4" class="modal" data-easein="flipBounceXIn" tabindex="-1" role="dialog" aria-labelledby="costumModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title mdlHd-txt">Important Information
                    </h4>
                </div>
                <div class="modal-body">
                    <ul>
                        <li><a href="#">Schedule of Sports Trials</a></li>
                        <li><a href="#">Steps to be followed for ECA admission UG2017</a></li>
                        <li><a href="#">Schedule for Admission on the Basis of ECA In Undergraduate Courses 2017</a></li>
                        <li><a href="#">List Of colleges offering ECA Under different Activities/ Subcategories</a></li>
                        <li><a href="#">Final Merit List of ECA Selected Candidates UG-2017.</a></li>
                        <li><a href="#">Schedule of Sports Admission</a></li>
                        <li>The Marks of Sports Certificate has been displayed on the dashboard of the applicants. The applicants who have secured marks in Sports Certificate will only be eligible for Sports Trials. The applicants should refer the Schedule of Sports Trials on the UG Portal. For any grievance related to Sports under the Admission Helpline Menu, click on Grievance and use “Sports Quota” from the Dropdown Menu under Select Grievance Category and submit your Grievance. No Grievance will be entertained after Sunday, 25th, June 2017 after 3:00 pm.</li>
                    </ul>
                </div>
                <div class="modal-footer" style="text-align: center !important;">
                    <button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">
                        Close
                    </button>

                </div>
            </div>
        </div>
    </div>--%>
    <!--Modal END Here-->

    <section class="slide-img">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-lg-4" style="float:right">
                <div class="techcallno">
                    <h4 style="margin-top: 0; margin-bottom: 5px;">Support Desk Details </h4>
                    Email ID : csvtu[dot]helpdesk[at]gmail[dot]com
                <br />
                    Mobile No.: 88171 19597
               <%-- Email ID : sambhalpur[dot]university[at]gmail[dot]com
                <br />
                Mobile No.: 7000745655 / 9078570345<br>--%><br />
                    (Please call during working days from 10:00 AM to 5:00 PM)
                </div>
                
            </div>
        </div>
        <div class="row">
            <!-------+ DTE Councelling Enrollment Form Link--------->
            <div class="col-xs-12 col-sm-12 col-lg-4">

                <div class="admission-txt" style="">
                    <%--<a href="/WebApp/Entrance/PhD/CSVTUPage.aspx">--%>
                    <a href="/WebApp/Citizen/Forms/Geustuser.aspx?SvcID=1469">
                        <div style="right: 35px; bottom: -43%; width: 450px;">
                            <div style="float: left; background-color: #e8e8e8; min-height: 70px; padding: 5px;">
                                <img src="/Sambalpur/img/DigiVarsity.png" width="70" alt="DigiVarsity Logo" class="pright5" />
                            </div>
                            <div style="background-color: #FFFF4D; color: #C44A2D; text-align: center; padding: 9px; line-height: 19px; border-radius: 10px;">
                                <b style="font-size: 15px; font-family: 'OpenSans-Bold', Helvetica, Arial, sans-serif;">Enrollment for Part time & Diploma/UTD Student 
                                </b>
                                <br />
                                <span style="font-size: 12px; color: darkblue">(Application for admission into CSVTU though Part Time Diploma/UTD, 2021-2022)</span>
                            </div>
                        </div>
                    </a>
                </div>

            </div>
        </div>
        <div class="row" style="margin-top:85px">
            

            <div class="col-xs-12 col-sm-12 col-lg-4">

                <div class="admission-txt" style="">
                    <%--<a href="/WebApp/Entrance/PhD/CSVTUPage.aspx">--%>
                    <a href="/WebApp/Enrollment/SearchForm.aspx">
                        <div style="right: 35px; bottom: -43%; width: 450px;">
                            <div style="float: left; background-color: #e8e8e8; min-height: 70px; padding: 5px;">
                                <img src="/Sambalpur/img/DigiVarsity.png" width="70" alt="DigiVarsity Logo" class="pright5" />
                            </div>
                            <div style="background-color: #FFFF4D; color: #C44A2D; text-align: center; padding: 9px; line-height: 19px; border-radius: 10px;">
                                <b style="font-size: 15px; font-family: 'OpenSans-Bold', Helvetica, Arial, sans-serif;">Enrollment for Admission into CSVTU-2021-2022 
                                </b>
                                <br />
                                <span style="font-size: 12px; color: darkblue">(Application for admission into CSVTU though DTE Counselling, 2021-2022)</span>
                            </div>
                        </div>
                    </a>
                </div>

            </div>
            <!--blank-->
           <!-------+ DTE Councelling Enrollment Form Link--------->
            <div class="col-xs-12 col-sm-12 col-lg-4">

                <div class="admission-txt" style="">
                    <%--<a href="/WebApp/Entrance/PhD/CSVTUPage.aspx">--%>
                    <a href="/WebApp/Citizen/Forms/Geustuser.aspx?SvcID=1469">
                        <div style="right: 35px; bottom: -43%; width: 450px;">
                            <div style="float: left; background-color: #e8e8e8; min-height: 70px; padding: 5px;">
                                <img src="/Sambalpur/img/DigiVarsity.png" width="70" alt="DigiVarsity Logo" class="pright5" />
                            </div>
                            <div style="background-color: #FFFF4D; color: #C44A2D; text-align: center; padding: 9px; line-height: 19px; border-radius: 10px;">
                                <b style="font-size: 15px; font-family: 'OpenSans-Bold', Helvetica, Arial, sans-serif;">Enrollment for Part time & Diploma/UTD Student 
                                </b>
                                <br />
                                <span style="font-size: 12px; color: darkblue">(Application for admission into CSVTU though Part Time Diploma/UTD, 2021-2022)</span>
                            </div>
                        </div>
                    </a>
                </div>

            </div>
            <!-------+ Link to rest the Password for Existing CSVTU Student--------->
            <div class="col-xs-12 col-sm-12 col-lg-4">

                <div class="admission-txt" style="left: 2.5em;">
                    <%--<a href="/WebApp/Entrance/PhD/CSVTUPage.aspx">--%>
                    <a href="/WebApp/Examination/SearchStudent.aspx">
                        <div style="right: 35px; bottom: -43%; width: 450px;">
                            <div style="background-color: #FFFF4D; color: #C44A2D; text-align: center; padding: 9px; line-height: 19px; border-radius: 10px;float:left;margin-right: -5px;">
                                <b style="font-size: 15px; font-family: 'OpenSans-Bold', Helvetica, Arial, sans-serif;">Reset Password for Exisitng CSVTU Student 
                                </b>
                                <br />
                                <span style="font-size: 12px; color: darkblue">(Reset Password for accessing Digivarsity Portal)</span><br />
                                <span style="font-size: 12px; color: darkblue">for Student Enrolled before 2021</span>
                            </div>
                            <div style="float: left; background-color: #e8e8e8; min-height: 70px; padding: 5px;">
                                <img src="/Sambalpur/img/DigiVarsity.png" width="70" alt="DigiVarsity Logo" class="pright5" />
                            </div>
                        </div>
                    </a>
                </div>

            </div>
        </div>



        
    </section>
    <section id="#wrapper">
        <div class="container-fluid">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="morequick-link">
                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                    <ul>
                        <li><a href="https://suniv.ac.in/page.php?page=-ddce-su" target="_blank">Directorate of Distance & Continuing Education</a>
                        </li>
                        <li><a href="http://suiit.ac.in/" target="_blank">www.suiit.ac.in</a>
                        </li>
                        <li><a href="http://suniv.ac.in/upload/List_of_Colleges%20_Aff.pdf" target="_blank">Colleges</a>
                        </li>
                        <li><a href="https://suniv.ac.in/page.php?page=advertisement-forms" target="_blank">Advertisement & Forms</a>
                        </li>
                    </ul>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                    <ul>
                        <li><a href="https://suniv.ac.in/page.php?page=museums-collections" target="_blank">Museums & Collections</a>
                        </li>
                        <li><a href="http://suniv.ac.in/events.php" target="_blank">Current Events</a>
                        </li>
                        <li><a href="https://suniv.ac.in/page.php?page=nearby-places-to-visit" target="_blank">Nearby Places to Visit</a>
                        </li>
                        <li><a href="https://suniv.ac.in/page.php?page=pec-su" target="_blank">Private Examination Cell</a>
                        </li>
                    </ul>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                    <ul>
                        <li><a href="https://www.suniv.ac.in/page.php?page=civil-service-coaching-centre-cscc-" target="_blank">Civil Service Coaching Centre (CSCC)</a>
                        </li>
                        <li><a href="https://suniv.ac.in/page.php?page=senate-meeting" target="_blank">Senate Meeting</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="clearfix"></div>

            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mtop20 pleft0 pright0">
                <ul class="nav nav-tabs">
                    <li class="active"><a data-toggle="tab" href="#newsupadate">University Profile</a>
                    <%--<li style=""><a data-toggle="tab" href="#counterbaseapp">Counterbase Application</a>
                    <li style=""><a data-toggle="tab" href="#semesterexamapp">Semester Exam Form Fill-up</a>--%>
                    </li>
                </ul>

                <div class="tab-content" style="background-color: #fff; border-right: 1px solid #ddd; border-bottom: 1px solid #ddd; border-left: 1px solid #ddd; padding: 10px; overflow-y: scroll; height: 100%; max-height: 450px; margin-bottom: 15px;">
                    <div id="newsupadate" class="tab-pane fade in active tab-content">
                        <h3>About</h3>
                        <div class="col-md-12 cms-page-content">
                            <p><b>Chhattisgarh Swami Vivekanand Technical University (CSVTU)</b> was established by an act (No. 25 of 2004) of legislature passed by the Chhattisgarh State Govt. Assembly vide notification no. 639/21-A/Praroopan/04 dt 21st January 2005 to incorporate a University and Technology for the purpose of ensuring systematic, efficient and quality education in engineering and technological subjects including Architecture and Pharmacy at Research, Post graduate, Degree and Diploma level.</p>
                            <p>The University since its inception in the year 2005 is striving hard to emerge as one of the nations prominent Universities to fulfill its commitment to the service of state and nation. It was inaugurated on 30th April 2005 by the Hon’ble <b>Prime-Minister of India Dr. Manmohan Singh.</b> The University without waiting for full fledged infrastructure development started identifying the frontier area of research and development and outreach programmes for the benefit of the society. With this approach several academic programmes, seminars, workshops and conferences have been conducted by the University during past 5 years.</p>
                            <p>In order to improve the standards of the education and enable the students to acquire the knowledge and skills required in the professional world the scheme of teaching, learning and syllabus was designed and implemented by way of brainstorming session, taskforce, group working and workshops on Redefining the Technical Education. The efforts have been widely appreciated and the University has earned distinction of introducing soft skills as a part of the curriculum. The courses include communication skills, group discussion, human values education, health hygiene and yoga, personality development, entrepreneurship and project based learning.</p>
                            <p>The permanent campus of the University encircles 250 acres of land in the vicinity of Bhilai township considered to be one of the most eminent education hubs in India. The formalities of acquisition of land have been completed and construction of the University building and related facilities are in progress. The construction of University Administrative building is complete.</p>
                            <p><b>Presently there are 44 Engineering Colleges, 1 Architecture Institution, 40 Polytechnics and 11 Pharmacy colleges affiliated to the University.</b></p>
                            <p>University has introduced digitalized evaluation system over the last few years that has brought in a sea-change in the publication of result precisely ahead of the schedule, thereby increasing substantially the available time for teaching and interaction with the students.</p>
                            <p>Owing to the different reformative measures adopted by the university, <b>WORLD MANAGEMENT CONGRESS</b>, Higher Education and Development Summit, conferred <b>“EMERGING TECHNOLOGICAL UNIVERSITY OF THE YEAR AWARD”</b>on 30th Dec 2011 during the global meet held at world Management Congress New Delhi. The Chief Minister, Chhattisgarh has expressed his happiness – which in fact has added another new dimension to the enhancement of visibility of the University in the current challenging scenario of upgrading educational standards.</p>
                        </div>

                    </div>

                    <div id="counterbaseapp" class="tab-pane fade ">
                        <div class="table-responsive">
                            <asp:GridView ID="grdView1" runat="server" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" OnRowDataBound="grdView1_RowDataBound">
                            </asp:GridView>
                        </div>
                    </div>
                    <div id="semesterexamapp" class="tab-pane fade ">
                        <div class="table-responsive">
                            <asp:GridView ID="GridView1" runat="server" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" OnRowDataBound="grdView1_RowDataBound">
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>

            <div class="clearfix"></div>
            <div class="mtop20"></div>


            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 admission-noticebox" style="display: none;">
                <h2>Admission Notice for the year 2018-19</h2>
                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                    <div class="panel panel-warning bdrnone">
                        <div class="panel-heading blue-panelhd">
                            <h2>PG Admissions 2018-19</h2>
                        </div>
                        <div class="panel-body blue-panelhd-txt">
                            <a href="#">
                                <h4>PG Admissions 2018-19 <span class="clck-here">Click Here &gt;&gt; </span></h4>
                            </a>
                            <a href="#">
                                <h4>Admission Lists 2018-19 <span class="clck-here">Click Here &gt;&gt; </span></h4>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                    <div class="panel panel-warning bdrnone">
                        <div class="panel-heading blue-panelhd">
                            <h2>M.Phil./Ph.D. Admissions 2018-19</h2>
                        </div>
                        <div class="panel-body blue-panelhd-txt">
                            <a href="#">
                                <h4>M.Phil./Ph.D. Admissions 2018-19 <span class="clck-here">Click Here &gt;&gt; </span></h4>
                            </a>
                            <a href="#">
                                <h4>Admission Lists 2018-19 <span class="clck-here">Click Here &gt;&gt; </span></h4>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                    <div class="panel panel-warning bdrnone">
                        <div class="panel-heading blue-panelhd">
                            <h2>UG Admissions 2018-19 (Entrance Based)</h2>
                        </div>
                        <div class="panel-body blue-panelhd-txt">
                            <a href="#">
                                <h4>UG Admissions 2018-19 <span class="clck-here">Click Here &gt;&gt; </span></h4>
                            </a>
                            <a href="#">
                                <h4>Admission Lists 2018-19 <span class="clck-here">Click Here &gt;&gt; </span></h4>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
