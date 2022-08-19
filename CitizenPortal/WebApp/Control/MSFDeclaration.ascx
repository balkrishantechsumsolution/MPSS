<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MSFDeclaration.ascx.cs" Inherits="CitizenPortal.WebApp.Control.MSFDeclaration" %>

<script type="text/javascript">
    function OISFDeclaration(chk) {

        debugger;
        if (chk) {
            if ($('#FirstName').val() == "" || $('#FatherName').val() == "") {
                alert("Please enter the all the mandatory fields.");
                Declaration.checked = false;
                return false;
            }

            var name = $('#FirstName').val();
            var fname = $('#FatherName').val();
            //alert(name);
            $("#lblName").text(name);
            $("#lblFthrName").text(fname);
            // $('#btnSubmit').prop('disabled', false)
        }
        else {
            $("#lblName").text("");
            $("#lblFthrName").text("");
            // $('#btnSubmit').prop('disabled', true);
        }
    }
</script>

<div class="box-body box-body-open">
    <div class="col-sm-6 col-md-6 col-lg-12">
        <div class="text-danger text-danger-green mt0">
            <p class="text-justify">
                <input type="checkbox" runat="server" id="Declaration" onclick="javascript: OISFDeclaration(this.checked);" />I, Shri <b>
                    <span id="lblName" style="text-transform: uppercase;"></span>
                </b>Son of <b>
                    <span id="lblFthrName" style="text-transform: uppercase;"></span>
                </b>declared that the above statement furnished is completely correct to the best of my knowledge. If any, facts stated above are found to be in-correct my candidature will stand cancel.<br />
                I agree to serve any where in Odisha if selected.<br />
            </p>
        </div>
    </div>
    <div class="clearfix">
    </div>

</div>
