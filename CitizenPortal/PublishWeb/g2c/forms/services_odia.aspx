<%@ Page Title="" Language="C#" MasterPageFile="~/g2c/master/HomeOdia.Master" AutoEventWireup="true" CodeBehind="services_odia.aspx.cs" Inherits="CitizenPortal.g2c.forms.services_odia" EnableSessionState="False"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        table.serviceTbles  {
            width: 100%;
            border-top: 1px solid #D1D9DC;
            border-left: 1px solid #D1D9DC;
            font-size: 14px;
            line-height: 40px;
        }

            table.serviceTbles  tbody tr th {
                background-color: #1C3048 !important;
                color: #fff !important;
                padding-left:8px;
                font-family: 'proximanovaaltbold';
            }

            table.serviceTbles  tr td {
                padding-left: 8px;
                border-right: 1px solid #D1D9DC;
                border-bottom: 1px solid #D1D9DC;
            }
        .visibleTab { display:block;
        }
        .hiddenTab {
            display:none;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
         
            $("#ddldept").change(function () {
                $('#agricultureDept').hide();
                $("#cmrceTrnsptDept").hide();
                $("#cooperationDept").hide();
                $("#emplmntTechnicalDept").hide();
                $("#exciseDept").hide();
                $("#financeDept").hide();
                $("#fisheriesDept").hide();
                $("#forestDept").hide();
                $("#generalAdminDept").hide();
                $("#healthfamilyDept").hide();
                $("#higherEduDept").hide();
                $("#homeDept").hide();
                $("#housingUrbanDept").hide();
                $("#industriesDept").hide();
                $("#labourESIDept").hide();
                $("#panchayatiDept").hide();
                $("#revenueDsterDept").hide();
                $("#backwardClassesDept").hide();
                $("#massEduDept").hide();
                $("#ssepd_Dept").hide();
                $("#worksDept").hide();
                $("#enterpriseDept").hide();
                var result = this.value;
             
                if (result != "") {
                    $(result).show();
                } else {
                    $(result).hide();
                }


                });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbody" runat="server">
    <div class="row">
        <div class="w95" style="min-height:400px;">
            <h1>ସେବା</h1>
            <div class="col-lg-12">
                <p>Select the department to know the list of Services under Odisha Right to Public Services Act, 2012.</p>
              <div style="background-color:rgba(217, 217, 217, 0.9); width: 728px; height: 57px; border-radius: 2px; padding: 12px 10px 10px 10px;">
                <div class="col-xs-4 mbtm20 pleft0"><b style="color:#000;">Select the Departments</b></div>
                <div class="col-xs-8 mbtm20">
                    <select name="deptList" id="ddldept" style="font-size: 13px; width: 450px; height: 32px; border:2px solid #d8d8d8;">
                        <option selected="selected" value="">---Select Department---</option>
                        <option value="#agricultureDept">Agriculture</option>
                        <option value="#cmrceTrnsptDept">Commerce &amp;  Transport</option>
                        <option value="#cooperationDept">Co-operation</option>
                        <option value="#emplmntTechnicalDept">Employment and Technical Education &amp; Training</option>
                        <option value="#exciseDept">Excise</option>
                        <option value="#financeDept">Finance</option>
                        <option value="#fisheriesDept">Fisheries &amp; Animal Resources Dev</option>
                        <option value="#forestDept">Forest &amp; Environment</option>
                        <option value="#generalAdminDept">General Administration</option>
                        <option value="#healthfamilyDept">Health &amp; Family Welfare</option>
                        <option value="#higherEduDept">Higher Education</option>
                        <option value="#homeDept">Home</option>
                        <option value="#housingUrbanDept">Housing &amp; Urban Development</option>
                        <option value="#industriesDept">Industries</option>
                        <option value="#labourESIDept">Labour &amp; Employees' State Insurance</option>
                        <option value="#panchayatiDept">Panchayati Raj</option>
                        <option value="#revenueDsterDept">Revenue &amp; Disaster Management</option>
                        <option value="#backwardClassesDept">ST &amp; SC Development, Minorities &amp; Backward Classes Welfare</option>
                        <option value="#massEduDept">School &amp; Mass Education</option>
                        <option value="#ssepd_Dept">Social Security and Empowerment of Person with Disabilities</option>
                        <option value="#worksDept">Works</option>
                        <option value="#enterpriseDept">Micro, Small &amp; Medium Enterprise</option>

                    </select>
                </div>
                   </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-lg-12">
                <div id="agricultureDept" class="hiddenTab table-responsive">
                    <h2>Agriculture</h2>
                    <table class="serviceTbles table">
                        <tr>
                            <td class="srvcshdtxt">S.No.</td>
                            <td class="srvcshdtxt">Services</td>
                            <td class="srvcshdtxt">Time Limit</td>
                            <td class="srvcshdtxt">Designated Officer</td>
                            <td class="srvcshdtxt">Appellate Authority</td>
                            <td class="srvcshdtxt">Revisional Authority</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>Seed License</td>
                            <td>45 days</td>
                            <td>DAO/JDA(F&amp;S)</td>
                            <td>DDA/ADA(Extn)</td>
                            <td>DA&amp;FP(O)</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Fertilizer License</td>
                            <td>45 days</td>
                            <td>DAO/JDA(F&amp;C)</td>
                            <td>DDA/ADA(Extn)</td>
                            <td>DA&amp;FP(O)</td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>Pesticide License</td>
                            <td>45 days</td>
                            <td>DAO/DDA(PP)</td>
                            <td>DDA/ADA(Extn)</td>
                            <td>DA&amp;FP(O)</td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>Soil Health Card</td>
                            <td>45 days</td>
                            <td>AAO</td>
                            <td>DAO</td>
                            <td>DDA</td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td>Seed License</td>
                            <td>45 days</td>
                            <td>Dy. Director of Horticulture/Asst. Director of Horticulture</td>
                            <td>Jt. Director of Horticulture</td>
                            <td>Director of Horticulture</td>
                        </tr>
                        <tr>
                            <td>6</td>
                            <td>Fertilizer License</td>
                            <td>90 days</td>
                            <td>Dy. Director of Horticulture/Asst. Director of Horticulture</td>
                            <td>Jt. Director of Horticulture</td>
                            <td>Director of Horticulture</td>
                        </tr>
                    </table>
                </div>
                <div class="clearfix"></div>
                <div id="cmrceTrnsptDept" class="hiddenTab table-responsive">
                    <h2>Commerce & Transport</h2>
                    <table class="serviceTbles table">
                        <tbody>
                            <tr>
                                <th scope="col">S.No.</th>
                                <th scope="col">Services</th>
                                <th scope="col">Time Limit</th>
                                <th scope="col">Designated Officer</th>
                                <th scope="col">Appellate Authority</th>
                                <th scope="col">Revisional Authority</th>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Temporary Registration</td>
                                <td>3 Days</td>
                                <td>MVI/ Addl. RTO/RTO</td>
                                <td>RTO/Sub-Collector</td>
                                <td>Collector-cum-Chairman, RTA</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Registration of Vehicles</td>
                                <td>7 Days</td>
                                <td>MVI/ Addl. RTO/RTO</td>
                                <td>RTO/Sub-Collector</td>
                                <td>Collector-cum-Chairman, RTA</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Tax Clearance Certificate(TCC) in Form-D</td>
                                <td>4 Days</td>
                                <td>MVI/ Addl. RTO/RTO</td>
                                <td>RTO/Sub-Collector</td>
                                <td>Collector-cum-Chairman, RTA</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>NOC in Form-28</td>
                                <td>4 Days (after receipt of Police clearance report)</td>
                                <td>MVI/ Addl. RTO/RTO</td>
                                <td>RTO/Sub-Collector</td>
                                <td>Collector-cum-Chairman, RTA</td>

                            </tr>
                            <tr>
                                <td>5</td>
                                <td>Addition/Deletion of Hire Purchase/Mortgage entry</td>
                                <td>4  Days (after receipt of confirmation from Financier)</td>
                                <td>MVI/ Addl. RTO/RTO</td>
                                <td>RTO/Sub-Collector</td>
                                <td>Collector-cum-Chairman, RTA</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td>Transfer of ownership of vehicle</td>
                                <td>4 Days(after appearance of both seller &amp; purchaser)</td>
                                <td>MVI/ Addl. RTO/RTO</td>
                                <td>RTO/Sub-Collector</td>
                                <td>Collector-cum-Chairman, RTA</td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td>Issue of Lerner's License for Driving License</td>
                                <td>3 days from the date of appearance for test</td>
                                <td>MVI/ Addl. RTO/RTO</td>
                                <td>RTO/Sub-Collector</td>
                                <td>Collector-cum-Chairman, RTA</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td>Issue Driving License</td>
                                <td>5 Days (after passing in the test)</td>
                                <td>MVI/ Addl. RTO/RTO</td>
                                <td>RTO/Sub-Collector</td>
                                <td>Collector-cum-Chairman, RTA</td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td>Renewal of Driving License</td>
                                <td>5 Days</td>
                                <td>MVI/ Addl. RTO/RTO</td>
                                <td>RTO/Sub-Collector</td>
                                <td>Collector-cum-Chairman, RTA</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td>Issue of Duplicate Driving license</td>
                                <td>5 Days</td>
                                <td>MVI/ Addl. RTO/RTO</td>
                                <td>RTO/Sub-Collector</td>
                                <td>Collector-cum-Chairman, RTA</td>
                            </tr>
                            <tr>
                                <td>11</td>
                                <td>Issue of Trade Certificate</td>
                                <td>30 Days</td>
                                <td>MVI/ Addl. RTO/RTO</td>
                                <td>RTO/Sub-Collector</td>
                                <td>Collector-cum-Chairman, RTA</td>

                            </tr>
                            <tr>
                                <td>12</td>
                                <td>Issue of Transporting Agents' License</td>
                                <td>30 days after receipt of clearance from Mining Department wherever necessary</td>
                                <td>MVI/ Addl. RTO/RTO</td>
                                <td>RTO/Sub-Collector</td>
                                <td>Collector-cum-Chairman, RTA</td>
                            </tr>
                            <tr>
                                <td>13</td>
                                <td>Issue of Fitness Certificate for Transport Vehicle</td>
                                <td>3 Days (after production of vehicle for inspection &amp; compliance to rules)</td>
                                <td>Junior MVI/MVI</td>
                                <td>RTO/Sub-Collector</td>
                                <td>Collector-cum-Chairman, RTA</td>
                            </tr>
                            <tr>
                                <td>14</td>
                                <td>Issue of Conductor License </td>
                                <td>7 days</td>
                                <td>MVI/ Addl. RTO/RTO</td>
                                <td>RTO/Sub-Collector </td>
                                <td>Collector-cum- Chairman, RTA</td>
                            </tr>
                            <tr>
                                <td>15</td>
                                <td>Renewal of Conductor License</td>
                                <td>7 days</td>
                                <td>MVI/ Addl. RTO/RTO</td>
                                <td>RTO/Sub-Collector </td>
                                <td>Collector-cum- Chairman, RTA</td>
                            </tr>
                            <tr>
                                <td>16</td>
                                <td>Change of Address in Conductor License</td>
                                <td>7 days</td>
                                <td>MVI/ Addl. RTO/RTO</td>
                                <td>RTO/Sub-Collector </td>
                                <td>Collector-cum- Chairman, RTA</td>
                            </tr>
                            <tr>
                                <td>17</td>
                                <td>Issue of Duplicate  Conductor License</td>
                                <td>7 days</td>
                                <td>MVI/ Addl. RTO/RTO</td>
                                <td>RTO/Sub-Collector </td>
                                <td>Collector-cum- Chairman, RTA</td>
                            </tr>
                            <tr>
                                <td>18</td>
                                <td>Grant Renewal of Conductor License</td>
                                <td>7 days</td>
                                <td>MVI/ Addl. RTO/RTO</td>
                                <td>RTO/Sub-Collector</td>
                                <td>Collector-cum- Chairman, STA</td>
                            </tr>
                            <tr>
                                <td>19</td>
                                <td>Issue of Duplicate Registration Certificate(RC)</td>
                                <td>7 days </td>
                                <td>MVI/Addl. RTO/ RTO</td>
                                <td>RTO/Sub-Collector</td>
                                <td>Collector- Cum-Chairman, RTA.</td>
                            </tr>
                            <tr>
                                <td>20</td>
                                <td>Issue of certified copy of Registration Certificate (RC)</td>
                                <td>2 days</td>
                                <td>MVI/Addl. RTO/RTO</td>
                                <td>RTO/Sub-Collector</td>
                                <td>Collector- Cum-Chairman, RTA.</td>
                            </tr>
                            <tr>
                                <td>21</td>
                                <td>Cancellation of Registration Certificate (RC)</td>
                                <td>30 days after physical inspection of vehicle</td>
                                <td>MVI/Addl. RTO / RTO</td>
                                <td>RTO/Sub-Collector</td>
                                <td>Collector- Cum-Chairman, RTA.</td>
                            </tr>
                            <tr>
                                <td>22</td>
                                <td>Change of Address in the Registration Certificate (RC) card</td>
                                <td>7 days </td>
                                <td>MVI/Addl. RTO/RTO</td>
                                <td>RTO/Sub-Collector</td>
                                <td>Collector- Cum-Chairman, RTA.</td>
                            </tr>
                            <tr>
                                <td>23</td>
                                <td>Change of Address in Driving License</td>
                                <td>7 days</td>
                                <td>MVI/Addl. RTO/RTO</td>
                                <td>RTO/Sub-Collector</td>
                                <td>Collector- Cum-Chairman, RTA.</td>
                            </tr>
                            <tr>
                                <td>24</td>
                                <td>Issue of certified copy of Driving License (DL)</td>
                                <td>2 days</td>
                                <td>MVI/Addl. RTO/RTO</td>
                                <td>RTO/Sub-Collector</td>
                                <td>Collector- Cum-Chairman, RTA.</td>
                            </tr>
                            <tr>
                                <td>25</td>
                                <td>Issue of License to Driving Training School</td>
                                <td>45 days </td>
                                <td>MVI/Addl. RTO / RTO</td>
                                <td>RTO/Sub-Collector</td>
                                <td>Collector- Cum-Chairman, RTA.</td>
                            </tr>
                            <tr>
                                <td>26</td>
                                <td>Renewal of License to Driving Training School</td>
                                <td>15 days after physical verification of the Institute</td>
                                <td>MVI/Addl. RTO/RTO</td>
                                <td>RTO/Sub-Collector</td>
                                <td>Collector- Cum-Chairman, RTA.</td>
                            </tr>
                            <tr>
                                <td>27</td>
                                <td>Transfer of ownership of vehicle on succession after death of owner</td>
                                <td>7 days from the date of filing required documents &amp; appearing before RTO</td>
                                <td>MVI/Addl. RTO / RTO</td>
                                <td>RTO/Sub-Collector</td>
                                <td>Collector- Cum-Chairman, RTA.</td>
                            </tr>
                            <tr>
                                <td>28</td>
                                <td>Transfer of ownership of Vehicle purchased on auction</td>
                                <td>7 days from date of filing required document &amp; after appearing before RTO</td>
                                <td>MVI/Addl. RTO/RTO</td>
                                <td>RTO/Sub-Collector</td>
                                <td>Collector- Cum-Chairman, RTA.</td>
                            </tr>
                            <tr>
                                <td>29</td>
                                <td>Cancellation of Hypothecation Agreement</td>
                                <td>7 days from the date of filing required document &amp; after verification from financier</td>
                                <td>MVI/Addl. RTO / RTO</td>
                                <td>RTO/Sub-Collector</td>
                                <td>Collector- Cum-Chairman, RTA.</td>
                            </tr>
                            <tr>
                                <td>30</td>
                                <td>Issue of certified copy of Route permit</td>
                                <td>2 days</td>
                                <td>MVI/Addl. RTO / RTO</td>
                                <td>RTO/Sub-Collector</td>
                                <td>Collector- Cum-Chairman, RTA.</td>
                            </tr>
                            <tr>
                                <td>31</td>
                                <td>Renewal of Registration Certificate (RC) of Non Transport Vehicles</td>
                                <td>7 days from Production of vehicle for inspection</td>
                                <td>MVI/Addl. RTO / RTO</td>
                                <td>RTO/Sub-Collector</td>
                                <td>Collector- Cum-Chairman, RTA.</td>
                            </tr>
                            <tr>
                                <td>32</td>
                                <td>Addition of New Vehicle Class to an existing Driving License</td>
                                <td>5 days after passing the test</td>
                                <td>MVI/Addl. RTO / RTO</td>
                                <td>RTO/Sub-Collector</td>
                                <td>Collector- Cum-Chairman, RTA.</td>
                            </tr>
                        </tbody>

                    </table>
                </div>
                <div class="clearfix"></div>
                <div id="cooperationDept" class="hiddenTab table-responsive">
                    <h2>Co-Operation</h2>
                    <table class="serviceTbles table">
                        <tbody>
                            <tr>
                                <th>S.No.</th>
                                <th>Services</th>
                                <th>Time Limit</th>
                                <th>Designated Officer</th>
                                <th>Appellate Authority</th>
                                <th>Revisional Authority</th>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Amendment of Bye- laws</td>
                                <td>60 days</td>
                                <td>1.    ARCS, 2.    DRCS, 3.    JRCS, 4.    ADDL. RCS, 5.    RCS(O) </td>
                                <td>1.    DRCS, 2.    JRCS,  3.    ADDL. RCS,   4.    RCS,  5.    State. Govt.</td>
                                <td>1.    RCS/ Addl. RCS, 2.    RCS/ Addl. RCS, , 3.    RCS,. 4.    State Govt.</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Registration</td>
                                <td>60 days</td>
                                <td>1.    ARCS, 2.    DRCS, 3.    JRCS, 4.    ADDL. RCS, 5.    RCS(O) </td>
                                <td>1.    DRCS, 2.    JRCS,  3.    ADDL. RCS,   4.    RCS,  5.    State. Govt.</td>
                                <td>1.    RCS/ Addl. RCS, 2.    RCS/ Addl. RCS, , 3.    RCS,. 4.    State Govt.</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Issuance of Regd. Certificate</td>
                                <td>60 days</td>
                                <td>1.    ARCS, 2.    DRCS, 3.    JRCS, 4.    ADDL. RCS, 5.    RCS(O) </td>
                                <td>1.    DRCS, 2.    JRCS,  3.    ADDL. RCS,   4.    RCS,  5.    State. Govt.</td>
                                <td>1.    RCS/ Addl. RCS, 2.    RCS/ Addl. RCS, , 3.    RCS,. 4.    State Govt.</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>Issue of certified copy of bye-laws</td>
                                <td>15 days</td>
                                <td>1.    ARCS, 2.    DRCS , 3.    JRCS,  4.    ADDL. RCS , 5.    RCS(O)</td>
                                <td>1.    DRCS, 2.    JRCS,  3.    ADDL. RCS,   4.    RCS,  5.    State. Govt.</td>
                                <td>1.    RSC/ Addl. RSC, 2.    RCS/ Addl. RCS, 3.    RCS,   4. State Govt.</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>License for Trading /Processing/ Commission Agent /Broker/ Weighman</td>
                                <td>40 days</td>
                                <td>Secretary, RMC</td>
                                <td>Market Committee</td>
                                <td>OSAM Board</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td>License for establishment of Private Marketing</td>
                                <td>60 days</td>
                                <td>Govt. of Cooperation </td>
                                <td>Govt. of Cooperation </td>
                                <td>Govt. of Cooperation</td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td>Settlement of disputes between producer sellers and buyers</td>
                                <td>15 days</td>
                                <td>Secretary, RMC</td>
                                <td>Arbitrators</td>
                                <td>Market Committee</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td>Grievances related to settlement of sale proceeds</td>
                                <td>15 days</td>
                                <td>Secretary, RMC</td>
                                <td>Arbitrators</td>
                                <td>Market Committee</td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td>Grievances related to Market charges</td>
                                <td>15 days</td>
                                <td>Secretary, RMC</td>
                                <td>Arbitrators</td>
                                <td>Market Committee</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td>Reservation of Storage Space as per the request of Bulk Depositor</td>
                                <td>15 days</td>
                                <td>Warehouse Superintendent/ Zonal Manager</td>
                                <td>General Manager(C )</td>
                                <td>Managing Director</td>
                            </tr>
                            <tr>
                                <td>11</td>
                                <td>Issue of Duplicate Warehouse Receipt as per prescribed rules in case the warehouse Receipt is lost or damaged</td>
                                <td>15 days</td>
                                <td>Warehouse Superintendent/ Zonal Manager</td>
                                <td>General Manager(C )</td>
                                <td>Managing Director</td>
                            </tr>
                            <tr>
                                <td>12</td>
                                <td>Membership</td>
                                <td>15 days</td>
                                <td>Secretary, PACS/ Managing Director, LAMPCS</td>
                                <td>Branch Manager of the CCB concerned</td>
                                <td>Assistant Registrar, Cooperative Societies</td>
                            </tr>
                            <tr>
                                <td>13</td>
                                <td>Issue Kisan Credit</td>
                                <td>15 days</td>
                                <td>Secretary, PACS/ Managing Director, LAMPCS</td>
                                <td>Branch Manager of the CCB concerned</td>
                                <td>Assistant Registrar, Cooperative Societies</td>
                            </tr>
                            <tr>
                                <td>14</td>
                                <td>Sanction of Crop Loans</td>
                                <td>15 days</td>
                                <td>Secretary, PACS/ Managing Director, LAMPCS</td>
                                <td>Branch Manager of the CCB concerned</td>
                                <td>Assistant Registrar, Cooperative Societies</td>
                            </tr>
                            <tr>
                                <td>15</td>
                                <td>Sanction of Agricultural Term Loans</td>
                                <td>30 days</td>
                                <td>Secretary, PACS/ Managing Director, LAMPCS</td>
                                <td>Branch Manager of the CCB concerned</td>
                                <td>Assistant Registrar, Cooperative Societies</td>
                            </tr>
                            <tr>
                                <td>16</td>
                                <td>Issue of Deposit Receipt/ Pass Book</td>
                                <td>1 days</td>
                                <td>Secretary, PACS/ Managing Director, LAMPCS</td>
                                <td>Branch Manager of the CCB concerned</td>
                                <td>Secretary, CCB concerned</td>
                            </tr>
                            <tr>
                                <td>17</td>
                                <td>Receipt toward repayment of Lone</td>
                                <td>1 days</td>
                                <td>Secretary, PACS/ Managing Director, LAMPCS</td>
                                <td>Branch Manager of the CCB concerned</td>
                                <td>Assistant Registrar, Cooperative Societies</td>
                            </tr>
                            <tr>
                                <td>18</td>
                                <td>Online Registration for paddy procurement</td>
                                <td>3 days</td>
                                <td>Secretary, PACS/ Managing Director, LAMPCS</td>
                                <td>Branch Manager of the CCB concerned</td>
                                <td>Assistant Registrar, Cooperative Societies</td>
                            </tr>
                            <tr>
                                <td>19</td>
                                <td>Payment against procurement of paddy</td>
                                <td>3 days</td>
                                <td>Secretary, PACS/ Managing Director, LAMPCS</td>
                                <td>Branch Manager of the CCB concerned</td>
                                <td>Assistant Registrar, Cooperative Societies</td>
                            </tr>
                            <tr>
                                <td>20</td>
                                <td>Withdrawal of Deposits </td>
                                <td>1 days</td>
                                <td>Secretary, PACS/ Managing Director, LAMPCS</td>
                                <td>Branch Manager of the CCB concerned</td>
                                <td>Secretary, CCB concerned</td>
                            </tr>
                            <tr>
                                <td>21</td>
                                <td>Adjustment of shares against loan repayment</td>
                                <td>7 days</td>
                                <td>Secretary, PACS/ Managing Director, LAMPCS</td>
                                <td>Branch Manager of the CCB concerned</td>
                                <td>Assistant Registrar, Cooperative Societies</td>
                            </tr>
                            <tr>
                                <td>22</td>
                                <td>Availability of fertilizer/ seeds/ pesticides</td>
                                <td>1 days</td>
                                <td>Secretary, PACS/ Managing Director, LAMPCS</td>
                                <td>Branch Manager of the CCB concerned</td>
                                <td>Assistant Registrar, Cooperative Societies</td>
                            </tr>
                            <tr>
                                <td>23</td>
                                <td>Sanction of Loan</td>
                                <td>15 days</td>
                                <td>Banking Assistant</td>
                                <td>Assistant Manager</td>
                                <td>Secretary</td>
                            </tr>
                            <tr>
                                <td>24</td>
                                <td>Issue of fresh cheque books </td>
                                <td>1 day</td>
                                <td>Banking Assistant</td>
                                <td>Assistant Manager</td>
                                <td>Branch Manager</td>
                            </tr>
                            <tr>
                                <td>25</td>
                                <td>Issue of personalized RuPay ATM card</td>
                                <td>30 days</td>
                                <td>Banking Assistant</td>
                                <td>Assistant Manager</td>
                                <td>Branch Manager</td>
                            </tr>
                            <tr>
                                <td>26</td>
                                <td>Sanction of Loan</td>
                                <td>15 days</td>
                                <td>Junior Manager </td>
                                <td>Assistant Manager/ Manager</td>
                                <td>General Manager(C&amp;I) of H.O</td>
                            </tr>
                            <tr>
                                <td>27</td>
                                <td>Issue of fresh cheque books </td>
                                <td>1 day</td>
                                <td>Junior Manager </td>
                                <td>Assistant Manager/ Manager</td>
                                <td>Branch Manager</td>
                            </tr>
                            <tr>
                                <td>28</td>
                                <td>Issue of personalized RuPay ATM card</td>
                                <td>30 days</td>
                                <td>Junior Manager </td>
                                <td>Assistant Manager/ Manager</td>
                                <td>Branch Manager</td>
                            </tr>
                        </tbody>

                    </table>
                </div>
                <div class="clearfix"></div>
                <div id="emplmntTechnicalDept" class="hiddenTab table-responsive">
                    <h2>Employment and Technical Education & Training</h2>
                    <table class="serviceTbles table">
                        <tbody>
                            <tr>
                                <th>S.No.</th>
                                <th>Services</th>
                                <th>Time Limit</th>
                                <th>Designated Officer</th>
                                <th>Appellate Authority</th>
                                <th>Revisional Authority</th>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Issue of Diploma Certificate</td>
                                <td>45 days</td>
                                <td>Deputy Secretary</td>
                                <td>Secretary SCTE &amp; VT</td>
                                <td>DTET, ODISHA</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Issue of Provisional Certificate</td>
                                <td>15 days</td>
                                <td>Deputy Secretary</td>
                                <td>Secretary SCTE &amp; VT</td>
                                <td>DTET, ODISHA</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Issue of Semester Mark sheet</td>
                                <td>10 days</td>
                                <td>Deputy Controller of Exam.</td>
                                <td>Secretary SCTE &amp; VT</td>
                                <td>DTET, ODISHA</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>Issue of Divisional Mark Sheet</td>
                                <td>45 days</td>
                                <td>Deputy Controller of Exam.</td>
                                <td>Secretary SCTE &amp; VT</td>
                                <td>DTET, ODISHA</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>Issue of Migration Certificate</td>
                                <td>10 days</td>
                                <td>Deputy Controller of Exam.</td>
                                <td>Secretary SCTE &amp; VT</td>
                                <td>DTET, ODISHA</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td>Issue of Verification Certificate</td>
                                <td>15 days</td>
                                <td>Deputy Controller of Exam.</td>
                                <td>Secretary SCTE &amp; VT</td>
                                <td>DTET, ODISHA</td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td>Issue of Duplicate Certificate</td>
                                <td>10 days</td>
                                <td>Deputy Controller of Exam.</td>
                                <td>Secretary SCTE &amp; VT</td>
                                <td>DTET, ODISHA</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td>Issue of Duplicate Mark Sheet</td>
                                <td>10 days</td>
                                <td>Deputy Controller of Exam.</td>
                                <td>Secretary SCTE &amp; VT</td>
                                <td>DTET, ODISHA</td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td>Issue of Transcript</td>
                                <td>30 days</td>
                                <td>Deputy Controller of Exam.</td>
                                <td>Secretary SCTE &amp; VT</td>
                                <td>DTET, ODISHA</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td>Recounting of Answer Books</td>
                                <td>90 days</td>
                                <td>Deputy Controller of Exam.</td>
                                <td>Secretary SCTE &amp; VT</td>
                                <td>DTET, ODISHA</td>
                            </tr>
                            <tr>
                                <td>11</td>
                                <td>Supply of photocopy of Answer Books</td>
                                <td>90 days</td>
                                <td>Deputy Controller of Exam.</td>
                                <td>Secretary SCTE &amp; VT</td>
                                <td>DTET, ODISHA</td>
                            </tr>
                        </tbody>

                    </table>
                </div>
                <div class="clearfix"></div>
                <div id="exciseDept" class="hiddenTab table-responsive">
                    <h2>Excise</h2>
                    <table class="serviceTbles table">
                        <tbody>
                            <tr>
                                <th>S.No.</th>
                                <th>Services</th>
                                <th>Time Limit</th>
                                <th>Designated Officer</th>
                                <th>Appellate Authority</th>
                                <th>Revisional Authority</th>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>To process the proposal for grant of liquor license at District Level</td>
                                <td>60 days</td>
                                <td>Superintendent of Excise/ Collector of the District</td>
                                <td>Excise Commissioner</td>
                                <td>Principal Secretary / Secretary</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Recommendation of the Excise Commissioner for Grant of Liquor License at Commissioner's Level</td>
                                <td>30 days</td>
                                <td>Excise Commissioner</td>
                                <td>Principal Secretary/ Secretary</td>
                                <td>Hon'ble Minister</td>
                            </tr>
                        </tbody>

                    </table>
                </div>
                <div class="clearfix"></div>
                <div id="financeDept" class="hiddenTab table-responsive">
                    <h2>Finance</h2>
                    <table class="serviceTbles table">
                        <tbody>
                            <tr>
                                <th>S.No.</th>
                                <th>Services</th>
                                <th style="width:7%;">Time Limit</th>
                                <th>Designated Officer</th>
                                <th>Appellate Authority</th>
                                <th>Revisional Authority</th>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Disposal of application for registration under VAT/CST Act</td>
                                <td>30 Days</td>
                                <td>Commercial Tax Officers/ Asst. Commissioner of Commercial Taxes/ Deputy Commissioner of Commercial Taxes in charge of Circles &amp; Assessment Units
                                </td>
                                <td>Joint Commissioner of Commercial Taxes in charge of Ranges </td>
                                <td>Additional Commissioner of Commercial Taxes (Zonal)</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Disposal of application for amendment of registration certificates</td>
                                <td>15 days</td>
                                <td>Commercial Tax Officers/ Asst. Commissioner of Commercial Taxes/ Deputy Commissioner of Commercial Taxes in charge of Circles &amp; Assessment Units
                                </td>
                                <td>Joint Commissioner of Commercial Taxes in charge of Ranges </td>
                                <td>Additional Commissioner of Commercial Taxes (Zonal) </td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Disposal of application for 'C' forms, 'F' forms, 'H' forms &amp; Waybills</td>
                                <td>7 days</td>
                                <td>Commercial Tax Officers/ Asst. Commissioner of Commercial Taxes/ Deputy Commissioner of Commercial Taxes in charge of Circles &amp; Assessment Units</td>
                                <td>Joint Commissioner of Commercial Taxes in charge of Ranges</td>
                                <td>Additional Commissioner of Commercial Taxes (Zonal)</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>Disposal of application for registration for registration under Odisha Entry Tax Act, 1999</td>
                                <td>30 days </td>
                                <td>Commercial Tax officers/ Asst. Commissioner of Commercial Taxes/ Deputy Commissioner of Commercial taxes in charge of Circle &amp; Assessment Units</td>
                                <td>Joint Commissioner of Commercial taxes in charge of Ranges</td>
                                <td>Additional Commissioner of Commercial Taxes (Zonal)</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>Disposal of application for registration for No Deduction Certificate under Odisha Value Added tax Act, 2004</td>
                                <td>15 days</td>
                                <td>Commercial Tax officers/ Asst. Commissioner of Commercial Taxes/ Deputy Commissioner of Commercial taxes in charge of Circle &amp; Assessment Units</td>
                                <td>Joint Commissioner of Commercial taxes in charge of Ranges</td>
                                <td>Additional Commissioner of Commercial Taxes (Zonal)</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td>Disposal of application for registration for Clearance Certificate under Odisha Value Added tax Act, 2004</td>
                                <td>7 days</td>
                                <td>Commercial Tax officers/ Asst. Commissioner of Commercial Taxes/ Deputy Commissioner of Commercial taxes in charge of Circle &amp; Assessment Units</td>
                                <td>Joint Commissioner of Commercial taxes in change of Ranges</td>
                                <td>Additional Commissioner  of Commercial Taxes (Zonal)</td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td>Disposal of requisition for 'El' Form under Central Sales Tax Act,1956</td>
                                <td>3 days</td>
                                <td>Commercial Tax officers/ Asst. Commissioner of Commercial Taxes/ Deputy Commissioner of Commercial taxes in charge of Circle &amp; Assessment Units</td>
                                <td>Joint Commissioner of Commercial taxes in change of Ranges</td>
                                <td>Additional Commercial of Commercial Taxes (Zonal)</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td>Disposal of requisition for 'Ell' Form under Central Sales Tax Act,1956</td>
                                <td>3 days</td>
                                <td>Commercial Tax officers/ Asst. Commissioner of Commercial Taxes/ Deputy Commissioner of Commercial taxes in charge of Circle &amp; Assessment Units</td>
                                <td>Joint Commissioner of Commercial taxes in change of Ranges</td>
                                <td>Additional Commercial of Commercial Taxes (Zonal)</td>
                            </tr>
                        </tbody>

                    </table>
                </div>
                <div class="clearfix"></div>
                <div id="fisheriesDept" class="hiddenTab table-responsive">
                    <h2>Fisheries & Animal Resources Devlopment</h2>
                    <table class="serviceTbles table">
                        <tbody>
                            <tr>
                                <th>S.No.</th>
                                <th>Services</th>
                                <th>Time Limit</th>
                                <th>Designated Officer</th>
                                <th>Appellate Authority</th>
                                <th>Revisional Authority</th>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>lssue of Registration Certificate along with fishing license after deposit of prescribed fees under OMFRA</td>
                                <td>15 days</td>
                                <td>Additional Fisheries Officer (Marine),Kujanga, Puri,Ganjam, Balasore &amp; District Fisheries Officer (B&amp;T), Balugaon</td>
                                <td>Deputy Director of Fisheries (Marine),Directorate of Fisheries, Odisha,Cuttack</td>
                                <td>Joint Director of Fisheries (Coastal), Directorate of Fisheries, Odisha, Cuttack</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>lssue of renewal fishing license after deposit of prescribed fees under OMFRA</td>
                                <td>15 Days</td>
                                <td>Additional Fisheries Officer (Marine),Kujanga, Puri, Ganjam, Balasore &amp; District Fisheries Officer (B&amp;T), Baluqaon</td>
                                <td>Deputy Director of Fisheries (Marine), Directorate of Fisheries, Odisha, Cuttack</td>
                                <td>Joint Director of Fisheries (Coastal), Directorate of Fisheries, Odisha, Cuttack</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Animal Health Certificate</td>
                                <td>Within 5 days in Headquarters area and 7 days in peripheral areas</td>
                                <td>BVO / VAS / AVAS</td>
                                <td>SDVO</td>
                                <td>CDVO</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>Forwarding of proposal by Asst. Fisheries Officer to Addl.  Fisheries Officer after Verification </td>
                                <td>15 days</td>
                                <td>Addl. Fisheries Officer, Marine, Kujanga, Balasore, Puri, Ganjam</td>
                                <td>Addl. Fisheries Officer, Marine (Directorate of Fisheries, Odisha, Cuttack)</td>
                                <td>Jt. Director of Fisheries (Coastal) Directorate of Fisheries, Odisha, Cuttack</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>Sponsoring of proposal by Addl. Fisheries Officer to Banks subject to availability of subsidy</td>
                                <td>15 days</td>
                                <td>Addl. Fisheries Officer, Marine, Kujanga, Balasore, Puri, Ganjam</td>
                                <td>Addl. Fisheries Officer, Marine (Directorate of Fisheries, Odisha, Cuttack)</td>
                                <td>Jt. Director of Fisheries (Coastal) Directorate of Fisheries, Odisha, Cuttack</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td>Sponsoring of proposal to District Office by the Assistant FO</td>
                                <td>15 days</td>
                                <td>District Fisheries Officer </td>
                                <td>Dy. Director of Fisheries (Zone)</td>
                                <td>Jt. Director of Fisheries (Inland) Directorate of Fisheries, Odisha, Cuttack</td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td>Sponsoring of proposal by District Office to bank</td>
                                <td>15 days</td>
                                <td>District Fisheries Officer</td>
                                <td>Dy. Director of Fisheries (Zone)</td>
                                <td>Jt. Director of Fisheries (Inland) Directorate of Fisheries, Odisha, Cuttack</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td>Submission of Utilisation certificate by AFO  after completion of the Project</td>
                                <td>15 days</td>
                                <td>District Fisheries Officer</td>
                                <td>Dy. Director of Fisheries (Zone)</td>
                                <td>Jt. Director of Fisheries (Inland) Directorate of Fisheries, Odisha, Cuttack</td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td>Release of subsidy after receipt of Utilisation certificate by AFO subject to availability of funds.</td>
                                <td>15 days</td>
                                <td>District Fisheries Officer</td>
                                <td>Dy. Director of Fisheries (Zone)</td>
                                <td>Jt. Director of Fisheries (Inland) Directorate of Fisheries, Odisha, Cuttack</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td>Placing the case in the screening committee headed by Collector after receipt of security money from the farmer</td>
                                <td>15 days</td>
                                <td>District Fisheries Officer</td>
                                <td>Dy. Director of Fisheries (Zone)</td>
                                <td>Jt. Director of Fisheries (Inland) Directorate of Fisheries, Odisha, Cuttack</td>
                            </tr>
                            <tr>
                                <td>11</td>
                                <td>Issue of go ahead letter after approval of screening committee.</td>
                                <td>5 days</td>
                                <td>District Fisheries Officer</td>
                                <td>Dy. Director of Fisheries (Zone)</td>
                                <td>Jt. Director of Fisheries (Inland) Directorate of Fisheries, Odisha, Cuttack</td>
                            </tr>
                            <tr>
                                <td>12</td>
                                <td>Recommendation to the Committee for release of subsidy after receipt of UC</td>
                                <td>15 days</td>
                                <td>District Fisheries Officer</td>
                                <td>Dy. Director of Fisheries (Zone)</td>
                                <td>Jt. Director of Fisheries (Inland) Directorate of Fisheries, Odisha, Cuttack</td>
                            </tr>
                            <tr>
                                <td>13</td>
                                <td>Submission of the collected applications at DFO office by AFO </td>
                                <td>10 days</td>
                                <td>District Fisheries Officer</td>
                                <td>Dy. Director of Fisheries (Zone)</td>
                                <td>Jt. Director of Fisheries (Inland) Directorate of Fisheries, Odisha, Cuttack</td>
                            </tr>
                            <tr>
                                <td>14</td>
                                <td>Filling of the application from online as per the beneficiary application and generation of permit by DFO</td>
                                <td>17 days</td>
                                <td>District Fisheries Officer</td>
                                <td>Dy. Director of Fisheries (Zone)</td>
                                <td>Jt. Director of Fisheries (Inland) Directorate of Fisheries, Odisha, Cuttack</td>
                            </tr>
                            <tr>
                                <td>15</td>
                                <td>Issue of permits for supply of equipments to vender</td>
                                <td>15 days</td>
                                <td>District Fisheries Officer</td>
                                <td>Dy. Director of Fisheries (Zone)</td>
                                <td>Jt. Director of Fisheries (Inland) Directorate of Fisheries, Odisha, Cuttack</td>
                            </tr>
                            <tr>
                                <td>16</td>
                                <td>Verification of equipment as per DLTC/SLTC approval. The details with GPS photograph (equipment, beneficiaries and AFO) at the beneficiary field to all quarter to be provided through SMS by AFO</td>
                                <td>7 days</td>
                                <td>District Fisheries Officer</td>
                                <td>Dy. Director of Fisheries (Zone)</td>
                                <td>Jt. Director of Fisheries (Inland) Directorate of Fisheries, Odisha, Cuttack</td>
                            </tr>
                            <tr>
                                <td>17</td>
                                <td>Online confirmation, the verification and uploading the photograph taken at the beneficiaries field by DFO</td>
                                <td>5 days</td>
                                <td>District Fisheries Officer</td>
                                <td>Dy. Director of Fisheries (Zone)</td>
                                <td>Jt. Director of Fisheries (Inland) Directorate of Fisheries, Odisha, Cuttack</td>
                            </tr>
                        </tbody>

                    </table>
                </div>
                <div class="clearfix"></div>
                <div id="forestDept" class="hiddenTab table-responsive">
                    <h2>Forest & Environment</h2>
                    <table class="serviceTbles table">
                        <tbody>
                            <tr>
                                <th>S.No.</th>
                                <th style="width: 30%;">Services</th>
                                <th>Time Limit</th>
                                <th>Designated Officer</th>
                                <th>Appellate Authority</th>
                                <th>Revisional Authority</th>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Distribution of Seedlings to Public-Issue of Orders</td>
                                <td>15 days</td>
                                <td>Range Forest Officers</td>
                                <td>Assistant Conservator of Forests</td>
                                <td>Deputy Conservator of Forests</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Sanction of compassionate amount to the concerned persons in case of crop damage by specified wild animals.</td>
                                <td>90 days</td>
                                <td>Divisional Forest Officer of Wildlife/Territorial Division.</td>
                                <td>Concerned Regional Chief Conservator of Forests.</td>
                                <td>Principal CCF(WL) &amp; Wildlife Warden Odisha</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Sanction of compassionate amount to the concerned persons in case of cattle kill by specified wild animals.</td>
                                <td>30 days</td>
                                <td>Divisional Forest Officer of Wildlife/Territorial Division.</td>
                                <td>Concerned Regional Chief Conservator of Forests.</td>
                                <td>Principal CCF(WL) &amp; Wildlife Warden Odisha</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>Sanction of compassionate amount to the concerned persons/legal heirs of the victims in case of human injury and casualty respectively by specified wild animals.</td>
                                <td>15 days</td>
                                <td>Divisional Forest Officer of Wildlife/Territorial Division.</td>
                                <td>Concerned Regional Chief Conservator of Forests.</td>
                                <td>Principal CCF (WL) &amp; Wildlife Warden Odisha.</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>Disposal of consent to establish application for new / expansion proposal of 17 Categories of highly polluting industries (Red-A) having investment of Rs.50 crores or more on recommendation of Consent Committee</td>
                                <td>60 days</td>
                                <td>Member Secretary</td>
                                <td>Appellate Authority constituted by F&amp;E Department u/s 28of Water (PCP) Act and 31of Air (PCP) Act.</td>
                                <td>Concerned designated officer, which grants consent revises the consent order as directed by the Appellate Authority.</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td>Disposal of consent to establish application for new / expansion proposal of Coal, Bauxite, Iron, Ore, Manganese, Limestone, Dolomite and Chromite Mines on recommendation of Consent Committee</td>
                                <td>60 days</td>
                                <td>Member Secretary</td>
                                <td>Appellate Authority constituted by F&amp;E Department u/s 28of Water (PCP) Act and 31of Air (PCP) Act.</td>
                                <td>Concerned designated officer, which grants consent revises the consent order as directed by the Appellate Authority.</td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td>Disposal of consent to establish application for new / expansion proposal of all Sponge Iron Plants on recommendation of Consent Committee</td>
                                <td>60 days</td>
                                <td>Member Secretary</td>
                                <td>Appellate Authority constituted by F&amp;E Department u/s 28of Water (PCP) Act and 31of Air (PCP) Act.</td>
                                <td>Concerned designated officer, which grants consent revises the consent order as directed by the Appellate Authority.</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td>Disposal of consent to establish application for new / expansion proposal of 17 Categories of highly polluting industries (Red-A) having investment of less than Rs.50 crores on recommendation of Internal Consent Committee</td>
                                <td>Cat.A-60 days, Cat.B-45 days</td>
                                <td>Sr. Environment Engineer/Sr. Environment Scientist</td>
                                <td>Appellate Authority constituted by F&amp;E Department u/s 28of Water (PCP) Act and 31of Air (PCP) Act.</td>
                                <td>Concerned designated officer, which grants consent revises the consent order as directed by the Appellate Authority.</td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td>Disposal of consent to establish application for new / expansion proposal of other than 17 Category of polluting industries (Red-A) i.e. Red-B, Orange and Green having investment of Rs.50 crores or more on recommendation of Internal Consent Committee</td>
                                <td>Cat.A-60 days, Cat.B-45 days</td>
                                <td>Sr. Environment Engineer/Sr. Environment Scientist</td>
                                <td>Appellate Authority constituted by F&amp;E Department u/s 28of Water (PCP) Act and 31of Air (PCP) Act.</td>
                                <td>Concerned designated officer, which grants consent revises the consent order as directed by the Appellate Authority.</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td>Disposal of consent to establish application for new / expansion proposal of other than 17 Category of polluting industries (Red-A) i.e. Red-B, Orange and Green having investment UPTO Rs.50 crore.</td>
                                <td>Cat.A-60 days ,Cat.B-45 days, Cat.C-30 days</td>
                                <td>Regional Officer</td>
                                <td>Appellate Authority constituted by F&amp;E Department u/s 28of Water (PCP) Act and 31of Air (PCP) Act.</td>
                                <td>Concerned designated officer, which grants consent revises the consent order as directed by the Appellate Authority.</td>
                            </tr>
                            <tr>
                                <td>11</td>
                                <td>Disposal of consent to establish application for new / expansion proposal of Mines other than Coal, Bauxite, Iron, Ore, Manganese, Limestone, Dolomite and Chromite.</td>
                                <td>Cat.A-60 days ,Cat.B-45 days</td>
                                <td>Regional Officer ST</td>
                                <td>Appellate Authority constituted by F&amp;E Department u/s 28 of Water (PCP) Act and 31 of Air (PCP) Act.</td>
                                <td>Concerned designated officer, which grants consent revises the consent order as directed by the Appellate Authority.</td>
                            </tr>
                        </tbody>

                    </table>
                </div>
                <div class="clearfix"></div>
                <div id="generalAdminDept" class="hiddenTab table-responsive">
                    <h2>General Administration</h2>
                    <table class="serviceTbles table">
                        <tbody>
                            <tr>
                                <th>S.No.</th>
                                <th>Services</th>
                                <th>Time Limit</th>
                                <th>Designated Officer</th>
                                <th>Appellate Authority</th>
                                <th>Revisional Authority</th>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Issue of Mortgage Permission of leasehold lands</td>
                                <td>30 days</td>
                                <td>Section / Desk Officer</td>
                                <td>Addl. Land / Land Officer</td>
                                <td>Director of Estates</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Issue of Conversion Order of leasehold lands</td>
                                <td>90 days</td>
                                <td>Section / Desk Officer</td>
                                <td>Addl. Land / Land Officer</td>
                                <td>Director of Estates</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Issue of Mutation Order of leasehold lands</td>
                                <td>60 days</td>
                                <td>Section / Desk Officer</td>
                                <td>Addl. Land / Land Officer</td>
                                <td>Director of Estates</td>
                            </tr>
                        </tbody>

                    </table>
                </div>
                <div class="clearfix"></div>
                <div id="healthfamilyDept" class="hiddenTab table-responsive">
                    <h2>Health & Family Welfare</h2>
                    <table class="serviceTbles table">
                        <tbody>
                            <tr>
                                <th>S.No.</th>
                                <th>Services</th>
                                <th>Time Limit</th>
                                <th>Designated Officer</th>
                                <th>Appellate Authority</th>
                                <th>Revisional Authority</th>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Registration of Birth/Death</td>
                                <td>30 days in case of Urban Area<br />
                                    30 days in case of Rural Area</td>
                                <td>Urban Area:
Health  Officer/ Executive Officer of Urban Local Bodies
                                    <br />
                                    Rural Area:
Medical Officer, CHC

                                </td>
                                <td>Urban Area:A.D.M.O.(P.H.) of DHH<br />
                                    Rural Area:S.D.M.O/ A.D.M.O of DHH

                                </td>
                                <td>Urban Area:C.D.M.O. of the District/ CMO in case of Rourkela &amp; BBSR Rural Area:C.D.M.O. of the District
                                </td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>For getting Birth/Death Certificate</td>
                                <td>7 days in case of Urban Area<br />
                                    7 days in case of Rural Area</td>
                                <td>Urban Area:
Health  Officer/ Executive Officer of Urban Local Bodies
                                    <br />
                                    Rural Area:
Medical Officer, CHC
                                </td>
                                <td>Urban Area:A.D.M.O.(P.H.) of DHH<br />
                                    Rural Area:S.D.M.O/ A.D.M.O of DHH
                                </td>
                                <td>Urban Area:C.D.M.O. of the District/ CMO in case of Rourkela &amp; BBSR

Rural Area:C.D.M.O. of the District</td>
                            </tr>
                        </tbody>

                    </table>
                </div>
                <div class="clearfix"></div>
                <div id="higherEduDept" class="hiddenTab table-responsive">
                    <h2>Higher Education</h2>
                    <table class="serviceTbles table">
                        <tbody>
                            <tr>
                                <th>S.No.</th>
                                <th>Services</th>
                                <th>Time Limit</th>
                                <th>Designated Officer</th>
                                <th>Appellate Authority</th>
                                <th>Revisional Authority</th>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>lssuance of Higher Secondary Examination Pass Certificate/ Equivalence Certificate by CHSE(O)</td>
                                <td>7 Days</td>
                                <td>Secretary,CHSE. Odisha</td>
                                <td>Chairman CHSE, Odisha</td>
                                <td>Director Higher Education</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>lssuance of Pass Certificate-cum-
Memorandum of Marks/Migration Certificate/Course Leaving Certificate
in Correspondence Course(Distance
Education) by CHSE(O)</td>
                                <td>7 Days</td>
                                <td>Controller of Examination,CHSE. Odisha</td>
                                <td>Chairman CHSE, Odisha</td>
                                <td>Director Higher Education</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>lssuance of Provisional Pass Certificate /Mark sheet by Universities</td>
                                <td>7 Days</td>
                                <td>Controller of Examination of the Universities Concerned</td>
                                <td>Registrar of the Universities concerned</td>
                                <td>Vice-Chancellor of the Universities concerned</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>lssuance of migration certificate by Universities</td>
                                <td>30 Days</td>
                                <td>Controller of Examination of the Universities concerned</td>
                                <td>Registrar of the Universities concerned</td>
                                <td>Vice-Chancellor of the Universities concerned</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>lssuance of CLC by College</td>
                                <td>3 Days</td>
                                <td>Principal of the college concerned</td>
                                <td>Regional Director of Education</td>
                                <td>Director, Higher Education</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td>Authentication of Original Certificate by H E. Deptt.</td>
                                <td>Certificates to be
sent to the Universities/CHSE/Other lnstitutions within 02 days of receipt of application with fees from the applicant by the section of HE Dept.<br />
                                    <hr />
                                    Verification report to be sent by Universities/ Other lnstitutions within 07 days to H.E. Dept.<br />
                                    <hr />
                                    ln case of CHSE<br />
                                    <hr />
                                    Within 05 days from receipt of authenticated certificate from the Universities/CHSE/ Other lnstitutions</td>
                                <td>Joint Secretary to Govt.,Higher Education Department<br />
                                    <hr />
                                    Controller of
Examination of the Universities concerned<br />
                                    <hr />
                                    Secretary,CHSE, Odisha<br />
                                    <hr />
                                    Joint Secretary
to Govt.Higher Education Department</td>
                                <td>Additional Secretary to Govt., Higher Education Department<br />
                                    <hr />
                                    Registrar of the
Universities concerned<br />
                                    <hr />
                                    Chairman
CHSE. Odisha<br />
                                    <hr />
                                    Additional
Secretary to Govt., Higher Education Department</td>
                                <td>Principal Secretary to Govt., Higher Education Department<br />
                                    <hr />
                                    Vice-Chancellor of the Universities concerned<br />
                                    <hr />
                                    Director Higher
Education<br />
                                    <hr />
                                    Principal Secretary to Govt., Higher Education Department</td>

                            </tr>
                            <tr>
                                <td>7</td>
                                <td>Disposal of Memorandum with regard to Block GranV GIA and other Matters.</td>
                                <td>ln Office of DHE -15 (Thirty) days of receipt from College concerned.<br />
                                    <hr />
                                    In Govt.:- 30 days from date of receipt from Director of Higher Education</td>
                                <td>Deputy Director<br />
                                    <hr />
                                    Deputy
Secy./Joint Secy. in charge</td>
                                <td>Addl. Director<br />
                                    <hr />
                                    Addl. Secy. in
charge</td>
                                <td>Director<br />
                                    <hr />
                                    Pr. Secy.</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td>NOC for Passport Foreign / Vigilance
/ Higher Study.</td>
                                <td>ln DHE - 15 (fifteen) days from
receipt of proposal from College
Concerned.
                                    <br />
                                    <hr />
                                    ln Govt.:-
lssue:- 07 days from receipt of
clearance from Home/ Vigilance</td>
                                <td>Deputy Director<br />
                                    <hr />
                                    Deputy
Secy./Joint Secy. in charge</td>
                                <td>Addl. Director<br />
                                    <hr />
                                    Addl. Secy. in
charge</td>
                                <td>Director<br />
                                    <hr />
                                    Pr. Secy.</td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td>Sanction of Junior, Senior, PG Merit, Girls Merit, Technical &amp; Professional Scholarship</td>
                                <td>30 days</td>
                                <td>Joint Secretary to Govt., Higher Education Department</td>
                                <td>Additional Secretary to Govt., Higher Education Department</td>
                                <td>Principal Secretary to Govt., Higher Education Department</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td>Sanction of Loan Stipend</td>
                                <td>15 days</td>
                                <td>Joint Secretary to Govt., Higher Education Department</td>
                                <td>Additional Secretary to Govt., Higher Education Department</td>
                                <td>Principal Secretary to Govt., Higher Education Department</td>
                            </tr>
                            <tr>
                                <td>11</td>
                                <td>Issue of Clearance Certificate towards recovery of Loan Stipend</td>
                                <td>15 days</td>
                                <td>Joint Secretary to Govt., Higher Education Department</td>
                                <td>Additional Secretary to Govt., Higher Education Department</td>
                                <td>Principal Secretary to Govt., Higher Education Department</td>
                            </tr>
                            <tr>
                                <td>12</td>
                                <td>Investigation of Arrear claims</td>
                                <td>15 days</td>
                                <td>Joint Secretary to Govt., Higher Education Department</td>
                                <td>Additional Secretary to Govt., Higher Education Department</td>
                                <td>Principal Secretary to Govt., Higher Education Department</td>
                            </tr>
                            <tr>
                                <td>13</td>
                                <td>Verification of Original Certificate</td>
                                <td>02 days</td>
                                <td>Joint Secretary to Govt., Higher Education Department</td>
                                <td>Additional Secretary to Govt., Higher Education Department</td>
                                <td>Principal Secretary to Govt., Higher Education Department</td>
                            </tr>
                            <tr>
                                <td>14</td>
                                <td>Authentication of Original Certificate </td>
                                <td>03 days</td>
                                <td>Joint Secretary to Govt., Higher Education Department </td>
                                <td>Additional Secretary to Govt., Higher Education Department</td>
                                <td>Principal Secretary to Govt., Higher Education Department</td>
                            </tr>
                            <tr>
                                <td>15</td>
                                <td>Renewal of affiliation to the Colleges</td>
                                <td>60 days</td>
                                <td>Asst. Registrar /Dy. Registrar</td>
                                <td>Registrar</td>
                                <td>Vice-Chancellor</td>
                            </tr>
                            <tr>
                                <td>16</td>
                                <td>Issue of verification of certificates</td>
                                <td>07 days</td>
                                <td>Asst. Registrar /Dy. Registrar</td>
                                <td>Registrar</td>
                                <td>Vice-Chancellor</td>
                            </tr>
                            <tr>
                                <td>17</td>
                                <td>Issue of verification of Mark Sheet</td>
                                <td>30 days</td>
                                <td>Asst. Registrar /Dy. Registrar</td>
                                <td>Registrar</td>
                                <td>Vice-Chancellor</td>
                            </tr>
                            <tr>
                                <td>18</td>
                                <td>Re-addition of marks</td>
                                <td>60 days </td>
                                <td>Asst. Registrar /Dy. Registrar</td>
                                <td>Registrar</td>
                                <td>Vice-Chancellor</td>
                            </tr>
                            <tr>
                                <td>19</td>
                                <td>Selection of Nominee of University to Colleges</td>
                                <td>07 days </td>
                                <td>Asst. Registrar /Dy. Registrar</td>
                                <td>Registrar</td>
                                <td>Vice-Chancellor</td>
                            </tr>
                            <tr>
                                <td>20</td>
                                <td>Issue of Migration Certificate</td>
                                <td>07 days</td>
                                <td>Asst. Registrar /Dy. Registrar</td>
                                <td>Registrar</td>
                                <td>Vice-Chancellor</td>
                            </tr>
                            <tr>
                                <td>21</td>
                                <td>Issue of Provisional Mark sheet and Degree Certificate</td>
                                <td>07 days</td>
                                <td>Asst. Registrar /Dy. Registrar</td>
                                <td>Registrar</td>
                                <td>Vice-Chancellor</td>
                            </tr>
                            <tr>
                                <td>22</td>
                                <td>Issue of Official Transcript/ Authenticity</td>
                                <td>07 days</td>
                                <td>Asst. Registrar /Dy. Registrar</td>
                                <td>Registrar</td>
                                <td>Vice-Chancellor</td>
                            </tr>
                            <tr>
                                <td>23</td>
                                <td>Disbursal of Scholarship/ Research grant</td>
                                <td>07 days</td>
                                <td>Asst. Registrar /Dy. Registrar</td>
                                <td>Registrar</td>
                                <td>Vice-Chancellor</td>
                            </tr>
                            <tr>
                                <td>24</td>
                                <td>Issue of Registration/ Duplicate Mark sheet/Certificate</td>
                                <td>07 days</td>
                                <td>Asst. Registrar /Dy. Registrar</td>
                                <td>Registrar</td>
                                <td>Vice-Chancellor</td>
                            </tr>
                            <tr>
                                <td>25</td>
                                <td>Examination of Ph.D. Thesis</td>
                                <td>180 days </td>
                                <td>Asst. Registrar /Dy. Registrar</td>
                                <td>Registrar</td>
                                <td>Vice-Chancellor</td>
                            </tr>
                            <tr>
                                <td>26</td>
                                <td>Authentication of Original Certificate</td>
                                <td>07 days</td>
                                <td>Asst. Registrar /Dy. Registrar</td>
                                <td>Registrar</td>
                                <td>Vice-Chancellor</td>
                            </tr>
                            <tr>
                                <td>27</td>
                                <td>Renewal of affiliation to the Colleges</td>
                                <td>60 days</td>
                                <td>Secretary</td>
                                <td>Chairman</td>
                                <td>Director, Higher Education</td>
                            </tr>
                            <tr>
                                <td>28</td>
                                <td>Selection of Member (Women) to the GB</td>
                                <td>15 days</td>
                                <td>Secretary</td>
                                <td>Chairman</td>
                                <td>Director, Higher Education</td>
                            </tr>
                            <tr>
                                <td>29</td>
                                <td>Forwarding of fresh scholarship to MHRD</td>
                                <td>30 days</td>
                                <td>Secretary</td>
                                <td>Chairman</td>
                                <td>Director, Higher Education</td>
                            </tr>
                            <tr>
                                <td>30</td>
                                <td>Forwarding of Renewal of Scholarship to MHRD</td>
                                <td>30 days</td>
                                <td>Secretary</td>
                                <td>Chairman</td>
                                <td>Director, Higher Education</td>
                            </tr>
                            <tr>
                                <td>31</td>
                                <td>Issue of verification of certificates</td>
                                <td>07 days</td>
                                <td>Secretary</td>
                                <td>Chairman</td>
                                <td>Director, Higher Education</td>
                            </tr>
                            <tr>
                                <td>32</td>
                                <td>Issue of verification of Mark Sheet</td>
                                <td>30 days</td>
                                <td>Secretary</td>
                                <td>Chairman</td>
                                <td>Director, Higher Education</td>
                            </tr>
                            <tr>
                                <td>33</td>
                                <td>Re-addition of marks </td>
                                <td>7 days </td>
                                <td>Secretary</td>
                                <td>Chairman</td>
                                <td>Director, Higher Education</td>
                            </tr>
                            <tr>
                                <td>34</td>
                                <td>Re-addition of marks Manual Valuation </td>
                                <td>60 days </td>
                                <td>Secretary</td>
                                <td>Chairman</td>
                                <td>Director, Higher Education</td>
                            </tr>
                            <tr>
                                <td>35</td>
                                <td>Selection of Nominee of CHSE to Colleges</td>
                                <td>07 days </td>
                                <td>Secretary</td>
                                <td>Chairman</td>
                                <td>Director, Higher Education</td>
                            </tr>
                            <tr>
                                <td>36</td>
                                <td>Issue of Pass/ Equivalence Certificate</td>
                                <td>07 days</td>
                                <td>Secretary</td>
                                <td>Chairman</td>
                                <td>Director, Higher Education</td>
                            </tr>
                            <tr>
                                <td>37</td>
                                <td>Issue of Migration Certificate</td>
                                <td>07 days</td>
                                <td>Secretary</td>
                                <td>Chairman</td>
                                <td>Director, Higher Education</td>
                            </tr>
                            <tr>
                                <td>38</td>
                                <td>Issue of Provisional Pass Certificate/Mark sheet </td>
                                <td>07 days</td>
                                <td>Secretary</td>
                                <td>Chairman</td>
                                <td>Director, Higher Education</td>
                            </tr>
                            <tr>
                                <td>39</td>
                                <td>Authentication of Original Certificate</td>
                                <td>07 days</td>
                                <td>Secretary</td>
                                <td>Chairman</td>
                                <td>Director, Higher Education</td>
                            </tr>
                        </tbody>

                    </table>
                </div>
                <div class="clearfix"></div>
                <div id="homeDept" class="hiddenTab table-responsive">
                    <h2>Home</h2>
                    <table class="serviceTbles table">
                        <tbody>
                            <tr>
                                <th>S.No.</th>
                                <th>Services</th>
                                <th style="width: 10%;">Time Limit</th>
                                <th>Designated Officer</th>
                                <th>Appellate Authority</th>
                                <th>Revisional Authority</th>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>NOC For Passport Verification</td>
                                <td>30 Days</td>
                                <td>SI/ASI in-charge of the Desk in DIB
                                </td>
                                <td>DSP, DIB (for District)/ ACP, DIB (for Commissionerate)  </td>
                                <td>SP (for District)/ DCP (for Commissionerate) 
                                </td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Character / Antecedent verification</td>
                                <td>30 Days </td>
                                <td>SI/ASI in-charge of the Desk in DIB</td>
                                <td>DSP, DIB (for District)/ ACP, DIB (for Commissionerate)  </td>
                                <td>SP (for District)/ DCP (for Commissionerate)</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Disposal of application for registration of foreigners</td>
                                <td>7 Days</td>
                                <td>SI/ASI in charge of the Desk in DIB</td>
                                <td>DSP/ Inspector, DIB</td>
                                <td>S.P. (for District)/ DCP (for Commissionrate) </td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>Disposal of application for extension of residential permit of foreigners</td>
                                <td>15 Days</td>
                                <td>SI / ASI in charge of the Desk in DIB</td>
                                <td>DSP/ Inspector, DIB</td>
                                <td>S.P. (for District)/ DCP (for Commissionrate)</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>Supply of copy of FIR to the complainant</td>
                                <td>1 Day</td>
                                <td>IIC/OIC of concerned Police Station</td>
                                <td>SDPO/ACP, Zone  (for Commissionrate) </td>
                                <td>S.P. (for District)/ DCP (for Commissionrate)  </td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td>Disposal of application for use of loudspeakers (for Commissionrate Police area of Bhubaneswar and Cuttack) </td>
                                <td>10 Days</td>
                                <td>SI/ASI in charge of the Desk in Licensing Cell, DCP Office (for Commissionrate) </td>
                                <td>ACP(HQ) office of DCP (for Commissionrate) </td>
                                <td>DCP (for Commissionrate) </td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td>Disposal of application for NOC for fairs/ mela/ exhibition, etc. (for Commissionrate Police area of Bhubaneswar and Cuttack) </td>
                                <td>10 Days</td>
                                <td>SI/ASI in charge of the Desk in Licensing Cell, DCP Office (for Commissionrate) </td>
                                <td>ACP(HQ) office of DCP (for Commissionrate) </td>
                                <td>DCP (for Commissionrate</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td>Disposal of application for final form for road accident/ stolen vehicles/ theft cases</td>
                                <td>5 days</td>
                                <td>IIC/OIC of the concerned Police Station</td>
                                <td>SDPO/ACP Zone (for Commissionrate) </td>
                                <td>SP/DCP (for Commissionrate</td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td>Supply of copy of fire report</td>
                                <td>3 Days</td>
                                <td>Station Officer/ Asst. Fire Officer of the concerned Fire Station</td>
                                <td>Deputy Fire Officer of the Circle</td>
                                <td>Range Fire Officer</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td>Supply of copy of Fire certificate for Fire incident without Insurance</td>
                                <td>7 Days</td>
                                <td>Station Officer/ Asst. Fire Officer of the concerned Fire Station</td>
                                <td>Deputy Fire Officer of the Circle</td>
                                <td>Range Fire Officer</td>
                            </tr>
                            <tr>
                                <td>11</td>
                                <td>Supply of copy of Fire certificate for Fire incident in insured premises (below 10 lakhs) </td>
                                <td>30 days</td>
                                <td>Station Officer/ Asst. Fire Officer of the concerned Fire Station</td>
                                <td>Deputy Fire Officer of the Circle</td>
                                <td>Range Fire Officer</td>
                            </tr>
                            <tr>
                                <td>12</td>
                                <td>Supply of copy of Fire certificate for Fire incident with damage of property worth more than 10 lakhs (irrespective of insurance) </td>
                                <td>30 Days</td>
                                <td>Station Officer/ Asst. Fire Officer of the district Fire Station</td>
                                <td>Range Fire Officer</td>
                                <td>Chief Fire Officer, Odisha, Cuttack</td>
                            </tr>
                            <tr>
                                <td>13</td>
                                <td>Disposal of application for fire safety NOC for factories/ industries/ storage godowns/ explosive premises</td>
                                <td>45 Days</td>
                                <td>Station Officer/ Asst. Fire Officer of the district Fire Station</td>
                                <td>Deputy Fire Officer of Circle</td>
                                <td>Range Fire Officer</td>
                            </tr>
                            <tr>
                                <td>14</td>
                                <td>Disposal of application for fire safety NOC for non-high rise building (below 15 Mtrs of height)</td>
                                <td>45 Days</td>
                                <td>Deputy Fire Officer of concerned circle</td>
                                <td>Range Fire Officer</td>
                                <td>Chief Fire Officer</td>
                            </tr>
                            <tr>
                                <td>15</td>
                                <td>Disposal of application for fire safety NOC for high rise building (above 15 Mtrs of height)</td>
                                <td>60 Days</td>
                                <td>1. Deputy Fire Officer of concerned circle for building upto 21 Mtrs.
2. Deputy Fire Officer, Fire Prevention Wing, Odisha, Bhubaneswar for building above 21 Mtrs.</td>
                                <td>1. Range Fire Officer for building upto 21 Mtrs.
2. Chief Fire Officer for building above 21 Mtrs.</td>
                                <td>1. Chief Fire Officer for building upto 21 Mtrs.
2. I.G. of Police, Fire Service, Odisha, Cuttack for building above 21 Mts.
                                </td>
                            </tr>
                            <tr>
                                <td>16</td>
                                <td>Issue of Ex- servicemen/ Widow Identity Cards</td>
                                <td>1 day</td>
                                <td>Secretary, respective Zilla Sainik Boards (ZSB)</td>
                                <td>Secretary, Rajya Sainik Board, Odisha (RSB)</td>
                                <td>Special Secretary, Home Deptt</td>
                            </tr>
                            <tr>
                                <td>17</td>
                                <td>Registration of Ex-servicemen </td>
                                <td>1 day</td>
                                <td>Secretary, respective ZSBs</td>
                                <td>Secretary, RSB</td>
                                <td>Special Secretary, Home Deptt</td>
                            </tr>
                            <tr>
                                <td>18</td>
                                <td>Issue of Bonafide Certificate for admission of children in various Educational In Institutions</td>
                                <td>1 day</td>
                                <td>Secretary, respective ZSBs/ESB</td>
                                <td>Secretary, RSB</td>
                                <td>Special Secretary, Home Deptt</td>
                            </tr>
                            <tr>
                                <td>19</td>
                                <td>Registration for Employment of ESM.</td>
                                <td>1 day</td>
                                <td>Secretary, ZSBs</td>
                                <td>Secretary, RSB</td>
                                <td>Special Secretary, Home Deptt</td>
                            </tr>
                            <tr>
                                <td>20</td>
                                <td>Issue of Bonafide certificate for exemption of holding Tax</td>
                                <td>1 day</td>
                                <td>Secretary, respective ZSBs</td>
                                <td>Secretary, RSB</td>
                                <td>Special Secretary, Home Deptt</td>
                            </tr>
                            <tr>
                                <td>21</td>
                                <td>Processing of application for death benefits such as AGI, Funeral grant etc.</td>
                                <td>2 days</td>
                                <td>Secretary, respective ZSBs</td>
                                <td>Secretary, RSB</td>
                                <td>Special Secretary, Home Deptt</td>
                            </tr>
                            <tr>
                                <td>22</td>
                                <td>Processing of application for children education allowance for MoD.</td>
                                <td>7 days</td>
                                <td>Secretary, respective ZSBs</td>
                                <td>Secretary, RSB</td>
                                <td>Special Secretary, Home Deptt</td>
                            </tr>
                            <tr>
                                <td>23</td>
                                <td>Processing of application for Scholarship for Amalgamated Fund.</td>
                                <td>7 days</td>
                                <td>Secretary, respective ZSBs</td>
                                <td>Secretary, RSB</td>
                                <td>Special Secretary, Home Deptt</td>
                            </tr>
                            <tr>
                                <td>24</td>
                                <td>Processing of application for PM's scholarship from. MoD</td>
                                <td>7 days</td>
                                <td>Secretary, RSB</td>
                                <td>Special Secretary, 14</td>
                                <td>Special Secretary, Home Deptt</td>
                            </tr>
                            <tr>
                                <td>25</td>
                                <td>Processing of application for various financial assistance from Kendriya Sainik Board, MoD</td>
                                <td>15 days</td>
                                <td>Secretary, respective ZSBs</td>
                                <td>Secretary, RSB</td>
                                <td>Special Secretary, Home Deptt</td>
                            </tr>
                            <tr>
                                <td>26</td>
                                <td>Processing of application for sanction of 2nd World War Veteran Pension.</td>
                                <td>30 days</td>
                                <td>Secretary, respective ZSBs</td>
                                <td>Secretary, RSB</td>
                                <td>Special Secretary, Home Deptt</td>
                            </tr>
                            <tr>
                                <td>27</td>
                                <td>Processing of application for various financial assistance from Amalgamated Fund</td>
                                <td>7 days</td>
                                <td>Secretary, respective ZSBs</td>
                                <td>Secretary, RSB</td>
                                <td>Special Secretary, Home Deptt</td>
                            </tr>
                            <tr>
                                <td>28</td>
                                <td>Physical verification for change of address of serving personnel</td>
                                <td>15 days</td>
                                <td>Secretary, respective ZSBs</td>
                                <td>Secretary, KB</td>
                                <td>Special Secretary, Home Deptt</td>
                            </tr>
                            <tr>
                                <td>29</td>
                                <td>Redressal of grievances of serving/ESM</td>
                                <td>7 days</td>
                                <td>Secretary, respective ZSBs</td>
                                <td>Secretary, KB</td>
                                <td>Special Secretary, Home Deptt</td>
                            </tr>
                            <tr>
                                <td>30</td>
                                <td>Processing of grievance/ Petition of ESM/ Widows to concerned civil authorities.</td>
                                <td>7 days</td>
                                <td>Secretary, respective ZSBs</td>
                                <td>Secretary, KB</td>
                                <td>Special Secretary, Home Deptt</td>
                            </tr>
                            <tr>
                                <td>31</td>
                                <td>NOC for Crackers License</td>
                                <td>7 days</td>
                                <td>OIC of Fire station</td>
                                <td>Asst. Fire Officer of the District Fire Station.</td>
                                <td>Range Fire Officer</td>
                            </tr>
                        </tbody>

                    </table>
                </div>
                <div class="clearfix"></div>
                <div id="housingUrbanDept" class="hiddenTab table-responsive">
                    <h2>Housing & Urban Development</h2>
                    <table class="serviceTbles table">
                        <tbody>
                            <tr>
                                <th>S.No.</th>
                                <th>Services</th>
                                <th>Time Limit</th>
                                <th>Designated Officer</th>
                                <th>Appellate Authority</th>
                                <th>Revisional Authority</th>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Building Plan Approval</td>
                                <td>60 Days</td>
                                <td>Junior Town Planner/ Assistant Town Planner/ Town Planner concerned</td>
                                <td>Planning Member, DA concerned / Executive Officer concerned</td>
                                <td>Vice Chairman, DA concerned / ADM-cum-PD, DUDA</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Issue of Occupancy Certificate</td>
                                <td>30 Days</td>
                                <td>Junior Town Planner/ Assistant Town Planner/ Town Planner concerned</td>
                                <td>Planning Member, DA concerned / Executive Officer concerned</td>
                                <td>Vice Chairman, DA concerned / ADM-cum-PD, DUDA</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Marriage Certificate</td>
                                <td>7 Days</td>
                                <td>Dealing Assistant concerned</td>
                                <td>Deputy Commissioner/ Executive Officer concerned</td>
                                <td>Municipal Commissioner / ADM-cum-PD, DUDA</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>Trade License</td>
                                <td>15 Days</td>
                                <td>Misc. Sarkar/ Clerk concerned</td>
                                <td>Deputy Commissioner/ Executive Officer concerned</td>
                                <td>Municipal Commissioner/ ADM-cum-PD, DUDA</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>Pipe Water Connection</td>
                                <td>45 Days</td>
                                <td>Junior Engineer concerned</td>
                                <td>Assistant Engineer concerned</td>
                                <td>Executive Engineer concerned</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td>Correction of Water Bill</td>
                                <td>30 Days</td>
                                <td>Junior Engineer concerned</td>
                                <td>Assistant Engineer concerned</td>
                                <td>Executive Engineer concerned</td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td>Repair of Tube Wells</td>
                                <td>7 days for minor repair;<br />
                                    14 days for major repair</td>
                                <td>Junior Engineer Tube Wells</td>
                                <td>Assistant Engineer-in-Charge, Tube Wells</td>
                                <td>Executive Engineer concerned</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td>Certified Copy of Building Plan Aporoval</td>
                                <td>7 days</td>
                                <td>JTP /ATP/ TP/ Concerned Clerk</td>
                                <td>Planning Member</td>
                                <td>Vice-Chairman</td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td>Booking of Parks/Community Hall</td>
                                <td>2 Days</td>
                                <td>0hief Horticulturist / 0oncerned Clerk</td>
                                <td>Chief Engineer cum-Engineer Member / Dy.Commissioner</td>
                                <td>Vice-Chairman / Chairman MunicipalCommissioner</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td>Land Use lnformation</td>
                                <td>3 Days</td>
                                <td>JTP / ATP/ TP/ Concerned Clerk</td>
                                <td>Planning Member </td>
                                <td>Vice-Chairman</td>
                            </tr>
                            <tr>
                                <td>11</td>
                                <td>lssue of Conveyance Deed</td>
                                <td>30 Days</td>
                                <td>Concerned Allotment Officer /Concerned Clerk</td>
                                <td>Secretary</td>
                                <td>Vice-Chairman</td>
                            </tr>
                            <tr>
                                <td>12</td>
                                <td>lssue of <b>No Dues</b>Certificate</td>
                                <td>30 days</td>
                                <td>Concerned Allotment Officer / Concerned Branch Officer</td>
                                <td>Secretary / Deputy Commissioner</td>
                                <td>Vice-Chairman /Municipal Commissioner</td>
                            </tr>
                            <tr>
                                <td>13</td>
                                <td>Transfer of Property in case of Sale</td>
                                <td>30 Days</td>
                                <td>Concerned Allotment Officer / Concerned Clerk </td>
                                <td>Secretary</td>
                                <td>Vice-Chairman</td>
                            </tr>
                            <tr>
                                <td>14</td>
                                <td>lssue of Permission for Mortgage</td>
                                <td>30 days</td>
                                <td>Concerned Allotment Officer / Concerned Clerk</td>
                                <td>Secretary</td>
                                <td>Vice-Chairman</td>
                            </tr>
                            <tr>
                                <td>15</td>
                                <td>Transfer of Ownership of Holding</td>
                                <td>60 Days</td>
                                <td>Concerned Allotment Officer / Concerned
Clerk / Recovery Officer</td>
                                <td>Secretary / Deputy Commissioner</td>
                                <td>Vice-Chairman /Municipal Commissioner</td>
                            </tr>
                            <tr>
                                <td>16</td>
                                <td>Lifting of Municipal Solid Waste from
roads / Street</td>
                                <td>3 Days</td>
                                <td>Sanitary Inspector</td>
                                <td>City Health Officer</td>
                                <td>Municipal Commissioner</td>
                            </tr>
                            <tr>
                                <td>17</td>
                                <td>Replacement of Damaged Street Light</td>
                                <td>10 days</td>
                                <td>Concerned Junior Engineer</td>
                                <td>Concerned Executive Engineer</td>
                                <td>City Engineer</td>
                            </tr>
                            <tr>
                                <td>18</td>
                                <td>Assessment of Holding Tax</td>
                                <td>30 Days</td>
                                <td>Tax Collector / Tax Daroga</td>
                                <td>Deputy Commissioner</td>
                                <td>Municipal Commissioner</td>
                            </tr>
                            <tr>
                                <td>19</td>
                                <td>Road cutting permission</td>
                                <td>7 Days</td>
                                <td>Concerned Junior Engineer </td>
                                <td>Executive Engineer Concern</td>
                                <td>City Engineer</td>
                            </tr>
                            <tr>
                                <td>20</td>
                                <td>Road restoration from date of issue of Permission</td>
                                <td>15 days</td>
                                <td>Concerned Junior Engineer</td>
                                <td>Concerned Executive Engineer</td>
                                <td>City Engineer</td>
                            </tr>
                            <tr>
                                <td>21</td>
                                <td>lssue of duplicate Birth / Death Certificate</td>
                                <td>7 Days</td>
                                <td>Concerned Clerk</td>
                                <td>City health Officer</td>
                                <td>Municipal Commissioner</td>
                            </tr>
                            <tr>
                                <td>22</td>
                                <td>Repairing of WS pipelines (Minor leakage / Sewerage Over flow / Blockage</td>
                                <td>2 Days(48 hours)</td>
                                <td>Concerned JE / AE</td>
                                <td>Concerned AEE / Dy. Executive Engineer</td>
                                <td>Executive Engineer</td>
                            </tr>
                            <tr>
                                <td>23</td>
                                <td>Building Plan Approval (Applicable to Bhubaneswar Development Authority from 01-02-2013 and other Development authorities &amp; ULBs from 01-05-2013)</td>
                                <td>60 days</td>
                                <td>Counter Assistant/Dealing Assistant concerned</td>
                                <td>Planning Member, DA concerned/ Executive Officer concerned</td>
                                <td>Vice Chairman, DA concerned/ ADM-cum-PD, DUDA</td>
                            </tr>
                            <tr>
                                <td>24</td>
                                <td>Issuance of Occupancy Certificate (Applicable to Bhubaneswar Development authority from 01-02-2013 and other development Authorities &amp; ULBs from 01-03-2013)</td>
                                <td>30 days</td>
                                <td>Counter Assistant/Dealing Assistant concerned</td>
                                <td>Planning Member, DA concerned/ Executive Officer concerned</td>
                                <td>Vice Chairman, DA concerned/ ADM-cum-PD, DUDA</td>
                            </tr>
                            <tr>
                                <td>25</td>
                                <td>Marriage Certificate (Applicable to Bhubaneswar, Cuttack &amp; Berhampur Municipal Corporations from 01-02-2013 and other ULBs from 01-05-2013)</td>
                                <td>7 days</td>
                                <td>Dealing Assistant concerned</td>
                                <td>Deputy Commissioner/ Executive Officer concerned</td>
                                <td>Municipal Commissioner / ADM-cum-PD, DUDA</td>
                            </tr>
                            <tr>
                                <td>26</td>
                                <td>Birth &amp; Death Certificate (Applicable to Bhubaneswar, Cuttack &amp; Berhampur Municipal Corporations from 01-02-2013 and other ULBs from 01-05-2013)</td>
                                <td>15 days</td>
                                <td>VS Clerk</td>
                                <td>City Health Officer/ Executive Officer concerned</td>
                                <td>Municipal Commissioner / ADM-cum-PD, DUDA</td>
                            </tr>
                            <tr>
                                <td>27</td>
                                <td>Trade License (Applicable to Bhubaneswar, Cuttack &amp; Berhampur Municipal Corporations from 01-02-2013 and other ULBs from 01-05-2013)</td>
                                <td>15 days</td>
                                <td>Misc. Sarkar/Clerk concerned</td>
                                <td>Deputy Commissioner / Executive officer concerned</td>
                                <td>Municipal Commissioner / ADM-cum-PD, DUDA</td>
                            </tr>
                            <tr>
                                <td>28</td>
                                <td>Pipe Water connection (Applicable to Bhubaneswar, Cuttack &amp; Berhampur Municipal Corporations from 01-02-2013 and other ULBs from 01-05-2013)</td>
                                <td>45 days</td>
                                <td>Junior Engineer concerned</td>
                                <td>Assistant Engineer concerned</td>
                                <td>Executive Engineer concerned</td>
                            </tr>
                            <tr>
                                <td>29</td>
                                <td>Correction of Water Bill (Applicable to Bhubaneswar, Cuttack &amp; Berhampur Municipal Corporations from 01-02-2013 and other ULBs from 01-05-2013)</td>
                                <td>30 days</td>
                                <td>Junior Engineer concerned</td>
                                <td>Assistant Engineer concerned</td>
                                <td>Executive Engineer concerned</td>
                            </tr>
                            <tr>
                                <td>30</td>
                                <td>Repair of Tube Wells (Applicable to Bhubaneswar, Cuttack &amp; Berhampur Municipal Corporations from 01-02-2013 and other ULBs from 01-05-2013)</td>
                                <td>7 days for minor repair; 14 days for major repair</td>
                                <td>Junior Engineer, Tube wells</td>
                                <td>Assistant Engineer0in-charge, Tube wells</td>
                                <td>Executive Engineer concerned</td>
                            </tr>
                        </tbody>

                    </table>
                </div>
                <div class="clearfix"></div>
                <div id="industriesDept" class="hiddenTab table-responsive">
                    <h2>Industries</h2>
                    <table class="serviceTbles table">
                        <tbody>
                            <tr>
                                <th>S.No.</th>
                                <th>Services</th>
                                <th>Time Limit</th>
                                <th>Designated Officer</th>
                                <th>Appellate Authority</th>
                                <th>Revisional Authority</th>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Allotment letter after receipt of Land Allotment Committee (LAC) approval.</td>
                                <td>30 days</td>
                                <td>Concerned Divisional Head</td>
                                <td>Chairman-cum-Managing Director, IDCO</td>
                                <td>Principal Secretary, Industries Department</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Execution of agreement subject to compliance of terms and conditions of allotment after receipt of land cost.</td>
                                <td>15 days</td>
                                <td>Concerned Divisional Head</td>
                                <td>Chairman-cum-Managing Director, IDCO</td>
                                <td>Principal Secretary, Industries Department</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Issue of possession certificate after receipt of land cost</td>
                                <td>15 days</td>
                                <td>Concerned Divisional Head</td>
                                <td>Chairman-cum-Managing Director, IDCO</td>
                                <td>Principal Secretary, Industries Department</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>Allotment Letter after receipt of approval from High Level Clearance Committee (HLCC)</td>
                                <td>30 days</td>
                                <td>CGM ( MSME)</td>
                                <td>Chairman-cum-Managing Director, IDCO</td>
                                <td>Principal Secretary, Industries Department</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>Execution of agreement subject to compliance of terms and conditions of allotment after receipt of land cost</td>
                                <td>15 days</td>
                                <td>Concerned Divisional Head</td>
                                <td>Chairman-cum-Managing Director, IDCO</td>
                                <td>Principal Secretary, Industries Department</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td>Issue of possession certificate after receipt of land cost</td>
                                <td>15 days</td>
                                <td>Concerned Divisional Head</td>
                                <td>Chairman-cum-Managing Director, IDCO</td>
                                <td>Principal Secretary, Industries Department</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="clearfix"></div>
                <div id="labourESIDept" class="hiddenTab table-responsive">
                    <h2>Labour & Employee's State Insurance</h2>
                    <table class="serviceTbles table">
                        <tbody>
                            <tr>
                                <th>S.No.</th>
                                <th>Services</th>
                                <th>Time Limit</th>
                                <th>Designated Officer</th>
                                <th>Appellate Authority</th>
                                <th>Revisional Authority</th>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Registration under Odisha Shop and Commercial Establishment Act, 1956</td>
                                <td>15 days</td>
                                <td>District Labour Officer/ Assistant Labour Officer.</td>
                                <td>Assistant Labour Commissioner</td>
                                <td>Deputy Labour Commissioner</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Renewal of Registration  under Odisha Shop and Commercial Establishment Act, 1956</td>
                                <td>15 days</td>
                                <td>District Labour Officer/ Assistant Labour Officer.</td>
                                <td>Assistant Labour Commissioner</td>
                                <td>Deputy Labour Commissioner</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>The Motor Transport Workers Act, 1961 i) Registration ii) Renewal (annual)</td>
                                <td>15 days</td>
                                <td>Dist. Labour Officer</td>
                                <td>Asst. Labour Commissioner</td>
                                <td>Deputy Labour Commissioner</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>The Beedi &amp; Cigar Workers Act, 1966 i) License ii) Renewal (annual)</td>
                                <td>15 days</td>
                                <td>Dist. Labour Officer</td>
                                <td>Asst. Labour Commissioner</td>
                                <td>Deputy Labour Commissioner</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>Contract Labour (R&amp;A) Act, 1970 i) Registration (one time) ii) License iii) Renewal (annual)</td>
                                <td>15 days</td>
                                <td>Dist. Labour Officer</td>
                                <td>Asst. Labour Commissioner</td>
                                <td>Deputy Labour Commissioner</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td>Inter State Migrant Workmen Act, 1979 i) Registration (one time) ii) License iii) Renewal of License</td>
                                <td>15 days</td>
                                <td>Dist. Labour Officer</td>
                                <td>Asst. Labour Commissioner</td>
                                <td>Deputy Labour Commissioner</td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td>Building &amp; Other Construction Workers (RE&amp;CS) Act, 1996 i)   Registration of Establishment</td>
                                <td>15 days</td>
                                <td>Dist. Labour Officer</td>
                                <td>Asst. Labour Commissioner</td>
                                <td>Deputy Labour Commissioner</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td>Industrial Employment Standing Order Act, 1946</td>
                                <td>45 days</td>
                                <td>Deputy Labour Commissioner</td>
                                <td>Joint Labour Commissioner</td>
                                <td>Labour Commissioner</td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td>Approval of factory plans (Non hazardous factories)</td>
                                <td>30 days</td>
                                <td>Assistant Director, F&amp;B</td>
                                <td>Joint Director, F&amp;B</td>
                                <td>Director, F&amp;B</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td>Approval of factory plans ( hazardous factories)</td>
                                <td>60 days</td>
                                <td>Assistant Director, F&amp;B</td>
                                <td>Joint Director, F&amp;B</td>
                                <td>Director, F&amp;B</td>
                            </tr>
                            <tr>
                                <td>11</td>
                                <td>Approval of factory plans (Major Accident harzard factory)</td>
                                <td>90 days</td>
                                <td>Assistant Director, F&amp;B</td>
                                <td>Joint Director, F&amp;B</td>
                                <td>Director, F&amp;B</td>
                            </tr>
                            <tr>
                                <td>12</td>
                                <td>Registration  and licensing of Factories</td>
                                <td>30 days</td>
                                <td>Assistant Director, F&amp;B</td>
                                <td>Joint Director, F&amp;B</td>
                                <td>Director, F&amp;B</td>
                            </tr>
                            <tr>
                                <td>13</td>
                                <td>Renewal/ Amendment/ Transfer of Factory License </td>
                                <td>30 days</td>
                                <td>Section Officer</td>
                                <td>Joint Director, F&amp;B</td>
                                <td>Director, F&amp;B</td>
                            </tr>
                            <tr>
                                <td>14</td>
                                <td>Issue of Duplicate  License</td>
                                <td>30 days</td>
                                <td>Section Officer</td>
                                <td>Joint Director, F&amp;B</td>
                                <td>Director, F&amp;B</td>
                            </tr>
                            <tr>
                                <td>15</td>
                                <td>Inspection of Boilers and issue of provisional order to operate </td>
                                <td>15 days</td>
                                <td>Zonal Assistant Director, F&amp;B</td>
                                <td>Divisional Deputy Director, F&amp;B</td>
                                <td>Director, F&amp;B</td>
                            </tr>
                            <tr>
                                <td>16</td>
                                <td>Approval of repair order of boilers </td>
                                <td>15 days</td>
                                <td>Section Officer</td>
                                <td>Joint Director, F&amp;B</td>
                                <td>Director, F&amp;B</td>
                            </tr>
                            <tr>
                                <td>17</td>
                                <td>Approval of Drawings of Steam Pipeline </td>
                                <td>30 days</td>
                                <td>Assistant Director, F&amp;B</td>
                                <td>Joint Director, F&amp;B</td>
                                <td>Director, F&amp;B</td>
                            </tr>
                            <tr>
                                <td>18</td>
                                <td>Registration of Boilers</td>
                                <td>30 days</td>
                                <td>Assistant Director, F&amp;B</td>
                                <td>Divisional Deputy Director, F&amp;B</td>
                                <td>Director, F&amp;B</td>
                            </tr>
                            <tr>
                                <td>19</td>
                                <td>Endorsement of Certificates of Boiler Operation Engineers, Boiler Attendants and Welders issued by other states.</td>
                                <td>15 days</td>
                                <td>Section Officer</td>
                                <td>Secretary of Respective Board  (Assistant Director, F&amp;B/ Deputy Director, F&amp;B)</td>
                                <td>Chairman (Director, F&amp;B)</td>
                            </tr>
                            <tr>
                                <td>20</td>
                                <td>Revalidation of Welder's certificates </td>
                                <td>15 days</td>
                                <td>Section Officer</td>
                                <td>Deputy Director, F&amp;B</td>
                                <td>Director, F&amp;B</td>
                            </tr>
                        </tbody>

                    </table>
                </div>
                <div class="clearfix"></div>
                <div id="panchayatiDept" class="hiddenTab table-responsive">
                    <h2>Panchayati Raj</h2>
                    <table class="serviceTbles table">
                        <tbody>
                            <tr>
                                <th>S.No.</th>
                                <th>Services</th>
                                <th>Time Limit</th>
                                <th>Designated Officer</th>
                                <th>Appellate Authority</th>
                                <th>Revisional Authority</th>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Repair of hand pumps</td>
                                <td>7 days (minor repair)<br />
                                    14 days (major repair except replacement)<br />
                                    28 days for replacement<br />
                                </td>
                                <td>JE RWSS-II</td>
                                <td>AE RWSS</td>
                                <td>BDO</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Finalisation of work bill</td>
                                <td>30 Days (From the date of completion of the work)</td>
                                <td>BDO(Block Level) District Panchayat Officer/ PD, DRDA (District Level (As the case may be), Dy.Secy / Jt. Secy. (State Level)</td>
                                <td>Collector(Block Level) Director, Panchayati Raj (District Level (As the case may be) Collector(State Level)</td>
                                <td>Collector(Block Level) Director, Panchayati Raj (District Level (As the case may be) Commissioner- cum-Secretary (State Level)</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Issue of Trading License for trading of Minor Forest Produce</td>
                                <td>7days (By the Grama Panchayat)</td>
                                <td>Sarpanch (Block Level)</td>
                                <td>District Panchayat Officer (Block Level)</td>
                                <td>Collector (Block Level)</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="clearfix"></div>
                <div id="revenueDsterDept" class="hiddenTab table-responsive">
                    <h2>Revenue & Disaster Management</h2>
                    <table class="serviceTbles table">
                        <tbody>
                            <tr>
                                <th>S.No.</th>
                                <th>Services</th>
                                <th>Time Limit</th>
                                <th>Designated Officer</th>
                                <th>Appellate Authority</th>
                                <th>Revisional Authority</th>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Disposal of applications for issue of SC, ST, OBC, SEBC, Legal Heir Certificates</td>
                                <td>30 days (excluding the period taken for disposal of objections, if any) 
                                    <br>
                                    N.B.: For these certificates citizens should apply in their native tahasils.</td>
                                <td>Tahasildar/Addl. Tahasildar</td>
                                <td>Collector -(SC &amp; ST)<br />
                                    Sub-Collector-(OBC,
SEBC and Legal heir)
                                </td>
                                <td>RDC- (SC &amp; ST)<br />
                                    Collector -(OBC,
SEBC and Legal heir)
                                </td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Disposal of applications for issue of Residence &amp; Income Certficate</td>
                                <td>15 days (excluding the period taken for disposal of objections, if any) </td>
                                <td>Tahasildar / Addl. Tahasildar 
                                </td>
                                <td>Sub-Collector
                                </td>
                                <td>Collector
                                </td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Issue of certified copy of RoR</td>
                                <td>3 days</td>
                                <td>Tahasildar / Addl. Tahasildar 
                                </td>
                                <td>Sub-Collector
                                </td>
                                <td>Collector
                                </td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>Disposal of uncontested mutation cases</td>
                                <td>90 days for disposal &amp; 45 days for correction of RoR</td>
                                <td>Tahasildar / Addl. Tahasildar
                                </td>
                                <td>Sub-Collector
                                </td>
                                <td>Collector</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>Disposal of cases u/s 8 (A) of OLR Act</td>
                                <td>60 Days for disposal (excluding the time taken for payment of premium)</td>
                                <td>Tahasildar / Addl. Tahasildar concerned
                                </td>
                                <td>Sub-Collector 
                                </td>
                                <td>Collector 
                                </td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td>Partition of land on mutual agreement of all co-sharers u/s 19 (1) (C) of OLR Act</td>
                                <td>180 Days</td>
                                <td>Tahasildar /
Addl. Tahasidar</td>
                                <td>Sub-Collector</td>
                                <td>Collector</td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td>Registration of documents</td>
                                <td>3 days</td>
                                <td>DSR / SR</td>
                                <td>DR-cum-ADM</td>
                                <td>IGR</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td>Issue of Encumbrance Certificate</td>
                                <td>7 days</td>
                                <td>DSR / SR</td>
                                <td>DR-cum-ADM</td>
                                <td>IGR</td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td>Issue of certified copy of previously registered documents</td>
                                <td>7 days</td>
                                <td>DSR / SR</td>
                                <td>DR-cum-ADM</td>
                                <td>IGR</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td>Registration along with issue of marriage certificate under Special Marriage Act</td>
                                <td>40 days (where no objection received)/70 working days (where objection received )</td>
                                <td>DSR/SR<br />
                                    DR</td>
                                <td>DR-cum-ADM<br />
                                    Collector</td>
                                <td>IGR</td>
                            </tr>
                            <tr>
                                <td>11</td>
                                <td>Registration of Societies</td>
                                <td>90 days where more than one district is involved (State Level Society)<br />
                                    30 Days(where one district is involved)(State Level Society) </td>
                                <td>Registrar of Societies(IGR)<br />
                                    Addl. Registrar of Societies (ADM)</td>
                                <td>Government<br />
                                    IGR</td>
                                <td>Government<br />
                                    Government</td>

                            </tr>
                            <tr>
                                <td>12</td>
                                <td>Disbursement of ex-gratia by tahasildars from the date of receipt of funds and approval</td>
                                <td>90 Days</td>
                                <td>Tahasidar</td>
                                <td>Sub-Collector</td>
                                <td>Collector</td>
                            </tr>
                            <tr>
                                <td>13</td>
                                <td>Disposal of application for issue of Solvency Certificate for an amount less than rupees one lakh</td>
                                <td>30 days (Excluding the period taken for disposal of objections, if any) </td>
                                <td>Tahasildar / Addl. Tahasildar</td>
                                <td>Sub-Collector</td>
                                <td>Collector</td>
                            </tr>
                            <tr>
                                <td>14</td>
                                <td>Disposal of application for  issue of Solvency Certificate for an amount of and above rupees one lakh</td>
                                <td>30 days (Excluding the period taken for disposal of objections, if any)</td>
                                <td>Sub-Collector</td>
                                <td>Collector</td>
                                <td>RDC</td>
                            </tr>
                            <tr>
                                <td>15</td>
                                <td>Disposal of application for  issue of Guardianship Certificate</td>
                                <td>45 days (Excluding the period taken for disposal of objections, if any)</td>
                                <td>Collector</td>
                                <td>RDC</td>
                                <td>Member, Board of Revenue</td>
                            </tr>
                            <tr>
                                <td>16</td>
                                <td>Certified copy of the document filed u/s 89 of Registration Act, 1908</td>
                                <td>7 days</td>
                                <td>DSR/SR</td>
                                <td>ADM-cum-DR</td>
                                <td>IGR</td>
                            </tr>
                            <tr>
                                <td>17</td>
                                <td>Registration of Partnership Firm</td>
                                <td>90 days</td>
                                <td>Registrar of Firm (IGR) or Officer delegated with power</td>
                                <td>Land Reforms Commissioner</td>
                                <td>Member, Board of Revenue</td>
                            </tr>
                            <tr>
                                <td>18</td>
                                <td>Amendment of Registered Partnership Firm</td>
                                <td>30 days</td>
                                <td>Registrar of Firm (IGR) or Officer delegated with power</td>
                                <td>Land Reforms Commissioner</td>
                                <td>Member, Board of Revenue</td>
                            </tr>
                            <tr>
                                <td>19</td>
                                <td>Dissolution of Partnership firm </td>
                                <td>45 days</td>
                                <td>Registrar of Firm(IGR) or Officer delegated with power</td>
                                <td>Land Reforms Commissioner</td>
                                <td>Member, Board of Revenue</td>
                            </tr>
                            <tr>
                                <td>20</td>
                                <td>Certified copy of Certificate of Firm</td>
                                <td>7 days</td>
                                <td>Registrar of Firm(IGR) or Officer delegated with power</td>
                                <td>Land Reforms Commissioner</td>
                                <td>Member, Board of Revenue</td>
                            </tr>
                            <tr>
                                <td>21</td>
                                <td>Amendment of Registered Society (District level)</td>
                                <td>30 days</td>
                                <td>Additional Registrar of Societies(ADM)</td>
                                <td>IGR</td>
                                <td>Land Reforms Commissioner</td>
                            </tr>
                            <tr>
                                <td>22</td>
                                <td>Amendment of Registered Society (State level)</td>
                                <td>60 days</td>
                                <td>IGR</td>
                                <td>Land Reforms Commissioner</td>
                                <td>Member, Board of Revenue</td>
                            </tr>
                            <tr>
                                <td>23</td>
                                <td>Certified copy of Certificate of Society Registered within last five years (District level)</td>
                                <td>5 days</td>
                                <td>Additional Registrar of Societies(ADM)</td>
                                <td>IGR</td>
                                <td>Land Reforms Commissioner</td>
                            </tr>
                            <tr>
                                <td>24</td>
                                <td>Certified copy of Certificate of Society Registered within last five years (State level)</td>
                                <td>5 days</td>
                                <td>IGR</td>
                                <td>Land Reforms Commissioner</td>
                                <td>Member, Board of Revenue</td>
                            </tr>
                            <tr>
                                <td>25</td>
                                <td>Certified copy of Certificate of Society Registered within last ten years (District level)</td>
                                <td>7 days</td>
                                <td>Additional Registrar of Societies(ADM)</td>
                                <td>IGR</td>
                                <td>Land reforms Commissioner</td>
                            </tr>
                            <tr>
                                <td>26</td>
                                <td>Certified copy of Certificate of Society Registered within last ten  years (State level)</td>
                                <td>7 days</td>
                                <td>IGR</td>
                                <td>Land reforms Commissioner</td>
                                <td>Member, Board of Revenue</td>
                            </tr>
                            <tr>
                                <td>27</td>
                                <td>Certified copy of Bye-laws of Society Registered within last five years (District level)</td>
                                <td>5 days</td>
                                <td>Additional Registrar of Societies(ADM)</td>
                                <td>IGR</td>
                                <td>Land reforms Commissioner</td>
                            </tr>
                            <tr>
                                <td>28</td>
                                <td>Certified copy of Bye-laws of Society Registered within last five years (State level)</td>
                                <td>5 days</td>
                                <td>IGR</td>
                                <td>Land reforms Commissioner</td>
                                <td>Member, Board of Revenue</td>
                            </tr>
                            <tr>
                                <td>29</td>
                                <td>Certified copy of Bye-laws of Society Registered within last ten years (District level)</td>
                                <td>7 days</td>
                                <td>Additional Registrar of Societies(ADM)</td>
                                <td>IGR</td>
                                <td>Land reforms Commissioner</td>
                            </tr>
                            <tr>
                                <td>30</td>
                                <td>Certified copy of Bye-laws of Society Registered within last ten years (State level)</td>
                                <td>7 days</td>
                                <td>IGR</td>
                                <td>Land reforms Commissioner</td>
                                <td>Member, Board of Revenue</td>
                            </tr>
                            <tr>
                                <td>31</td>
                                <td>Certified copy of Memorandum of Society Registered within last five years (District level)</td>
                                <td>5 days</td>
                                <td>Additional Registrar of Societies(ADM)</td>
                                <td>IGR</td>
                                <td>Land reforms Commissioner</td>
                            </tr>
                            <tr>
                                <td>32</td>
                                <td>Certified copy of Memorandum of Society Registered within last five years (State level)</td>
                                <td>5 days</td>
                                <td>IGR</td>
                                <td>Land reforms Commissioner</td>
                                <td>Member, Board of Revenue</td>
                            </tr>
                            <tr>
                                <td>33</td>
                                <td>Certified copy of Memorandum of Society Registered within last ten years (District level)</td>
                                <td>7 days</td>
                                <td>Additional Registrar of Societies(ADM)</td>
                                <td>IGR</td>
                                <td>Land reforms Commissioner</td>
                            </tr>
                            <tr>
                                <td>34</td>
                                <td>Certified copy of Memorandum of Society Registered within last ten years (State level)</td>
                                <td>7 days</td>
                                <td>IGR</td>
                                <td>Land reforms Commissioner</td>
                                <td>Member, Board of Revenue</td>
                            </tr>
                        </tbody>

                    </table>
                </div>
                <div class="clearfix"></div>
                <div id="backwardClassesDept" class="hiddenTab table-responsive">
                    <h2>ST & SC Development, Minorities & Backward Classes Welfare</h2>
                    <table class="serviceTbles table">
                        <tbody>
                            <tr>
                                <th>S.No.</th>
                                <th>Services</th>
                                <th>Time Limit</th>
                                <th>Designated Officer</th>
                                <th>Appellate Authority</th>
                                <th>Revisional Authority</th>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Sanction and Disbursement of Post Matric scholarship to eligible ST &amp; SC Students</td>
                                <td>30 Days</td>
                                <td>Dist.Welfare Officers Concerned</td>
                                <td>A.D.M. of the Concerned District</td>
                                <td>Director, ST &amp; SC Dev. Deptt. Incharge of Post Matric Scholarship</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Disposal of Grievance Petitions received from ST &amp;SC students in relating to Post Matric Scholarship</td>
                                <td>30 Days</td>
                                <td>Dist .Welfare Officers Concerned</td>
                                <td>A.D.M. of the Concerned District</td>
                                <td>Director,ST &amp; SC Dev. Deptt. Incharge of Post Matric Scholarship</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Payment of cash incentive to couples for inter-caste Marriage as defined in Resolution No. 21332 HTW dt. 26.6.1980 subject to revision from time to time</td>
                                <td>60 days from receipt of application with requisite document from the Couple subject to availability of allotment of funds with the disbursing authority</td>
                                <td>District Welfare Officer (DWO) of the concerned district </td>
                                <td>Collector of the concerned district </td>
                                <td>Commissioner-cum- Secretary, ST&amp;SC Dev. Department</td>
                            </tr>
                        </tbody>

                    </table>
                </div>
                <div class="clearfix"></div>
                <div id="massEduDept" class="hiddenTab table-responsive">
                    <h2>School & Mass Education</h2>
                    <table class="serviceTbles table">
                        <tbody>
                            <tr>
                                <th>S.No.</th>
                                <th>Services</th>
                                <th>Time Limit</th>
                                <th>Designated Officer</th>
                                <th>Appellate Authority</th>
                                <th>Revisional Authority</th>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Issues of Original High School Certificate-cum-Mark Sheet</td>
                                <td>7 Days(from the date of publication of results by the BSE, Odisha)</td>
                                <td>Deputy Secretary, BSE(O)</td>
                                <td>Secretary, BSE(O)</td>
                                <td>President, BSE(O)</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Issue of duplicate copy of High School Mark sheet</td>
                                <td>15 Days</td>
                                <td>Deputy Secretary,BSE(O)</td>
                                <td>Secretary,BSE(O)</td>
                                <td>President,BSE(O)</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Issue of duplicate copy of High School Certificate</td>
                                <td>15 Days</td>
                                <td>Deputy Secretary,BSE(O)</td>
                                <td>Secretary,BSE(O)</td>
                                <td>President,BSE(O)</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>Issue of Transfer Certificate for Elementary Schools</td>
                                <td>3 Days</td>
                                <td>Head Master/ IC H.M.</td>
                                <td>SI of Schools</td>
                                <td>District Inspector of Schools</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>Issue of Conduct Certificate for Elementary Schools</td>
                                <td>3 Days</td>
                                <td>Head Master/ IC H.M.</td>
                                <td>SI of Schools</td>
                                <td>District Inspector of Schools</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td>Issue of Transfer Certificate for Secondary Schools</td>
                                <td>3 Days</td>
                                <td>Head Master/ IC H.M.</td>
                                <td>District Education Officer</td>
                                <td>Regional Joint Director (Schools)</td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td>Issue of Conduct Certificate for Secondary Schools</td>
                                <td>3 Days</td>
                                <td>Head Master/ IC H.M.</td>
                                <td>District Education Officer</td>
                                <td>Regional Joint Director (Schools)</td>
                            </tr>
                        </tbody>

                    </table>
                </div>
                <div class="clearfix"></div>
                <div id="ssepd_Dept" class="hiddenTab table-responsive">
                    <h2>Social Security and Empowerment of Person with Disabilities</h2>
                    <table class="serviceTbles table">
                        <tbody>
                            <tr>
                                <th>S.No.</th>
                                <th>Services</th>
                                <th>Time Limit</th>
                                <th>Designated Officer</th>
                                <th>Appellate Authority</th>
                                <th>Revisional Authority</th>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Assistance under National Family Benefit Scheme(NFBS)</td>
                                <td>30 Days in Rural areas<br />
                                    30 days in Urban areas</td>
                                <td>BDO(Rural areas)<br />
                                    Executive Officer(Urban areas)</td>
                                <td>Sub-Collector(Rural areas &amp; Urban areas)</td>
                                <td>Collector (Rural areas &amp; Urban areas)</td>
                            </tr>
                        </tbody>

                    </table>
                </div>
                <div class="clearfix"></div>
                <div id="worksDept" class="hiddenTab table-responsive">
                    <h2>Works</h2>
                    <table class="serviceTbles table">
                        <tbody>
                            <tr>
                                <th>S.No.</th>
                                <th>Services</th>
                                <th>Time Limit</th>
                                <th>Designated Officer</th>
                                <th>Appellate Authority</th>
                                <th>Revisional Authority</th>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Fair Rent Calculation.</td>
                                <td>30 days</td>
                                <td>Executive Engineer</td>
                                <td>Superintending Engineer.</td>
                                <td>Engineer in Chief (EIC) (C) Odisha.</td>
                            </tr>
                        </tbody>

                    </table>
                </div>
                <div class="clearfix"></div>
                <div id="enterpriseDept" class="hiddenTab table-responsive">
                    <h2>Micro, Small & Medium Enterprise</h2>
                    <table class="serviceTbles table">
                        <tbody>
                            <tr>
                                <th>S.No.</th>
                                <th>Services</th>
                                <th>Time Limit</th>
                                <th>Designated Officer</th>
                                <th>Appellate Authority</th>
                                <th>Revisional Authority</th>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Acknowledgement   of Entrepreneurs Memorandum Part I</td>
                                <td>24 working hrs.</td>
                                <td>General Manager, Regional Industries Centre (RIC) /District Industries Centre (DIC)</td>
                                <td>Director of Industries</td>
                                <td>Secretary, MSME Department</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Acknowledgement of Entrepreneurs Memorandum Part II</td>
                                <td>48 working hrs.</td>
                                <td>General Manager, Regional Industries Centre (RIC) /District Industries Centre (DIC)</td>
                                <td>Director of Industries</td>
                                <td>Secretary, MSME Department</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Recommendation for exemption of premium for conversion of land for MSMEs</td>
                                <td>60 days</td>
                                <td>General Manager, Regional Industries Centre (RIC) /District Industries Centre (DIC)</td>
                                <td>Director of Industries</td>
                                <td>Secretary, MSME Department</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>Sanction of capital investment subsidy under National Mission on Food Processing(NMFP)/ Odisha Food Processing Policies (OFPP) MSME development policy for Micro Enterprises</td>
                                <td>60 days</td>
                                <td>General Manager, Regional Industries Centre (RIC) /District Industries Centre (DIC</td>
                                <td>Director of Industries</td>
                                <td>Secretary, MSME Department</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>Sanction of capital investment subsidy under National Mission on Food Processing (NMFP)/ Odisha Food Processing Policies (OFPP)/ MSME development policy for Small Enterprises)</td>
                                <td>90 days</td>
                                <td>Joint Director of Industries/ Addl. Director of Industries</td>
                                <td>Director of Industries</td>
                                <td>Secretary, MSME Department</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td>Recommendation for Exemption of Stamp Duty</td>
                                <td>7 days</td>
                                <td>General Manager, Regional Industries Centre (RIC) /District Industries Centre (DIC</td>
                                <td>Director of Industries</td>
                                <td>Secretary, MSME Department</td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td>Sanction of assistance for Patent &amp; IPR (Industrial Policy Resolution)</td>
                                <td>30 days</td>
                                <td>General Manager, Regional Industries Centre (RIC) /District Industries Centre (DIC</td>
                                <td>Director of Industries</td>
                                <td>Secretary, MSME Department</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td>Sanction of assistance for Technical know-how</td>
                                <td>30 days</td>
                                <td>General Manager, Regional Industries Centre (RIC) /District Industries Centre (DIC</td>
                                <td>Director of Industries</td>
                                <td>Secretary, MSME Department</td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td>Sanction of assistance for quality Certification</td>
                                <td>30 days</td>
                                <td>General Manager, Regional Industries Centre (RIC) /District Industries Centre (DIC</td>
                                <td>Director of Industries</td>
                                <td>Secretary, MSME Department</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td>Recommendation for Electricity Duty (ED) Exemption on Power Supply for micro, small, medium &amp; large enterprises (up to 110 KVA)</td>
                                <td>30 days</td>
                                <td>General Manager, Regional Industries Centre (RIC) /District Industries Centre (DIC</td>
                                <td>Director of Industries</td>
                                <td>Secretary, MSME Department</td>
                            </tr>
                            <tr>
                                <td>11</td>
                                <td>Recommendation for Electricity Duty (ED)  Exemption on Power Supply for Thrust/Deemed Trust/Pioneer/Large up to 5 MW)</td>
                                <td>30 days</td>
                                <td>Joint Director of Industries/ Addl. Director of Industries</td>
                                <td>Director of Industries</td>
                                <td>Secretary, MSME Department</td>
                            </tr>
                            <tr>
                                <td>12</td>
                                <td>Recommendation for Electricity Duty (ED) Exemption on Captive Power Plant (CPP) (for Thrust/Deemed Trust/Pioneer/Large)</td>
                                <td>30 days</td>
                                <td>General Manager, Regional Industries Centre (RIC) /District Industries Centre (DIC</td>
                                <td>Director of Industries</td>
                                <td>Secretary, MSME Department</td>
                            </tr>
                            <tr>
                                <td>13</td>
                                <td>Recommendation for ED Exemption on CPP (for Thrust/Deemed Trust/Pioneer/Large)</td>
                                <td>30 days</td>
                                <td>Joint Director of Industries/ Additional Director of Industries</td>
                                <td>Director of Industries</td>
                                <td>Secretary, MSME Department</td>
                            </tr>
                            <tr>
                                <td>14</td>
                                <td>Recommendation for Entry Tax Exemption on Plant &amp; M/c &amp; Raw materials(Micro &amp; Small Enterprises)</td>
                                <td>15 days</td>
                                <td>General Manager, Regional Industries Centre (RIC) /District Industries Centre (DIC</td>
                                <td>Director of Industries</td>
                                <td>Secretary, MSME Department</td>
                            </tr>
                            <tr>
                                <td>15</td>
                                <td>Issue of VAT Exemption Certificate on Khadi, Village, Cottage &amp; Handicraft</td>
                                <td>30 days</td>
                                <td>General Manager, Regional Industries Centre (RIC) /District Industries Centre (DIC</td>
                                <td>Director of Industries</td>
                                <td>Secretary, MSME Department</td>
                            </tr>
                            <tr>
                                <td>16</td>
                                <td>Sanction towards reimbursement VAT(MSME)</td>
                                <td>30 days</td>
                                <td>General Manager, RIC/DIC</td>
                                <td>Director of Industries</td>
                                <td>Secretary, MSME Department</td>
                            </tr>
                            <tr>
                                <td>17</td>
                                <td>Sanction of Interest Subsidy Micro &amp; Small Enterprise/PMEGP</td>
                                <td>15 days</td>
                                <td>General Manager, Regional Industries Centre (RIC) /District Industries Centre (DIC</td>
                                <td>Director of Industries</td>
                                <td>Secretary, MSME Department</td>
                            </tr>
                            <tr>
                                <td>18</td>
                                <td>Sanction of Interest Subsidy Thrust Sector</td>
                                <td>15 days</td>
                                <td>Joint Director of Industries/ Additional Director of Industries</td>
                                <td>Director of Industries</td>
                                <td>Secretary, MSME  Department</td>
                            </tr>
                            <tr>
                                <td>19</td>
                                <td>Issue of EPM Registration Certificate.</td>
                                <td>48 working hrs.</td>
                                <td>Joint Director, EPM</td>
                                <td>Director, EPM</td>
                                <td>Secretary, MSME Department</td>
                            </tr>
                            <tr>
                                <td>20</td>
                                <td>Issue of Rate Contract Certificate</td>
                                <td>60 days</td>
                                <td>Joint Director, EPM</td>
                                <td>Director, EPM</td>
                                <td>Secretary, MSME Department</td>
                            </tr>
                            <tr>
                                <td>21</td>
                                <td>Issue of Test Report</td>
                                <td>15 days</td>
                                <td>Joint Director (Inspection)</td>
                                <td>Director, EPM</td>
                                <td>Secretary, MSME Department</td>
                            </tr>
                            <tr>
                                <td>22</td>
                                <td>Export related Assistance</td>
                                <td>30 days</td>
                                <td>Deputy Director (Marketing)</td>
                                <td>Director, EPM</td>
                                <td>Secretary, MSME Department</td>
                            </tr>
                            <tr>
                                <td>23</td>
                                <td>Recommendation for Issue of Khadi Industries Certificate</td>
                                <td>30 days</td>
                                <td>Deputy Secretary, OK&amp;VIB</td>
                                <td>Secretary, OK&amp;VIB</td>
                                <td>Secretary, MSME Department</td>
                            </tr>
                            <tr>
                                <td>24</td>
                                <td>Release of Rebate claims</td>
                                <td>90 days</td>
                                <td>Senior Assistant Directorate of Industries  Posted at OK &amp; VI Board</td>
                                <td>Additional Director�cum - Ex. officio, Secretary, OK&amp;VIB</td>
                                <td>Director of Industries.</td>
                            </tr>
                            <tr>
                                <td>25</td>
                                <td>Supply of raw materials to the units </td>
                                <td>60 days</td>
                                <td>DGM(C), OSIC</td>
                                <td>MD, OSIC</td>
                                <td>Secretary, MSME Department</td>
                            </tr>
                            <tr>
                                <td>26</td>
                                <td>Supply of materials to the various firms through consortium marketing</td>
                                <td>60 days</td>
                                <td>DGM(Marketing), OSIC</td>
                                <td>MD, OSIC</td>
                                <td>Secretary, MSME Department</td>
                            </tr>
                            <tr>
                                <td>27</td>
                                <td>Sanction of loan</td>
                                <td>90 days</td>
                                <td>Heads of Department (HoD) Credit DepartmentCD)</td>
                                <td>MD, OSFC/DGM, OSFC</td>
                                <td>Chairman, OSFC</td>
                            </tr>
                            <tr>
                                <td>28</td>
                                <td>Issue of No Dues Certificate</td>
                                <td>15 days</td>
                                <td>Branch Manager</td>
                                <td>MD, OSFC/ HoD,Financial Account Department(FAD)</td>
                                <td>Chairman, OSFC</td>
                            </tr>
                            <tr>
                                <td>29</td>
                                <td>One time settlement</td>
                                <td>90 days</td>
                                <td>Branch Manager</td>
                                <td>MD, OSFC/HoD, Recovery Division (RD)</td>
                                <td>Chairman, OSFC</td>
                            </tr>
                        </tbody>

                    </table>
                </div>
                <div class="mbtm20"></div>
            </div>
        </div>
    </div>
</asp:Content>
