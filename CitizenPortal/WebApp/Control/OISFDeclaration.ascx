<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OISFDeclaration.ascx.cs" Inherits="CitizenPortal.WebApp.Control.OISFDeclaration" %>


<script type="text/javascript">
    function OISFDeclaration(chk) {
        //alert($('#FirstName').val());
        debugger;
        if (chk) {
            var name = $('#FullName').val();
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

    function OISFPhysical(chk) {
        //alert($('#FirstName').val());
        debugger;
        //if (chk) {
        //    var name = $('#FullName').val();
        //    var fname = $('#FatherName').val();
        //    var fname = $('#PddlDistrict').val();
        //    //alert(name);
        //    $("#lblPhysical").text(name);
        //    $("#lblPhsclFthrName").text(fname);
        //    $("#lblPhsclDstName").text(fname);
        //    $('#btnSubmit').prop('disabled', false)
        //}
        //else {
        //    $("#lblPhysical").text("");
        //    $("#lblPhsclFthrName").text("");
        //    $("#lblPhsclDstName").text("");
        //    $('#btnSubmit').prop('disabled', true);
        //}
    }
</script>



<div class="form-group">
    <div class="col-sm-6 col-md-6 col-lg-12 pleft0 pright0">
        <div class="text-danger text-danger-green">
            <p class="text-justify">
                <input type="checkbox" runat="server" id="Declaration" onclick="javascript: OISFDeclaration(this.checked);"/>I, Shri <b>
                    <span id="lblName" style="text-transform:uppercase;"></span>
                   </b> Son of <b>
                       <span id="lblFthrName" style="text-transform:uppercase;"></span>
                    </b>declared that the above statement furnished is completely correct to the best of my knowledge. If any, facts stated above are found to be in-correct my candidature will stand cancel.<br />
                I agree to serve any where in Odisha if selected as a Constable in 9<sup>th</sup>India Reserve Battalion (Specialised).<br />



            </p>
        </div>

        <div class="text-danger text-danger-green" style="padding-bottom: 60px;">
            <p class="text-center" style="font-size: 16px !important;"><b>Declaration for participation in Physical Efficiency Test for appointment as Constable in Odisha Industrial Security Force (OISF)</b></p>
            <p class="text-justify">
                <input type="checkbox" runat="server" id="chkPhysical" onclick="javascript: OISFPhysical(this.checked);"/>
                I undersigned Shri <b>
                    <span id="lblPhysical" style="text-transform:uppercase;"></span>
                    </b>
                Son of <b>
                    <span id="lblPhsclFthrName" style="text-transform:uppercase;"></span>

                </b>Village <b>
                    <asp:Label ID="CddlVillage" runat="server"></asp:Label></b> Post  <b>Candidate Post Name </b>
                <label id="cndidtepost"></label>
                P.S   <b>Candidate P.S Name </b>
                <label id="cndidteplcestation"></label>
                Dist.  <b> <span id="lblPhsclDstName"></span> </b>. I hereby declared that I am completely capable and fit to appear in the Physical Efficiency Test for the post of Constables in 9<sup>th</sup> India Reserve Battalion (Specialised). During the Physical Efficiency Test if any, Physical injury or untoward accident takes place, the concerned officers shall not be held responsible or liable.<br />
                Place :
                <label id="cndidteplce"></label>
                <br />
                <span class="pull-left">Date  :
                    <label id="currntdte"></label>
                </span><b><span class="pull-right">Full Signature of the Candidate</span></b>


            </p>
        </div>
    </div>
    <div class="clearfix">
    </div>

</div>
