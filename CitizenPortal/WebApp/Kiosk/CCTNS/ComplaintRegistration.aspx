<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="ComplaintRegistration.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.CCTNS.ComplaintRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="../../../g2c/js/bootstrap.min.js"></script>
    <script src="ComplaintRegistration.js"></script>
    <link href="/PortalStyles/jquery-ui.min.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {
            $('#txtDOB').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                yearRange: "-150:+0",
                maxDate: '0',
                onSelect: function (date) {
                    var t_DOB = $("#txtDOB").val();
                    t_DOB = t_DOB.replace(/-/g, "/");
                    $('#txtDOB').val(t_DOB);
                    //$('#txtDOB').prop("disabled", true);

                    var t_DOB = $("#txtDOB").val();
                    t_DOB = t_DOB.replace("-", "/");
                    var S_date = new Date(t_DOB.substr(6, 4), t_DOB.substr(3, 2) - 1, t_DOB.substr(0, 2));
                    var selectedYear = S_date.getFullYear();
                    $("#txtDOBYear").val(selectedYear);
                    var Age = AgeCalculate(t_DOB);
                    $('#txtAge').val(Age);
                    CalAgeRange(Age);
                }
            });

            $('#txtIncidentFromDate').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                yearRange: "-150:+0",
                maxDate: '0',
                onSelect: function (date) {
                    var date2 = $('#txtIncidentFromDate').datepicker('getDate');
                    date2.setDate(date2.getDate() + 1);
                    $('#txtIncidentToDate').datepicker('setDate', date2);
                    //sets minDate to dt1 date + 1
                    $('#txtIncidentToDate').datepicker('option', 'minDate', date2);
                }
            });

            $('#txtIncidentToDate').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                //yearRange: "150:+0",
                maxDate: '0',
                //minDate: $("#txtIncidentToDate").val()
                onClose: function () {
                    var dt1 = $('#txtIncidentFromDate').datepicker('getDate');
                    var dt2 = $('#txtIncidentToDate').datepicker('getDate');
                    //check to prevent a user from entering a date below date of dt1
                    if (dt2 <= dt1) {
                        var minDate = $('#txtIncidentToDate').datepicker('option', 'minDate');
                        $('#txtIncidentToDate').datepicker('setDate', minDate);
                    }
                }
            });


            $('#txtPassportIssueDate').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                maxDate: '0',
                yearRange: "-150:+0",
            });


            $('#txtComplaintDate').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                maxDate: '0',
                yearRange: "-150:+0",
            });

        });

    </script>
    <style>
        .ui-widget-header {
            color: #333 !important;
            font-weight: normal !important;
        }

        .activetab {
            font-size: 15px !important;
            background-color: #0A4B81 !important;
            color: #fff !important;
            padding: 14px !important;
        }

        .non_activetab {
            font-size: 15px !important;
            background-color: #0A4B81 !important;
            color: #fff !important;
            padding: 14px !important;
        }


        .mytable > tbody > tr > td {
            padding: 5px !important;
            border: 1px solid #ddd;
        }

        .mytable > tbody > tr > th {
            padding: 5px !important;
            background-color: #f4f4f4;
            border: 1px solid #ddd;
        }

        .mtop22 {
            margin-top: 22px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title">Applying Complaint For?</h3>
                </div>
                <div class="modal-body">
                    <select class="form-control" id="ddlApplicantType">
                        <option value="0">Please Select...</option>
                        <option value="1">Self</option>
                        <option value="2">Other</option>
                    </select>
                    <br />
                    <input id="errorMsg" type="text" hidden="hidden" value="" style="color: red; width: 100%; border: none" />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="submitApplicantType(this);">Submit</button>
                </div>
            </div>
        </div>
    </div>

    <div id="page-wrapper" style="min-height: 335px;">
        <div class="row">
            <div class="col-lg-12">
                <h2 class="form-heading"><i class="fa fa-pencil-square-o fa-fw"></i>Register New Complaint </h2>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <ul class="nav nav-tabs">
                    <li class="active"><a data-toggle="tab" href="#complaint" class="activetab">Complaint Detail</a></li>
                    <li><a data-toggle="tab" href="#accused" class="non_activetab">Accused Detail</a></li>
                    <li><a data-toggle="tab" href="#incident" class="non_activetab">Incident Detail</a></li>
                    <li><a data-toggle="tab" href="#complaintsubmission" class="non_activetab">Complaint Submission Details</a></li>
                    <li><a data-toggle="tab" href="#complaintdetail" class="non_activetab">Complaint Detail</a></li>
                </ul>

                <div class="tab-content">
                    <div id="complaint" class="tab-pane fade in active" style="border-right: 1px solid #ddd; border-bottom: 1px solid #ddd; border-left: 1px solid #ddd; padding: 10px;">

                        <div class="row">
                            <div class="col-md-12 box-container mTop15">
                                <div class="box-heading">
                                    <h4 class="box-title">Identify YourSelf..</h4>
                                </div>
                                <div class="box-body box-body-open">

                                    <%-- <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory">Submitter Name</label>
                                            <input type="text" id="txtApplicantName" placeholder="Applicant Name" class="form-control" runat="server" />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory">Relation with Applicant</label>
                                            <select class="form-control" id="txtRelationType">
                                                <option value="0">Select Relation Type</option>
                                                <option value="Father">Father</option>
                                                <option value="Mother">Mother</option>
                                                <option value="Guardian">Guardian</option>
                                                <option value="Husband">Husband</option>
                                                <option value="Wife">Wife</option>
                                            </select>
                                        </div>
                                    </div>--%>
                                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory">Country of Nationality</label>
                                            <select name="" id="ddlNationality" class="form-control" data-val="true">
                                                <option selected="selected" value="0">-Select-</option>
                                                <option value="1">ABU DHABI/DUBAI</option>
                                                <option value="2">AFGHANISTAN</option>
                                                <option value="3">AFRICA</option>
                                                <option value="4">ALBANIA</option>
                                                <option value="5">ALGERIA</option>
                                                <option value="6">ANDORRA</option>
                                                <option value="7">ANGOLA</option>
                                                <option value="217">ANTIGUA BARBUDA</option>
                                                <option value="8">ARGENTINA</option>
                                                <option value="9">ARMENIA</option>
                                                <option value="10">AUSTRALIA</option>
                                                <option value="11">AUSTRIA</option>
                                                <option value="12">AZERBAIJAN</option>
                                                <option value="13">BAHAMAS</option>
                                                <option value="14">BAHRAIN</option>
                                                <option value="15">BANGLADESH</option>
                                                <option value="16">BARBADOS</option>
                                                <option value="205">BELARUS</option>
                                                <option value="19">BELGIUM</option>
                                                <option value="206">BELIZE</option>
                                                <option value="17">BELORUSSIA</option>
                                                <option value="18">BENIN</option>
                                                <option value="207">BENIN</option>
                                                <option value="20">BERMUDA</option>
                                                <option value="21">BHUTAN</option>
                                                <option value="22">BOLIVIA</option>
                                                <option value="23">BOSNIA - HERZEGOVINA</option>
                                                <option value="24">BOTSWANA</option>
                                                <option value="25">BRAZIL</option>
                                                <option value="208">BRITAIN</option>
                                                <option value="26">BRITISH HONDURAS</option>
                                                <option value="27">BRUNEI</option>
                                                <option value="28">BULGARIA</option>
                                                <option value="29">BURKINA</option>
                                                <option value="30">BURUNDI</option>
                                                <option value="31">CAMBODIA</option>
                                                <option value="32">CAMEROON</option>
                                                <option value="33">CANADA</option>
                                                <option value="34">CAPE VERDE</option>
                                                <option value="35">CENTRAL AFRICAN REPUBLIC</option>
                                                <option value="36">CHAD</option>
                                                <option value="37">CHILE</option>
                                                <option value="38">CHINA</option>
                                                <option value="39">COLOMBIA</option>
                                                <option value="40">COMOROS</option>
                                                <option value="41">CONGO</option>
                                                <option value="42">COSTARICA</option>
                                                <option value="43">CROATIA</option>
                                                <option value="44">CUBA</option>
                                                <option value="45">CYPRUS</option>
                                                <option value="46">CZECH REPUBLIC</option>
                                                <option value="47">DENMARK</option>
                                                <option value="48">DJIBOUTI</option>
                                                <option value="49">DOMINICA</option>
                                                <option value="50">DOMINICAN REPUBLIC</option>
                                                <option value="218">EAST TIMOR</option>
                                                <option value="51">ECUADOR</option>
                                                <option value="52">EGYPT</option>
                                                <option value="53">ELSALVADOR</option>
                                                <option value="209">ENGLAND</option>
                                                <option value="54">EQUATORIAL GUINEA</option>
                                                <option value="55">ERITREA</option>
                                                <option value="56">ESTONIA</option>
                                                <option value="57">ETHIOPIA</option>
                                                <option value="58">FALKLAND ISLANDS</option>
                                                <option value="59">FEDERATION OF NIGERIA</option>
                                                <option value="60">FIJI</option>
                                                <option value="61">FINLAND</option>
                                                <option value="62">FRANCE</option>
                                                <option value="63">FRENCH POLYNESIA</option>
                                                <option value="64">GABON</option>
                                                <option value="65">GAMBIA</option>
                                                <option value="66">GEORGIA</option>
                                                <option value="67">GERMANY</option>
                                                <option value="68">GHANA</option>
                                                <option value="69">GREECE</option>
                                                <option value="219">GREENLAND</option>
                                                <option value="70">GRENADA</option>
                                                <option value="71">GUATEMALA</option>
                                                <option value="72">GUINEA</option>
                                                <option value="73">GUINEA BISSAU</option>
                                                <option value="74">GUYANA</option>
                                                <option value="75">HAITI</option>
                                                <option value="76">HONDURAS</option>
                                                <option value="77">HONGKONG</option>
                                                <option value="78">HUNGARY</option>
                                                <option value="79">ICELAND</option>
                                                <option value="80">INDIA</option>
                                                <option value="81">INDONESIA</option>
                                                <option value="82">IRAN</option>
                                                <option value="83">IRAQ</option>
                                                <option value="84">IRELAND (EIRE)</option>
                                                <option value="85">ISRAEL</option>
                                                <option value="86">ITALY</option>
                                                <option value="87">IVORY COAST</option>
                                                <option value="88">JAMAICA</option>
                                                <option value="89">JAPAN</option>
                                                <option value="90">JORDAN</option>
                                                <option value="91">KAZAKHISTAN</option>
                                                <option value="92">KENYA</option>
                                                <option value="93">KIRGIZIA</option>
                                                <option value="94">KIRIBATI</option>
                                                <option value="97">KUWAIT</option>
                                                <option value="98">LAOS</option>
                                                <option value="99">LATVIA</option>
                                                <option value="100">LEBANON</option>
                                                <option value="101">LESOTHO</option>
                                                <option value="102">LIBERIA</option>
                                                <option value="103">LIBYA</option>
                                                <option value="104">LIECHTENSTEIN</option>
                                                <option value="105">LITHUNIA</option>
                                                <option value="106">LUXEMBOURG</option>
                                                <option value="210">MACEDONIA</option>
                                                <option value="107">MADAGASCAR</option>
                                                <option value="108">MALAWI</option>
                                                <option value="109">MALAYA</option>
                                                <option value="110">MALAYSIA</option>
                                                <option value="111">MALDIVES</option>
                                                <option value="112">MALI</option>
                                                <option value="113">MALTA</option>
                                                <option value="114">MAURITANIA</option>
                                                <option value="115">MAURITIUS</option>
                                                <option value="116">MEXICO</option>
                                                <option value="117">MOLDAVIA</option>
                                                <option value="211">MOLDOVA</option>
                                                <option value="118">MONACO</option>
                                                <option value="119">MONGOLIA</option>
                                                <option value="212">MONTENEGRO</option>
                                                <option value="120">MOROCCO</option>
                                                <option value="121">MOZAMBIQUE</option>
                                                <option value="122">MUSCAT</option>
                                                <option value="123">MYANMAR</option>
                                                <option value="124">NAMIBIA</option>
                                                <option value="125">NEPAL</option>
                                                <option value="126">NETHERLANDS</option>
                                                <option value="127">NETHERLANDS ANTILLES</option>
                                                <option value="128">NEW ZEALAND</option>
                                                <option value="129">NICARAGUA</option>
                                                <option value="130">NIGER</option>
                                                <option value="131">NIGERIA</option>
                                                <option value="95">NORTH KOREA</option>
                                                <option value="132">NORWAY</option>
                                                <option value="133">OMAN</option>
                                                <option value="134">PAKISTAN</option>
                                                <option value="220">PALESTINE</option>
                                                <option value="135">PANAMA</option>
                                                <option value="136">PAPUA NEW GUINEA</option>
                                                <option value="137">PARAGUAY</option>
                                                <option value="138">PERU</option>
                                                <option value="139">PHILIPPINES</option>
                                                <option value="140">POLAND</option>
                                                <option value="141">PORTUGAL</option>
                                                <option value="142">PUERTO RICO</option>
                                                <option value="143">QATAR</option>
                                                <option value="144">ROMANIA</option>
                                                <option value="145">RUSSIAN FEDERATION</option>
                                                <option value="146">RWANDA</option>
                                                <option value="147">SAN MARINO</option>
                                                <option value="148">SAO TOME AND PRINCIPE</option>
                                                <option value="149">SAUDI ARABIA</option>
                                                <option value="213">SCOTLAND</option>
                                                <option value="150">SENEGAL</option>
                                                <option value="214">SERBIA</option>
                                                <option value="151">SEYCHELLES</option>
                                                <option value="152">SIERRA LEONE</option>
                                                <option value="153">SINGAPORE</option>
                                                <option value="154">SLOVAKIA</option>
                                                <option value="155">SLOVENIA</option>
                                                <option value="156">SOLOMAN ISLANDS</option>
                                                <option value="157">SOMALIA</option>
                                                <option value="158">SOUTH AFRICA</option>
                                                <option value="96">SOUTH KOREA</option>
                                                <option value="159">SPAIN</option>
                                                <option value="160">SRI LANKA</option>
                                                <option value="161">ST KITTS - NEVIS</option>
                                                <option value="162">ST LUCIA</option>
                                                <option value="163">ST VINCENT</option>
                                                <option value="164">SUDAN</option>
                                                <option value="165">SURINAM</option>
                                                <option value="166">SWAZILAND</option>
                                                <option value="167">SWEDEN</option>
                                                <option value="168">SWITZERLAND</option>
                                                <option value="169">SYRIA</option>
                                                <option value="170">TAIWAN</option>
                                                <option value="171">TAJIKISTAN</option>
                                                <option value="172">TANZANIA</option>
                                                <option value="173">TASMANIA</option>
                                                <option value="174">THAILAND</option>
                                                <option value="175">TIBET</option>
                                                <option value="176">TOGO</option>
                                                <option value="177">TONGA</option>
                                                <option value="178">TRINIDAD &amp; TOBAGO</option>
                                                <option value="179">TUNISIA</option>
                                                <option value="180">TURKEMANISTAN</option>
                                                <option value="181">TURKEY</option>
                                                <option value="182">TUVALLI</option>
                                                <option value="183">UGANDA</option>
                                                <option value="184">UKRAINE</option>
                                                <option value="185">UNITED ARAB EMIRATES (UAE)</option>
                                                <option value="186">UNITED KINGDOM (UK)</option>
                                                <option value="187">UNITED STATES OF AMERICA (USA)</option>
                                                <option value="216">UNKNOWN</option>
                                                <option value="188">UPPER VALTA</option>
                                                <option value="189">URUGUAY</option>
                                                <option value="190">UZBEKISTAN</option>
                                                <option value="191">VANUATU</option>
                                                <option value="192">VATICAN</option>
                                                <option value="193">VENEZUELA</option>
                                                <option value="194">VIETNAM</option>
                                                <option value="215">WALES</option>
                                                <option value="195">WALLIS &amp; FUTUNA ISLANDS</option>
                                                <option value="196">WEST INDIES</option>
                                                <option value="197">WESTERN AUSTRALIA</option>
                                                <option value="198">WESTERN SAMOA</option>
                                                <option value="199">YEMAN</option>
                                                <option value="200">YUGOSLAVIA</option>
                                                <option value="201">YUKON</option>
                                                <option value="202">ZAIRE</option>
                                                <option value="203">ZAMBIA</option>
                                                <option value="204">ZIMBABWE</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                                        <div class="form-group">
                                            <label>Applicant Identification Type</label>
                                            <select class="form-control" id="ddlIdentificationType">
                                                <option value="0">Select Identification Type</option>
                                                <option value="8">AADHAR CARD(UIDAI)</option>
                                                <option value="4">Arms License</option>
                                                <option value="2">Driving License</option>
                                                <option value="6">Income Tax (PAN) Card</option>
                                                <option value="1">Passport</option>
                                                <option value="3">Ration Card</option>
                                                <option value="5">Voter ID Card</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                                        <div class="form-group">
                                            <label>Applicant Identification No.</label>
                                            <input type="text" id="txtIdentificationNumber" placeholder="Enter your Identification Number" class="form-control" maxlength="12" />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3" id="divPassPlace">
                                        <div class="form-group">
                                            <label>Passport Issue Place</label>
                                            <input type="text" id="txtPassportIssuePlace" placeholder="Passport Issue Place" class="form-control" maxlength="12" />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3" id="divPassDate">
                                        <div class="form-group">
                                            <label>Passport Issue Date</label>
                                            <input type="text" id="txtPassportIssueDate" placeholder="Passport Issue Date" class="form-control" maxlength="12" />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3 mtop22">
                                        <div class="form-group">
                                            <input type="button" id="btnverify" class="btn btn-primary" value="Verify Identification No." />
                                        </div>
                                    </div>
                                    <div class="clearfix">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12 box-container ptop15">
                                <div class="box-heading">
                                    <h4 class="box-title">Applicent Personal Information</h4>
                                </div>
                                <div class="box-body box-body-open">
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                        <div class="form-group">
                                            <label for="UID">UID</label>
                                            <input type="text" id="txtAppUID" class="form-control" maxlength="12" placeholder="UID Number" onkeypress="return onlyNumbers(event);"/>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-10">
                                        <div class="form-group">
                                            <label class="manadatory" for="firstname">Name of the Applicent</label>
                                            <div class="col-xs-4 pleft0">
                                                <input type="text" id="txtFirstName" class="form-control" placeholder="First Name" name="FirstName" maxlength="40" />
                                            </div>
                                            <div class="col-xs-4 pleft0">
                                                <input type="text" id="txtMiddleName" class="form-control" placeholder="Middle Name" name="MiddleName" maxlength="40" />
                                            </div>
                                            <div class="col-xs-4 pleft0 pright0">
                                                <input type="text" id="txtLastName" class="form-control" placeholder="Last Name" name="LastName" maxlength="40" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory">Gender</label>
                                            <select id="ddlGender" class="form-control">
                                                <option value="0">Select</option>
                                                <option value="M">Male</option>
                                                <option value="F">Female</option>
                                                <option value="T">Transgender</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                        <div class="form-group">
                                            <label for="txtDOB">Date of Birth <span style="font-size: 11px;"></span></label>
                                            <input id="txtDOB" class="form-control" placeholder="DOB" name="DOB" maxlength="10" />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                        <div class="form-group">
                                            <label for="txtDOBYear">Birth Year<span style="font-size: 11px;"></span></label>

                                            <input id="txtDOBYear" class="form-control" placeholder="Birth Year" name="DOB" maxlength="4" onkeypress="return onlyNumbers(event);"/>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                        <div class="form-group">
                                            <label for="Age">
                                                Age</label>

                                            <input id="txtAge" class="form-control mtop0" placeholder="Age" name="Year" value="" maxlength="3" autofocus="" disabled="disabled" />

                                        </div>
                                    </div>
                                    <%--<div class="col-xs-12 col-sm-6 col-md-6 col-lg-2 ">
                                        <div class="form-group">
                                            <label for="Age">Age</label>
                                            <div class="col-xs-6 pleft0 pright0">
                                                <input id="txtYear" class="form-control mtop0" placeholder="Year" name="Year" maxlength="3" />
                                            </div>
                                            <div class="col-xs-6 pleft0 pright0">
                                                <input id="txtMonth" class="form-control mtop0" placeholder="Month" name="Month" maxlength="2" />
                                            </div>
                                        </div>
                                    </div>--%>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                        <div class="form-group">
                                            <label for="Age">Age Range (From-To)</label>
                                            <div class="col-xs-6 pleft0 pright0">
                                                <input id="txtAgeFrom" class="form-control mtop0" placeholder="From" name="Age From" maxlength="3" disabled="disabled" />
                                            </div>
                                            <div class="col-xs-6 pleft0 pright0">
                                                <input id="txtAgeTo" class="form-control mtop0" placeholder="To" name="Age To" maxlength="3" disabled="disabled"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>

                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <label for="txtEmailID">Email ID</label>
                                            <input type="email" id="txtEmailID" class="form-control" placeholder="Email Id" name="Email Id" maxlength="30" onchange="ValiateEmail();" />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                        <div class="form-group">
                                            <label for="MobileNo">Mobile Number</label>
                                            <div class="col-xs-3 pleft0 pright0">
                                                <input type="text" placeholder="+91" class="form-control"/>
                                            </div>
                                            <div class="col-xs-9 pleft0">
                                                <input id="txtMobileNo" class="form-control" maxlength="10" name="MobileNo" placeholder="Mobile Number" onkeypress="return onlyNumbers(event);" type="text" autocomplete="off" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3 pright0">
                                        <div class="form-group">
                                            <label for="LandlineNo">Landline No.</label>
                                            <div class="col-xs-4 pleft0 pright0">
                                                <input type="text" id="txtStdCode" placeholder="Std Code" maxlength="5" onkeypress="return onlyNumbers(event);" class="form-control" />
                                            </div>
                                            <div class="col-xs-8 pleft0">
                                                <input type="text" id="txtPhone" class="form-control" onkeypress="return onlyNumbers(event);" maxlength="10" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                        <div class="form-group">
                                            <label for="ddlRelativeType">
                                                Relative Type</label>
                                            <select class="form-control" id="ddlRelativeType" name="Gender">
                                                <option value="0">-Select-</option>
                                                <option value="Father">Father</option>
                                                <option value="Mother">Mother</option>
                                                <option value="Guardian">Guardian</option>
                                                <option value="Husband">Husband</option>
                                                <option value="Wife">Wife</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                        <div class="form-group">
                                            <label for="txtRelativeName">Relative Name</label>
                                            <input id="txtRelativeName" class="form-control" placeholder="Relative Name" name="Father Name" type="text" maxlength="40" />
                                        </div>
                                    </div>



                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlGender">
                                                Nature of Complaint</label>
                                            <select class="form-control" id="ddlComplaintNature" name="">
                                                <option value="0">-Select-</option>
                                                <option value="1">Against Public</option>
                                                <option value="2">Against Organization</option>
                                                <option value="3">Against Police Officer</option>
                                                <option value="4">Against Public Servant (Civil)</option>
                                                <option value="5">Wild Life Case</option>
                                                <option value="6">Against Army and Paramilitary force</option>
                                                <option value="7">Against Foreigner&#39;s</option>
                                                <option value="8">Against Department</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 box-container mTop15">
                                <div class="box-heading">
                                    <h4 class="box-title">Permanent Address</h4>
                                </div>
                                <div class="box-body box-body-open">
                                    <div class="box-body box-body-open">
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label for="AddressLine1">Care of</label>
                                                <input type="text" id="txtAddressLine1" class="form-control" placeholder="First Line Address" maxlength="40" onchange="return checkLength(this);" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label for="AddressLine2">House No.</label>
                                                <input name="" type="text" id="txtAddressLine2" class="form-control" placeholder="Second Line Address" maxlength="40" onchange="return checkLength(this);" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label for="RoadStreetName">Street Name</label>
                                                <input name="" type="text" id="txtRoadStreetName" class="form-control" placeholder="Road / Street Name" maxlength="40" onchange="return checkLength(this);" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label>Colony/Locality/Area</label>
                                                <input name="" type="text" id="txtLocality" class="form-control" placeholder="Locality" maxlength="40" onchange="return checkLength(this);" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory">Country</label>
                                                <select name="" id="ddlCountry" class="form-control" data-val="true" data-val-number="State." data-val-required="Please select state">
                                                    <option selected="selected" value="0">-Select-</option>
                                                    <option value="1">ABU DHABI/DUBAI</option>
                                                    <option value="2">AFGHANISTAN</option>
                                                    <option value="3">AFRICA</option>
                                                    <option value="4">ALBANIA</option>
                                                    <option value="5">ALGERIA</option>
                                                    <option value="6">ANDORRA</option>
                                                    <option value="7">ANGOLA</option>
                                                    <option value="217">ANTIGUA BARBUDA</option>
                                                    <option value="8">ARGENTINA</option>
                                                    <option value="9">ARMENIA</option>
                                                    <option value="10">AUSTRALIA</option>
                                                    <option value="11">AUSTRIA</option>
                                                    <option value="12">AZERBAIJAN</option>
                                                    <option value="13">BAHAMAS</option>
                                                    <option value="14">BAHRAIN</option>
                                                    <option value="15">BANGLADESH</option>
                                                    <option value="16">BARBADOS</option>
                                                    <option value="205">BELARUS</option>
                                                    <option value="19">BELGIUM</option>
                                                    <option value="206">BELIZE</option>
                                                    <option value="17">BELORUSSIA</option>
                                                    <option value="18">BENIN</option>
                                                    <option value="207">BENIN</option>
                                                    <option value="20">BERMUDA</option>
                                                    <option value="21">BHUTAN</option>
                                                    <option value="22">BOLIVIA</option>
                                                    <option value="23">BOSNIA - HERZEGOVINA</option>
                                                    <option value="24">BOTSWANA</option>
                                                    <option value="25">BRAZIL</option>
                                                    <option value="208">BRITAIN</option>
                                                    <option value="26">BRITISH HONDURAS</option>
                                                    <option value="27">BRUNEI</option>
                                                    <option value="28">BULGARIA</option>
                                                    <option value="29">BURKINA</option>
                                                    <option value="30">BURUNDI</option>
                                                    <option value="31">CAMBODIA</option>
                                                    <option value="32">CAMEROON</option>
                                                    <option value="33">CANADA</option>
                                                    <option value="34">CAPE VERDE</option>
                                                    <option value="35">CENTRAL AFRICAN REPUBLIC</option>
                                                    <option value="36">CHAD</option>
                                                    <option value="37">CHILE</option>
                                                    <option value="38">CHINA</option>
                                                    <option value="39">COLOMBIA</option>
                                                    <option value="40">COMOROS</option>
                                                    <option value="41">CONGO</option>
                                                    <option value="42">COSTARICA</option>
                                                    <option value="43">CROATIA</option>
                                                    <option value="44">CUBA</option>
                                                    <option value="45">CYPRUS</option>
                                                    <option value="46">CZECH REPUBLIC</option>
                                                    <option value="47">DENMARK</option>
                                                    <option value="48">DJIBOUTI</option>
                                                    <option value="49">DOMINICA</option>
                                                    <option value="50">DOMINICAN REPUBLIC</option>
                                                    <option value="218">EAST TIMOR</option>
                                                    <option value="51">ECUADOR</option>
                                                    <option value="52">EGYPT</option>
                                                    <option value="53">ELSALVADOR</option>
                                                    <option value="209">ENGLAND</option>
                                                    <option value="54">EQUATORIAL GUINEA</option>
                                                    <option value="55">ERITREA</option>
                                                    <option value="56">ESTONIA</option>
                                                    <option value="57">ETHIOPIA</option>
                                                    <option value="58">FALKLAND ISLANDS</option>
                                                    <option value="59">FEDERATION OF NIGERIA</option>
                                                    <option value="60">FIJI</option>
                                                    <option value="61">FINLAND</option>
                                                    <option value="62">FRANCE</option>
                                                    <option value="63">FRENCH POLYNESIA</option>
                                                    <option value="64">GABON</option>
                                                    <option value="65">GAMBIA</option>
                                                    <option value="66">GEORGIA</option>
                                                    <option value="67">GERMANY</option>
                                                    <option value="68">GHANA</option>
                                                    <option value="69">GREECE</option>
                                                    <option value="219">GREENLAND</option>
                                                    <option value="70">GRENADA</option>
                                                    <option value="71">GUATEMALA</option>
                                                    <option value="72">GUINEA</option>
                                                    <option value="73">GUINEA BISSAU</option>
                                                    <option value="74">GUYANA</option>
                                                    <option value="75">HAITI</option>
                                                    <option value="76">HONDURAS</option>
                                                    <option value="77">HONGKONG</option>
                                                    <option value="78">HUNGARY</option>
                                                    <option value="79">ICELAND</option>
                                                    <option value="80">INDIA</option>
                                                    <option value="81">INDONESIA</option>
                                                    <option value="82">IRAN</option>
                                                    <option value="83">IRAQ</option>
                                                    <option value="84">IRELAND (EIRE)</option>
                                                    <option value="85">ISRAEL</option>
                                                    <option value="86">ITALY</option>
                                                    <option value="87">IVORY COAST</option>
                                                    <option value="88">JAMAICA</option>
                                                    <option value="89">JAPAN</option>
                                                    <option value="90">JORDAN</option>
                                                    <option value="91">KAZAKHISTAN</option>
                                                    <option value="92">KENYA</option>
                                                    <option value="93">KIRGIZIA</option>
                                                    <option value="94">KIRIBATI</option>
                                                    <option value="97">KUWAIT</option>
                                                    <option value="98">LAOS</option>
                                                    <option value="99">LATVIA</option>
                                                    <option value="100">LEBANON</option>
                                                    <option value="101">LESOTHO</option>
                                                    <option value="102">LIBERIA</option>
                                                    <option value="103">LIBYA</option>
                                                    <option value="104">LIECHTENSTEIN</option>
                                                    <option value="105">LITHUNIA</option>
                                                    <option value="106">LUXEMBOURG</option>
                                                    <option value="210">MACEDONIA</option>
                                                    <option value="107">MADAGASCAR</option>
                                                    <option value="108">MALAWI</option>
                                                    <option value="109">MALAYA</option>
                                                    <option value="110">MALAYSIA</option>
                                                    <option value="111">MALDIVES</option>
                                                    <option value="112">MALI</option>
                                                    <option value="113">MALTA</option>
                                                    <option value="114">MAURITANIA</option>
                                                    <option value="115">MAURITIUS</option>
                                                    <option value="116">MEXICO</option>
                                                    <option value="117">MOLDAVIA</option>
                                                    <option value="211">MOLDOVA</option>
                                                    <option value="118">MONACO</option>
                                                    <option value="119">MONGOLIA</option>
                                                    <option value="212">MONTENEGRO</option>
                                                    <option value="120">MOROCCO</option>
                                                    <option value="121">MOZAMBIQUE</option>
                                                    <option value="122">MUSCAT</option>
                                                    <option value="123">MYANMAR</option>
                                                    <option value="124">NAMIBIA</option>
                                                    <option value="125">NEPAL</option>
                                                    <option value="126">NETHERLANDS</option>
                                                    <option value="127">NETHERLANDS ANTILLES</option>
                                                    <option value="128">NEW ZEALAND</option>
                                                    <option value="129">NICARAGUA</option>
                                                    <option value="130">NIGER</option>
                                                    <option value="131">NIGERIA</option>
                                                    <option value="95">NORTH KOREA</option>
                                                    <option value="132">NORWAY</option>
                                                    <option value="133">OMAN</option>
                                                    <option value="134">PAKISTAN</option>
                                                    <option value="220">PALESTINE</option>
                                                    <option value="135">PANAMA</option>
                                                    <option value="136">PAPUA NEW GUINEA</option>
                                                    <option value="137">PARAGUAY</option>
                                                    <option value="138">PERU</option>
                                                    <option value="139">PHILIPPINES</option>
                                                    <option value="140">POLAND</option>
                                                    <option value="141">PORTUGAL</option>
                                                    <option value="142">PUERTO RICO</option>
                                                    <option value="143">QATAR</option>
                                                    <option value="144">ROMANIA</option>
                                                    <option value="145">RUSSIAN FEDERATION</option>
                                                    <option value="146">RWANDA</option>
                                                    <option value="147">SAN MARINO</option>
                                                    <option value="148">SAO TOME AND PRINCIPE</option>
                                                    <option value="149">SAUDI ARABIA</option>
                                                    <option value="213">SCOTLAND</option>
                                                    <option value="150">SENEGAL</option>
                                                    <option value="214">SERBIA</option>
                                                    <option value="151">SEYCHELLES</option>
                                                    <option value="152">SIERRA LEONE</option>
                                                    <option value="153">SINGAPORE</option>
                                                    <option value="154">SLOVAKIA</option>
                                                    <option value="155">SLOVENIA</option>
                                                    <option value="156">SOLOMAN ISLANDS</option>
                                                    <option value="157">SOMALIA</option>
                                                    <option value="158">SOUTH AFRICA</option>
                                                    <option value="96">SOUTH KOREA</option>
                                                    <option value="159">SPAIN</option>
                                                    <option value="160">SRI LANKA</option>
                                                    <option value="161">ST KITTS - NEVIS</option>
                                                    <option value="162">ST LUCIA</option>
                                                    <option value="163">ST VINCENT</option>
                                                    <option value="164">SUDAN</option>
                                                    <option value="165">SURINAM</option>
                                                    <option value="166">SWAZILAND</option>
                                                    <option value="167">SWEDEN</option>
                                                    <option value="168">SWITZERLAND</option>
                                                    <option value="169">SYRIA</option>
                                                    <option value="170">TAIWAN</option>
                                                    <option value="171">TAJIKISTAN</option>
                                                    <option value="172">TANZANIA</option>
                                                    <option value="173">TASMANIA</option>
                                                    <option value="174">THAILAND</option>
                                                    <option value="175">TIBET</option>
                                                    <option value="176">TOGO</option>
                                                    <option value="177">TONGA</option>
                                                    <option value="178">TRINIDAD &amp; TOBAGO</option>
                                                    <option value="179">TUNISIA</option>
                                                    <option value="180">TURKEMANISTAN</option>
                                                    <option value="181">TURKEY</option>
                                                    <option value="182">TUVALLI</option>
                                                    <option value="183">UGANDA</option>
                                                    <option value="184">UKRAINE</option>
                                                    <option value="185">UNITED ARAB EMIRATES (UAE)</option>
                                                    <option value="186">UNITED KINGDOM (UK)</option>
                                                    <option value="187">UNITED STATES OF AMERICA (USA)</option>
                                                    <option value="216">UNKNOWN</option>
                                                    <option value="188">UPPER VALTA</option>
                                                    <option value="189">URUGUAY</option>
                                                    <option value="190">UZBEKISTAN</option>
                                                    <option value="191">VANUATU</option>
                                                    <option value="192">VATICAN</option>
                                                    <option value="193">VENEZUELA</option>
                                                    <option value="194">VIETNAM</option>
                                                    <option value="215">WALES</option>
                                                    <option value="195">WALLIS &amp; FUTUNA ISLANDS</option>
                                                    <option value="196">WEST INDIES</option>
                                                    <option value="197">WESTERN AUSTRALIA</option>
                                                    <option value="198">WESTERN SAMOA</option>
                                                    <option value="199">YEMAN</option>
                                                    <option value="200">YUGOSLAVIA</option>
                                                    <option value="201">YUKON</option>
                                                    <option value="202">ZAIRE</option>
                                                    <option value="203">ZAMBIA</option>
                                                    <option value="204">ZIMBABWE</option>
                                                </select>
                                            </div>
                                            <input id="txtCountry" style="display: none" class="form-control" name="txtCountry" type="text" value="" autofocus="autofocus" />

                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlState">State</label>
                                                <select name="" id="ddlState" class="form-control" data-val="true" data-val-number="State." data-val-required="Please select state">
                                                    <option selected="selected" value="0">-Select-</option>
                                                </select>
                                            </div>
                                            <input id="txtState" style="display: none" class="form-control" name="txtState" type="text" value="" autofocus="autofocus" />

                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">District</label>
                                                <select id="ddlDistrict" class="form-control" data-val="true" data-val-number="District." data-val-required="Please select District.">
                                                    <option value="0">-Select-</option>
                                                </select>
                                            </div>
                                            <input id="txtDistrict" style="display: none" class="form-control" name="txtDistrict" type="text" value="" autofocus="autofocus" />

                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlState">Police Station</label>
                                                <select name="" id="ddlPS" class="form-control" data-val="true" data-val-number="State." data-val-required="Please select state">
                                                    <option selected="selected" value="0">-Select-</option>
                                                </select>
                                            </div>
                                            <input id="txtPS" style="display: none" class="form-control" name="txtDistrict" type="text" value="" autofocus="autofocus" />

                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label>Tehsil/Block/Mandal</label>
                                                <input name="" type="text" id="txtTaluka" class="form-control" placeholder="Village/Town/City" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory">Panchayat/Village/City</label>
                                                <input name="" type="text" id="txtVillage" class="form-control" placeholder="Village/Town/City" />
                                            </div>
                                        </div>

                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label for="PIN">Pin Code</label>
                                                <input name="" type="text" id="txtPinCode" class="form-control" placeholder="PIN" maxlength="6" onkeypress="return onlyNumbers(event);" />
                                            </div>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>
                                    <div class="clearfix">
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-6 box-container mTop15">
                                <div class="box-heading">
                                    <h4 class="box-title">Present Address <span style="font-size: 11px; padding-right: 0">(For correspondence)</span>
                                        <span class="col-md-5 pull-right" style="font-style: normal; font-size: 12px; text-align: right; padding-right: 0; padding-left: 0;">
                                            <input id="chkAddress" type="checkbox" style="vertical-align: bottom;" />Same as Permanent Address</span>
                                    </h4>
                                </div>
                                <div class="box-body box-body-open">
                                    <div class="box-body box-body-open">
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label for="AddressLine1">Care of</label>
                                                <input type="text" id="txtCAddressLine1" class="form-control" placeholder="First Line Address" maxlength="40" onchange="return checkLength(this);" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label for="AddressLine2">House No.</label>
                                                <input name="" type="text" id="txtCAddressLine2" class="form-control" placeholder="Second Line Address" maxlength="40" onchange="return checkLength(this);" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label for="RoadStreetName">Street Name</label>
                                                <input name="" type="text" id="txtCRoadStreetName" class="form-control" placeholder="Road / Street Name" maxlength="40" onchange="return checkLength(this);" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label for="Locality">Colony/Locality/Area</label>
                                                <input name="" type="text" id="txtCLocality" class="form-control" placeholder="Locality" maxlength="40" onchange="return checkLength(this);" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory">Country</label>
                                                <select name="" id="ddlCCountry" class="form-control" data-val="true" data-val-number="State." data-val-required="Please select state">
                                                    <option selected="selected" value="0">-Select-</option>
                                                    <option value="1">ABU DHABI/DUBAI</option>
                                                    <option value="2">AFGHANISTAN</option>
                                                    <option value="3">AFRICA</option>
                                                    <option value="4">ALBANIA</option>
                                                    <option value="5">ALGERIA</option>
                                                    <option value="6">ANDORRA</option>
                                                    <option value="7">ANGOLA</option>
                                                    <option value="217">ANTIGUA BARBUDA</option>
                                                    <option value="8">ARGENTINA</option>
                                                    <option value="9">ARMENIA</option>
                                                    <option value="10">AUSTRALIA</option>
                                                    <option value="11">AUSTRIA</option>
                                                    <option value="12">AZERBAIJAN</option>
                                                    <option value="13">BAHAMAS</option>
                                                    <option value="14">BAHRAIN</option>
                                                    <option value="15">BANGLADESH</option>
                                                    <option value="16">BARBADOS</option>
                                                    <option value="205">BELARUS</option>
                                                    <option value="19">BELGIUM</option>
                                                    <option value="206">BELIZE</option>
                                                    <option value="17">BELORUSSIA</option>
                                                    <option value="18">BENIN</option>
                                                    <option value="207">BENIN</option>
                                                    <option value="20">BERMUDA</option>
                                                    <option value="21">BHUTAN</option>
                                                    <option value="22">BOLIVIA</option>
                                                    <option value="23">BOSNIA - HERZEGOVINA</option>
                                                    <option value="24">BOTSWANA</option>
                                                    <option value="25">BRAZIL</option>
                                                    <option value="208">BRITAIN</option>
                                                    <option value="26">BRITISH HONDURAS</option>
                                                    <option value="27">BRUNEI</option>
                                                    <option value="28">BULGARIA</option>
                                                    <option value="29">BURKINA</option>
                                                    <option value="30">BURUNDI</option>
                                                    <option value="31">CAMBODIA</option>
                                                    <option value="32">CAMEROON</option>
                                                    <option value="33">CANADA</option>
                                                    <option value="34">CAPE VERDE</option>
                                                    <option value="35">CENTRAL AFRICAN REPUBLIC</option>
                                                    <option value="36">CHAD</option>
                                                    <option value="37">CHILE</option>
                                                    <option value="38">CHINA</option>
                                                    <option value="39">COLOMBIA</option>
                                                    <option value="40">COMOROS</option>
                                                    <option value="41">CONGO</option>
                                                    <option value="42">COSTARICA</option>
                                                    <option value="43">CROATIA</option>
                                                    <option value="44">CUBA</option>
                                                    <option value="45">CYPRUS</option>
                                                    <option value="46">CZECH REPUBLIC</option>
                                                    <option value="47">DENMARK</option>
                                                    <option value="48">DJIBOUTI</option>
                                                    <option value="49">DOMINICA</option>
                                                    <option value="50">DOMINICAN REPUBLIC</option>
                                                    <option value="218">EAST TIMOR</option>
                                                    <option value="51">ECUADOR</option>
                                                    <option value="52">EGYPT</option>
                                                    <option value="53">ELSALVADOR</option>
                                                    <option value="209">ENGLAND</option>
                                                    <option value="54">EQUATORIAL GUINEA</option>
                                                    <option value="55">ERITREA</option>
                                                    <option value="56">ESTONIA</option>
                                                    <option value="57">ETHIOPIA</option>
                                                    <option value="58">FALKLAND ISLANDS</option>
                                                    <option value="59">FEDERATION OF NIGERIA</option>
                                                    <option value="60">FIJI</option>
                                                    <option value="61">FINLAND</option>
                                                    <option value="62">FRANCE</option>
                                                    <option value="63">FRENCH POLYNESIA</option>
                                                    <option value="64">GABON</option>
                                                    <option value="65">GAMBIA</option>
                                                    <option value="66">GEORGIA</option>
                                                    <option value="67">GERMANY</option>
                                                    <option value="68">GHANA</option>
                                                    <option value="69">GREECE</option>
                                                    <option value="219">GREENLAND</option>
                                                    <option value="70">GRENADA</option>
                                                    <option value="71">GUATEMALA</option>
                                                    <option value="72">GUINEA</option>
                                                    <option value="73">GUINEA BISSAU</option>
                                                    <option value="74">GUYANA</option>
                                                    <option value="75">HAITI</option>
                                                    <option value="76">HONDURAS</option>
                                                    <option value="77">HONGKONG</option>
                                                    <option value="78">HUNGARY</option>
                                                    <option value="79">ICELAND</option>
                                                    <option value="80">INDIA</option>
                                                    <option value="81">INDONESIA</option>
                                                    <option value="82">IRAN</option>
                                                    <option value="83">IRAQ</option>
                                                    <option value="84">IRELAND (EIRE)</option>
                                                    <option value="85">ISRAEL</option>
                                                    <option value="86">ITALY</option>
                                                    <option value="87">IVORY COAST</option>
                                                    <option value="88">JAMAICA</option>
                                                    <option value="89">JAPAN</option>
                                                    <option value="90">JORDAN</option>
                                                    <option value="91">KAZAKHISTAN</option>
                                                    <option value="92">KENYA</option>
                                                    <option value="93">KIRGIZIA</option>
                                                    <option value="94">KIRIBATI</option>
                                                    <option value="97">KUWAIT</option>
                                                    <option value="98">LAOS</option>
                                                    <option value="99">LATVIA</option>
                                                    <option value="100">LEBANON</option>
                                                    <option value="101">LESOTHO</option>
                                                    <option value="102">LIBERIA</option>
                                                    <option value="103">LIBYA</option>
                                                    <option value="104">LIECHTENSTEIN</option>
                                                    <option value="105">LITHUNIA</option>
                                                    <option value="106">LUXEMBOURG</option>
                                                    <option value="210">MACEDONIA</option>
                                                    <option value="107">MADAGASCAR</option>
                                                    <option value="108">MALAWI</option>
                                                    <option value="109">MALAYA</option>
                                                    <option value="110">MALAYSIA</option>
                                                    <option value="111">MALDIVES</option>
                                                    <option value="112">MALI</option>
                                                    <option value="113">MALTA</option>
                                                    <option value="114">MAURITANIA</option>
                                                    <option value="115">MAURITIUS</option>
                                                    <option value="116">MEXICO</option>
                                                    <option value="117">MOLDAVIA</option>
                                                    <option value="211">MOLDOVA</option>
                                                    <option value="118">MONACO</option>
                                                    <option value="119">MONGOLIA</option>
                                                    <option value="212">MONTENEGRO</option>
                                                    <option value="120">MOROCCO</option>
                                                    <option value="121">MOZAMBIQUE</option>
                                                    <option value="122">MUSCAT</option>
                                                    <option value="123">MYANMAR</option>
                                                    <option value="124">NAMIBIA</option>
                                                    <option value="125">NEPAL</option>
                                                    <option value="126">NETHERLANDS</option>
                                                    <option value="127">NETHERLANDS ANTILLES</option>
                                                    <option value="128">NEW ZEALAND</option>
                                                    <option value="129">NICARAGUA</option>
                                                    <option value="130">NIGER</option>
                                                    <option value="131">NIGERIA</option>
                                                    <option value="95">NORTH KOREA</option>
                                                    <option value="132">NORWAY</option>
                                                    <option value="133">OMAN</option>
                                                    <option value="134">PAKISTAN</option>
                                                    <option value="220">PALESTINE</option>
                                                    <option value="135">PANAMA</option>
                                                    <option value="136">PAPUA NEW GUINEA</option>
                                                    <option value="137">PARAGUAY</option>
                                                    <option value="138">PERU</option>
                                                    <option value="139">PHILIPPINES</option>
                                                    <option value="140">POLAND</option>
                                                    <option value="141">PORTUGAL</option>
                                                    <option value="142">PUERTO RICO</option>
                                                    <option value="143">QATAR</option>
                                                    <option value="144">ROMANIA</option>
                                                    <option value="145">RUSSIAN FEDERATION</option>
                                                    <option value="146">RWANDA</option>
                                                    <option value="147">SAN MARINO</option>
                                                    <option value="148">SAO TOME AND PRINCIPE</option>
                                                    <option value="149">SAUDI ARABIA</option>
                                                    <option value="213">SCOTLAND</option>
                                                    <option value="150">SENEGAL</option>
                                                    <option value="214">SERBIA</option>
                                                    <option value="151">SEYCHELLES</option>
                                                    <option value="152">SIERRA LEONE</option>
                                                    <option value="153">SINGAPORE</option>
                                                    <option value="154">SLOVAKIA</option>
                                                    <option value="155">SLOVENIA</option>
                                                    <option value="156">SOLOMAN ISLANDS</option>
                                                    <option value="157">SOMALIA</option>
                                                    <option value="158">SOUTH AFRICA</option>
                                                    <option value="96">SOUTH KOREA</option>
                                                    <option value="159">SPAIN</option>
                                                    <option value="160">SRI LANKA</option>
                                                    <option value="161">ST KITTS - NEVIS</option>
                                                    <option value="162">ST LUCIA</option>
                                                    <option value="163">ST VINCENT</option>
                                                    <option value="164">SUDAN</option>
                                                    <option value="165">SURINAM</option>
                                                    <option value="166">SWAZILAND</option>
                                                    <option value="167">SWEDEN</option>
                                                    <option value="168">SWITZERLAND</option>
                                                    <option value="169">SYRIA</option>
                                                    <option value="170">TAIWAN</option>
                                                    <option value="171">TAJIKISTAN</option>
                                                    <option value="172">TANZANIA</option>
                                                    <option value="173">TASMANIA</option>
                                                    <option value="174">THAILAND</option>
                                                    <option value="175">TIBET</option>
                                                    <option value="176">TOGO</option>
                                                    <option value="177">TONGA</option>
                                                    <option value="178">TRINIDAD &amp; TOBAGO</option>
                                                    <option value="179">TUNISIA</option>
                                                    <option value="180">TURKEMANISTAN</option>
                                                    <option value="181">TURKEY</option>
                                                    <option value="182">TUVALLI</option>
                                                    <option value="183">UGANDA</option>
                                                    <option value="184">UKRAINE</option>
                                                    <option value="185">UNITED ARAB EMIRATES (UAE)</option>
                                                    <option value="186">UNITED KINGDOM (UK)</option>
                                                    <option value="187">UNITED STATES OF AMERICA (USA)</option>
                                                    <option value="216">UNKNOWN</option>
                                                    <option value="188">UPPER VALTA</option>
                                                    <option value="189">URUGUAY</option>
                                                    <option value="190">UZBEKISTAN</option>
                                                    <option value="191">VANUATU</option>
                                                    <option value="192">VATICAN</option>
                                                    <option value="193">VENEZUELA</option>
                                                    <option value="194">VIETNAM</option>
                                                    <option value="215">WALES</option>
                                                    <option value="195">WALLIS &amp; FUTUNA ISLANDS</option>
                                                    <option value="196">WEST INDIES</option>
                                                    <option value="197">WESTERN AUSTRALIA</option>
                                                    <option value="198">WESTERN SAMOA</option>
                                                    <option value="199">YEMAN</option>
                                                    <option value="200">YUGOSLAVIA</option>
                                                    <option value="201">YUKON</option>
                                                    <option value="202">ZAIRE</option>
                                                    <option value="203">ZAMBIA</option>
                                                    <option value="204">ZIMBABWE</option>
                                                </select>
                                                <input id="txtCCountry" style="display: none" class="form-control" name="txtCountry" type="text" value="" autofocus="autofocus" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="CddlState">State</label>
                                                <select name="" id="ddlCState" class="form-control" data-val="true" data-val-number="State." data-val-required="Please select state">
                                                    <option selected="selected" value="0">-Select-</option>
                                                </select>
                                                <input id="txtCState" style="display: none" class="form-control" placeholder="Enter State Name" name="txtCState" type="text" value="" autofocus="autofocus" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="CddlDistrict">District</label>
                                                <select id="ddlCDistrict" class="form-control" data-val="true" data-val-number="District." data-val-required="Please select District.">
                                                    <option value="0">-Select-</option>
                                                </select>
                                                <input id="txtCDistrict" style="display: none" class="form-control" placeholder="Current District" name="Current District" value="" maxlength="30" autofocus="autofocus" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlCPS">Police Station</label>
                                                <select name="" id="ddlCPS" class="form-control" data-val="true" data-val-number="State." data-val-required="Please select state">
                                                    <option selected="selected" value="0">-Select-</option>
                                                </select>
                                                <input id="txtCPS" style="display: none" placeholder="Police Station" class="form-control" name="txtCPS" type="text" value="" autofocus="autofocus" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label>Tehsil/Block/Mandal</label>
                                                <input name="" type="text" id="txtCTaluka" class="form-control" placeholder="Village/Town/City" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory">Panchayat/Village/City</label>
                                                <input name="" type="text" id="txtCVillage" class="form-control" placeholder="Village/Town/City" />
                                            </div>
                                        </div>

                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label for="PIN">Pin Code</label>
                                                <input name="" type="text" id="txtCPPinCode" class="form-control" placeholder="PIN" maxlength="6" onkeypress="return onlyNumbers(event);" />
                                            </div>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>
                                    <div class="clearfix">
                                    </div>
                                </div>
                                <div class="clearfix">
                                </div>
                            </div>
                        </div>

                        <%--<div class="row">
                            <div class="col-md-12 box-container ptop15">
                                <div class="box-heading">
                                    <h4 class="box-title">Identification Detail</h4>
                                </div>
                                <div class="box-body box-body-open">
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                        <div class="form-group">
                                            <label for="UID">Country of Nationality</label>
                                            <select class="form-control" id="ddlNationality" name="">
                                                <option value="0">-Select-</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlGender">
                                                Identification Type</label>
                                            <select class="form-control" id="ddlIdentificationType" name="">
                                                <option value="0">-Select-</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-4">
                                        <div class="form-group">
                                            <label class="manadatory" for="firstname">Identification Number</label>

                                            <input type="text" id="IdentificationNo" class="form-control" placeholder="Identification Number" name="IdentificationNo" maxlength="40" />

                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="table-responsive">
                                        <table style="width: 99%; margin: 8px auto;" class="table-striped table-bordered table">
                                            <tbody>
                                                <tr>
                                                    <th>S.No
                                                    </th>
                                                    <th>Identification Type
                                                    </th>
                                                    <th>Identification Number
                                                    </th>

                                                    <th>Passport Issue Place
                                                    </th>
                                                    <th>Passport Issue Date (DD/MM/YYYY)
                                                    </th>

                                                    <th>Action
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                    <td>
                                                        <button type="button" class="btn btn-info">ADD</button></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>--%>
                    </div>
                    <div id="accused" class="tab-pane fade" style="border-right: 1px solid #ddd; border-bottom: 1px solid #ddd; border-left: 1px solid #ddd; padding: 10px;">
                        <div class="row">
                            <div class="col-md-12 box-container ptop15">
                                <div class="box-heading">
                                    <h4 class="box-title">Accused Personal Information</h4>
                                </div>
                                <div class="box-body box-body-open">
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                        <div class="form-group">
                                            <label for="UID">Accused UID</label>
                                            <input type="text" id="txtAAppUID" class="form-control" maxlength="12" placeholder="UID Number" onkeypress="return onlyNumbers(event);" />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-10">
                                        <div class="form-group">
                                            <label for="firstname">Name of the Accused</label>
                                            <div class="col-xs-4 pleft0">
                                                <input type="text" id="txtAFirstName" class="form-control" placeholder="First Name" name="FirstName" maxlength="40" />
                                            </div>
                                            <div class="col-xs-4 pleft0">
                                                <input type="text" id="txtAMiddleName" class="form-control" placeholder="Middle Name" name="MiddleName" maxlength="40" />
                                            </div>
                                            <div class="col-xs-4 pleft0 pright0">
                                                <input type="text" id="txtALastName" class="form-control" placeholder="Last Name" name="LastName" maxlength="40" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                        <div class="form-group">
                                            <label for="MobileNo">Accused Mobile Number</label>
                                            <div class="col-xs-3 pleft0 pright0">
                                                <input type="text" placeholder="+91" class="form-control" disabled="disabled" />
                                            </div>
                                            <div class="col-xs-9 pleft0">
                                                <input id="txtAMobileNo" class="form-control" maxlength="10" name="MobileNo" placeholder="Mobile Number" onkeypress="return onlyNumbers(event);" type="text" autocomplete="off" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                        <div class="form-group">
                                            <label for="LandlineNo">Accused Landline No.</label>
                                            <div class="col-xs-4 pleft0 pright0">
                                                <input type="text" id="txtAStdCode" placeholder="Std Code" maxlength="5" onkeypress="return onlyNumbers(event);" class="form-control" />
                                            </div>
                                            <div class="col-xs-8 pleft0">
                                                <input type="text" id="txtAPhone" placeholder="Phoone No." class="form-control" onkeypress="return onlyNumbers(event);" maxlength="10"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 box-container mTop15">
                                <div class="box-heading">
                                    <h4 class="box-title">Permanent Address</h4>
                                </div>
                                <div class="box-body box-body-open">
                                    <div class="box-body box-body-open">
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label for="AddressLine2">House No.</label>
                                                <input name="" type="text" id="txtAAddressLine2" class="form-control" placeholder="Second Line Address" maxlength="40" onchange="return checkLength(this);" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label for="RoadStreetName">Street Name</label>
                                                <input name="" type="text" id="txtARoadStreetName" class="form-control" placeholder="Road / Street Name" maxlength="40" onchange="return checkLength(this);" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label>Colony/Locality/Area</label>
                                                <input name="" type="text" id="txtALocality" class="form-control" placeholder="Locality" maxlength="40" onchange="return checkLength(this);" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label>Country</label>
                                                <select name="" id="ddlACountry" class="form-control" data-val="true" data-val-number="State." data-val-required="Please select state">
                                                    <option selected="selected" value="0">-Select-</option>
                                                    <option value="1">ABU DHABI/DUBAI</option>
                                                    <option value="2">AFGHANISTAN</option>
                                                    <option value="3">AFRICA</option>
                                                    <option value="4">ALBANIA</option>
                                                    <option value="5">ALGERIA</option>
                                                    <option value="6">ANDORRA</option>
                                                    <option value="7">ANGOLA</option>
                                                    <option value="217">ANTIGUA BARBUDA</option>
                                                    <option value="8">ARGENTINA</option>
                                                    <option value="9">ARMENIA</option>
                                                    <option value="10">AUSTRALIA</option>
                                                    <option value="11">AUSTRIA</option>
                                                    <option value="12">AZERBAIJAN</option>
                                                    <option value="13">BAHAMAS</option>
                                                    <option value="14">BAHRAIN</option>
                                                    <option value="15">BANGLADESH</option>
                                                    <option value="16">BARBADOS</option>
                                                    <option value="205">BELARUS</option>
                                                    <option value="19">BELGIUM</option>
                                                    <option value="206">BELIZE</option>
                                                    <option value="17">BELORUSSIA</option>
                                                    <option value="18">BENIN</option>
                                                    <option value="207">BENIN</option>
                                                    <option value="20">BERMUDA</option>
                                                    <option value="21">BHUTAN</option>
                                                    <option value="22">BOLIVIA</option>
                                                    <option value="23">BOSNIA - HERZEGOVINA</option>
                                                    <option value="24">BOTSWANA</option>
                                                    <option value="25">BRAZIL</option>
                                                    <option value="208">BRITAIN</option>
                                                    <option value="26">BRITISH HONDURAS</option>
                                                    <option value="27">BRUNEI</option>
                                                    <option value="28">BULGARIA</option>
                                                    <option value="29">BURKINA</option>
                                                    <option value="30">BURUNDI</option>
                                                    <option value="31">CAMBODIA</option>
                                                    <option value="32">CAMEROON</option>
                                                    <option value="33">CANADA</option>
                                                    <option value="34">CAPE VERDE</option>
                                                    <option value="35">CENTRAL AFRICAN REPUBLIC</option>
                                                    <option value="36">CHAD</option>
                                                    <option value="37">CHILE</option>
                                                    <option value="38">CHINA</option>
                                                    <option value="39">COLOMBIA</option>
                                                    <option value="40">COMOROS</option>
                                                    <option value="41">CONGO</option>
                                                    <option value="42">COSTARICA</option>
                                                    <option value="43">CROATIA</option>
                                                    <option value="44">CUBA</option>
                                                    <option value="45">CYPRUS</option>
                                                    <option value="46">CZECH REPUBLIC</option>
                                                    <option value="47">DENMARK</option>
                                                    <option value="48">DJIBOUTI</option>
                                                    <option value="49">DOMINICA</option>
                                                    <option value="50">DOMINICAN REPUBLIC</option>
                                                    <option value="218">EAST TIMOR</option>
                                                    <option value="51">ECUADOR</option>
                                                    <option value="52">EGYPT</option>
                                                    <option value="53">ELSALVADOR</option>
                                                    <option value="209">ENGLAND</option>
                                                    <option value="54">EQUATORIAL GUINEA</option>
                                                    <option value="55">ERITREA</option>
                                                    <option value="56">ESTONIA</option>
                                                    <option value="57">ETHIOPIA</option>
                                                    <option value="58">FALKLAND ISLANDS</option>
                                                    <option value="59">FEDERATION OF NIGERIA</option>
                                                    <option value="60">FIJI</option>
                                                    <option value="61">FINLAND</option>
                                                    <option value="62">FRANCE</option>
                                                    <option value="63">FRENCH POLYNESIA</option>
                                                    <option value="64">GABON</option>
                                                    <option value="65">GAMBIA</option>
                                                    <option value="66">GEORGIA</option>
                                                    <option value="67">GERMANY</option>
                                                    <option value="68">GHANA</option>
                                                    <option value="69">GREECE</option>
                                                    <option value="219">GREENLAND</option>
                                                    <option value="70">GRENADA</option>
                                                    <option value="71">GUATEMALA</option>
                                                    <option value="72">GUINEA</option>
                                                    <option value="73">GUINEA BISSAU</option>
                                                    <option value="74">GUYANA</option>
                                                    <option value="75">HAITI</option>
                                                    <option value="76">HONDURAS</option>
                                                    <option value="77">HONGKONG</option>
                                                    <option value="78">HUNGARY</option>
                                                    <option value="79">ICELAND</option>
                                                    <option value="80">INDIA</option>
                                                    <option value="81">INDONESIA</option>
                                                    <option value="82">IRAN</option>
                                                    <option value="83">IRAQ</option>
                                                    <option value="84">IRELAND (EIRE)</option>
                                                    <option value="85">ISRAEL</option>
                                                    <option value="86">ITALY</option>
                                                    <option value="87">IVORY COAST</option>
                                                    <option value="88">JAMAICA</option>
                                                    <option value="89">JAPAN</option>
                                                    <option value="90">JORDAN</option>
                                                    <option value="91">KAZAKHISTAN</option>
                                                    <option value="92">KENYA</option>
                                                    <option value="93">KIRGIZIA</option>
                                                    <option value="94">KIRIBATI</option>
                                                    <option value="97">KUWAIT</option>
                                                    <option value="98">LAOS</option>
                                                    <option value="99">LATVIA</option>
                                                    <option value="100">LEBANON</option>
                                                    <option value="101">LESOTHO</option>
                                                    <option value="102">LIBERIA</option>
                                                    <option value="103">LIBYA</option>
                                                    <option value="104">LIECHTENSTEIN</option>
                                                    <option value="105">LITHUNIA</option>
                                                    <option value="106">LUXEMBOURG</option>
                                                    <option value="210">MACEDONIA</option>
                                                    <option value="107">MADAGASCAR</option>
                                                    <option value="108">MALAWI</option>
                                                    <option value="109">MALAYA</option>
                                                    <option value="110">MALAYSIA</option>
                                                    <option value="111">MALDIVES</option>
                                                    <option value="112">MALI</option>
                                                    <option value="113">MALTA</option>
                                                    <option value="114">MAURITANIA</option>
                                                    <option value="115">MAURITIUS</option>
                                                    <option value="116">MEXICO</option>
                                                    <option value="117">MOLDAVIA</option>
                                                    <option value="211">MOLDOVA</option>
                                                    <option value="118">MONACO</option>
                                                    <option value="119">MONGOLIA</option>
                                                    <option value="212">MONTENEGRO</option>
                                                    <option value="120">MOROCCO</option>
                                                    <option value="121">MOZAMBIQUE</option>
                                                    <option value="122">MUSCAT</option>
                                                    <option value="123">MYANMAR</option>
                                                    <option value="124">NAMIBIA</option>
                                                    <option value="125">NEPAL</option>
                                                    <option value="126">NETHERLANDS</option>
                                                    <option value="127">NETHERLANDS ANTILLES</option>
                                                    <option value="128">NEW ZEALAND</option>
                                                    <option value="129">NICARAGUA</option>
                                                    <option value="130">NIGER</option>
                                                    <option value="131">NIGERIA</option>
                                                    <option value="95">NORTH KOREA</option>
                                                    <option value="132">NORWAY</option>
                                                    <option value="133">OMAN</option>
                                                    <option value="134">PAKISTAN</option>
                                                    <option value="220">PALESTINE</option>
                                                    <option value="135">PANAMA</option>
                                                    <option value="136">PAPUA NEW GUINEA</option>
                                                    <option value="137">PARAGUAY</option>
                                                    <option value="138">PERU</option>
                                                    <option value="139">PHILIPPINES</option>
                                                    <option value="140">POLAND</option>
                                                    <option value="141">PORTUGAL</option>
                                                    <option value="142">PUERTO RICO</option>
                                                    <option value="143">QATAR</option>
                                                    <option value="144">ROMANIA</option>
                                                    <option value="145">RUSSIAN FEDERATION</option>
                                                    <option value="146">RWANDA</option>
                                                    <option value="147">SAN MARINO</option>
                                                    <option value="148">SAO TOME AND PRINCIPE</option>
                                                    <option value="149">SAUDI ARABIA</option>
                                                    <option value="213">SCOTLAND</option>
                                                    <option value="150">SENEGAL</option>
                                                    <option value="214">SERBIA</option>
                                                    <option value="151">SEYCHELLES</option>
                                                    <option value="152">SIERRA LEONE</option>
                                                    <option value="153">SINGAPORE</option>
                                                    <option value="154">SLOVAKIA</option>
                                                    <option value="155">SLOVENIA</option>
                                                    <option value="156">SOLOMAN ISLANDS</option>
                                                    <option value="157">SOMALIA</option>
                                                    <option value="158">SOUTH AFRICA</option>
                                                    <option value="96">SOUTH KOREA</option>
                                                    <option value="159">SPAIN</option>
                                                    <option value="160">SRI LANKA</option>
                                                    <option value="161">ST KITTS - NEVIS</option>
                                                    <option value="162">ST LUCIA</option>
                                                    <option value="163">ST VINCENT</option>
                                                    <option value="164">SUDAN</option>
                                                    <option value="165">SURINAM</option>
                                                    <option value="166">SWAZILAND</option>
                                                    <option value="167">SWEDEN</option>
                                                    <option value="168">SWITZERLAND</option>
                                                    <option value="169">SYRIA</option>
                                                    <option value="170">TAIWAN</option>
                                                    <option value="171">TAJIKISTAN</option>
                                                    <option value="172">TANZANIA</option>
                                                    <option value="173">TASMANIA</option>
                                                    <option value="174">THAILAND</option>
                                                    <option value="175">TIBET</option>
                                                    <option value="176">TOGO</option>
                                                    <option value="177">TONGA</option>
                                                    <option value="178">TRINIDAD &amp; TOBAGO</option>
                                                    <option value="179">TUNISIA</option>
                                                    <option value="180">TURKEMANISTAN</option>
                                                    <option value="181">TURKEY</option>
                                                    <option value="182">TUVALLI</option>
                                                    <option value="183">UGANDA</option>
                                                    <option value="184">UKRAINE</option>
                                                    <option value="185">UNITED ARAB EMIRATES (UAE)</option>
                                                    <option value="186">UNITED KINGDOM (UK)</option>
                                                    <option value="187">UNITED STATES OF AMERICA (USA)</option>
                                                    <option value="216">UNKNOWN</option>
                                                    <option value="188">UPPER VALTA</option>
                                                    <option value="189">URUGUAY</option>
                                                    <option value="190">UZBEKISTAN</option>
                                                    <option value="191">VANUATU</option>
                                                    <option value="192">VATICAN</option>
                                                    <option value="193">VENEZUELA</option>
                                                    <option value="194">VIETNAM</option>
                                                    <option value="215">WALES</option>
                                                    <option value="195">WALLIS &amp; FUTUNA ISLANDS</option>
                                                    <option value="196">WEST INDIES</option>
                                                    <option value="197">WESTERN AUSTRALIA</option>
                                                    <option value="198">WESTERN SAMOA</option>
                                                    <option value="199">YEMAN</option>
                                                    <option value="200">YUGOSLAVIA</option>
                                                    <option value="201">YUKON</option>
                                                    <option value="202">ZAIRE</option>
                                                    <option value="203">ZAMBIA</option>
                                                    <option value="204">ZIMBABWE</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlState">State</label>
                                                <select name="" id="ddlAState" class="form-control" data-val="true" data-val-number="State." data-val-required="Please select state">
                                                    <option selected="selected" value="0">-Select-</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label for="ddlDistrict">District</label>
                                                <select id="ddlADistrict" class="form-control" data-val="true" data-val-number="District." data-val-required="Please select District.">
                                                    <option value="0">-Select-</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label for="ddlState">Police Station</label>
                                                <select name="" id="ddlAPS" class="form-control" data-val="true" data-val-number="State." data-val-required="Please select state">
                                                    <option selected="selected" value="0">-Select-</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label>Tehsil/Block/Mandal</label>
                                                <input name="" type="text" id="txtATaluka" class="form-control" placeholder="Village/Town/City" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label>Panchayat/Village/City</label>
                                                <input name="" type="text" id="txtAVillage" class="form-control" placeholder="Village/Town/City" />
                                            </div>
                                        </div>

                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label for="PIN">Pin Code</label>
                                                <input name="" type="text" id="txtAPinCode" class="form-control" placeholder="PIN" maxlength="6" onkeypress="return onlyNumbers(event);" />
                                            </div>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>
                                    <div class="clearfix">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 box-container mTop15">
                                <div class="box-heading">
                                    <h4 class="box-title">Present Address <span style="font-size: 11px; padding-right: 0">(For correspondence)</span>
                                        <span class="col-md-5 pull-right" style="font-style: normal; font-size: 12px; text-align: right; padding-right: 0; padding-left: 0;">
                                            <input id="chkAAddress" type="checkbox" style="vertical-align: bottom;" />Same as Permanent Address</span>
                                        <span class="clearfix"></span></h4>
                                </div>
                                <div class="box-body box-body-open">
                                    <div class="box-body box-body-open">
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label for="AddressLine2">House No.</label>
                                                <input name="" type="text" id="txtCAAddressLine2" class="form-control" placeholder="Second Line Address" maxlength="40" onchange="return checkLength(this);" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label for="RoadStreetName">Street Name</label>
                                                <input name="" type="text" id="txtCARoadStreetName" class="form-control" placeholder="Road / Street Name" maxlength="40" onchange="return checkLength(this);" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label for="Locality">Colony/Locality/Area</label>
                                                <input name="" type="text" id="txtCALocality" class="form-control" placeholder="Locality" maxlength="40" onchange="return checkLength(this);" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label>Country</label>
                                                <select name="" id="ddlCACountry" class="form-control" data-val="true" data-val-number="State." data-val-required="Please select state">
                                                    <option selected="selected" value="0">-Select-</option>
                                                    <option value="1">ABU DHABI/DUBAI</option>
                                                    <option value="2">AFGHANISTAN</option>
                                                    <option value="3">AFRICA</option>
                                                    <option value="4">ALBANIA</option>
                                                    <option value="5">ALGERIA</option>
                                                    <option value="6">ANDORRA</option>
                                                    <option value="7">ANGOLA</option>
                                                    <option value="217">ANTIGUA BARBUDA</option>
                                                    <option value="8">ARGENTINA</option>
                                                    <option value="9">ARMENIA</option>
                                                    <option value="10">AUSTRALIA</option>
                                                    <option value="11">AUSTRIA</option>
                                                    <option value="12">AZERBAIJAN</option>
                                                    <option value="13">BAHAMAS</option>
                                                    <option value="14">BAHRAIN</option>
                                                    <option value="15">BANGLADESH</option>
                                                    <option value="16">BARBADOS</option>
                                                    <option value="205">BELARUS</option>
                                                    <option value="19">BELGIUM</option>
                                                    <option value="206">BELIZE</option>
                                                    <option value="17">BELORUSSIA</option>
                                                    <option value="18">BENIN</option>
                                                    <option value="207">BENIN</option>
                                                    <option value="20">BERMUDA</option>
                                                    <option value="21">BHUTAN</option>
                                                    <option value="22">BOLIVIA</option>
                                                    <option value="23">BOSNIA - HERZEGOVINA</option>
                                                    <option value="24">BOTSWANA</option>
                                                    <option value="25">BRAZIL</option>
                                                    <option value="208">BRITAIN</option>
                                                    <option value="26">BRITISH HONDURAS</option>
                                                    <option value="27">BRUNEI</option>
                                                    <option value="28">BULGARIA</option>
                                                    <option value="29">BURKINA</option>
                                                    <option value="30">BURUNDI</option>
                                                    <option value="31">CAMBODIA</option>
                                                    <option value="32">CAMEROON</option>
                                                    <option value="33">CANADA</option>
                                                    <option value="34">CAPE VERDE</option>
                                                    <option value="35">CENTRAL AFRICAN REPUBLIC</option>
                                                    <option value="36">CHAD</option>
                                                    <option value="37">CHILE</option>
                                                    <option value="38">CHINA</option>
                                                    <option value="39">COLOMBIA</option>
                                                    <option value="40">COMOROS</option>
                                                    <option value="41">CONGO</option>
                                                    <option value="42">COSTARICA</option>
                                                    <option value="43">CROATIA</option>
                                                    <option value="44">CUBA</option>
                                                    <option value="45">CYPRUS</option>
                                                    <option value="46">CZECH REPUBLIC</option>
                                                    <option value="47">DENMARK</option>
                                                    <option value="48">DJIBOUTI</option>
                                                    <option value="49">DOMINICA</option>
                                                    <option value="50">DOMINICAN REPUBLIC</option>
                                                    <option value="218">EAST TIMOR</option>
                                                    <option value="51">ECUADOR</option>
                                                    <option value="52">EGYPT</option>
                                                    <option value="53">ELSALVADOR</option>
                                                    <option value="209">ENGLAND</option>
                                                    <option value="54">EQUATORIAL GUINEA</option>
                                                    <option value="55">ERITREA</option>
                                                    <option value="56">ESTONIA</option>
                                                    <option value="57">ETHIOPIA</option>
                                                    <option value="58">FALKLAND ISLANDS</option>
                                                    <option value="59">FEDERATION OF NIGERIA</option>
                                                    <option value="60">FIJI</option>
                                                    <option value="61">FINLAND</option>
                                                    <option value="62">FRANCE</option>
                                                    <option value="63">FRENCH POLYNESIA</option>
                                                    <option value="64">GABON</option>
                                                    <option value="65">GAMBIA</option>
                                                    <option value="66">GEORGIA</option>
                                                    <option value="67">GERMANY</option>
                                                    <option value="68">GHANA</option>
                                                    <option value="69">GREECE</option>
                                                    <option value="219">GREENLAND</option>
                                                    <option value="70">GRENADA</option>
                                                    <option value="71">GUATEMALA</option>
                                                    <option value="72">GUINEA</option>
                                                    <option value="73">GUINEA BISSAU</option>
                                                    <option value="74">GUYANA</option>
                                                    <option value="75">HAITI</option>
                                                    <option value="76">HONDURAS</option>
                                                    <option value="77">HONGKONG</option>
                                                    <option value="78">HUNGARY</option>
                                                    <option value="79">ICELAND</option>
                                                    <option value="80">INDIA</option>
                                                    <option value="81">INDONESIA</option>
                                                    <option value="82">IRAN</option>
                                                    <option value="83">IRAQ</option>
                                                    <option value="84">IRELAND (EIRE)</option>
                                                    <option value="85">ISRAEL</option>
                                                    <option value="86">ITALY</option>
                                                    <option value="87">IVORY COAST</option>
                                                    <option value="88">JAMAICA</option>
                                                    <option value="89">JAPAN</option>
                                                    <option value="90">JORDAN</option>
                                                    <option value="91">KAZAKHISTAN</option>
                                                    <option value="92">KENYA</option>
                                                    <option value="93">KIRGIZIA</option>
                                                    <option value="94">KIRIBATI</option>
                                                    <option value="97">KUWAIT</option>
                                                    <option value="98">LAOS</option>
                                                    <option value="99">LATVIA</option>
                                                    <option value="100">LEBANON</option>
                                                    <option value="101">LESOTHO</option>
                                                    <option value="102">LIBERIA</option>
                                                    <option value="103">LIBYA</option>
                                                    <option value="104">LIECHTENSTEIN</option>
                                                    <option value="105">LITHUNIA</option>
                                                    <option value="106">LUXEMBOURG</option>
                                                    <option value="210">MACEDONIA</option>
                                                    <option value="107">MADAGASCAR</option>
                                                    <option value="108">MALAWI</option>
                                                    <option value="109">MALAYA</option>
                                                    <option value="110">MALAYSIA</option>
                                                    <option value="111">MALDIVES</option>
                                                    <option value="112">MALI</option>
                                                    <option value="113">MALTA</option>
                                                    <option value="114">MAURITANIA</option>
                                                    <option value="115">MAURITIUS</option>
                                                    <option value="116">MEXICO</option>
                                                    <option value="117">MOLDAVIA</option>
                                                    <option value="211">MOLDOVA</option>
                                                    <option value="118">MONACO</option>
                                                    <option value="119">MONGOLIA</option>
                                                    <option value="212">MONTENEGRO</option>
                                                    <option value="120">MOROCCO</option>
                                                    <option value="121">MOZAMBIQUE</option>
                                                    <option value="122">MUSCAT</option>
                                                    <option value="123">MYANMAR</option>
                                                    <option value="124">NAMIBIA</option>
                                                    <option value="125">NEPAL</option>
                                                    <option value="126">NETHERLANDS</option>
                                                    <option value="127">NETHERLANDS ANTILLES</option>
                                                    <option value="128">NEW ZEALAND</option>
                                                    <option value="129">NICARAGUA</option>
                                                    <option value="130">NIGER</option>
                                                    <option value="131">NIGERIA</option>
                                                    <option value="95">NORTH KOREA</option>
                                                    <option value="132">NORWAY</option>
                                                    <option value="133">OMAN</option>
                                                    <option value="134">PAKISTAN</option>
                                                    <option value="220">PALESTINE</option>
                                                    <option value="135">PANAMA</option>
                                                    <option value="136">PAPUA NEW GUINEA</option>
                                                    <option value="137">PARAGUAY</option>
                                                    <option value="138">PERU</option>
                                                    <option value="139">PHILIPPINES</option>
                                                    <option value="140">POLAND</option>
                                                    <option value="141">PORTUGAL</option>
                                                    <option value="142">PUERTO RICO</option>
                                                    <option value="143">QATAR</option>
                                                    <option value="144">ROMANIA</option>
                                                    <option value="145">RUSSIAN FEDERATION</option>
                                                    <option value="146">RWANDA</option>
                                                    <option value="147">SAN MARINO</option>
                                                    <option value="148">SAO TOME AND PRINCIPE</option>
                                                    <option value="149">SAUDI ARABIA</option>
                                                    <option value="213">SCOTLAND</option>
                                                    <option value="150">SENEGAL</option>
                                                    <option value="214">SERBIA</option>
                                                    <option value="151">SEYCHELLES</option>
                                                    <option value="152">SIERRA LEONE</option>
                                                    <option value="153">SINGAPORE</option>
                                                    <option value="154">SLOVAKIA</option>
                                                    <option value="155">SLOVENIA</option>
                                                    <option value="156">SOLOMAN ISLANDS</option>
                                                    <option value="157">SOMALIA</option>
                                                    <option value="158">SOUTH AFRICA</option>
                                                    <option value="96">SOUTH KOREA</option>
                                                    <option value="159">SPAIN</option>
                                                    <option value="160">SRI LANKA</option>
                                                    <option value="161">ST KITTS - NEVIS</option>
                                                    <option value="162">ST LUCIA</option>
                                                    <option value="163">ST VINCENT</option>
                                                    <option value="164">SUDAN</option>
                                                    <option value="165">SURINAM</option>
                                                    <option value="166">SWAZILAND</option>
                                                    <option value="167">SWEDEN</option>
                                                    <option value="168">SWITZERLAND</option>
                                                    <option value="169">SYRIA</option>
                                                    <option value="170">TAIWAN</option>
                                                    <option value="171">TAJIKISTAN</option>
                                                    <option value="172">TANZANIA</option>
                                                    <option value="173">TASMANIA</option>
                                                    <option value="174">THAILAND</option>
                                                    <option value="175">TIBET</option>
                                                    <option value="176">TOGO</option>
                                                    <option value="177">TONGA</option>
                                                    <option value="178">TRINIDAD &amp; TOBAGO</option>
                                                    <option value="179">TUNISIA</option>
                                                    <option value="180">TURKEMANISTAN</option>
                                                    <option value="181">TURKEY</option>
                                                    <option value="182">TUVALLI</option>
                                                    <option value="183">UGANDA</option>
                                                    <option value="184">UKRAINE</option>
                                                    <option value="185">UNITED ARAB EMIRATES (UAE)</option>
                                                    <option value="186">UNITED KINGDOM (UK)</option>
                                                    <option value="187">UNITED STATES OF AMERICA (USA)</option>
                                                    <option value="216">UNKNOWN</option>
                                                    <option value="188">UPPER VALTA</option>
                                                    <option value="189">URUGUAY</option>
                                                    <option value="190">UZBEKISTAN</option>
                                                    <option value="191">VANUATU</option>
                                                    <option value="192">VATICAN</option>
                                                    <option value="193">VENEZUELA</option>
                                                    <option value="194">VIETNAM</option>
                                                    <option value="215">WALES</option>
                                                    <option value="195">WALLIS &amp; FUTUNA ISLANDS</option>
                                                    <option value="196">WEST INDIES</option>
                                                    <option value="197">WESTERN AUSTRALIA</option>
                                                    <option value="198">WESTERN SAMOA</option>
                                                    <option value="199">YEMAN</option>
                                                    <option value="200">YUGOSLAVIA</option>
                                                    <option value="201">YUKON</option>
                                                    <option value="202">ZAIRE</option>
                                                    <option value="203">ZAMBIA</option>
                                                    <option value="204">ZIMBABWE</option>
                                                </select>
                                                <input id="txtCACountry" style="display: none" class="form-control" name="txtCountry" type="text" value="" autofocus="autofocus" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label for="CddlState">State</label>
                                                <select name="" id="ddlCAState" class="form-control" data-val="true" data-val-number="State." data-val-required="Please select state">
                                                    <option selected="selected" value="0">-Select-</option>
                                                </select>
                                                <input id="txtCAState" style="display: none" class="form-control" placeholder="Enter State Name" name="txtCState" type="text" value="" autofocus="autofocus" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label for="CddlDistrict">District</label>
                                                <select id="ddlCADistrict" class="form-control" data-val="true" data-val-number="District." data-val-required="Please select District.">
                                                    <option value="0">-Select-</option>
                                                </select>
                                                <input id="txtCADistrict" style="display: none" class="form-control" placeholder="Current District" name="Current District" value="" maxlength="30" autofocus="autofocus" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label for="ddlCPS">Police Station</label>
                                                <select name="" id="ddlCAPS" class="form-control" data-val="true" data-val-number="State." data-val-required="Please select state">
                                                    <option selected="selected" value="0">-Select-</option>
                                                </select>
                                                <input id="txtCAPS" style="display: none" placeholder="Police Station" class="form-control" name="txtCPS" type="text" value="" autofocus="autofocus" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label>Tehsil/Block/Mandal</label>
                                                <input name="" type="text" id="txtCATaluka" class="form-control" placeholder="Village/Town/City" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label>Panchayat/Village/City</label>
                                                <input name="" type="text" id="txtCAVillage" class="form-control" placeholder="Village/Town/City" />
                                            </div>
                                        </div>

                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label for="PIN">Pin Code</label>
                                                <input name="" type="text" id="txtCAPPinCode" class="form-control" placeholder="PIN" maxlength="6" onkeypress="return onlyNumbers(event);" />
                                            </div>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>
                                    <div class="clearfix">
                                    </div>
                                </div>
                                <div class="clearfix">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="incident" class="tab-pane fade" style="border-right: 1px solid #ddd; border-bottom: 1px solid #ddd; border-left: 1px solid #ddd; padding: 10px;">
                        <div class="table-responsive">
                            <table style="width: 100%; margin: 8px auto;" class="mytable">
                                <tbody>
                                    <tr>
                                        <th>Place of Incident<span class="manadatory"></span>
                                        </th>
                                        <td>
                                            <input type="text" class="form-control" id="txtIncidentPlace" placeholder="" />
                                        </td>
                                        <th>Is Date/Time of Incident Known?<span class="manadatory"></span>
                                        </th>
                                        <td>
                                            <input type="radio" name="radio4" id="rdoDYes" value="Y" checked="checked" />Yes
                                            <input type="radio" name="radio4" id="rdoDNo" value="N" />No
                                        </td>


                                    </tr>
                                    <tr id="trIncDate">
                                        <th>Date of Incident (DD/MM/YYYY) (From)<span class="manadatory"></span></th>
                                        <td>
                                            <input type="text" class="form-control" id="txtIncidentFromDate" placeholder="" /></td>
                                        <th>Date of Incident (DD/MM/YYYY) (To)<span class="manadatory"></span></th>
                                        <td>
                                            <input type="text" class="form-control" id="txtIncidentToDate" placeholder="" /></td>
                                    </tr>
                                    <tr>
                                        <th>Type of Incident</th>
                                        <td colspan="3">
                                            <input type="text" class="form-control" id="IncidentType" placeholder="" /></td>
                                    </tr>
                                    <%-- <tr>
                                        <th>File Upload</th>
                                        <td colspan="3">
                                            <input type="file" /></td>
                                    </tr>--%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div id="complaintsubmission" class="tab-pane fade" style="border-right: 1px solid #ddd; border-bottom: 1px solid #ddd; border-left: 1px solid #ddd; padding: 10px;">
                        <div class="table-responsive">
                            <table style="width: 100%; margin: 8px auto;" class="mytable">
                                <tbody>
                                    <tr>
                                        <th style="width: 50%">Do you know your Police Station?<span class="manadatory"></span>
                                        </th>
                                        <td colspan="3">
                                            <input type="radio" name="rdoPS" id="rdoPSY" value="Y" checked="checked" />Yes
                                            <input type="radio" name="rdoPS" id="rdoPSN" value="N" />No
                                        </td>
                                    </tr>
                                    <tr id="trrdoDis">
                                        <th style="width: 50%">Do you know your District?<span class="manadatory"></span>
                                        </th>
                                        <td colspan="3">
                                            <input type="radio" name="rdoDis" id="rdoDisY" value="Y" checked="checked" />Yes
                                            <input type="radio" name="rdoDis" id="rdoDisN" value="N" />No
                                        </td>
                                    </tr>
                                    <tr id="trCSDDis">
                                        <th>District <span class="manadatory"></span></th>
                                        <td>
                                            <select id="ddlCSDDis" class="form-control">
                                                <option value="Select">Select</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr id="trPS">
                                        <th>Police Station <span class="manadatory"></span></th>
                                        <td>
                                            <select id="ddlCSDPs" class="form-control">
                                                <option value="Select">Select</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr id="trOffN">
                                        <th>Office Name <span class="manadatory"></span></th>
                                        <td>
                                            <select id="ddlCSDOffN" class="form-control">
                                                <option value="Select">Select</option>
                                            </select>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div id="complaintdetail" class="tab-pane fade" style="border-right: 1px solid #ddd; border-bottom: 1px solid #ddd; border-left: 1px solid #ddd; padding: 10px;">
                        <div class="table-responsive">
                            <table style="width: 100%; margin: 8px auto;" class="mytable">
                                <tbody>
                                    <tr>
                                        <th>Date of Complaint
                                        </th>
                                        <td>
                                            <input type="text" class="form-control" id="txtComplaintDate" placeholder="" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Complaint Description <span class="manadatory"></span>
                                        </th>
                                        <td>
                                            <textarea id="txtComplaintDesc" rows="4" cols="50" class="form-control" maxlength="500"></textarea>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Remark</th>
                                        <td>
                                            <textarea id="txtRemark" rows="4" cols="50" class="form-control" maxlength="500"></textarea>
                                        </td>
                                    </tr>

                                    <%--<tr>
                                        <th>File Upload</th>
                                        <td colspan="3">
                                            <input type="file" /></td>
                                    </tr>--%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mtop15">
            <div class="col-md-12 box-container" id="divBtn">
                <div class="box-body box-body-open" style="text-align: center;">
                    <input type="button" id="btnSubmit" class="btn btn-success" value="Register &amp; Proceed" onclick="fnNext(this);" />
                    <asp:Button runat="server" PostBackUrl="" value="Cancel" ID="btnCancel" Text="Cancel" class="btn btn-danger" />
                    <%--<input type="submit" name="ctl00$ContentPlaceHolder1$btnHome" value="Home" id="btnHome" title="Back to Home Page" class="btn btn-primary" />--%>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="hidPremises" value="0" />
    <input type="hidden" id='hdfSuspect' />
    <input type="hidden" id='hdfSuspectSave' />
    <input type="hidden" id='hdfSuspectString' />
    <input type="hidden" id="HFUIDData" />
    <input type="hidden" id="HFServiceID" />
    <input type="hidden" id="hidApplicentPhoto" />
    <input type="hidden" id="hidApplicentName" />
</asp:Content>
