<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InstructionScholar.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.MPSS.InstructionScholar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="/Sambalpur/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="/Sambalpur/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
    <link href="/Sambalpur/css/homestyle.css" type="text/css" rel="stylesheet" />
    <link href="/Sambalpur/css/normalize.min.css" rel="stylesheet" />
    <link href="../../Common/Styles/style.admin.css" rel="stylesheet" />
    <script src="/Sambalpur/js/jquery-2.2.3.min.js" type="text/javascript"></script>

    <!-- IE10 viewport hack START for Surface/desktop Windows 8 bug -->
    <link href="/Sambalpur/css/ie10-viewport-bug-workaround.css" type="text/css" rel="stylesheet" />
    <script src="/Sambalpur/js/ie-emulation-modes-warning.js" type="text/javascript"></script>
    <!-- IE10 viewport hack END for Surface/desktop Windows 8 bug -->
    <script src="../../WebApp/Scripts/DisableBackButton.js"></script>

    <script src="/WebApp/Scripts/CommonScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/ValidationScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Login/js/jquery-1.12.3.js"></script>
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>

    <%--<script src="bootstrap-datetimepicker.min.js"></script>--%>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/WebApp/Login/js/jquery.dataTables.min.js"></script>
    <script src="/WebApp/Citizen/Forms/Js/jqueryDataTableButtons-1.2.4.js"></script>

    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <link href="/WebApp/Login/css/bootstrap.css" rel="stylesheet" />

    <link href="/WebApp/Citizen/Forms/Css/jQueryDataTableButtons.css" rel="stylesheet" />

    <script src="/WebApp/Scripts/CommonScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/ValidationScript.js?v=1.26"></script>
    <link href="/g2c/css/hmepge.bootstrap.css" rel="stylesheet" />

    <style>
        .form-heading {
            color: #820000;
            text-align: left;
            border-left: 15px solid #ce6d07;
            border-right: 2px solid #ce6d07;
            border-top: 1px solid #d8d8d8;
            border-bottom: 1px solid #d8d8d8;
            background: rgba(0, 0, 0, .075);
            padding: 10px 20px 10px 15px;
            border-top-right-radius: 2px;
            border-top-left-radius: 2px;
            text-transform: uppercase;
            font-weight: bold;
            font-size: x-large;
        }

            .form-heading span {
                font-size: 25px;
                padding-left: 0;
            }

        .w3-note {
            background: #99FFE5; /* For browsers that do not support gradients */
            background: -webkit-linear-gradient(#99FFE5, #4DA6FF); /* For Safari 5.1 to 6.0 */
            background: -o-linear-gradient(#99FFE5, #4DA6FF); /* For Opera 11.1 to 12.0 */
            background: -moz-linear-gradient(#99FFE5, #4DA6FF); /* For Firefox 3.6 to 15 */
            background: linear-gradient(#99FFE5, #4DA6FF); /* Standard syntax */
            border-left: 6px solid #ffeb3b;
            text-align: center;
            box-shadow: 0 15px 10px -10px rgba(31, 31, 31, 0.5);
        }

        .w3-panel {
            text-align: center;
            height: 100px;
            padding: 0.01em 16px;
            margin-top: 16px !important;
            margin-bottom: 16px !important;
        }

            .w3-panel p {
                font-size: 30px !important;
                font-weight: bold;
                color: #002CB2 !important;
                padding: 25px 0 0 0;
            }

            .w3-panel span {
                font-size: 18px !important;
                font-weight: bold;
                color: #002751 !important;
            }

        #container {
            width: 100%;
        }

        @media only screen and (max-width: 768px) {
            #container {
                width: 100%;
                margin: 0 auto;
            }
        }

        .SrvDiv {
            background-color: #fff;
            border: solid 1px #ddd;
            color: #045abc;
            width: 49%;
            margin: .5%;
            float: left;
            padding: .5%;
            overflow: auto;
            font-size: 18px;
            border-radius: 5px;
            border-left: solid 5px #438bc8;
        }

            .SrvDiv a {
                color: #337ab7;
                font-size: .9em;
                text-decoration: none;
                font-weight: bold;
            }

                .SrvDiv a:hover {
                    color: #5AB1D0;
                    font-size: .9em;
                    text-decoration: none;
                    font-weight: bolder;
                }

            .SrvDiv img {
                margin-right: 10px;
                border: none;
            }

            .SrvDiv span {
                line-height: 20px;
                margin: 10px 0 0 0;
                color: #767676;
                font-size: .65em;
            }

        .form-heading {
            color: #820000 !important;
            text-align: left;
            border-left: 15px solid #ce6d07;
            border-right: 2px solid #ce6d07;
            border-top: 1px solid #d8d8d8;
            border-bottom: 1px solid #d8d8d8;
            background: rgba(0, 0, 0, .075);
            padding: 10px 20px 10px 15px !important;
            border-top-right-radius: 2px;
            border-top-left-radius: 2px;
            font-weight: bold;
        }

        .PagePrint {
            margin-left: 300px;
            width: 210mm;
            height: 297mm;
        }
        /* ... the rest of the rules ... */
        }
    </style>
    <script>

        function openPage() {
            var url = "/WebApp/Kiosk/MPSS/ScholarShip.aspx";
            window.location.href = url;
            window.location.assign(url);
            window.location = url;
            window.location.replace = url;
            return false;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="PagePrint">
            <div style="text-align: center;">
                <br />
                मध्यप्रदेश शासन
            <br />
                स्कूल शिक्षा विभाग, मंत्रालय, वल्लभ-भवन, भोपाल- 462004
            <br />
                <br />
                ::आदेशः:
            <br />
                भोपाल, दिनांक 26.05.2022
            <br />
                -00-
            <br />
            </div>
            क्रमांक एफ-48-1/2022/20-3 :: प्रदेश में महर्षि पतजंलि संस्कृत संस्थान, से संबद्धता प्राप्त प्राच्य गुरूकुल (अशासकीय छात्रावास युक्त) संचालित है। इन अशासकीय आवासीय विद्यालयों को संलग्न परिशिष्ट- 1 अनुसार राज्य शासन एतद् द्वारा आर्थिक सहायता प्रदान किये जाने की स्वीकृति प्रदान करता है।
  <br />
            <br />
            <div style="text-align: right;">
                <br />
                <br />
                <img align="right" class="form-control" src="/webApp/kiosk/Images/SignPramod.jpg" name="signaturecustomer" style="width: 280px; height: 110px" />
                <br />
                <br />
                <br />
                <br />
                <div class="bottom-right">
                    <br />
                    <br />
                    (प्रमोद सिंह)
                    <br />
                    उप सचिव<br />

                    स्कूल शिक्षा विभाग
           <br />
                    भोपाल, दिनांक 26.05.2022<br />
                </div>
            </div>

            पृष्ठाकंन एफ-48-1/2022/20-3
              <br />
            <br />

            प्रतिलिपि:-
              <br />
            <br />



            1. प्रमुख सचिव, मुख्यमंत्री कार्यालय 2. निज सचिव, मंत्री स्कूल शिक्षा (स्वतंत्र प्रभार) मध्यप्रदेश
             <br />

            3. उप सचिव, मुख्य सचिव कार्यालय
             <br />

            4. आयुक्त, लोक शिक्षण, मध्यप्रदेश भोपाल
             <br />

            5. संचालक, महर्षि पतजंलि संस्कृत संस्थान
             <br />

            6. ऑर्डर
             <br />

            सूचनार्थ एवं आवश्यक कार्यवाही हेतु
             <br />
            <div style="text-align: right;">
                <br />
                <br />
                <img align="right" class="form-control" src="/webApp/kiosk/Images/SignPramod.jpg" name="signaturecustomer" style="width: 280px; height: 110px" />
                <br />
                <br />
                <br />
                <br />
                <div class="bottom-right">
                    <br />
                    <br />
                    (प्रमोद सिंह)
                    <br />
                    उप सचिव<br />

                    स्कूल शिक्षा विभाग
           <br />
                    भोपाल, दिनांक 26.05.2022<br />
                </div>
            </div>
            <br />
            <br />
            <div style="text-align: center;">
                परिशिष्ट- 1
             <br />
                आर्थिक सहायता हेतु नियम एवं निर्देश
              <br />
                <br />
            </div>

            प्रदेश में महर्षि पतंजलि संस्कृत संस्थान, से संबद्धता प्राप्त प्राच्य गुरूकुल (अशासकीय छात्रावास युक्त) संचालित है। इन अशासकीय आवासीय विद्यालयों को निम्नानुसार आर्धिक सहायता प्रदान किया जायेगा ।
              <br />
            1. आर्थिक सहायता प्रस्ताव: -
              <br />
            1.1 हितग्राही- अशासकीय आवासीय संस्कृत प्राच्य विद्यालय जो कि परपंरागत गुरूकुल के नाम से वर्तमान में संचालित है, में अध्ययनरत् विद्यार्थी। वर्तमान में ऐसे 90 अशासकीय प्राच्य गुरूकुल संचालित है।
              <br />
            1.2 आर्थिक सहायता विद्यार्थियों के भोजन, गणवेश, दैनिक आवश्यकता से संबंधित सामग्रियों, पाठ्य पुस्तक एवं पाठ्य सामग्री के लिए देय होगी।
              <br />
            1.3 आर्थिक सहायता प्रति विद्यार्थी के मान से कक्षा 1-5 हेतु रूपये 8,000/- एवं कक्षा 6-12 हेतु रूपये 10,000/- वार्षिक देय होगी। विद्यार्थियों पर होने वाले शेष व्यय इन अशासकीय आवासीय विद्यालयों द्वारा स्वयं व्यय किया जायेगा। 
              <br />
            1.4 कक्षा 1-5 हेतु रूपये 8,000/- में से 7400/- अशासकीय आवासीय विद्यालय को एवं 600/- विद्यार्थी/ अभिभावक के खाते देय होगी। इसी प्रकार कक्षा 6-12 हेतु रुपये 10,000/- में से,
 8800/- अशासकीय आवासीय विद्यालय को एवं 1200/- विद्यार्थी/अभिभावक के खाते में देय होगी। 
              <br />
            2.अशासकीय आवासीय संस्कृत विद्यालयः- 
              <br />
            4.1 महर्षि पंतजलि संस्कृत संस्थान से प्राच्य विद्यालय के रूप में संबद्धता प्राप्त हो ।
              <br />
            3. आर्थिक सहायता प्रदान किये जाने की प्रक्रिया: -
              <br />

            3.1 प्रतिवर्ष महर्षि पंतजलि संस्कृत संस्थान द्वारा कराये गये निरीक्षण प्रतिवेदन में नियमित प्रवेश प्राप्त विद्यार्थियों की संख्या के अनुरूप देय होगी।
              <br />

            3.2 विद्यार्थियों की संख्या की गणना में कक्षा 1-4, प्रवेशिका (कक्षा 5), प्रथमा (कक्षा 6, 7 एवं 8), पूर्व मध्यमा (कक्षा 9 एवं 10) एवं उत्तर मध्यमा (कक्षा 11 एवं 12) के प्रवेशित विद्यार्थियों को शामिल किया जायेगा।
              <br />
            3.3 सत्र प्रारम्भ होने के पश्चात् महर्षि पंतजलि संस्कृत संस्थान द्वारा परीक्षण उपरांत आर्थिक सहायता की राशि रूपये 8,000/- (कक्षा 1-5 के प्रति विद्यार्थी) एवं रूपये 10,000/- (कक्षा 6-12 के प्रति विद्यार्थी) का वितरण खाते में पारदर्शी प्रक्रिया के माध्यम से की जाएगी।
            
            <br />
            3.4 यदि कोई विद्यार्थी किसी कक्षा में अनुत्तीर्ण होता है, तो उसे उसी कक्षा में दोबारा पढ़ने हेतु आर्थिक सहायता की

पात्रता नहीं होगी।
             <br />



            4. यह आर्थिक सहायता स्कूल शिक्षा विभाग की योजना क्रमांक 5545 (महर्षि पतजंलि संस्कृत संस्थान) को अनुदान अन्तर्ग भारित होगा।
     <div style="text-align: right;">
         <br />
         <br />
         <img align="right" class="form-control" src="/webApp/kiosk/Images/SignPramod.jpg" name="signaturecustomer" style="width: 280px; height: 110px" />
         <br />
         <br />
         <br />
         <br />
         <div class="bottom-right">
             <br />
             <br />
             (प्रमोद सिंह)
             <br />
             उप सचिव<br />

             स्कूल शिक्षा विभाग
           <br />
             भोपाल, दिनांक 26.05.2022<br />
         </div>
     </div>
            <div style="text-align: center;">
                <asp:Button ID="btnSubmit" runat="server" CausesValidation="True" ToolTip="OK"
                    CssClass="btn btn-success" Text="Proceed" ValidationGroup="G" OnClientClick="return openPage();" />

            </div>
        </div>

    </form>
</body>
</html>
