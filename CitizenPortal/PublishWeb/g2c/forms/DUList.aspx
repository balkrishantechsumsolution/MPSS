<%@ Page Title="" Language="C#" MasterPageFile="~/g2c/master/Home.Master" AutoEventWireup="true" CodeBehind="DUList.aspx.cs" Inherits="CitizenPortal.g2c.forms.DUList" EnableSessionState="False"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../WebApp/Login/js/JqueryDT.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphbody" runat="Server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12 cscPgehd">
                <h1>List of Applicant <br />who have not uploaded their Payment Details in 9th SIRB Recruitment Application</h1>
            </div>
        </div>
        <div class="col-lg-12">            
            <p style="color:#000;">
                The following candidates have paid their fees through SB-Collect for Recruitment of constable in 9TH INDIA RESERVE BATTALION (SPECIALISED) but they have not updated their payment details properly in the https://lokaseba-odisha.in website. SMS have been sent to the following candidate to rectify / update their details.
            </p>
            <p style="color:#000;">
                These candidates are requested to call Customer Support No. 0674-6580 111/222/333 and update / rectify their details before 12/01/2017 by 5:00 PM, otherwise their candidature will be rejected.
            </p>
        </div>
		<div class="col-lg-12">            
            <p style="color:#000;">
                ନିମ୍ନଲିଖିତ ପ୍ରାର୍ଥୀମାନେ SBI (ବ୍ୟାଙ୍କ) ରେ ଟଙ୍କା ଜମା କରିବାପରେ ଲୋକସେବା- ଓଡିଶା website ରେ ସଠିକ ତଥ୍ୟ ନଦେଇ ତାଙ୍କ online form ଟିକୁ update କରିପାରିନାହାନ୍ତି ।ଏହି ପ୍ରାର୍ଥୀ ମାନଙ୍କୁ ନିଜର ତଥ୍ୟକୁ update କରିବାପାଇଁ SMS ଦ୍ଵାରା ଜଣ। ଯାଇଅଛି ।ଏତ ଦ୍ଵାରା ସେମାନଙ୍କୁ ଅନୁରୋଧ କରାଯାଉଛି କି ସେମାନେ Customer Support No. 0674-6580 111/222/333 ରେ ଫୋନ କରି ସଠିକ ତଥ୍ୟ ଦେଇ ୧୨ ଜାନୁଆରୀ ୨୦୧୭ ସୁଦ୍ଧା ନିଜର ଆପ୍ଳିକେସନ ଟିକୁ update କର।ନ୍ତୁ ।ନଚେତ ତାଙ୍କ ପ୍ରାର୍ଥୀତ୍ଵ ନାକଚ ହୋଇଯିବ ।
            </p>            
        </div>
        <div class="row">
            <div class="col-lg-12">
                <asp:GridView ID="DataGridView" AutoGenerateColumns="false" OnPreRender="DataGridView_PreRender" runat="server" PageSize="100"></asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>