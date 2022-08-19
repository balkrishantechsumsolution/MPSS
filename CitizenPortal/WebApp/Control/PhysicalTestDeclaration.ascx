<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PhysicalTestDeclaration.ascx.cs" Inherits="CitizenPortal.WebApp.Control.PhysicalTestDeclaration" %>

<script type="text/javascript">
    function OISFPhysical(chk) {
        //alert($('#FirstName').val());
        debugger;
        if (chk) {
            if ($('#FirstName').val() == "" || $('#FatherName').val() == "") {
                //alert("Please enter the all the mandatory fields.");
                alert("Please enter your Full Name, Father Name to continue.");
                chkPhysical.checked = false;
                return false;
            }

            if ($('#CddlDistrict').val() == 0) {
                alert("Please select Present District to continue.");
                chkPhysical.checked = false;
                return false;
            }

            var name = $('#FirstName').val();
            var fname = $('#FatherName').val();
            var place = $("#CddlDistrict option:selected").text();//$('#CddlDistrict').val();
            //alert(name);
            $("#lblPhysical").text(name);
            $("#lblPhysical2").text(name);
            $("#lblPhsclFthrName").text(fname);
            //$("#lblPhsclDstName").text(fname);
            $("#cndidteplce").text(place);

            $('#btnSubmit').prop('disabled', false);


            var today = new Date();
            var dd = today.getDate();
            var mm = today.getMonth() + 1; //January is 0!

            var yyyy = today.getFullYear();
            if (dd < 10) {
                dd = '0' + dd
            }
            if (mm < 10) {
                mm = '0' + mm
            }
            var today = dd + '/' + mm + '/' + yyyy;
            $("#currntdte").text(today);

        }
        else {
            $("#lblPhysical").text("");
            $("#lblPhysical2").text("");
            $("#lblPhsclFthrName").text("");
            $("#lblPhsclDstName").text("");
            $('#btnSubmit').prop('disabled', true);
        }
    }
</script>
<div class="box-body box-body-open">
    <div class="col-sm-12 col-md-12 col-lg-12">
        <div class="text-danger text-danger-green mt0">
            <p class="text-justify">
                <input type="checkbox" runat="server" id="chkPhysical" onclick="javascript: OISFPhysical(this.checked);" />
                {{resourcesData.i}} <b>
                    <span id="lblPhysical" style="text-transform: uppercase;"></span>
                </b>
                {{resourcesData.sonof}} <b>
                    <span id="lblPhsclFthrName" style="text-transform: uppercase;"></span>
                </b>
                {{resourcesData.declarationtext3}}
            </p>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td><b style="color: #000;"><span class="pull-left" style="padding-right: 3px;">{{resourcesData.place}} :</span>
                        <label id="cndidteplce" style="font-weight:bold"></label>
                    </b>
                        <br />
                    </td>

                    <td rowspan="2"><span class="pull-right" style="color: #000;"><span id="lblPhysical2" style="text-transform: uppercase; float: right; color: #777; padding-right: 50px;"></span>
                        <br />
                        {{resourcesData.signature}}</span></td>
                </tr>
                <tr>
                    <td><b style="color: #000;"><span class="pull-left" style="padding-right: 3px;">{{resourcesData.date}} : </span>
                        <label id="currntdte" style="font-weight:bold"></label>
                    </b></td>
                </tr>
            </table>
            <%--<span class="col-md-12 pleft0"><b>Place :</b><label id="cndidteplce"></label></span>

                <span class="col-md-1 pleft0"><b>Date : </b>
               <label id="currntdte"></label></span>

                <b>
                    <span id="lblPhysical2" style="text-transform: uppercase; float: right; padding-right: 50px;"></span>
                    <br />
                    <span class="pull-right">Full Signature of the Candidate</span></b>

            --%>
            <br />
        </div>
    </div>
    <div class="clearfix">
    </div>

</div>

