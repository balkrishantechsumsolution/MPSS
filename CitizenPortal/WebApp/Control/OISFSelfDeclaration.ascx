<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OISFSelfDeclaration.ascx.cs" Inherits="CitizenPortal.WebApp.Control.OISFSelfDeclaration" %>


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
    <div class="col-sm-12 col-md-12 col-lg-12">
        <div class="text-danger text-danger-green mt0">
            <p class="text-justify">
                <input type="checkbox" runat="server" id="Declaration" onclick="javascript: OISFDeclaration(this.checked);" />{{resourcesData.i}}, <b>
                    <span id="lblName" style="text-transform: uppercase;"></span>
                </b>{{resourcesData.sonof}} <b>
                    <span id="lblFthrName" style="text-transform: uppercase;"></span>
                </b>{{resourcesData.declarationtext}}.<br />{{resourcesData.declarationtext1}}
            </p>
        </div>
    </div>
    <div class="clearfix">
    </div>

</div>
