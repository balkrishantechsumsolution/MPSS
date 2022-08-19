<%@ Page Title="" Language="C#" MasterPageFile="~/g2c/master/Home.Master" AutoEventWireup="true" CodeBehind="sitemap.aspx.cs" Inherits="CitizenPortal.g2c.forms.sitemap" EnableSessionState="False" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbody" runat="server">
    <div class="row mbtm10">
        <div class="w95">
            <h1>SITEMAP</h1>
            <div class="col-lg-12 mtop10 stmp">
                <div class="col-md-4 pleft0">
                    <h1>GENERAL</h1>
                    <ul>
                        <li><a href="index.aspx">Home</a></li>
                        <li><a href="act.aspx">Act</a></li>
                        <li><a href="/WebApp/Citizen/Forms/Geustuser.aspx">Apply for Citizen Services</a></li>
                        <li><a href="whos_who.aspx">Who’s Who</a></li>
                        <li><a href="forms.aspx">Forms</a></li>
                        <li><a href="departments.aspx">Departments</a></li>
                        <li><a href="http://ortpsa.in/pmu_cell.php" target="_blank">PMU</a></li>
                        <li><a href="faq.aspx">FAQ</a></li>
                        <li><a href="http://ortpsa.in/contact_us.php" target="_blank">Contacts</a></li>
                    </ul>

                </div>
                <div class="col-md-5">
                    <h1>SERVICES</h1>
                    <b class="mtop15">Social Security and Empowerment of Person Disability (SSEPD)</b>
                    <ul>
                        <li><a href="/Account/Login">National Family Benefit Scheme (NFBS)</a></li>
                        <li><a href="/Account/Login">Indira Gandhi National Disabled Pension Scheme (IGNDP)</a></li>
                        <li><a href="/Account/Login">Indira Gandhi National Widow Pension Scheme (IGNWP)</a></li>
                        <li><a href="/Account/Login">Indira Gandhi National Old Age Pension Scheme (IGNOAP)</a></li>
                        <li><a href="/Account/Login">Madhu Babu Pension Yojana (MBPY)</a></li>
                    </ul>

                </div>

                <div class="col-md-3 mtop15 pright0">
                    <b class="mtop15">Home Department</b>
                    <ul>
                        <li><a href="/WebApp/Citizen/Forms/Geustuser.aspx?SvcID=388">Application for Recruitment of Constables</a></li>
                        <li><a href="/WebApp/Citizen/Forms/Geustuser.aspx?SvcID=389">Application for Recruitment of Group D Staff</a></li>
                    </ul>

                </div>

                <div class="clearfix"></div>

                <div class="col-md-4 mtop10 pleft0">
                    <h1>HELP</h1>
                    <ul>
                        <li><a href="#">Disclaimer & Policies</a></li>
                        <li><a href="#">Terms & Condition</a></li>
                        <li><a href="http://g2cservices.in/g2c/forms/CenterList.aspx">List of CSC Centers in Odisha</a></li>
                        <li><a href="/webapp/kiosk/forms/applicationstatus.aspx">Track Application</a></li>
                    </ul>

                </div>
                <div class="col-md-4  mtop10">
                    <h1>USEFUL LINKS</h1>
                    <ul>
                        <li><a href="/Account/Login" target="_blank">Login</a></li>
                        <li><a href="http://gis.csc.gov.in/locator/csc.aspx" target="_blank">Locate CSC Center</a></li>
                        <li><a href="#">News & Achievement</a></li>
                        <li><a href="http://ortpsa.in/circulars.php" target="_blank">Circulars</a></li>
                    </ul>

                </div>

            </div>
        </div>
    </div>
</asp:Content>
