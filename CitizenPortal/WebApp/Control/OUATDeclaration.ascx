<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OUATDeclaration.ascx.cs" Inherits="CitizenPortal.WebApp.Control.OUATDeclaration" %>


<script type="text/javascript">
    function OUATDeclaration(chk) {

        debugger;
        
        if (chk) {
            if ($('#FirstName').val() == "" || $('#FatherName').val() == "") {
                //alert("Please enter the all the mandatory fields.");
                alert("Please enter your Full Name, Father Name  to continue.");
                chkPhysical.checked = false;
                return false;
            }

            if ($('#CddlDistrict').val() == 0) {
                alert("Please select Present District to continue.");
                chkPhysical.checked = false;
                return false;
            }
            if ($('#ddlGender').val() != '0') {
                if ($('#ddlGender').val() == "M" || $('#ddlGender').val() == "Male") {
                    $('#lblGender').text("Son of ");
                    $('#lblTitle').text("Mr.");
                } else if ($('#ddlGender').val() == "F" || $('#ddlGender').val() == "Female") {
                    $('#lblGender').text("Daughter of ");
                    $('#lblTitle').text("Ms.");
                } else { $('#lblGender').text("Transgender of"); $('#lblTitle').text("Mr./Ms."); }
            }
            else {
                alert("Please, seect Gender");
            }

            var name = $('#FirstName').val();
            var fname = $('#FatherName').val();
            var place = $("#CddlDistrict option:selected").text();//$('#CddlDistrict').val();
            //alert(name);
            $("#lblName").text(name);
            $("#lblApplicant").text(name);
            $("#lblNameAadhaar").text(name);
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
            $('#divDeclaration').show();
        }
        else {
            $("#lblName").text("");
            $("#lblNameAadhaar").text("");
            $("#lblApplicant").text("");
            $("#lblPhsclFthrName").text("");
            $("#lblPhsclDstName").text("");
            $('#btnSubmit').prop('disabled', true);
            $('#divDeclaration').hide();
        }
    }
</script>


<div class="row">
    <div class="col-md-12 box-container">
        <div class="box-heading">
            <h4 class="box-title manadatory"id="lblDeclaration">
                <input type="checkbox" runat="server" id="chkPhysical" onclick="javascript: OUATDeclaration(this.checked);" />{{resourcesData.declaration}}
            </h4>
        </div>
        <div class="box-body box-body-open" id="divDeclaration">
            <div class="col-sm-12 col-md-12 col-lg-12">
                <div class="text-danger text-danger-green mt0">                    
                    <p class="text-justify">
                        {{resourcesData.i}} <b>
                            <span id="lblName" style="text-transform: uppercase;"></span>
                        </b>,
                <span id="lblGender" style="font-size:1.1em;"></span><b>
                    <span id="lblPhsclFthrName" style="text-transform: uppercase;"></span>
                </b>
                        {{resourcesData.ouatDeclaration}}
                    </p>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td><b style="color: #000;"><span class="pull-left" style="padding-right: 3px;">{{resourcesData.place}} :</span>
                                <label id="cndidteplce" style="font-weight: bold"></label>
                            </b>
                                <br />
                            </td>

                            <td rowspan="2"><span class="pull-right" style="color: #000;"><span id="lblApplicant" style="text-transform: uppercase; float: right; color: #777; padding-right: 50px;"></span>
                                <br />
                                {{resourcesData.signature}}</span></td>
                        </tr>
                        <tr>
                            <td><b style="color: #000;"><span class="pull-left" style="padding-right: 3px;">{{resourcesData.date}} : </span>
                                <label id="currntdte" style="font-weight: bold"></label>
                            </b></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="clearfix">
            </div>

        </div>
    </div>
</div>
