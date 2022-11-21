<%@ Page Title="" Language="C#" MasterPageFile="~/g2c/master/Home.Master" AutoEventWireup="true" CodeBehind="departments.aspx.cs" Inherits="WebApplication1.lokaseba_adhikar.forms.departments" EnableSessionState="False"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbody" runat="server">
    <div class="row">
        <div class="w95">
            <h1>Departments</h1>

            <p>The following departments have selected certain services under Odisha Right to Public Service Act, 2012.</p>
            <div class=" col-xs-12 col-lg-9 p0 mbtm15">
                <table class="act">
                    <thead>
                        <tr>
                            <th width="5%" class="tblhd">Sl No.</th>
                            <th width="40%" class="tblhd">Department Name</th>
                            <th width="10%" class="tblhd">No. of Services</th>
                            <th width="33%" class="tblhd">Website</th>
                            <th width="12%" class="tblhd">Manuals</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>Agriculture</td>
                            <td>6</td>
                            <td><a href="http://agriodisha.nic.in/Http_public/index.aspx" target="_blank">http://agriodisha.nic.in/Http_public/index.aspx</a></td>
                            <td>-</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Commerce & Transport</td>
                            <td>32</td>
                            <td><a href="http://www.odisha.gov.in/commerce_transport/" target="_blank">http://www.odisha.gov.in/commerce_transport/</a></td>
                            <td>-</td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>Co-operation</td>
                            <td>28</td>
                            <td><a href="http://coopodisha.gov.in/" target="_blank">http://coopodisha.gov.in/</a></td>
                            <td>-</td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>Employment and Technical Education & Training</td>
                            <td>11</td>
                            <td><a href="http://etetodisha.gov.in/" target="_blank">http://etetodisha.gov.in/</a></td>
                            <td><a href="../pdf/employment_and_technical_education_training_csc.pdf">Download Manual</a></td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td>Excise</td>
                            <td>2</td>
                            <td><a href="http://excise.odisha.gov.in/" target="_blank">http://excise.odisha.gov.in/</a></td>
                            <td><a href="../pdf/excise_dept_csc.pdf">Download Manual</a></td>
                        </tr>
                        <tr>
                            <td>6</td>
                            <td>Finance</td>
                            <td>8</td>
                            <td><a href="http://www.odisha.gov.in/finance/index.htm" target="_blank">http://www.odisha.gov.in/finance/index.htm</a></td>
                            <td>-</td>
                        </tr>
                        <tr>
                            <td>7</td>
                            <td>Fisheries & Animal Resources Dev</td>
                            <td>17</td>
                            <td><a href="http://www.fardodisha.gov.in/" target="_blank">http://www.fardodisha.gov.in/</a></td>
                            <td>-</td>
                        </tr>
                        <tr>
                            <td>8</td>
                            <td>Forest & Environment</td>
                            <td>11</td>
                            <td><a href="http://www.odisha.gov.in/forest_environment/index.htm">http://www.odisha.gov.in/forest_environment/index.htm</a></td>
                            <td>-</td>
                        </tr>
                        <tr>
                            <td>9</td>
                            <td>General Administration</td>
                            <td>3</td>
                            <td><a href="http://www.gaodisha.gov.in/" target="_blank">http://www.gaodisha.gov.in/</a></td>
                            <td>-</td>
                        </tr>
                        <tr>
                            <td>10</td>
                            <td>Health & Family Welfare</td>
                            <td>2</td>
                            <td><a href="http://www.odisha.gov.in/health_portal/index.html" target="_blank">http://www.odisha.gov.in/health_portal/index.html</a></td>
                            <td>-</td>
                        </tr>
                        <tr>
                            <td>11</td>
                            <td>Higher Education</td>
                            <td>39</td>
                            <td><a href="http://dheorissa.in/" target="_blank">http://dheorissa.in/</a></td>
                            <td>-</td>
                        </tr>
                        <tr>
                            <td>12</td>
                            <td>Home</td>
                            <td>31</td>
                            <td><a href="http://www.homeodisha.gov.in/" target="_blank">http://www.homeodisha.gov.in/</a></td>
                            <td>-</td>
                        </tr>
                        <tr>
                            <td>13</td>
                            <td>Housing & Urban Development</td>
                            <td>30</td>
                            <td><a href="http://www.urbanodisha.gov.in/" target="_blank">http://www.urbanodisha.gov.in/</a></td>
                            <td>-</td>
                        </tr>
                        <tr>
                            <td>14</td>
                            <td>Industries</td>
                            <td>6</td>
                            <td><a href="http://www.odisha.gov.in/industries/index.htm" target="_blank">http://www.odisha.gov.in/industries/index.htm</a></td>
                            <td>-</td>
                        </tr>
                        <tr>
                            <td>15</td>
                            <td>Labour & Employees' State Insurance</td>
                            <td>20</td>
                            <td><a href="http://labour.odisha.gov.in/" target="_blank">http://labour.odisha.gov.in/</a></td>
                            <td>-</td>
                        </tr>
                        <tr>
                            <td>16</td>
                            <td>Panchayati Raj</td>
                            <td>3</td>
                            <td><a href="http://www.odishapanchayat.gov.in/" target="_blank">http://www.odishapanchayat.gov.in/</a></td>
                            <td>-</td>
                        </tr>
                        <tr>
                            <td>17</td>
                            <td>Revenue & Disaster Management</td>
                            <td>34</td>
                            <td><a href="http://www.odisha.gov.in/revenue/index.html" target="_blank">http://www.odisha.gov.in/revenue/index.html</a></td>
                            <td>-</td>
                        </tr>
                        <tr>
                            <td>18</td>
                            <td>ST & SC Development, Minorities & Backward Classes Welfare</td>
                            <td>3</td>
                            <td><a href="http://www.stscodisha.gov.in/" target="_blank">http://www.stscodisha.gov.in/</a></td>
                            <td><a href="../pdf/st_and-sc_dept_35_36_164_csc.pdf">Download Manual</a></td>
                        </tr>
                        <tr>
                            <td>19</td>
                            <td>School & Mass Education</td>
                            <td>7</td>
                            <td><a href="http://www.odisha.gov.in/schooleducation/index.html" target="_blank">http://www.odisha.gov.in/schooleducation/index.html</a></td>
                            <td>-</td>
                        </tr>
                        <tr>
                            <td>20</td>
                            <td>Social Securities and Empowerment of Person with Disabilities (SSEPD)</td>
                            <td>1</td>
                            <td><a href="http://ssepd.gov.in/" target="_blank">http://ssepd.gov.in/</a></td>
                            <td>-</td>
                        </tr>
                        <tr>
                            <td>21</td>
                            <td>Works</td>
                            <td>1</td>
                            <td><a href="http://www.worksodisha.gov.in/" target="_blank">http://www.worksodisha.gov.in/</a></td>
                            <td>-</td>
                        </tr>
                        <tr>
                            <td>22</td>
                            <td>Micro, Small & Medium Enterprise</td>
                            <td>29</td>
                            <td><a href="http://www.msmeodisha.gov.in/" target="_blank">http://www.msmeodisha.gov.in/</a></td>
                            <td>-</td>
                        </tr>
                    </tbody>
                </table>
            </div>

        </div>
    </div>
</asp:Content>
