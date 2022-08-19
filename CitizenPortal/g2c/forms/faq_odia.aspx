<%@ Page Title="" Language="C#" MasterPageFile="~/g2c/master/HomeOdia.Master" AutoEventWireup="true" CodeBehind="faq_odia.aspx.cs" Inherits="CitizenPortal.g2c.forms.faq_odia" EnableSessionState="False"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .faq-block {
            width: auto;
            max-width: 900px;
            margin-right: auto;
            margin-left: auto;
            padding: 25px;
            margin-bottom: 5px;
        }

        .dsplyflx {
            display: flex;
            padding-top: 4px;
            padding-left: 3px;
            line-height: 20px;
            font-size: 14px;
        }

        .pleft32 {
            padding-left: 18px !important;
        }
    </style>

    <script>
        $(document).ready(function () {
            $('.collapse.in').prev('.panel-headingfaq').addClass('active');
            $('#accordion, #bs-collapse')
                .on('show.bs.collapse', function (a) {
                    $(a.target).prev('.panel-heading').addClass('active');
                })
                .on('hide.bs.collapse', function (a) {
                    $(a.target).prev('.panel-headingfaq').removeClass('active');
                });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbody" runat="server">
    <div class="row">
        <div class="w95">

            <h1>୨୦୧୨ ମସିହା ଓଡିଶା ଲୋକସେବା ଅଧିକାର
                <br />
                ଅଧିନିୟମ ସଙ୍କ୍ରାନ୍ତୀୟ ବହୁ ଜିଜ୍ଞାସିତ ପ୍ରଶ୍ନ ଉତ୍ତର</h1>
            <div class="col-lg-12">
                <div class="panel-group wrap" id="bs-collapse">

                    <div class="panel">
                        <div class="panel-headingfaq">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#bs-collapse" href="#one">୧. ଓଡିଶା ଲୋକସେବା ଅଧିକାର ଅଧିନିୟମ କ’ଣ ?
                                </a>
                            </h4>
                        </div>
                        <div id="one" class="panel-collapse collapse in">
                            <div class="panel-body-faq">
                                <b class="fltleft">ଉ:</b> <span class="dsplyflx">ନିର୍ଦ୍ଧାରିତ ସମୟସୀମା ମଧ୍ୟରେ ଓଡିଶା ରାଜ୍ୟର ନାଗରିକ ମାନଙ୍କୁ ଲୋକସେବା ଯୋଗାଇଦେବା ନିମନ୍ତେ ୨୦୧୨ ମସିହା ସେପ୍ଟେମ୍ବର ମାସରେ ଓଡିଶା ବିଧାନ ସଭାଦ୍ଵାରା ପାରିତ ଏହା ଏକ ଆଇନ ।</span>

                            </div>
                        </div>

                    </div>
                    <!-- end of panel -->

                    <div class="panel">
                        <div class="panel-headingfaq">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#bs-collapse" href="#two">୨. ଏହା କିପରି ନାଗରିକ ମାନଙ୍କୁ ସାହାର୍ଯ୍ୟ କରିବ ?
                                </a>
                            </h4>
                        </div>
                        <div id="two" class="panel-collapse collapse">
                            <div class="panel-body-faq">

                                <b>ଉ :</b>  ଏହି ଆଇନରେ ଅଧିସୂଚିତ ଲୋକ –ସେବା,ନିର୍ଦ୍ଧାରିତ ସମୟସୀମା ମଧ୍ୟରେ ନାଗରିକମାନଙ୍କୁ ଯୋଗାଇ ଦେବାରେ ସାହାର୍ଯ୍ୟ କରିବ ।

                       
                            </div>

                        </div>
                    </div>
                    <!-- end of panel -->

                    <div class="panel">
                        <div class="panel-headingfaq">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#bs-collapse" href="#three">୩ . ଅଧିସୂଚିତ ସେବା ନିମନ୍ତେ ଦରଖାସ୍ତ ଦାଖଲ କଲାପରେ ନାଗରିକ କ’ଣ ପାଇବେ ?
                                </a>
                            </h4>
                        </div>
                        <div id="three" class="panel-collapse collapse">
                            <div class="panel-body-faq">
                                <b>ଉ:</b> ନାମିତ ଅଧିକାରୀ କିମ୍ବା ତାଙ୍କର କ୍ଷମତାପ୍ରାପ୍ତ ପ୍ରତିନିଧୀଙ୍କୁ ଦରଖାସ୍ତ ମିଳିବାପରେ ନାଗରିକ ତାହାର ପ୍ରାପ୍ତି ସ୍ଵୀକୃତି ପାଇବେ ।
                       
                            </div>
                        </div>
                    </div>
                    <!-- end of panel -->

                    <div class="panel">
                        <div class="panel-headingfaq">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#bs-collapse" href="#four">୪ . ପ୍ରାପ୍ତି ସ୍ଵୀକୃତିରେ କଣ ରହିବ ?
                                </a>
                            </h4>
                        </div>
                        <div id="four" class="panel-collapse collapse">
                            <div class="panel-body-faq">
                                <b class="fltleft">ଉ :</b> <span class="dsplyflx">ଯଦି ଦରଖାସ୍ତରେ ଆବଶ୍ୟକୀୟ ଦସ୍ତାବିଜ ସଂଲଗ୍ଣ ହୋଇଥାଏ ତେବେ ବିହିତ ଫର୍ମରେ ପ୍ରଦତ୍ତ ସମୟସୀମାରେ ଶେଷ ତାରିଖ ଦରଜ ଥାଇ ଦରଖାସ୍ତକାରୀଙ୍କୁ ଏକ ପ୍ରାପ୍ତି ସ୍ଵିକୃତି ନିର୍ଗମିତ ମିତ ହେବ । ଅନ୍ୟଥା ସମୟ-ସୀମାର ଶେଷ ତାରିଖ ଉଲ୍ଲିଖିତ ହେବନାହିଁ ।</span>

                            </div>
                        </div>
                    </div>
                    <!-- end of panel -->

                    <div class="panel">
                        <div class="panel-headingfaq">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#bs-collapse" href="#five">୫. କିପରି ଜଣେ ନାଗରିକ ନିଜ ଦରଖାସ୍ତର ଅବସ୍ଥା ସମ୍ବନ୍ଧରେ ଅବଗତ ହେବେ ?
                                </a>
                            </h4>
                        </div>
                        <div id="five" class="panel-collapse collapse">
                            <div class="panel-body-faq">
                                <b>ଉ:</b>ପ୍ରାପ୍ତି ସ୍ଵୀକୃତିରେ ଉଲ୍ଲିଖିତ ନିଜ ଦରଖାସ୍ତର କ୍ରମାଙ୍କ ଓ ତାରିଖ ଦରଜ ଥାଇ,ନାମିତ ଅଧିକାରୀଙ୍କ କାର୍ଜ୍ୟାଳୟରୁ ଉକ୍ତ ଦରଖାସ୍ତର ଅବସ୍ଥା ସମ୍ବନ୍ଧୀୟ ସୂଚନା ନାଗରିକ ପାଇପାରିବେ ?
                       
                            </div>
                        </div>
                    </div>
                    <!-- end of panel -->

                    <div class="panel">
                        <div class="panel-headingfaq">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#bs-collapse" href="#six">୬. ଏହି ଅଧିନିୟମରେ ଅନ୍ତର୍ଭୂକ୍ତ ସେବାଗୁଡିକ ସଂକ୍ରାନ୍ତିରେ ନାଗରିକ କେଉଁଠି ଜାଣି ପରିବେ ?
                                </a>
                            </h4>
                        </div>
                        <div id="six" class="panel-collapse collapse">
                            <div class="panel-body-faq">
                                <b class="fltleft">ଉ :</b> <span class="dsplyflx">ସର୍ବସାଧାରଣଙ୍କ ସୁବିଧା ପାଇଁ ଏହି ଅଧିନିୟମ ଅନୁସାରେ ସେବା ପ୍ରଦାନ ନିମନ୍ତେ ଅଭିପ୍ରେତ ପ୍ରତ୍ୟକ ସରକାରୀ କା... ଳୟ ସୂଚନା ଫଳକ (ନୋଟିସ ବୋର୍ଡ )ରେ ଓଡିଆ ଭାଷାରେ ଲୋକ ସେବାଗୁଡିକ ନିମନ୍ତେ ନିର୍ଦ୍ଧାରିତ ସମୟସୀମା,ଅପିଲ ପ୍ରାଧିକାରୀ ଏବଂ ପୁନଃ ନିରୀକ୍ଷଣ ପ୍ରାଧିକାରୀଙ୍କ ନାମ ଇତ୍ୟାଦି ସଂକ୍ରାନ୍ତୀୟ ସବୁ ସୂଚନା ପ୍ରଦର୍ଶୀତ କରାଯିବ ।</span>

                            </div>
                        </div>
                    </div>
                    <!-- end of panel -->

                    <div class="panel">
                        <div class="panel-headingfaq">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#bs-collapse" href="#seven">୭. ନାମିତ ଅଧିକାରୀଙ୍କ କାର୍ଜ୍ୟାଳୟରେ କିଏ ଦରଖାସ୍ତ ଗ୍ରହଣ କରିବ ?
                                </a>
                            </h4>
                        </div>
                        <div id="seven" class="panel-collapse collapse">
                            <div class="panel-body-faq">
                                <b>ଉ:</b> ନାମିତ ଅଧିକାରୀ ନିଜର ଅଧସ୍ତନ କୌଣସି କର୍ମଚାରୀଙ୍କୁ ଦରଖାସ୍ତ ଗ୍ରହଣ ଏବଂ ପ୍ରାପ୍ତି ସ୍ଵୀକୃତି ନିର୍ଗମନ ନିମନ୍ତେ ପ୍ରାଧିକୃତ ଅଧିକାରୀଙ୍କ ନାମ ସୂଚନା ଫଳକ (ନୋଟିସ ବୋର୍ଡ ) ରେ ପ୍ରଦର୍ଶୀତ ହେବ ।
                       
                            </div>
                        </div>
                    </div>
                    <!-- end of panel -->


                    <div class="panel">
                        <div class="panel-headingfaq">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#bs-collapse" href="#eight">୮. ଦରଖାସ୍ତ ସହିତ କେଉଁ ଦସ୍ତାବିଜ ଗୁଡିକ ସଂଲଗ୍ନ କରାଯିବା ଆବଶକ୍ୟ ?
                                </a>
                            </h4>
                        </div>
                        <div id="eight" class="panel-collapse collapse">
                            <div class="panel-body-faq">
                                <b class="fltleft">ଉ:</b><span class="dsplyflx"> ପ୍ରତେକ ସେବା ପାଇଁ ଦରଖାସ୍ତ ସହିତ ସଂଲଗ୍ନ ହେବାକୁ ଥିବା ଆବଶ୍ୟକୀୟ ଦସ୍ତାବିଜ ଗୁଡିକ ନାମିତ ଅଧିକାରୀଙ୍କ ଦ୍ଵାରା ସୂଚନା ଫଳକ (ନୋଟିସ ବୋର୍ଡ )ରେ ପ୍ରଦର୍ଶିତ ହେବ । ତଦନୁଯାୟୀ ଦରଖାସ୍ତକୁ ସବୁ ଦିଗରୁ ସଂପୂର୍ଣ୍ଣ କରିବା ସହିତ ଆବଶ୍ୟକୀୟ ଦସ୍ତାବିଜ ଗୁଡିକୁ ଦାଖଲ କରିବେ । କେବଳ ଯେଉଁ କ୍ଷେତ୍ରରେ ଦରଖାସ୍ତଟି ସବୁଦିଗରୁ ସଂପୂର୍ଣ୍ଣ ହୋଇଥିବ, ସେଇ କ୍ଷେତ୍ରରେ ସଂପୃକ୍ତ ଅଧିକାରୀଙ୍କ ସେବା ଯୋଗାଣର ସମୟସୀମାର ଶେଷ ତାରିଖ ଉଲ୍ଲିଖିତ ହେବ ।</span>

                            </div>
                        </div>
                    </div>
                    <!-- end of panel -->

                    <div class="panel">
                        <div class="panel-headingfaq">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#bs-collapse" href="#nine">୯. ଯଦି ନାମିତ ଅଧିକାରୀ ସେବା ଯୋଗାଇଦେବାକୁ ମନା କରନ୍ତି କିମ୍ବା ବିଳମ୍ବ କରନ୍ତି ତେବେ ସେ ତାହା ଦରଖାସ୍ତକାରୀଙ୍କୁ କିପରି ସଂସୂଚିତ କରିବେ ।
                                </a>
                            </h4>
                        </div>
                        <div id="nine" class="panel-collapse collapse">
                            <div class="panel-body-faq">
                                <b>ଉ:</b> ନାମିତ ଅଧିକାରୀ ନିମ୍ନୋକ୍ତ ଦିଗଗୁଡିକୁ ବର୍ଣନା କରି ଦରଖାସ୍ତକାରୀଙ୍କୁ ସଂସୂଚିତ :<br />
                                <ul>
                                    <li>ଏପରି ପ୍ରତ୍ୟାଖ୍ୟାନ ବା ବିଳମ୍ବର କାରଣ ।</li>
                                    <li>ଏପରି ପ୍ରତ୍ୟାଖ୍ୟାନ କିମ୍ବା ବିଳମ୍ବ ବିରୁଦ୍ଧରେ କେତେଦିନ ମଧ୍ୟରେ ଏକ ଅପିଲ ଦାଏର କରାଯାଇ ପାରିବ </li>
                                    <li>ଅପିଲ ପ୍ରାଧିକାରୀଙ୍କ ସଂକ୍ରାନ୍ତରେ ଉପଲବ୍ଧ ସମସ୍ତ ଯୋଗାଯୋଗ ସୂଚନା ସମେତ ସବୁ ବିବରଣୀ ।</li>
                                </ul>

                            </div>
                        </div>
                    </div>
                    <!-- end of panel -->

                    <div class="panel">
                        <div class="panel-headingfaq">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#bs-collapse" href="#ten">୧୦. ପ୍ରତେକ ସେବା ପ୍ରଦାନର ନିର୍ଦ୍ଧାରିତ ସମୟସୀମା ସରକାରୀ ଛୁଟି ଦିବସ ଗୁଡିକ ଅନ୍ତର୍ଭୂକ୍ତ କରୁଛି କି ?
                                </a>
                            </h4>
                        </div>
                        <div id="ten" class="panel-collapse collapse">
                            <div class="panel-body-faq">
                                <b>ଉ:</b> ନାଁ,ସେବା ଯୋଗାଣ ନିମନ୍ତେ ପ୍ରଦତ୍ତ ସମୟସୀମାରେ ସରକାରୀ ଛୁଟି ଦିବସ ଗୁଡିକ ଅନ୍ତର୍ଭୂକ୍ତ ହେବ ନାହିଁ
                            </div>
                        </div>
                    </div>
                    <!-- end of panel -->


                    <div class="panel">
                        <div class="panel-headingfaq">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#bs-collapse" href="#eleven">୧୧.  କିଏ ଅପିଲ ଦାଏର କରିପାରିବେ ?
                                </a>
                            </h4>
                        </div>
                        <div id="eleven" class="panel-collapse collapse">
                            <div class="panel-body-faq">
                                <b>ଉ:</b> ଯେଉଁ ଦରଖାସ୍ତଟି ନାମିତ ଅଧିକାରୀଙ୍କ ଦ୍ଵାରା ନାକଚ ହୋଇଥିବ କିମ୍ବା ଯାହାଙ୍କୁ ପ୍ରଦତ୍ତ ସମୟସୀମା ମଧ୍ୟରେ ସେବା ଯୋଗାଇ ଦିଆଯାଇ ନଥିବ,ସେ ଅପିଲ ଦାଏର କରିପାରିବେ ।
                            </div>
                        </div>
                    </div>
                    <!-- end of panel -->


                    <div class="panel">
                        <div class="panel-headingfaq">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#bs-collapse" href="#tweleve">୧୨. କ୍ଷୁବ୍ଧ ଦରଖାସ୍ତକାରୀ ନାମିତ ଅଧିକାରୀଙ୍କ ଆଦେଶ ବିରୁଦ୍ଧରେ କେତେଦିନ ମଧ୍ୟରେ ଏକ ଅପିଲ ଦାଏର କରିପାରିବେ ?
                                </a>
                            </h4>
                        </div>
                        <div id="tweleve" class="panel-collapse collapse">
                            <div class="panel-body-faq">
                                <b class="fltleft">ଉ :</b><span class="dsplyflx">ପ୍ରଦତ୍ତ ସମୟସୀମା ଅତିକ୍ରାନ୍ତ ଦେବା ପରଠାରୁ କିମ୍ବା ଦରଖାସ୍ତଟିର ନାକଚ ଆଦେଶ ପ୍ରାପ୍ତି ତାରିଖରୁ ୩୦ (ତିରିଶ) ଦିନ ମଧ୍ୟରେ ଦରଖାସ୍ତକାରୀ ଅପିଲ ଦାଏର କରିପାରିବେ ପୁନଶ୍ଚ ଅପିଲ ଦାଏର ପ୍ରାଧିକାରୀ ଯଦି ସନ୍ତୁଷ୍ଟ ହୁଅନ୍ତି ଯେ, ଦରଖାସ୍ତକାରୀ ସମୟସୀମାମଧ୍ୟରେ ଅପିଲ ଦାଏର ନକରି ପାରିବାରେ ପର୍ଜ୍ୟାପ୍ତ /ଯଥେଷ୍ଟ କାରଣ ବଶତଃ ପ୍ରତିରୋଧିତ ହୋଇଛନ୍ତି ,ତେବେ ସେ ୯୦ (ନବେ)ଦିନ ମଧ୍ୟରେ ଉକ୍ତ ଅପିଲକୁ ଗ୍ରହଣ କରିପାରିବେ ।</span>
                            </div>
                        </div>
                    </div>
                    <!-- end of panel -->

                    <div class="panel">
                        <div class="panel-headingfaq">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#bs-collapse" href="#thirteen">୧୩.	ନାମିତ ଅଧିକାରୀଙ୍କ ଆଦେଶ ବିରୁଦ୍ଧରେ ଜଣେ ଦରଖାସ୍ତକାରୀ କିପରି ଏକ ଅପିଲ ଦାଏର କରିପାରିବେ</a>
                            </h4>
                        </div>
                        <div id="thirteen" class="panel-collapse collapse">
                            <div class="panel-body-faq">
                                <b>ଉ:</b> ନାମିତ ଅଧିକାରୀଙ୍କ ଆଦେଶଦ୍ଵାରା କ୍ଷୁବ୍ଧ ଦରଖାସ୍ତକାରୀ ଅପିଲ ପ୍ରାଧିକାରୀଙ୍କ ସମ୍ବନ୍ଧରେ ନିମ୍ନୋକ୍ତ ସୂଚନା ସମ୍ବଳିତ ଏକ ଅପିଲ ଦାଏର କରିପାରିବେ :
                                <br />
                                <ul>
                                    <li>(୧)ଅପିଲ ଚାଉଁଥିବା ବ୍ୟକ୍ତି ଦରଖାସ୍ତକାରୀଙ୍କ ନାମ ଓ ଠିକଣା ।</li>
                                    <li>(୨ )ଯେଉଁ ନାମିତ ଆଦିକାରୀଙ୍କ ସିଦ୍ଦାନ୍ତ ବିରୁଦ୍ଧରେ ଅପିଲ ଉପସ୍ଥାପିତ ହେବାକୁ ଯାଉଛି,ଯଥାସାଧ୍ୟ ସମ୍ଭବ ତାଙ୍କର ନାମ ଓ ଠିକଣା । </li>
                                    <li>(୩ )ଯେଉଁ ଅଦେଶ୍ୟ ବିରୁଦ୍ଧରେ ଅପିଲ ପ.... ବସିତ ତାହାର ସାରାଂଶ । </li>
                                    <li>(୪ )ଯଦି ଦରଖାସ୍ତର ପ୍ରାପ୍ତି ସ୍ଵୀକୃତି ମିଳି ନଥାଏ ତେବେ ସେପରି କ୍ଷେତ୍ରରେ ଦରଖାସ୍ତର ତାରିଖ ସହିତ ନାମିତ ଅଧିକାରୀଙ୍କ ନାମ ଓ ଠିକଣା । </li>
                                    <li>( ୫ ) ଅପିଲର ଭିତଭୂମି । </li>
                                    <li>(୬ ) ପ୍ରାର୍ଥିତ ଉପଶମ । </li>
                                    <li>(୮) ଅପିଲ ସମାପନ ନିମନ୍ତେ ଆବଶ୍ୟକୀୟ ଅନ୍ୟ ଯେକୌଣସି ସମ୍ପର୍କିତ ସୂଚନା ।</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- end of panel -->

                    <div class="panel">
                        <div class="panel-headingfaq">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#bs-collapse" href="#forteen">୧୪.	ଅପିଲ ଦରଖାସ୍ତ ସହିତ କେଉଁ ଦସ୍ତାବିଜସବୁ ସଂଲଗ୍ନ କରାଯିବା ଆବଶ୍ୟକ ?</a>
                            </h4>
                        </div>
                        <div id="forteen" class="panel-collapse collapse">
                            <div class="panel-body-faq">
                                <b>ଉ:</b> ଅପିଲ ଦରଖାସ୍ତ ସହିତ ନିମ୍ନୋକ୍ତ ଦସ୍ତାବିଜଗୁଡିକୁ ସଂଲଗ୍ନ କରାଯିବ ।<br />
                                <ul>
                                    <li>(୧) ଅପିଲ ସହିତ ସଂଲଗ୍ନ ଦସ୍ତାବିଜଗୁଡିକର ବିଷୟବସ୍ତୁର ସାରାଂଶ ।</li>
                                    <li>(୨)ଯେଉଁ ଆଦେଶ ବିରୁଦ୍ଧରେ ଅପିଲ କରାଯାଉଛି ତାହାର ସ୍ଵ ଅଣୁପ୍ରମାଣିତ ନକଲ ।</li>
                                    <li>(୩) ଅପିଲ ଦରଖାସ୍ତରେ ଉଲ୍ଲିଖିତ ଦସ୍ତାବିଜଗୁଡିକର ନକଲ ।</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- end of panel -->

                    <div class="panel">
                        <div class="panel-headingfaq">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#bs-collapse" href="#fifteen">୧୫.	ଅପିଲ ପ୍ରାଧିକାରୀଙ୍କ ଦ୍ଵାରା ଅପିଲ ଫଇସଲା କରିବା ନିମନ୍ତେ କୌଣସି ବିହିତ ସମୟସୀମା ଅଛି କି ?</a>
                            </h4>
                        </div>
                        <div id="fifteen" class="panel-collapse collapse">
                            <div class="panel-body-faq">
                                <b>ଉ:</b> ଅପିଲ ପ୍ରାଧିକାରୀ ଅପିଲ ଦାଏର ହେବା ତାରିଖଠାରୁ ୩୦ (ତିରିଶ)ଦିନ ମଧ୍ୟରେ ଉକ୍ତ ଅପିଲଟିକୁ ଫଇସଲା କରିବେ ଏବଂ ତାଙ୍କ ଆଦେଶରେ ସମୟସୀମା ନିର୍ଧାରଣ ପୂର୍ବକ ସେବା-ଯୋଗାଣ ନିମନ୍ତେ ନାମିତ ଅଧିକାରୀଙ୍କୁ ନିର୍ଦେଶ ଦେବେ ।
                            </div>
                        </div>
                    </div>
                    <!-- end of panel -->

                    <div class="panel">
                        <div class="panel-headingfaq">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#bs-collapse" href="#sixteen">୧୬. ଜଣେ ଦରଖାସ୍ତକାରୀ ସିଧା-ସଳଖ ବିଭାଗୀୟ ଶାସନ ସଚିବ କିମ୍ବା ରାଜ୍ୟ ସରକାରଙ୍କ ନିକଟରେ ଦରଖାସ୍ତ ଦାଖଲ କରିପାରିବେ କି ?</a>
                            </h4>
                        </div>
                        <div id="sixteen" class="panel-collapse collapse">
                            <div class="panel-body-faq">
                                <b class="fltleft">ଉ:</b><span class="dsplyflx"> ହଁ, ଦରଖାସ୍ତକାରୀ ସିଧାସଳଖ ବିଭାଗୀୟ ଶାସନ ସଚିବ କିମ୍ବା ରାଜ୍ୟ ସରକାରଙ୍କ ନିକଟରେ ଦରଖାସ୍ତ ଦାଖଲ କାରୀ ପରିବେ । ସ୍ଥଳେ ଦରଖାସ୍ତଟିକୁ ସଂପୃକ୍ତ ଅପିଲ ପ୍ରାଧିକାରୀଙ୍କ ନିକଟକୁ ସିଧାସଳଖ ପଠାଇ ଦିଆଯିବ ଏବଂ ଅପିଲ ପ୍ରାଧିକାରୀ ଦରଖାସ୍ତଟିକୁ ଅପିଲ ପରି ଏକା ପଦ୍ଦତିରେ ଫଇସଲା କରିବେ ।</span>
                            </div>
                        </div>
                    </div>
                    <!-- end of panel -->

                    <div class="panel">
                        <div class="panel-headingfaq">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#bs-collapse" href="#seventeen">୧୭.	କିଏ ପୁନଃରୀକ୍ଷିଣ ଦାଏର କରିବାକୁ ପସନ୍ଦ କରିବେ ?</a>
                            </h4>
                        </div>
                        <div id="seventeen" class="panel-collapse collapse">
                            <div class="panel-body-faq">
                                <b>ଉ:</b> ଅପିଲ ପ୍ରାଧିକାରୀଙ୍କ ଆଦେସରେ କ୍ଷୁବ୍ଧ ଜଣେ ଅପିଲକାରୀ ପୁନଃରୀକ୍ଷିଣ ପ୍ରାଧିକାରୀଙ୍କ ସମକ୍ଷରେ ପୁନଃରୀକ୍ଷିଣ ଦରଖାସ୍ତ ଦାଖଲ କରିପାରିବେ
                            </div>
                        </div>
                    </div>
                    <!-- end of panel -->

                    <div class="panel">
                        <div class="panel-headingfaq">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#bs-collapse" href="#eighteen">୧୮. କେଉଁ ସମୟସୀମା ମଧ୍ୟରେ ପୁନଃରୀକ୍ଷିଣ ଦରଖାସ୍ତ ଦାଖଲ କରାଯାଇପାରିବ ?</a>
                            </h4>
                        </div>
                        <div id="eighteen" class="panel-collapse collapse">
                            <div class="panel-body-faq">
                                <b class="fltleft">ଉ:</b><span class="dsplyflx">ଅପିଲ ପ୍ରାଧିକାରୀଙ୍କ ଆଦେଶରେ କ୍ଷୁବ୍ଧ ଅପିଲକାରୀ କିମ୍ବା ନାମିତ ଅଧିକାରୀ ଉକ୍ତ ଆଦେଶର ୩୦(ତିରିଶ)ଦିନ ମଧ୍ୟରେ ଅତିକ୍ରାକ୍ତ ହୋଇପାରେ ପୁନଃରୀକ୍ଷିଣ ଦରଖାସ୍ତ ପୁନଃରୀକ୍ଷିଣ ପ୍ରାଧିକାରୀଙ୍କ ସମକ୍ଷରେ ଦାଖଲ କାରି ପାରିବେ ପୁନଶ୍ଚ, ପୁନଃରୀକ୍ଷିଣ ପ୍ରାଧିକାରୀ ଯଦି ସନ୍ତୁଷ୍ଟ ହୁଅନ୍ତିଯେ ଦରଖାସ୍ତକାରୀ ସମୟସୀମା ମଧ୍ୟରେ ଯଥେଷ୍ଟ କାରଣ ଯୋ... ପୁନଃରୀକ୍ଷିଣ ଦରଖାସ୍ତ କରିବାକୁ ପ୍ରତିରୋଧିତ ହୋଇଛନ୍ତି,ତେବେ ସେ ୬୦(ଷାଠିଏ)ଦିନ ପର୍ଯ୍ୟନ୍ତ ପୁନଃରୀକ୍ଷିଣ ଦରଖାସ୍ତ ଗ୍ରହଣ କରିପାରିବେ।</span>
                            </div>
                        </div>
                    </div>
                    <!-- end of panel -->

                    <div class="panel">
                        <div class="panel-headingfaq">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#bs-collapse" href="#nineteen">୧୯.	ଅପିଲ ପ୍ରାଧିକାରୀଙ୍କ ଆଦେଶ ବିରୁଦ୍ଧରେ ଦରଖାସ୍ତକାରୀ କିପରି ପୁନଃରୀକ୍ଷଣ ଦରଖାସ୍ତ ଦାଖଲ କରିବେ?</a>
                            </h4>
                        </div>
                        <div id="nineteen" class="panel-collapse collapse">
                            <div class="panel-body-faq">
                                <b>ଉ:</b> ଅପିଲ ପ୍ରାଧିକାରୀଙ୍କ ଆଦେଶରେ କ୍ଷୁବ୍ଧ ଜଣେ ଦରଖାସ୍ତକାରୀ ନିମ୍ନୋକ୍ତ ସୂଚନା ଶମ୍ବଳିତ ଏହି ପୁନଃରୀକ୍ଷିଣ ଦରଖାସ୍ତ ପୁନଃରୀକ୍ଷିଣ ପ୍ରାଧିକାରୀଙ୍କ ସମକ୍ଷରେ ଦାଖଲ କରିପାରିବେ<br />
                                <ul>
                                    <li>(୧) ପୁନଃରୀକ୍ଷିଣ ଚାହୁଁଥିବା ଦରଖାସ୍ତକାରୀ କିମ୍ବା ବ୍ୟକ୍ତିଙ୍କ ନାମ ଓ ଠିକଣା </li>
                                    <li>(୨) ଉପସ୍ଥାପ୍ୟ ପୁନଃରୀକ୍ଷିଣ ଦରଖାସ୍ତଟି ଯେଉଁ ନାମିତ ଅଧିକାରୀ/ଅପିଲ ପ୍ରାଧିକାରୀଙ୍କ ସିଦ୍ଧାନ୍ତ ବିରୁଦ୍ଧର ଉଦ୍ଧିଷ୍ଟ, ଯଥାସଧ୍ୟ ସମ୍ଭବ, ତାଙ୍କ ନାମ ଓ ଠିକଣା । </li>
                                    <li>(୩) ଯେଉଁ ଆଦେଶ ବିରୁଦ୍ଧରେ ପୁନଃରୀକ୍ଷିଣ କରାଯାଉଛି ସେହି ଆଦେଶଟିର ସାରାଂଶ । </li>
                                    <li>(୪) ଦରଖାସ୍ତର ପ୍ରାପ୍ତିସ୍ଵୀକୃତି ନ ମିଳିବା କାରଣରୁ ଅପିଲ କରାଯାଇଥିଲେ ଉକ୍ତ ଦରଖାସ୍ତ ଦାଖଲ ତାରିଖ ସହିତ ନାମିତ ଅଧିକାରଙ୍କ ନାମ ଓ ଠିକଣା । </li>
                                    <li>(୫) ଅପିଲ କିମ୍ବା ପୁନଃରୀକ୍ଷିଣର ଭିତ୍ତିଭୂମି ।</li>
                                    <li>(୬) ପ୍ରାର୍ଥୀତ ଉପଶମ ।</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- end of panel -->

                    <div class="panel">
                        <div class="panel-headingfaq">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#bs-collapse" href="#twenty">୨୦. ପୁନଃରୀକ୍ଷିଣ ଦରଖାସ୍ତ ସହିତ କେଉଁ ଦସ୍ତାବିଜ ଗୁଡିକ ସଂଲଗ୍ନ କରାଯିବ ?</a>
                            </h4>
                        </div>
                        <div id="twenty" class="panel-collapse collapse">
                            <div class="panel-body-faq">
                                <b>ଉ:</b> ପୁନଃରୀକ୍ଷିଣ ଦରଖାସ୍ତ ସହିତ ନିମ୍ନୋକ୍ତ ଦସ୍ତାବିଜଗୁଡିକ ସଂଲଗ୍ନ କରାଯିବା ଆବଶ୍ୟକ :<br />
                                <p>
                                    <span class="pleft32">(୧) ପୁନଃରୀକ୍ଷିଣ ଦରଖାସ୍ତ ସହିତ ସଂଲଗ୍ନ ଦସ୍ତାବିଜ ଅନ୍ତର୍ଗତ ବିଷୟବସ୍ତୁର ଏକ ସାରଣୀ ।</span><br />
                                    <span class="pleft32">(୨) ଯେଉଁ ଆଦେଶ ବିରୁଦ୍ଧରେ ପୁନଃରୀକ୍ଷିଣ କରାଯାଉଛି ତାହାର ଏକ ସ୍ଵ-ଅଣୁପ୍ରମାଣିତ ନକଲ ।</span><br />
                                    <span class="pleft32">(୩) ପୁନଃରୀକ୍ଷିଣ ନିମନ୍ତ୍ରେ ଦରଖାସ୍ତରେ ଉଲ୍ଲିଖିତ ଦସ୍ତାବିଜ ଗୁଡିକର ନକଲ ।</span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <!-- end of panel -->

                    <div class="panel">
                        <div class="panel-headingfaq">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#bs-collapse" href="#twentyone">୨୧. ଅପିଲ କିମ୍ବା ପୁନଃରୀକ୍ଷିଣ ସିଦ୍ଧାନ୍ତ ଗ୍ରହଣ ନିମନ୍ତେ କେଉଁ ସବୁ ପଦ୍ଧତି ଅନୁସୃତ ହେବ ?</a>
                            </h4>
                        </div>
                        <div id="twentyone" class="panel-collapse collapse">
                            <div class="panel-body-faq">
                                <b>ଉ:</b> ଅପିଲ କିମ୍ବା ପୁନଃରୀକ୍ଷିଣ ସିଦ୍ଧାନ୍ତ ଗ୍ରହଣ ନିମନ୍ତେ ନିମ୍ନୋକ୍ତ ପଦ୍ଧତି ଅନୁସୃତ ହେବ:<br />
                                <p>
                                    <span class="pleft32">(୧) ସଂପୃକ୍ତ ଦସ୍ତାବିଜ ଗୁଡିକ,ସରକାରୀ ନଥିପତ୍ର କିମ୍ବା ସେଗୁଡିକର ନକଲ ପୁନଃରୀକ୍ଷିଣ ହେବ ।<br />
                                    </span>
                                    <span class="pleft32">(୨)କୌଣସି ଅସାଧାରଣ ପରିସ୍ଥିରେ ଆବଶ୍ୟକୀୟ ଅନୁସନ୍ଧାନ ନିମନ୍ତେ କୌଣସି ଜଣେ ଅଧିକାରୀଙ୍କୁ ପ୍ରାଧିକୃତ କରାଯିବ ।</span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <!-- end of panel -->

                    <div class="panel">
                        <div class="panel-headingfaq">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#bs-collapse" href="#twentytwo">୨୨. ଅପିଲ କିମ୍ବା ପୁନଃରୀକ୍ଷିଣର ଶୁଣିବା ତାରିଖ,ସଂପୃକ୍ତ ପକ୍ଷଙ୍କୁ କିପରି ଜଣାଇ ଦିଆଯିବ ?</a>
                            </h4>
                        </div>
                        <div id="twentytwo" class="panel-collapse collapse">
                            <div class="panel-body-faq">
                                <b>ଉ:</b> ନିମ୍ନୋକ୍ତ ପଦ୍ଧତି ମଧ୍ୟରୁ ଯେକୌଣସି ଗୋଟିଏ ପଦ୍ଧତି ମାଧ୍ୟମରେ ଅପିଲ ବା ପୁନଃରୀକ୍ଷିଣ ପାଇଁ ଦରଖାସ୍ତଟିର ଶୁଣାଣି ର ସୂଚନା ପ୍ରଦାନ କରାଯିବ ।
                            </div>
                        </div>
                    </div>
                    <!-- end of panel -->

                    <div class="panel">
                        <div class="panel-headingfaq">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#bs-collapse" href="#twentythree">୨୩.	ଅପିଲ ପ୍ରାଧିକାରୀ ଏବଂ ପୁନଃରୀକ୍ଷିଣ ପ୍ରାଧିକାରୀଙ୍କ ସମକ୍ଷରେ ହଜାର ହେବା ଦିବସର କେତେଦିନ ପୂର୍ବରୁ ନୋଟିସ କାରୀ କରାଯିବା ଆବଶ୍ୟକ ?</a>
                            </h4>
                        </div>
                        <div id="twentythree" class="panel-collapse collapse">
                            <div class="panel-body-faq">
                                <b>ଉ:</b> ସବୁ ପରିସ୍ଥିତିରେ ଦରଖାସ୍ତକାରୀ/ନାମିତ ଅଧିକାରୀ /ଅପିଲ ପ୍ରାଧିକାରୀ /ଅଧସ୍ତନ କର୍ମଚାରିମାନଙ୍କୁ ଶୁଣା... ତାରିଖକୁ ଅନ୍ତତଃ ପକ୍ଷେ ସାତଦିନ ପୂର୍ବରୁ ଜଣାଇ ଦିଆଯିବ ।<br />

                            </div>
                        </div>
                    </div>
                    <!-- end of panel -->

                    <div class="panel">
                        <div class="panel-headingfaq">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#bs-collapse" href="#thirtythree">୨୪.	ଅପିଲ ଏବଂ ପୁନଃରୀକ୍ଷିଣ ଆଦେଶ ଯୋଗାଇଦେବା ନିମନ୍ତେ କୌଣସି ବ୍ୟବସ୍ଥା ଅଛିକି ?</a>
                            </h4>
                        </div>
                        <div id="thirtythree" class="panel-collapse collapse">
                            <div class="panel-body-faq">
                                <b>ଉ:</b> ହଁ, ଅପିଲ ଏବଂ ପୁନଃରୀକ୍ଷିଣ ଆଦେଶ ଯୋଗାଇଦେବା ନିମନ୍ତେ ବ୍ୟବସ୍ଥା ରହିଛି :<br />
                                <p>
                                    <span class="pleft32">(୧) ଅପିଲ ଏବଂ ପୁନଃରୀକ୍ଷିଣ ଆଦେଶ ଯଥାସ୍ଥିତି,ଶୁଣା... ସମୟରେ ପଢାଯିବ ଏବଂ ତାହା ମଧ୍ୟ ଲିପିବଦ୍ଧ କରାଯିବ ।<br />
                                    </span>
                                    <span class="pleft32">(୨) ଅପିଲ ଆଦେଶର ନକଲ ଦରଖାସ୍ତକାରୀ ଏବଂ ନାମିତ ଅଧିକାରଙ୍କୁ ପ୍ରଦାନ କରାଯିବ,<br />
                                    </span>
                                    <span class="pleft32">(୩) ପୁନଃରୀକ୍ଷିଣ ଆଦେଶ ନକଲ, ଦରଖାସ୍ତକାରୀ,ନାମିତ ଅଧିକାରୀ, ଅଧସ୍ତନ କର୍ମଚାରୀ ଏବଂ ଅପିଲ ପ୍ରାଧିକାରୀଙ୍କୁ ପ୍ରଦାନ କରାଯିବ ।</span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <!-- end of panel -->

                    <div class="panel">
                        <div class="panel-headingfaq">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#bs-collapse" href="#twentyfour">୨୫.	ସେବା ପ୍ରଦାନରେ ବିଫଳ ହୋଇଥିବା ସଂପୃକ୍ତ ନାମିତ ଅଧିକାରୀଙ୍କ ଉପରେ ଜୋରିନାମା କରାଯିବାର କୌଣସି ବ୍ୟବସ୍ଥା ଅଛିକି ?</a>
                            </h4>
                        </div>
                        <div id="twentyfour" class="panel-collapse collapse">
                            <div class="panel-body-faq">
                                <b>ଉ:</b> ଶୁଣାଣି ପରେ, ପୁନଃରୀକ୍ଷିଣ ଅଧିକାରୀ,ବୀନା ଯଥେଷ୍ଟ ଓ ଉପଯୁକ୍ତ କାରଣରେ ସେବା ପ୍ରଦାନରେ ବିଫଳ ହୋଇଥିବା ନାମିତ ଅଧିକାରୀ ଏବଂ ଅପିଲ ପ୍ରାଧିକାରୀଙ୍କୁ କୋରିମାନ ଦଣ୍ଡରେ ଦଣ୍ଡିତ କରିପାରିବେ। ପୁନଶ୍ଚ ସେ ଲୋକସେବା ଯୋଗାଣରେ ବିଳମ୍ବ ନିମନ୍ତେ ମଧ୍ୟ ସେମାନଙ୍କୁ ଜୋରିମାନ କରିପାରିବେ।<br />
                            </div>
                        </div>
                    </div>
                    <!-- end of panel -->

                    <div class="panel">
                        <div class="panel-headingfaq">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#bs-collapse" href="#twentyfive">୨୬. ଜୋରିମାନର ପରିମାଣ କେତେ ?</a>
                            </h4>
                        </div>
                        <div id="twentyfive" class="panel-collapse collapse">
                            <div class="panel-body-faq">
                                <b class="fltleft">ଉ:</b><span class="dsplyflx"> ଯଥେଷ୍ଟ ଓ ଉପଯୁକ୍ତ କାରଣ ବ୍ୟତୀତ ସେବା ଯୋଗାଣରେ ବିଫଳ ହୋଇଥିବା ନାମିତ ଅଧିକାରୀ କିମ୍ବା ଅପିଲ ପ୍ରାଧିକାରୀ କିମ୍ବା ସଂପୃକ୍ତ ଅଧସ୍ତନ କର୍ମଚାରୀଙ୍କ ଉପରେ ପୁନଃରୀକ୍ଷିଣ ଅଧିକାରୀ ଅଧିକାରୀ ଅନ୍ୟୁନ ୫,୦୦୦ /- (ପାଞ୍ଚ ହଜାର ଟଙ୍କା ) ପର୍ଯ୍ୟନ୍ତ ଜୋରିମାନା କରିପାରିବେ ।<br />
                                    ସେବା ଯୋଗାଣରେ ପ୍ରତ୍ୟକ ଦିନର ବିଳମ୍ବ ନିମନ୍ତେ ପୁନଃରୀକ୍ଷିଣ ଅଧିକାରୀ ମଧ୍ୟ ଅନ୍ୟୁନ ଟ . ୨୫୦/- (ଦୁଇ ଶହ ପଚାଶ ) ଟଙ୍କା ହିସାବରେ ଜୋରିମାନା କରିପାରିବେ ।</span>
                            </div>
                        </div>
                    </div>
                    <!-- end of panel -->

                    <div class="panel">
                        <div class="panel-headingfaq">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#bs-collapse" href="#twentysix">୨୭. ଜୋରିମାନ କିପରି ଆଦାୟ କରାଯିବ ?</a>
                            </h4>
                        </div>
                        <div id="twentysix" class="panel-collapse collapse">
                            <div class="panel-body-faq">
                                <b class="fltleft">ଉ:</b><span class="dsplyflx"> ଏହି ଅଧିନିୟମ ଅନୁସାରେ ଆରୋପିତ ଜୋରିମାନା ସଂପୃକ୍ତ ନାମିତ ଅଧିକାରୀ କିମ୍ବା ଅପିଲ ପ୍ରାଧିକାରୀ କିମ୍ବା ସଂପୃକ୍ତ ଅଧସ୍ତନ କର୍ମଚାରୀଙ୍କର ଯଥାସ୍ଥିତି,ବେତନ/ମାନଦେୟ/ ପାରିତୋଷିକରୁ ଆଦାୟ କରାଯିବ ।<br>
                                    ଜୋରିମାନର ଅର୍ଥ ରାଶି ନିମ୍ନୋକ୍ତ ହିସାବ ଶୀର୍ଷରେ ଜମାଦେବା ନିମନ୍ତେ ଅର୍ଥ ବଭାଗ ସ୍ଥିର କରିଛନ୍ତି : “0070-Other Administrative Services-60- Other Services-800-Other Receipts-0097-Misc. Receipts-02214-Fines under Odisha Right to Public Service Act.”</span>
                            </div>
                        </div>
                    </div>
                    <!-- end of panel -->

                    <div class="panel">
                        <div class="panel-headingfaq">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#bs-collapse" href="#twentyseven">୨୮.	ଅପିଲ ପ୍ରାଧିକାରୀ ଏବଂ ପୁନଃରୀକ୍ଷିଣ ପ୍ରାଧିକାରୀଙ୍କ ଅଦାଲତର କି କ୍ଷମତା ଅଛି ?</a>
                            </h4>
                        </div>
                        <div id="twentyseven" class="panel-collapse collapse">
                            <div class="panel-body-faq">
                                <b class="fltleft">ଉ :</b><span class="dsplyflx"> ଏହି ଅଧିନିୟମ ଅନ୍ତର୍ଗତ ଏକ ଅପିଲ ଏବଂ ପୁନଃରୀକ୍ଷିଣକୁ ବିଚାର କଲାବେଳେ ନିମ୍ନୋକ୍ତ ବିଷୟରେ ଦେୱାନି ଅଦାଲତ ଉପରେ ଯେଉଁସବୁ କ୍ଷମତା ନ୍ୟସ୍ତ କରାଯାଇଛି ସେହିସବୁ କ୍ଷମତା ଅପିଲ ପ୍ରାଧିକାରୀ ଏବଂ ପୁନଃରୀକ୍ଷିଣ ପ୍ରାଧିକାରୀଙ୍କ ରହିବ ।</span><br />
                                <span class="pleft32">(୧) ଦସ୍ତାବିଜ ଗୁଡିକର ଉପସ୍ଥାପନ ଓ ନିରୀକ୍ଷଣ ଆବଶ୍ୟକ କରାଇବା ।</span><br />
                                <span class="pleft32">(୨) ନାମିତ ଅଧିକାରୀ ଓ ଅପିଲକାରୀଙ୍କ ଉପରେ ଶୁଣା.. ବେଳେ ସମନ ଜାରି କରିବା । </span>
                                <br />
                                <span class="pleft32">(୩) ଅନ୍ୟ ଯେ କୌଣସି ବିହିତ ବିଷୟ ।</span>
                            </div>
                        </div>
                    </div>
                    <!-- end of panel -->


                    <div class="panel">
                        <div class="panel-headingfaq">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#bs-collapse" href="#twentyeight">୨୯. ଅପିଲ କିମ୍ବା ପୁନଃରୀକ୍ଷିଣ ନିମନ୍ତେ କୌଣସି ଫିସ ଦେବା ଆବଶ୍ୟକ କି ?</a>
                            </h4>
                        </div>
                        <div id="twentyeight" class="panel-collapse collapse">
                            <div class="panel-body-faq">
                                <b class="fltleft">ଉ:</b> <span class="dsplyflx">T ନାଁ, ଅପିଲ କିମ୍ବା ପୁନଃରୀକ୍ଷିଣ ନିମନ୍ତେ କୌଣସି ଫିସ ଦେବାକୁ ପଡେ ନାହିଁ ।</span>

                            </div>
                        </div>
                    </div>
                    <!-- end of panel -->

                    <div class="panel">
                        <div class="panel-headingfaq">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#bs-collapse" href="#twentynine">୩୦. ଯଦି ପୁନଃରୀକ୍ଷିଣ ପ୍ରାଧିକାରୀଙ୍କ ଆଦେଶ ସଂପୃକ୍ତ କର୍ମଚାରୀଙ୍କ ଦ୍ଵାରା କାର୍ଯ୍ୟାନ୍ଵୟନ କରାନଯାଏ ତେବେ କଣ ହେବ ?</a>
                            </h4>
                        </div>
                        <div id="twentynine" class="panel-collapse collapse">
                            <div class="panel-body-faq">
                                <b>ଉ:</b> ପୁନଃରୀକ୍ଷିଣ ପ୍ରାଧିକାରୀଙ୍କ ଆଦେଶର ଅନୁପାଳନ କରାନଗଲେ ଅସଦାଚରଣ ରୂପେ ଗଣାଯିବ ଏବଂ ତଦନୁଯାୟୀ ପୁନଃରୀକ୍ଷିଣ ପ୍ରାଧିକାରୀଙ୍କ ସଂପୃକ୍ତ କର୍ମଚାରିଙ୍କ ବିରୁଦ୍ଧରେ ଶୃଙ୍ଖଳାଗତ କାର୍ଯ୍ୟାନୁଷ୍ଠାନ ନିମନ୍ତେ ପାରିଶ କରିବେ ।
                            </div>
                        </div>
                    </div>
                    <!-- end of panel -->

                    <div class="panel">
                        <div class="panel-headingfaq">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#bs-collapse" href="#thirty">୩୧.କୌଣସି ଦେୱାନି ଅଦାଲତ ,ଅପିଲ ପ୍ରାଧିକାରୀ ଏବଂ ପୁନଃରୀକ୍ଷିଣ ପ୍ରାଧିକାରୀଙ୍କ ଆଦେଶଗୁଡିକ ଉପରେ ମଧ୍ୟ କ୍ଷେପ କରି ପାରିବ କି ?</a>
                            </h4>
                        </div>
                        <div id="thirty" class="panel-collapse collapse">
                            <div class="panel-body-faq">
                                <b>ଉ:</b> ନାଁ, ଏହି ଅଧିନିୟମ ଆଉସରେ କରାଯାଉଥିବା କୌଣସି ଆଦେଶ ସଂକ୍ରାନ୍ତରେ କୌଣସି ମକଦ୍ଦମା,ଦରଖାସ୍ତ କିମ୍ବା ଅନ୍ୟ ପ୍ରୋଷିଡିଂ କୌଣସି ଦେୱାନି ଅଦାଲତ ଗ୍ରହଣ କରିପାରିବେ ନାହିଁ ଏବଂ ଅଧିନିୟମ ଅନୁସାରେ ନିର୍ଦ୍ଧାରିତ ପିଆଇଏଲ ବ୍ୟତିରେକ ଅନ୍ୟଥା ଏପରି ଆଦେଶ ଉପରେ କୌଣସି ପ୍ରକାରର ପ୍ରଶ୍ନ ଉଠାଯାଇପାରିବନାହିଁ ।
                            </div>
                        </div>
                    </div>
                    <!-- end of panel -->

                    <div class="panel">
                        <div class="panel-headingfaq">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#bs-collapse" href="#thirtyone">୩୨. ବିନା ବିଫଳତାରେ ସେବା ଯୋଗାଣକାରି କର୍ମଚାରୀଙ୍କୁ ଉତ୍ସାହିତ କରିବା ଦିଗରେ ପୁରସ୍କୃତ କରିବା ନିମନ୍ତେ କୌଣସି ବ୍ୟବସ୍ଥା ଅଛି କି ?</a>
                            </h4>
                        </div>
                        <div id="thirtyone" class="panel-collapse collapse">
                            <div class="panel-body-faq">
                                <b class="fltleft">ଉ:</b><span class="dsplyflx"> ସରକାରୀ କର୍ମଚାରୀଙ୍କ ଦକ୍ଷତା ବୃଦ୍ଧି ତଥା ସେମାନଙ୍କୁ ଉତ୍ସାହିତ କରିବା ନିମନ୍ତେ ଏକ ବର୍ଷ ମଧ୍ୟରେ ବିନା ବିଫଳତାରେ ଯେଉଁ କର୍ମଚାରୀମାନେ ସେବା ଯୋଗାଇଥିବେ ସେମାନଙ୍କୁ ରାଜ୍ୟ ସରକାର ପୁରସ୍କୃତ କରିବେ ମୋଟ ଅନ୍ୟୁନ ଟ .୫,୦୦୦ (ପାଞ୍ଚ ହଜାର) ଟଙ୍କା ପ୍ରୋତ୍ସାହିତ ଅର୍ଥରାଶି ପୁରସ୍କାର ସ୍ୱରୂପ ଦେବା ସଙ୍ଗେ ସଙ୍ଗେ ତାଙ୍କୁ ଏକ ପ୍ରସଂଶା ପତ୍ର ମଧ୍ୟ ପ୍ରଦାନ କରାଯିବ ।</span>
                                <ul>
                                    <li><b>୩୩.</b>	ଏହି ଅଧିନିୟମ ସମ୍ପର୍କିତ ନଥିପତ୍ର ସଂରକ୍ଷଣ କରାଯିବ କି ନାହିଁ ?</li>
                                    <li><b>ଉ :</b> ନାମିତ ଆଦିକାରୀ , ଅପିଲ ପ୍ରାଧିକାରୀ ଏବଂ ପୁନଃରୀକ୍ଷିଣ ପ୍ରାଧିକାରୀଙ୍କ ବିହିତ ଫରମାଟରେ ସବୁ ମାମଲା ଗୁଡିକର ନଥିପତ୍ର ରକ୍ଷଣାବେକ୍ଷଣ କରିବେ ।</li>
                                </ul>
                             
                            </div>
                        </div>
                    </div>
                    <!-- end of panel -->
                </div>
                <!-- end of #bs-collapse  -->

            </div>
        </div>
    </div>
</asp:Content>
