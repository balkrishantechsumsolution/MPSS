<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SearchRecord.ascx.cs" Inherits="CitizenPortal.WebApp.Control.SearchRecord" %>
<script>
    function validateUID(UIDVal) {
        debugger;
        if (UIDVal == "1") {
            var UID = $("#UID").val();
            var length = UID.length;

            if ($("#UID").val() == "") {
                alert("Please enter Aadhaar UID number.");
                //$("#UID").focus();
                return false;
            }
            if (eval(length) < 12) {
                alert("Aadhaar UID should be 12 digit");
                $("#UID").val("");

                return false;
            }

        }
    }

    function openWindow_old(UIDVal, value, SessionName) {
        debugger;
        var qs = getQueryStrings();
        var SvcID = qs["SvcID"];

        if (validateUID(UIDVal) != false) {

            var code = "";
            if (UIDVal == "1") {
                code = $("#UID").val();
            }

            var t_Result = false;//CheckUID(code);

            if (t_Result) {
                var EID = "0";
                var left = (screen.width / 2) - (560 / 2);
                var top = (screen.height / 2) - (400 / 2);

                window.open('/UID/VerifyUID.aspx?aadhaarNumber=' + code + '&SvcID=' + SvcID, 'open_window',
                           ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');
                window.focus();

            }
            else
            {

                var EID = "0";
                var left = (screen.width / 2) - (560 / 2);
                var top = (screen.height / 2) - (400 / 2);

                window.open('/UID/Default.aspx?aadhaarNumber=' + code + '&kycTypesToUse=OTP&SvcID=' + SvcID, 'open_window',
                           ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');
                window.focus();
            }
            return false;
        }
        return false;
    }

    
</script>

<div class="box-body box-body-open">
    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
        <div class="row">
            <div class="form-group col-lg-4">
                <select class="form-control" data-val="true" data-val-number="search application"
                    data-val-required="Please select search type" id="ddlSearch" name="Search">
                    <option value="0">Select Search Type</option>
                    <option selected value="R">Aadhaar Enrollment Number</option>
                    <option selected value="U">Aadhaar Number</option>
                    
<%--                    <option value="C">Citizen Profile ID</option>
                    <option value="A">Application ID</option>--%>
                </select>
            </div>
            <div class="form-group col-lg-4">
                <input class="form-control" placeholder="Enter 12 digit Aadhaar Number" name="txtAadhaar" type="text" value="" id="UID" maxlength="12" onkeypress="return isNumberKey(event);"
                    autofocus />
            </div>
            <div class="form-group col-lg-2 text-left">
                <asp:Button ID="btnSearch" runat="server" CausesValidation="False" CssClass="btn btn-primary"
                    Text="Proceed" OnClientClick="return openWindow(1,2,'UIDCasteCertificate1'); " />
                
                <%-- <button type="button" class="btn btn-primary" onclick="alert('hello');"> Create Profile </button>
                               <asp:Button ID="btnSearch" runat="server" CausesValidation="False" CssClass="btn btn-primary"
                    Text="OTP" OnClientClick="return openWindow(1,2,'UIDCasteCertificate1'); " />
                <asp:Button ID="Button1" runat="server" CausesValidation="False" CssClass="btn btn-primary"
                    Text="Bio metric" OnClientClick="return openWindow(1,1,'UIDSGNPPass'); " />--%>
                
            </div>
            <div id="divNonAadhar" class="form-group col-lg-3 text-right" style="white-space:nowrap;margin-top: 10px;"><a href="#" onclick="fnNonUID();" title="Click if Aadhaar UID is not available">I don't have Aadhaar No.</a></div>
        </div>
    </div>
    <div class="clearfix">
    </div>
</div>
