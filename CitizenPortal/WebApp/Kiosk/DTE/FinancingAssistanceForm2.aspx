<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="FinancingAssistanceForm2.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.DTE.FinancingAssistanceForm2" %>

<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>
<%@ Register Src="~/WebApp/Control/Address.ascx" TagPrefix="uc1" TagName="Address" %>
<%@ Register Src="~/WebApp/Control/ApplicationSteps.ascx" TagPrefix="uc1" TagName="ApplicationSteps" %>
<%@ Register Src="~/WebApp/Control/ServiceInformation.ascx" TagPrefix="uc1" TagName="ServiceInformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script src="/PortalScripts/ServiceLanguage.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="../../Scripts/ValidationScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="../../Scripts/CommonScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="FinancingAssistance2.js"></script>

    <style>
        .instn {
            background-color: #E6F2FF;
            border-right: 2px solid #C4E0FF;
            border-bottom: 2px solid #C4E0FF;
            border-left: 2px solid #C4E0FF;
            padding-left: 15px;
            font-size: 14px;
            color: #000;
            line-height: 22px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper" class="pleft15 pright15">
        <div class="row">
            <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>Award of stipend </h2>
        </div>
        <div class="row">
            <div class="col-lg-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title">Instruction to Fill the Form
                                    <span class="col-md-6 pull-right" style="font-style: normal; font-size: 12px; text-align: right; padding: 0;">
                                        <i class="fa fa-info-circle" style="cursor: pointer; font-size: 20px;" title="Information" onclick="ckhInfo();"></i>
                                    </span>
                        <span class="clearfix"></span>
                    </h4>
                </div>
                <div class="instn" id="divInfo">
                    <p><b style="color: #000; padding-top: 10px;">Document to be attached</b></p>
                    <ul>
                        <li>1.	Copy of HSC</li>
                        <li>2.	Income certificate of the financing guardian.</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title">Additional Information</h4>
                </div>
                <div class="box-body box-body-open">


                   <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2 pright0">
                        <label id="TankArea">Registration Number</label>
                        <div class="form-group">
                            <input id="txtRegistrationNo" style="width: 195px;" class="form-control mtop0" placeholder="Start with  F  or  L max 11 digit numeric" maxlength="12" onkeypress="return AlphaNumeric(event);" onchange="RegistrationNo();" />
                        </div>
                    </div>

                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2  pright1" >
                        <div class="form-group">
                            <label class="manadatory" for="AdmissionYear">Year of Admission</label>
                            <select class="form-control" data-val="true" data-val-required="Please select." id="drpAdmisionYear">
                                <option value="0">-Select-</option>
                                <option value="2012">2012</option>
                                <option value="2013">2013</option>
                                <option value="2014">2014</option>
                                <option value="2015">2015</option>
                                <option value="2016">2016</option>
                                <option value="2017">2017</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory" for="Semester">Semester </label>
                            <select class="form-control" data-val="true" data-val-required="Please select." id="drpSemester" name="Tank Status" >
                                <option value="0">-Select-</option>
                                <option value="1stSem">1st</option>
                                <option value="3rdSem">3rd</option>
                                <option value="5thSem">5th</option>
                            </select>
                        </div>
                    </div>
                   <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2 pleft0 pright0">
                        <div class="form-group">
                            <label class="manadatory"  style=" text-align:left"  for="Semester">Type of Institute </label>
                            <select class="form-control" data-val="true" data-val-required="Please select." id="drpInstituteType" onchange="OnchangeFunction();">
                                <option value="0">-Select-</option>
                                <option value="Private">Private</option>
                                <option value="Government">Government</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label class="manadatory" for="InstitutionName">
                                Name of the Institution<span style="font-size: 11px;"></span>
                            </label>
                            <select class="form-control" data-val="true" data-val-required="Please select." id="drpInstitutionName" name="">
                                <option value="0">-Select-</option>
                                <%--<option value="Govt1">BHUBANANADA ORISSA SCHOOL OF ENGG., CUTTACK   </option>
                                <option value="Govt2">BIJU PATNAIK INSTITUTE OF TECHNOLOGY, MOTO, BRAHMA GIRI, PURI</option>
                                <option value="Govt3">BPFTIO, CUTTACK (AUTONOMOUS)</option>
                                <option value="Govt4">GOVT. POLYTECHNIC, ANGUL</option>
                                <option value="Govt5">GOVT. POLYTECHNIC, BALANGIR </option>
                                <option value="Govt6">GOVT. POLYTECHNIC, BALASORE</option>
                                <option value="Govt7">GOVT. POLYTECHNIC, BARGARH</option>
                                <option value="Govt8">GOVT. POLYTECHNIC, BERHAMPUR</option>
                                <option value="Govt9">GOVT. POLYTECHNIC, BHUBANESWAR</option>
                                <option value="Govt10">GOVT. POLYTECHNIC, BOUDH</option>
                                <option value="Govt11">GOVT. POLYTECHNIC, DHENKANAL</option>
                                <option value="Govt12">GOVT. POLYTECHNIC, GAJAPATI</option>
                                <option value="Govt13">GOVT. POLYTECHNIC, JAJPUR </option>
                                <option value="Govt14">GOVT. POLYTECHNIC, KALAHANDI</option>
                                <option value="Govt15">GOVT. POLYTECHNIC, KANDHAMAL</option>
                                <option value="Govt16">GOVT. POLYTECHNIC, KENDRAPADA </option>
                                <option value="Govt17">GOVT. POLYTECHNIC, KORAPUT</option>
                                <option value="Govt18">GOVT. POLYTECHNIC, MALKANAGIRI</option>
                                <option value="Govt19">GOVT. POLYTECHNIC,  MAYURBHANJ, TIKARPADA </option>
                                <option value="Govt20">GOVT. POLYTECHNIC, NAWARANGPUR</option>
                                <option value="Govt21">GOVT. POLYTECHNIC, NAWARANGPUR</option>
                                <option value="Govt22">GOVT. POLYTECHNIC, SAMBALPUR  </option>
                                <option value="Govt23">GOVT. POLYTECHNIC, SONEPUR </option>
                                <option value="Govt24">INDIRA GANDHI INSTITUTE OF TECH., SARANG (SOCIETY)</option>
                                <option value="Govt25">INST. OF TEXTILE TECH-NOLOGY, CHOUDWAR, CUTTACK (SOCIETY)</option>
                                <option value="Govt26">JHARSUGUDA ENGINEERING  SCHOOL, JHARSUGUDA    </option>
                                <option value="Govt27">ORISSA SCHOOL OF MINING ENGINEERING, KEONJHAR </option>
                                <option value="Govt28">SKDAV GOVT. POLYTECHNIC, ROURKELA </option>
                                <option value="Govt29">UMA CHARAN PATNAIK ENGG. SCHOOL, BERHAMPUR</option>
                                <option value="Govt30">UTKAL GOURAB MADHUSUDAN INST. OF TECHNOLOGY, RAYAGADA </option>
                                <option value="Govt31">UTKALMANI GOPABANDHU INST. OF ENGG, ROURKELA</option>
                                <option value="Govt32">BHUBANANADA ORISSA SCHOOL OF ENGG., CUTTACK (2nd Shift)</option>
                                <option value="Govt33">GOVT. POLYTECHNIC, BHUBANESWAR, (2nd Shift)</option>
                                <option value="Govt34">INSTITUTE OF TEXTILE TECH-NOLOGY, CHOUDWAR, CUTTACK (SOCIETY), (2nd Shift)</option>
                                <option value="Prvt1">ADARSHA SCHOOL OF ENGG. & INTERNATIONAL POLYTECHNIC, ANGUL</option>
                                <option value="Prvt2">ARYAN INST. OF ENGG. & TECH. POLY, SUNDARGRAM, CUTTACK</option>
                                <option value="Prvt3">ASIAN SCHOOL OF TECH., BANTALA, MUKTAPUR, KHURDA</option>
                                <option value="Prvt4">AUMSAI INSTITUTE OF TECHNICAL EDUCATIONPOLY, BERHAMPUR</option>
                                <option value="Prvt5">B.I.T. POLYTECHNIC, BALASORE</option>
                                <option value="Prvt6">BADRI PRASAD INST. OF TECH., DEBAIPALI, SAMBALPUR </option>
                                <option value="Prvt7">BAJIROUT INST. OF ENG. & TECH. (POLY), GOBINDPUR, DHENKANAL</option>
                                <option value="Prvt8">BALAJI INST. OF TECH. & SCIENCE, KNOWLEDGE CENTRE, GUNUPUR</option>
                                <option value="Prvt9">BALASORE SCHOOL OF ENGINEERING, BALASORE</option>
                                <option value="Prvt10">BARAPADA SCHOOL OF ENGG. & TECH., BARAPADA, BHADRAK</option>
                                <option value="Prvt11">BARUNEI INST. OF ENGG. & TECH.POLY, KHURDA</option>
                                <option value="Prvt12">BERHAMPUR SCHOOL OF ENGG. & TECHNOLOGY, DORA, BERHAMPUR</option>
                                <option value="Prvt13">BHADRAK ENGG. SCHOOL & TECH., ASURALI, BHADRAK</option>
                                <option value="Prvt14">BHARAT INST. OF ENGG. & TECH., SIVRAM VIHAR, BERHAMPUR</option>
                                <option value="Prvt15">BHUBANESWAR POLYTECHNIC, JANALA, BHUBANESWAR </option>
                                <option value="Prvt16">BIJU PATNAIK INST. OF TECHNOLOGY, PHULBANI</option>
                                <option value="Prvt17">BLACK DIAMOND SCHOOL OF ENGINEERING, BRAJRAJNAGAR</option>
                                <option value="Prvt18">C.V. RAMAN POLYTECHNIC, BHUBANESWAR</option>
                                <option value="Prvt19">CITY INST.OF TECHNICAL EDUCATION, KUANR MUNDA, ROURKELA</option>
                                <option value="Prvt20">DHABALESWAR INSTITUTE OF POLYTECHNIC, ATHAGARH</option>
                                <option value="Prvt21">DIVINE INSTITUTE OF ENGG. & TECH., PODA ASTIA, BARIPADA</option>
                                <option value="Prvt22">DRIEMS POLYTECHNIC, TANGI, CUTTACK</option>
                                <option value="Prvt23">GANAPATI INST. OF ENGG. & TECH.POLY, JAGATPUR, CUTTACK</option>
                                <option value="Prvt24">GANDHI POLYTECHNIC, GOLANTHARA, KONISI, BERHAMPUR</option>
                                <option value="Prvt25">GANDHI SCHOOL OF ENGG., PURUSOTTAMPUR, BERHAMPUR</option>
                                <option value="Prvt26">GANESH INSTITUTE OF ENGG. & TECH.POLY, ANDHARUA, BBSR</option>
                                <option value="Prvt27">GURUKRUPA TECHNICAL SCHOOL, NARSINGHPUR, CUTTACK</option>
                                <option value="Prvt28">GURUKULA ENGG. SCHOOL, JAMAJHARI, CHATABAR, BHUBANESWAR</option>
                                <option value="Prvt29">HI-TECH. INSTITUTE OF ENGG. & MGMT., RANITAL, BHADRAK</option>
                                <option value="Prvt30">HI-TECH. INSTITUTE OF INF. & TECH., UMERI, JEYPORE</option>
                                <option value="Prvt31">HOLY INSTITUTE OF TECHNOLOGY, GOBINADPUR, GANJAM </option>
                                <option value="Prvt32">IDEAL SCHOOL OF ENGG POLY, JHINKHARADA, KHURDA</option>
                                <option value="Prvt33">INDUS SCHOOL OF ENGG., BARAKUDA, KHURDA</option>
                                <option value="Prvt34">INSTITUTE OF ENGG. & MGMT., JEYPORE, KORAPUT </option>
                                <option value="Prvt35">INTERNATIONAL POLYTECHNIC, LAHANGA, MOTA, KHURDA</option>
                                <option value="Prvt36">JEYPORE SCHOOL OF ENGG. & TECH., RONDAPALLI, JEYPORE</option>
                                <option value="Prvt37">JHADESWAR INST. OF ENGG. & TECH., CHHANPUR, BALASORE</option>
                                <option value="Prvt38">KALAHANDI SCHOOL OF ENGG. & TECH.POLY, BHAWANIPATNA</option>
                                <option value="Prvt39">KALAM INSTITUTE OF TECHNOLOGYPOLY, BERHAMPUR </option>
                                <option value="Prvt40">KALINGA  INST. OF MINING ENGG. & TECH, CHHENDIPADA, ANGUL</option>
                                <option value="Prvt41">KALINGA INST. OF ENGG. & TECHNOLOGY, FC PROJECT, JAJPUR</option>
                                <option value="Prvt42">KALINGA NAGAR POLYTECHNIC, TARAPUR, JAJPUR </option>
                                <option value="Prvt43">KEONJHAR SCHOOL OF ENGINEERING, KEONJHAR</option>
                                <option value="Prvt44">KIIT POLYTECHNIC, PATIA, BHUBANESWAR</option>
                                <option value="Prvt45">KOUSTUV SCHOOL OF ENGG., PATIA, BHUBANESWAR</option>
                                <option value="Prvt46">KRUPAJAL ENGINEERING SCHOOL, BHUBANESWAR</option>
                                <option value="Prvt47">MAHALAXMI INSTITUTE OF TECH. & ENGG., RAJ NILAGIRI, BALASORE</option>
                                <option value="Prvt48">MAHAMAYA INST. OF MEDICAL & TECH. SCIENCEPOLY, NUAPADA</option>
                                <option value="Prvt49">MAHARAJA POLYTECHNIC, TARABOI, BEHIND BARUNEI HILL, BHUBANESWAR</option>
                                <option value="Prvt50">MAHAVIR ENGINEERING COLLEGE, MAHAVIR NAGAR, BBSR, PANIORA, PALASHPUR, KHURDA-752054</option>
                                <option value="Prvt51">MAYURBHANJ SCHOOL OF ENGINEERING, BARIPADA                                    </option>
                                <option value="Prvt52">MITS INSTITUTE OF POLYTECHNIC, RAYAGADA                                       </option>
                                <option value="Prvt53">MITS SCHOOL OF ENGINEERING, JANLA, BHUBANESWAR                                </option>
                                <option value="Prvt54">NALANDA INSTITUTE OF TECH., CHANDAKA, BHUBANESWAR                             </option>
                                <option value="Prvt55">NARAYANI INST. OF ENGG. & TECHNOLOGY, BANARPAL, ANGUL                         </option>
                                <option value="Prvt56">NAYAGARH INSTITUTE OF ENGG. & TECHNOLOGY, NAYAGARH                            </option>
                                <option value="Prvt57">NILACHAL POLYTECHNIC, BHUBANESWAR                                             </option>
                                <option value="Prvt58">NILASAILA INSTITUTE OF SCIENCE &TECH., SERGARH, BALASORE                      </option>
                                <option value="Prvt59">NORTH ODISHA SCHOOL OF ENGG., RASAGOVINDPUR, MAYURBHANJ                       </option>
                                <option value="Prvt60">ODISHA POLYTECHNIC, KURUDA, BALASORE                                          </option>
                                <option value="Prvt61">ORISSA INSTITUTE OF ENGG. & TECHNOLOGY, DHENKANAL                             </option>
                                <option value="Prvt62">ORISSA SCHOOL OF ENGINEERINGPOLY, BERHAMPUR                                   </option>
                                <option value="Prvt63">OXFORD SCHOOL OF POLYTECHNIC DIPLOMA, BALIANTA, BBSR                          </option>
                                <option value="Prvt64">PABITRA MOHAN INSTITUTE OF TECHNOLOGY, TALCHER, ANGUL                         </option>
                                <option value="Prvt65">PADMASHREE KRUTARTHA ACHARYA INST. OF ENG. & TECH., BARAGARH                  </option>
                                <option value="Prvt66">PATHANI SAMANTA INSTITUTE OF ENGG. & TECH. POLY, DHENKANAL                    </option>
                                <option value="Prvt67">PNS SCHOOL OF ENGG. & TECH. MARSAGHAI, KENDRAPARA                             </option>
                                <option value="Prvt68">PURI ENGINEERING SCHOOL, BALIGUALI, PURI                                      </option>
                                <option value="Prvt69">PURNA CHANDRA INST. OF ENGG. & TECHNOLOGY, CHHENDIPADA, ANGUL                 </option>
                                <option value="Prvt70">PURUSOTTAM SCHOOL OF ENGG. & TECH. POLY, MANDIAKUDUR, ROURKELA                </option>
                                <option value="Prvt71">RAJA KISHORE CHANDRA ACADEMY OF TECH., NILAGIRI, BALASORE                     </option>
                                <option value="Prvt72">RAMARANI INSTITUTE OF TECHNOLOGY, BALASORE                                    </option>
                                <option value="Prvt73">RK INSTITUTE OF ENGG. & TECH., KANTAPADA, NIALI, CUTTACK                      </option>
                                <option value="Prvt74">ROURKELA INSTITUTE OF TECH., KALUNGA, ROURKELA                                </option>
                                <option value="Prvt75">SAI INSTITUTE OF TECH. SCIENCE, CHOUDWAR, CUTTACK                             </option>
                                <option value="Prvt76">SAMANTA CHANDRA SEKHAR INST. OF TECH. & MGT., SEMILIGUDA                      </option>
                                <option value="Prvt77">SANJAY MEMORIAL INSTITUTE OF TECH., ANKUSPUR, BERHAMPUR                       </option>
                                <option value="Prvt78">SATYA SAI SCHOOL OF ENGG. DIPLOMA, BALASORE                                   </option>
                                <option value="Prvt79">SIDDHARTHA INSTITUTE OF ENGG. & TECH., EKTAGUDA, KORAPUT                      </option>
                                <option value="Prvt80">SRI POLYTECHNIC, KOMOND, ODAGAON, NAYAGARH                                    </option>
                                <option value="Prvt81">SSB REGIONAL INST. OF SC. & TECH. POLY, CHITRADA, MAYURBHANJ                  </option>
                                <option value="Prvt82">SUDDHANANDA RESIDENTIAL POLYTECHNIC, NACHHIPUR, CUTTACK                       </option>
                                <option value="Prvt83">SUNDERGARH ENGINEERING SCHOOL, KIREI, SUNDERGARH                              </option>
                                <option value="Prvt84">SUSHREE INSTITUTE OF TECH. EDUCATION, BOLANGIR                                </option>
                                <option value="Prvt85">SWAMI VIVEKANANDA SCHOOL OF ENGG. & TECH. POLY, BHUBANESWAR                   </option>
                                <option value="Prvt86">UTKAL INSTITUTE OF ENGG. & TECH., RATHIPUR, KHURDA                            </option>
                                <option value="Prvt87">VENUS GROUP OF EDUCATIONAL & REASERCH INSTITUTE, BAHANAGA, BALASORE           </option>
                                <option value="Prvt88">VIKASH POLYTECHNIC, BARGARH                                                   </option>
                                <option value="Prvt89">ZENITH INSTITUTE OF SCIENCE & TECHNOLOGY, JATANI, KHURDA                      </option>
                                <option value="Prvt90">ADARSHA COLLEGE OF ENGNEERING, ANGUL, (2nd Shift)                             </option>
                                <option value="Prvt91">ARYAN INSTITUTE OF ENGG & TECHNOLOGY, (2nd Shift), PANCHAGAON, BHUBANESWAR    </option>
                                <option value="Prvt92">BHUBANESWAR ENGINEERING COLLEGE, GANGAPADA, BHUBANESWAR (2nd Shift)           </option>
                                <option value="Prvt93">BRM INTERNATIONAL INSTITUTE OF TECH., PANDRA,  BHUBANESWAR, (2nd Shift)       </option>
                                <option value="Prvt94">EASTERN ACADEMY OF SCIENCE & TECHNOLOGY (EAST), PHULNAKHARA, (2nd Shift)      </option>
                                <option value="Prvt95">EINSTEIN ACADEMY OF TECH. & MGMT, BBSR (2nd Shift)                            </option>
                                <option value="Prvt96">GANDHI INST. FOR EDN. & TECH., BANIATANGI  KHORDHA, (2nd Shift)               </option>
                                <option value="Prvt97">GANDHI INSTITUTE OF ADVANCED COMPUER & RESEARCH, RAYAGADA (2nd Shift)         </option>
                                <option value="Prvt98">GANDHI INSTITUTE OF SCIENCE & TECHNOLOGY, KHOLIGUDA, RAYAGADA, (2nd Shift)    </option>
                                <option value="Prvt99">GANDHI INSTITUTE OF TECH. & MGMT. (GITAM), (2nd Shift), GANGAPADA, BHUBANESWAR</option>
                                <option value="Prvt100">HI-TECH INSTITUTE OF TECHN., INDL ESTATE, KHURDA (2nd Shift)</option>
                                <option value="Prvt101">HI-TECH INSTIYUTE OF INF. AND TECH., JEYPORE, (2nd Shift)</option>
                                <option value="Prvt102">INDIC INSTITUTE OF DESIGN & RESEARCH, MUKTAPUR, KHURDA, (2nd Shift)</option>
                                <option value="Prvt103">KRUPAJAL ENGINEERING SCHOOL, PRASANTIVIHAR, BHUBANESWAR, (2nd Shift)</option>
                                <option value="Prvt104">NARAYANI INST. OF ENGG. & TECHNOLOGY, BANARPAL, ANGUL (2nd Shift)</option>
                                <option value="Prvt105">NIGAM INSTITUTE OF ENGINEERING & TECHNOLOGY, BARANGA, CUTTACK, (2nd Shift)</option>
                                <option value="Prvt106">NM INSTITUTE OF ENGG. & TECHNOLOGY, SIJUA, PATRAPADA, BHUBANESWAR (2nd Shift)</option>
                                <option value="Prvt107">OXFORD COLLEGE OF ENGG. & MANANGEMENT, BHUBANESWAR (2nd Shift) </option>
                                <option value="Prvt108">RAJDHANI ENGG. COLLEGE, MANCHESWAR RLY. COLONY, BHUBANESWAR (2nd Shift)</option>
                                <option value="Prvt109">RAYAGADA INST. OF TECH. & MANAGEMENT (RITM), PITAMAHAL, RAYAGADA, (2nd Shift)</option>
                                <option value="Prvt110">SEEMANTA ENGG. COLLEGE, JHAR POKHARIA, MAYURBHANJ (2nd Shift)</option>
                                <option value="Prvt111">SHIBANI INSTITUTE OF TECHNICAL EDUCATION, JANLA, BHUBANESWAR, (2nd Shift)</option>
                                <option value="Prvt112">SPINTRONIC TECHNOLOGY & ADVANCE RESEARCH, BHUBANESWAR, (2nd Shift)</option>
                                <option value="Prvt113">SUDHANANDA ENGINEERING & RESEARCH CENTRE, BHUBANESWAR, (2nd Shift)</option>
                                <option value="Prvt114">SWAMI VIVEKANANDA SCHOOL OF ENGG. & TECH. POLY, BHUBANESWAR (2nd Shift)</option>
                                <option value="Prvt115">TECHNO SCHOOL, PATRAPADA, BHUBANESWAR (2nd Shift)</option>
                                <option value="Prvt116">VEDANG INSTITUTE OF TECHNOLOGY, BHUBANESWAR (2nd Shift)</option>
                                <option value="Prvt117">ADARSHA SCHOOL OF ENGG. & INERNATIONAL POLYTECHNIC, ANGUL, (Part- Time)</option>
                                <option value="Prvt118">NARAYANI INST. OF ENGG. & TECHNOLOGY, BANARPAL, ANGUL (Part- Time)</option>--%>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-1 pleft0">
                        <div class=" form-group  ">
                            <label class="manadatory" id="lblBranch">Branch<span style="font-size: 11px;"></span></label>
                            <select class="form-control" data-val="true" data-val-required="Please select." id="drpBranchName">
                                <option value="0">-Select-</option>
                               <%-- <option value="115">AE&IE</option>
                                <option value="108">AERONAUTICS</option>
                                <option value="101">ARCH. ASST</option>
                                <option value="109">AUTOMOBILE </option>
                                <option value="124">CHEMICAL</option>
                                <option value="122">CIVIL</option>
                                <option value="112">COMP.SCIENCE</option>
                                <option value="104">ELECTRICAL</option>
                                <option value="114">ELECTRICAL & ELECTRONICS</option>
                                <option value="120">ELECTRICAL </option>
                                <option value="119">MECHANICAL</option>
                                <option value="111">ETC</option>
                                <option value="113">INF. TECH</option>
                                <option value="102">MECHANICAL</option>
                                <option value="126">MECHANICAL ENGG. (Maint)</option>
                                <option value="121">MECHANICAL ENGG. (Prod.)</option>
                                <option value="110">DIPLOMA IN MECHANICAL</option>
                                <option value="106">METTALURGY</option>
                                <option value="117">MINING</option>
                                <option value="129">MLT</option>
                                <option value="130">MOM</option>--%>
                            </select>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2 pright0">
                        <div class="form-group">
                            <label for="FinancingGuardianName">Financing Guardian Name</label>
                            <input id="txtFinancingGuardianName" class="form-control" placeholder="Financing Guardian Name" name="" value="" maxlength="30"/>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                        <div class="form-group">
                            <label for="RelationFinancingGurdan">Relation with Financing Guardian</label>
                            <input id="txtFinancingGuardianRelation" class="form-control" placeholder="Relation" name="" value="" maxlength="15"/>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-1 pleft0 pright0">
                        <div class="form-group">
                            <label for="AnnualIncome">Category</label>
                            <select class="form-control" data-val="true" data-val-required="Please select." id="drpCategory" name="Tank Status">
                                <option value="0">-Select-</option>
                                <option value="General">General</option>
                                <option value="SC">SC</option>
                                <option value="ST">ST</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2 pright0">
                        <div class="form-group">
                            <label for="AnnualIncome">Annual Income of Guardian</label>
                            <input id="txtAnnualIncome" class="form-control" placeholder="Annual Income " name="" value="" maxlength="8" autofocus="" onkeypress="return isNumberKey(event);" onchange="AnnualIncome();" />
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 box-container" style="margin-top: 5px;">
                <div class="box-body box-body-open" style="text-align: center; border-top: 1px solid #ccc;">
                    <input type="button" id="btnSubmit" class="btn btn-success" value="Submit" onclick="SubmitData();" />
                    <input type="submit" name="Button1" value="Cancel" id="Button1" class="btn btn-danger" />
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</asp:Content>
