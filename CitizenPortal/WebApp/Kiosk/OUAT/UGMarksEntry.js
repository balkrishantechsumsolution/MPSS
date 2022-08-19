
function fuMarksPartern(strvalue) {
    checked();

    $("#divMarks").show();
    if (strvalue == '0') {
        $("#lblTheoryTotal").text("Total Marks");
        $("#lblTheoryObtain").text("Marks Obtain");
        $("#lblPractTotal").text("Total Marks ");
        $("#lblPractObtain").text("Marks Obtain");
        $("#lblMarks").text("Total Marks");
        $("#lblObtain").text("Marks Obtain");

        $("#thPTM").hide();
        $("#tdPTMP").hide();
        $("#tdPTMC").hide();
        $("#tdPTMPM").hide();
        $("#tdPTMB").hide();
        $("#tdPTMPZ").hide();
        $("#tdPTMT").hide();
        $("#tdPTMPTPCM").hide();
        $("#tdPTMPTPCB").hide();

        $("#thPMO").hide();
        $("#thPMOP").hide();
        $("#thPMOC").hide();
        $("#thPMOM").hide();
        $("#thPMOB").hide();
        $("#thPMOZ").hide();
        $("#thPMOT").hide();
        $("#thPMOPCM").hide();
        $("#thPMOPCB").hide();

        $("#trZoo").hide();
        $("#ddlSubjectBio").text("Biology");
    }
    else {
        $("#lblTheoryTotal").text("Total Marks in Theory");
        $("#lblTheoryObtain").text("Marks Obtain in Theory");
        $("#lblPractTotal").text("Total Marks in Practical");
        $("#lblPractObtain").text("Marks Obtain in Practical");
        $("#lblMarks").text("Total Marks (Theory + Practical)");
        $("#lblObtain").text("Total Mark Obtain (Theory + Practical)");
        $("#ddlSubjectBio").text("Botany");

        $("#trZoo").show();

        $("#thPTM").show();
        $("#tdPTMP").show();
        $("#tdPTMC").show();
        $("#tdPTMPM").show();
        $("#tdPTMB").show();
        $("#tdPTMPZ").show();
        $("#tdPTMT").show();
        $("#tdPTMPTPCM").show();
        $("#tdPTMPTPCB").show();

        $("#thPMO").show();
        $("#thPMOP").show();
        $("#thPMOC").show();
        $("#thPMOM").show();
        $("#thPMOB").show();
        $("#thPMOZ").show();
        $("#thPMOT").show();
        $("#thPMOPCM").show();
        $("#thPMOPCB").show();


    }
}
function checked() {
    var MarksPatarn = $("input[name='marks']:checked").val();
    if (MarksPatarn == "yes2") {
        $("#txtTMT_Physics").val("");
        $("#txtMOT_Physics").val("");
        $("#txtTMT_Chemistry").val("");
        $("#txtMOT_Chemistry").val("");
        $("#txtTMT_Maths").val("");
        $("#txtMOT_Maths").val("");
        $("#txtTMT_Botany").val("");
        $("#txtMOT_Botany").val("");
        $("#txtTMT_Zoology").val("");
        $("#txtMOT_Zoology").val("");
        $("#txtTMTP_Physics").val("");//total marks
        $("#txtTMOTP_Physics").val("");
        $("#txtTMTP_Chemistry").val("");
        $("#txtTMOTP_Chemistry").val("");
        $("#txtTMTP_Maths").val("");
        $("#txtTMOTP_Maths").val("");
        $("#txtTMTP_Botany").val("");
        $("#txtTMOTP_Botany").val("");
        $("#txtTMTP_Zoology").val("");
        $("#txtTMOTP_Zoology").val("");
        $("#txtTMP_PCM").text("");
        $("#txtTMP_PCB").text("");
        $("#txtTMT_PCM").text("");//
        $("#txtTMT_PCB").text("");
        $("#txtMOT_PCM").text("");
        $("#txtMOT_PCB").text("");
        $("#txtMOP_PCM").text("");
        $("#txtTMP_PCB").text("");
        $("#txtMOP_PCM").text("");
        $("#txtMOP_PCB").text("");
        $("#txtTMTP_PCM").text("");
        $("#txtTMTP_PCB").text("");
        $("#txtTMOTP_PCM").text("");
        $("#txtTMOTP_PCB").text("");




        $("#txtTMT_Physics").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#txtTMT_Physics").css({ "background-color": "#ffffff" });

        $("#txtMOT_Physics").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#txtMOT_Physics").css({ "background-color": "#ffffff" });

        $("#txtTMP_Physics").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#txtTMP_Physics").css({ "background-color": "#ffffff" });

        $("#txtMOP_Physics").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#txtMOP_Physics").css({ "background-color": "#ffffff" });

        $("#txtTMT_Chemistry").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#txtTMT_Chemistry").css({ "background-color": "#ffffff" });

        $("#txtMOT_Chemistry").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#txtMOT_Chemistry").css({ "background-color": "#ffffff" });


        $("#txtTMP_Chemistry").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#txtTMP_Chemistry").css({ "background-color": "#ffffff" });


        $("#txtMOP_Chemistry").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#txtMOP_Chemistry").css({ "background-color": "#ffffff" });

        $("#txtTMT_Maths").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#txtTMT_Maths").css({ "background-color": "#ffffff" });

        $("#txtMOT_Maths").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#txtMOT_Maths").css({ "background-color": "#ffffff" });

        $("#txtTMP_Maths").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#txtTMP_Maths").css({ "background-color": "#ffffff" });
        $("#txtMOP_Maths").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#txtMOP_Maths").css({ "background-color": "#ffffff" });

        $("#txtTMT_Botany").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#txtTMT_Botany").css({ "background-color": "#ffffff" });

        $("#txtMOT_Botany").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#txtMOT_Botany").css({ "background-color": "#ffffff" });

        $("#txtTMP_Botany").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#txtTMP_Botany").css({ "background-color": "#ffffff" });

        $("#txtMOP_Botany").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#txtMOP_Botany").css({ "background-color": "#ffffff" });

        $('#txtTMT_Zoology').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtTMT_Zoology').css({ "background-color": "#ffffff" });

        $('#txtMOT_Zoology').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtMOT_Zoology').css({ "background-color": "#ffffff" });

        $('#txtTMP_Zoology').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtTMP_Zoology').css({ "background-color": "#ffffff" });

        $('#txtMOP_Zoology').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtMOP_Zoology').css({ "background-color": "#ffffff" });


    }
    else if (MarksPatarn == "yes1") {
        $("#txtTMT_Physics").val("");
        $("#txtMOT_Physics").val("");
        $("#txtTMT_Chemistry").val("");
        $("#txtMOT_Chemistry").val("");
        $("#txtTMT_Maths").val("");
        $("#txtMOT_Maths").val("");
        $("#txtTMT_Botany").val("");
        $("#txtMOT_Botany").val("");
        $("#txtTMT_Zoology").val("");
        $("#txtMOT_Zoology").val("");
        $("#txtTMP_Physics").val("");
        $("#txtMOP_Physics").val("");
        $("#txtTMP_Chemistry").val("");
        $("#txtMOP_Chemistry").val("");
        $("#txtTMP_Maths").val("");
        $("#txtMOP_Maths").val("");
        $("#txtTMP_Botany").val("");
        $("#txtMOP_Botany").val("");
        $("#txtTMP_Zoology").val("");
        $("#txtMOP_Zoology").val("");
        $("#txtTMTP_Physics").val("");//total marks
        $("#txtTMOTP_Physics").val("");
        $("#txtTMTP_Chemistry").val("");
        $("#txtTMOTP_Chemistry").val("");
        $("#txtTMTP_Maths").val("");
        $("#txtTMOTP_Maths").val("");
        $("#txtTMTP_Botany").val("");
        $("#txtTMOTP_Botany").val("");
        $("#txtTMTP_Zoology").val("");
        $("#txtTMOTP_Zoology").val("");
        $("#txtTMP_PCM").text("");
        $("#txtTMP_PCB").text("");
        $("#txtTMT_PCM").text("");//
        $("#txtTMT_PCB").text("");
        $("#txtMOT_PCM").text("");
        $("#txtMOT_PCB").text("");
        $("#txtMOP_PCM").text("");
        $("#txtTMP_PCB").text("");
        $("#txtMOP_PCM").text("");
        $("#txtMOP_PCB").text("");
        $("#txtTMTP_PCM").text("");
        $("#txtTMTP_PCB").text("");
        $("#txtTMOTP_PCM").text("");
        $("#txtTMOTP_PCB").text("");

        $('#txtTMT_Physics').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtTMT_Physics').css({ "background-color": "#ffffff" });

        $('#txtMOT_Physics').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtMOT_Physics').css({ "background-color": "#ffffff" });

        $('#txtTMT_Chemistry').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtTMT_Chemistry').css({ "background-color": "#ffffff" });

        $('#txtMOT_Chemistry').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtMOT_Chemistry').css({ "background-color": "#ffffff" });


        $('#txtTMT_Maths').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtTMT_Maths').css({ "background-color": "#ffffff" });

        $('#txtMOT_Maths').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtMOT_Maths').css({ "background-color": "#ffffff" });


        $('#txtTMT_Botany').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtTMT_Botany').css({ "background-color": "#ffffff" });

        $('#txtMOT_Botany').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtMOT_Botany').css({ "background-color": "#ffffff" });

        $('#txtTMT_Zoology').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtTMT_Zoology').css({ "background-color": "#ffffff" });

        $('#txtMOT_Zoology').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtMOT_Zoology').css({ "background-color": "#ffffff" });
    }
}
function TotalMarksInTheory() {

    /*Start - Total Vertical*/

    var txtTMT_Physics = $('#txtTMT_Physics').val();
    var txtTMT_Chemistry = $('#txtTMT_Chemistry').val();
    var txtTMT_Maths = $('#txtTMT_Maths').val();
    var txtTMT_Botany = $('#txtTMT_Botany').val();
    var txtTMT_Zoology = $('#txtTMT_Zoology').val();
    var Total_Theory = 0;

    if (txtTMT_Physics == null || txtTMT_Physics == "") { txtTMT_Physics = 0; }
    if (txtTMT_Chemistry == null || txtTMT_Chemistry == "") { txtTMT_Chemistry = 0; }
    if (txtTMT_Maths == null || txtTMT_Maths == "") { txtTMT_Maths = 0; }
    if (txtTMT_Botany == null || txtTMT_Botany == "") { txtTMT_Botany = 0; }
    if (txtTMT_Zoology == null || txtTMT_Zoology == "") { txtTMT_Zoology = 0; }

    Total_Theory = (parseInt(txtTMT_Physics)) + (parseInt(txtTMT_Chemistry)) + (parseInt(txtTMT_Maths)) + (parseInt(txtTMT_Botany)) + (parseInt(txtTMT_Zoology));
    $('#txtTMT_Total').text(Total_Theory);


    var txtMOT_Physics = $('#txtMOT_Physics').val();
    var txtMOT_Chemistry = $('#txtMOT_Chemistry').val();
    var txtMOT_Maths = $('#txtMOT_Maths').val();
    var txtMOT_Botany = $('#txtMOT_Botany').val();
    var txtMOT_Zoology = $('#txtMOT_Zoology').val();
    var Total_Theory_Obtained = 0;

    if (txtMOT_Physics == null || txtMOT_Physics == "") { txtMOT_Physics = 0; }
    if (txtMOT_Chemistry == null || txtMOT_Chemistry == "") { txtMOT_Chemistry = 0; }
    if (txtMOT_Maths == null || txtMOT_Maths == "") { txtMOT_Maths = 0; }
    if (txtMOT_Botany == null || txtMOT_Botany == "") { txtMOT_Botany = 0; }
    if (txtMOT_Zoology == null || txtMOT_Zoology == "") { txtMOT_Zoology = 0; }

    Total_Theory_Obtained = (parseInt(txtMOT_Physics)) + (parseInt(txtMOT_Chemistry)) + (parseInt(txtMOT_Maths)) + (parseInt(txtMOT_Botany)) + (parseInt(txtMOT_Zoology));
    $('#txtMOT_Total').text(Total_Theory_Obtained);


    var txtTMP_Physics = $('#txtTMP_Physics').val();
    var txtTMP_Chemistry = $('#txtTMP_Chemistry').val();
    var txtTMP_Maths = $('#txtTMP_Maths').val();
    var txtTMP_Botany = $('#txtTMP_Botany').val();
    var txtTMP_Zoology = $('#txtTMP_Zoology').val();
    var Total_Practical = 0;

    if (txtTMP_Physics == null || txtTMP_Physics == "") { txtTMP_Physics = 0; }
    if (txtTMP_Chemistry == null || txtTMP_Chemistry == "") { txtTMP_Chemistry = 0; }
    if (txtTMP_Maths == null || txtTMP_Maths == "") { txtTMP_Maths = 0; }
    if (txtTMP_Botany == null || txtTMP_Botany == "") { txtTMP_Botany = 0; }
    if (txtTMP_Zoology == null || txtTMP_Zoology == "") { txtTMP_Zoology = 0; }

    Total_Practical = (parseInt(txtTMP_Physics)) + (parseInt(txtTMP_Chemistry)) + (parseInt(txtTMP_Maths)) + (parseInt(txtTMP_Botany)) + (parseInt(txtTMP_Zoology));
    $('#txtTMP_Total').text(Total_Practical);


    var txtMOP_Physics = $('#txtMOP_Physics').val();
    var txtMOP_Chemistry = $('#txtMOP_Chemistry').val();
    var txtMOP_Maths = $('#txtMOP_Maths').val();
    var txtMOP_Botany = $('#txtMOP_Botany').val();
    var txtMOP_Zoology = $('#txtMOP_Zoology').val();
    var Total_MarksObtained = 0;

    if (txtMOP_Physics == null || txtMOP_Physics == "") { txtMOP_Physics = 0; }
    if (txtMOP_Chemistry == null || txtMOP_Chemistry == "") { txtMOP_Chemistry = 0; }
    if (txtMOP_Maths == null || txtMOP_Maths == "") { txtMOP_Maths = 0; }
    if (txtMOP_Botany == null || txtMOP_Botany == "") { txtMOP_Botany = 0; }
    if (txtMOP_Zoology == null || txtMOP_Zoology == "") { txtMOP_Zoology = 0; }

    Total_MarksObtained = (parseInt(txtMOP_Physics)) + (parseInt(txtMOP_Chemistry)) + (parseInt(txtMOP_Maths)) + (parseInt(txtMOP_Botany)) + (parseInt(txtMOP_Zoology));
    $('#txtMOP_Total').text(Total_MarksObtained);


    var txtTMTP_Physics = $('#txtTMTP_Physics').val();
    var txtTMTP_Chemistry = $('#txtTMTP_Chemistry').val();
    var txtTMTP_Maths = $('#txtTMTP_Maths').val();
    var txtTMTP_Botany = $('#txtTMTP_Botany').val();
    var txtTMTP_Zoology = $('#txtTMTP_Zoology').val();
    var Total_Theory_Practical = 0;

    if (txtTMTP_Physics == null || txtTMTP_Physics == "") { txtTMTP_Physics = 0; }
    if (txtTMTP_Chemistry == null || txtTMTP_Chemistry == "") { txtTMTP_Chemistry = 0; }
    if (txtTMTP_Maths == null || txtTMTP_Maths == "") { txtTMTP_Maths = 0; }
    if (txtTMTP_Botany == null || txtTMTP_Botany == "") { txtTMTP_Botany = 0; }
    if (txtTMTP_Zoology == null || txtTMTP_Zoology == "") { txtTMTP_Zoology = 0; }

    Total_Theory_Practical = (parseInt(txtTMTP_Physics)) + (parseInt(txtTMTP_Chemistry)) + (parseInt(txtTMTP_Maths)) + (parseInt(txtTMTP_Botany)) + (parseInt(txtTMTP_Zoology));
    $('#txtTMTP_Total').text(Total_Theory_Practical);


    var txtTMOTP_Physics = $('#txtTMOTP_Physics').val();
    var txtTMOTP_Chemistry = $('#txtTMOTP_Chemistry').val();
    var txtTMOTP_Maths = $('#txtTMOTP_Maths').val();
    var txtTMOTP_Botany = $('#txtTMOTP_Botany').val();
    var txtTMOTP_Zoology = $('#txtTMOTP_Zoology').val();
    var Total_Theory_MarkObtain = 0;

    if (txtTMOTP_Physics == null || txtTMOTP_Physics == "") { txtTMOTP_Physics = 0; }
    if (txtTMOTP_Chemistry == null || txtTMOTP_Chemistry == "") { txtTMOTP_Chemistry = 0; }
    if (txtTMOTP_Maths == null || txtTMOTP_Maths == "") { txtTMOTP_Maths = 0; }
    if (txtTMOTP_Botany == null || txtTMOTP_Botany == "") { txtTMOTP_Botany = 0; }
    if (txtTMOTP_Zoology == null || txtTMOTP_Zoology == "") { txtTMOTP_Zoology = 0; }

    Total_Theory_MarkObtain = (parseInt(txtTMOTP_Physics)) + (parseInt(txtTMOTP_Chemistry)) + (parseInt(txtTMOTP_Maths)) + (parseInt(txtTMOTP_Botany)) + (parseInt(txtTMOTP_Zoology));
    $('#txtTMOTP_Total').text(Total_Theory_MarkObtain);
    /*End - Total Vertical*/





    /* Start Total Theory + Total Practical */

    var txtTMT_Physics = $('#txtTMT_Physics').val();
    var txtTMT_Chemistry = $('#txtTMT_Chemistry').val();
    var txtTMT_Maths = $('#txtTMT_Maths').val();
    var txtTMT_Botany = $('#txtTMT_Botany').val();
    var txtTMT_Zoology = $('#txtTMT_Zoology').val();
    var Total_Theory_Practical_Physics = 0;
    var Total_Theory_Practical_Chemistry = 0;
    var Total_Theory_Practical_Maths = 0;
    var Total_Theory_Practical_Botany = 0;
    var Total_Theory_Practical_Zoology = 0;

    if (txtTMT_Physics == null || txtTMT_Physics == "") { txtTMT_Physics = 0; }
    if (txtTMT_Chemistry == null || txtTMT_Chemistry == "") { txtTMT_Chemistry = 0; }
    if (txtTMT_Maths == null || txtTMT_Maths == "") { txtTMT_Maths = 0; }
    if (txtTMT_Botany == null || txtTMT_Botany == "") { txtTMT_Botany = 0; }
    if (txtTMT_Zoology == null || txtTMT_Zoology == "") { txtTMT_Zoology = 0; }

    Total_Theory_Practical_Physics = (parseInt(txtTMT_Physics));
    Total_Theory_Practical_Chemistry = (parseInt(txtTMT_Chemistry));
    Total_Theory_Practical_Maths = (parseInt(txtTMT_Maths));
    Total_Theory_Practical_Botany = (parseInt(txtTMT_Botany));
    Total_Theory_Practical_Zoology = (parseInt(txtTMT_Zoology));

    var txtTMP_Physics = $('#txtTMP_Physics').val();
    var txtTMP_Chemistry = $('#txtTMP_Chemistry').val();
    var txtTMP_Maths = $('#txtTMP_Maths').val();
    var txtTMP_Botany = $('#txtTMP_Botany').val();
    var txtTMP_Zoology = $('#txtTMP_Zoology').val();

    var Total_Theory_Practical2_Physics = 0;
    var Total_Theory_Practical2_Chemistry = 0;
    var Total_Theory_Practical2_Maths = 0;
    var Total_Theory_Practical2_Botany = 0;
    var Total_Theory_Practical2_Zoology = 0;

    Total_Theory_Practical2_Physics = (parseInt(txtTMP_Physics));
    Total_Theory_Practical2_Chemistry = (parseInt(txtTMP_Chemistry));
    Total_Theory_Practical2_Maths = (parseInt(txtTMP_Maths));
    Total_Theory_Practical2_Botany = (parseInt(txtTMP_Botany));
    Total_Theory_Practical2_Zoology = (parseInt(txtTMP_Zoology));

    if (txtTMP_Physics == null || txtTMP_Physics == "") { txtTMP_Physics = 0; }
    if (txtTMP_Chemistry == null || txtTMP_Chemistry == "") { txtTMP_Chemistry = 0; }
    if (txtTMP_Maths == null || txtTMP_Maths == "") { txtTMP_Maths = 0; }
    if (txtTMP_Botany == null || txtTMP_Botany == "") { txtTMP_Botany = 0; }
    if (txtTMP_Zoology == null || txtTMP_Zoology == "") { txtTMP_Zoology = 0; }

    Total_Theory_Practical2_Physics = (parseInt(txtTMP_Physics));
    Total_Theory_Practical2_Chemistry = (parseInt(txtTMP_Chemistry));
    Total_Theory_Practical2_Maths = (parseInt(txtTMP_Maths));
    Total_Theory_Practical2_Botany = (parseInt(txtTMP_Botany));
    Total_Theory_Practical2_Zoology = (parseInt(txtTMP_Zoology));

    Total_Theory_Practical_Physics = Total_Theory_Practical_Physics + Total_Theory_Practical2_Physics;
    Total_Theory_Practical_Chemistry = Total_Theory_Practical_Chemistry + Total_Theory_Practical2_Chemistry;
    Total_Theory_Practical_Maths = Total_Theory_Practical_Maths + Total_Theory_Practical2_Maths;
    Total_Theory_Practical_Botany = Total_Theory_Practical_Botany + Total_Theory_Practical2_Botany;
    Total_Theory_Practical_Zoology = Total_Theory_Practical_Zoology + Total_Theory_Practical2_Zoology;

    $('#txtTMTP_Physics').val(Total_Theory_Practical_Physics);
    $('#txtTMTP_Chemistry').val(Total_Theory_Practical_Chemistry);
    $('#txtTMTP_Maths').val(Total_Theory_Practical_Maths);
    $('#txtTMTP_Botany').val(Total_Theory_Practical_Botany);
    $('#txtTMTP_Zoology').val(Total_Theory_Practical_Zoology);



    /* End Total Theory + Total Practical */


    /**/
    var txtMOT_Physics = $('#txtMOT_Physics').val();
    var txtMOT_Chemistry = $('#txtMOT_Chemistry').val();
    var txtMOT_Maths = $('#txtMOT_Maths').val();
    var txtMOT_Botany = $('#txtMOT_Botany').val();
    var txtMOT_Zoology = $('#txtMOT_Zoology').val();
    var Total_Theory_MarkObtain_Physics = 0;
    var Total_Theory_MarkObtain_Chemistry = 0;
    var Total_Theory_MarkObtain_Maths = 0;
    var Total_Theory_MarkObtain_Botany = 0;
    var Total_Theory_MarkObtain_Zoology = 0;

    if (txtMOT_Physics == null || txtMOT_Physics == "") { txtMOT_Physics = 0; }
    if (txtMOT_Chemistry == null || txtMOT_Chemistry == "") { txtMOT_Chemistry = 0; }
    if (txtMOT_Maths == null || txtMOT_Maths == "") { txtMOT_Maths = 0; }
    if (txtMOT_Botany == null || txtMOT_Botany == "") { txtMOT_Botany = 0; }
    if (txtMOT_Zoology == null || txtMOT_Zoology == "") { txtMOT_Zoology = 0; }

    Total_Theory_MarkObtain_Physics = (parseInt(txtMOT_Physics));
    Total_Theory_MarkObtain_Chemistry = (parseInt(txtMOT_Chemistry));
    Total_Theory_MarkObtain_Maths = (parseInt(txtMOT_Maths));
    Total_Theory_MarkObtain_Botany = (parseInt(txtMOT_Botany));
    Total_Theory_MarkObtain_Zoology = (parseInt(txtMOT_Zoology));

    var txtMOP_Physics = $('#txtMOP_Physics').val();
    var txtMOP_Chemistry = $('#txtMOP_Chemistry').val();
    var txtMOP_Maths = $('#txtMOP_Maths').val();
    var txtMOP_Botany = $('#txtMOP_Botany').val();
    var txtMOP_Zoology = $('#txtMOP_Zoology').val();

    var Total_Theory_MarkObtain2_Physics = 0;
    var Total_Theory_MarkObtain2_Chemistry = 0;
    var Total_Theory_MarkObtain2_Maths = 0;
    var Total_Theory_MarkObtain2_Botany = 0;
    var Total_Theory_MarkObtain2_Zoology = 0;

    if (txtMOP_Physics == null || txtMOP_Physics == "") { txtMOP_Physics = 0; }
    if (txtMOP_Chemistry == null || txtMOP_Chemistry == "") { txtMOP_Chemistry = 0; }
    if (txtMOP_Maths == null || txtMOP_Maths == "") { txtMOP_Maths = 0; }
    if (txtMOP_Botany == null || txtMOP_Botany == "") { txtMOP_Botany = 0; }
    if (txtMOP_Zoology == null || txtMOP_Zoology == "") { txtMOP_Zoology = 0; }

    Total_Theory_MarkObtain2_Physics = (parseInt(txtMOP_Physics));
    Total_Theory_MarkObtain2_Chemistry = (parseInt(txtMOP_Chemistry));
    Total_Theory_MarkObtain2_Maths = (parseInt(txtMOP_Maths));
    Total_Theory_MarkObtain2_Botany = (parseInt(txtMOP_Botany));
    Total_Theory_MarkObtain2_Zoology = (parseInt(txtMOP_Zoology));

    Total_Theory_MarkObtain_Physics = Total_Theory_MarkObtain_Physics + Total_Theory_MarkObtain2_Physics;
    Total_Theory_MarkObtain_Chemistry = Total_Theory_MarkObtain_Chemistry + Total_Theory_MarkObtain2_Chemistry;
    Total_Theory_MarkObtain_Maths = Total_Theory_MarkObtain_Maths + Total_Theory_MarkObtain2_Maths;
    Total_Theory_MarkObtain_Botany = Total_Theory_MarkObtain_Botany + Total_Theory_MarkObtain2_Botany;
    Total_Theory_MarkObtain_Zoology = Total_Theory_MarkObtain_Zoology + Total_Theory_MarkObtain2_Zoology;

    $('#txtTMOTP_Physics').val(Total_Theory_MarkObtain_Physics);
    $('#txtTMOTP_Chemistry').val(Total_Theory_MarkObtain_Chemistry);
    $('#txtTMOTP_Maths').val(Total_Theory_MarkObtain_Maths);
    $('#txtTMOTP_Botany').val(Total_Theory_MarkObtain_Botany);
    $('#txtTMOTP_Zoology').val(Total_Theory_MarkObtain_Zoology);


    /**/


    /*Start - PCM*/

    var txtTMT_Physics = $('#txtTMT_Physics').val();
    var txtTMT_Chemistry = $('#txtTMT_Chemistry').val();
    var txtTMT_Maths = $('#txtTMT_Maths').val();
    var Total_PCM = 0;

    if (txtTMT_Physics == null || txtTMT_Physics == "") { txtTMT_Physics = 0; }
    if (txtTMT_Chemistry == null || txtTMT_Chemistry == "") { txtTMT_Chemistry = 0; }
    if (txtTMT_Maths == null || txtTMT_Maths == "") { txtTMT_Maths = 0; }

    Total_PCM = (parseInt(txtTMT_Physics)) + (parseInt(txtTMT_Chemistry)) + (parseInt(txtTMT_Maths));
    $('#txtTMT_PCM').text(Total_PCM);


    var txtMOT_Physics = $('#txtMOT_Physics').val();
    var txtMOT_Chemistry = $('#txtMOT_Chemistry').val();
    var txtMOT_Maths = $('#txtMOT_Maths').val();
    var Total_MOT_PCM = 0;

    if (txtMOT_Physics == null || txtMOT_Physics == "") { txtMOT_Physics = 0; }
    if (txtMOT_Chemistry == null || txtMOT_Chemistry == "") { txtMOT_Chemistry = 0; }
    if (txtMOT_Maths == null || txtMOT_Maths == "") { txtMOT_Maths = 0; }

    Total_MOT_PCM = (parseInt(txtMOT_Physics)) + (parseInt(txtMOT_Chemistry)) + (parseInt(txtMOT_Maths));
    $('#txtMOT_PCM').text(Total_MOT_PCM);


    var txtTMP_Physics = $('#txtTMP_Physics').val();
    var txtTMP_Chemistry = $('#txtTMP_Chemistry').val();
    var txtTMP_Maths = $('#txtTMP_Maths').val();
    var Total_TMP_PCM = 0;

    if (txtTMP_Physics == null || txtTMP_Physics == "") { txtTMP_Physics = 0; }
    if (txtTMP_Chemistry == null || txtTMP_Chemistry == "") { txtTMP_Chemistry = 0; }
    if (txtTMP_Maths == null || txtTMP_Maths == "") { txtTMP_Maths = 0; }

    Total_TMP_PCM = (parseInt(txtTMP_Physics)) + (parseInt(txtTMP_Chemistry)) + (parseInt(txtTMP_Maths));
    $('#txtTMP_PCM').text(Total_TMP_PCM);


    var txtMOP_Physics = $('#txtMOP_Physics').val();
    var txtMOP_Chemistry = $('#txtMOP_Chemistry').val();
    var txtMOP_Maths = $('#txtMOP_Maths').val();
    var Total_MOP_PCM = 0;

    if (txtMOP_Physics == null || txtMOP_Physics == "") { txtMOP_Physics = 0; }
    if (txtMOP_Chemistry == null || txtMOP_Chemistry == "") { txtMOP_Chemistry = 0; }
    if (txtMOP_Maths == null || txtMOP_Maths == "") { txtMOP_Maths = 0; }


    Total_MOP_PCM = (parseInt(txtMOP_Physics)) + (parseInt(txtMOP_Chemistry)) + (parseInt(txtMOP_Maths));
    $('#txtMOP_PCM').text(Total_MOP_PCM);


    var txtTMTP_Physics = $('#txtTMTP_Physics').val();
    var txtTMTP_Chemistry = $('#txtTMTP_Chemistry').val();
    var txtTMTP_Maths = $('#txtTMTP_Maths').val();
    var Total_TMTP_PCM = 0;

    if (txtTMTP_Physics == null || txtTMTP_Physics == "") { txtTMTP_Physics = 0; }
    if (txtTMTP_Chemistry == null || txtTMTP_Chemistry == "") { txtTMTP_Chemistry = 0; }
    if (txtTMTP_Maths == null || txtTMTP_Maths == "") { txtTMTP_Maths = 0; }

    Total_TMTP_PCM = (parseInt(txtTMTP_Physics)) + (parseInt(txtTMTP_Chemistry)) + (parseInt(txtTMTP_Maths));
    $('#txtTMTP_PCM').text(Total_TMTP_PCM);




    var txtTMOTP_Physics = $('#txtTMOTP_Physics').val();
    var txtTMOTP_Chemistry = $('#txtTMOTP_Chemistry').val();
    var txtTMOTP_Maths = $('#txtTMOTP_Maths').val();
    var Total_TMOTP_PCM = 0;

    if (txtTMOTP_Physics == null || txtTMOTP_Physics == "") { txtTMOTP_Physics = 0; }
    if (txtTMOTP_Chemistry == null || txtTMOTP_Chemistry == "") { txtTMOTP_Chemistry = 0; }
    if (txtTMOTP_Maths == null || txtTMOTP_Maths == "") { txtTMOTP_Maths = 0; }

    Total_TMOTP_PCM = (parseInt(txtTMOTP_Physics)) + (parseInt(txtTMOTP_Chemistry)) + (parseInt(txtTMOTP_Maths));
    $('#txtTMOTP_PCM').text(Total_TMOTP_PCM);



    /*End - PCM*/

    /*Start - PCB*/

    var txtTMT_Physics = $('#txtTMT_Physics').val();
    var txtTMT_Chemistry = $('#txtTMT_Chemistry').val();
    var txtTMT_Botany = $('#txtTMT_Botany').val();
    var txtTMT_Zoology = $('#txtTMT_Zoology').val();
    var Total_PCB = 0;

    if (txtTMT_Physics == null || txtTMT_Physics == "") { txtTMT_Physics = 0; }
    if (txtTMT_Chemistry == null || txtTMT_Chemistry == "") { txtTMT_Chemistry = 0; }
    if (txtTMT_Botany == null || txtTMT_Botany == "") { txtTMT_Botany = 0; }
    if (txtTMT_Zoology == null || txtTMT_Zoology == "") { txtTMT_Zoology = 0; }

    Total_PCB = (parseInt(txtTMT_Physics)) + (parseInt(txtTMT_Chemistry)) + (parseInt(txtTMT_Botany)) + (parseInt(txtTMT_Zoology));
    $('#txtTMT_PCB').text(Total_PCB);


    var txtMOT_Physics = $('#txtMOT_Physics').val();
    var txtMOT_Chemistry = $('#txtMOT_Chemistry').val();
    var txtMOT_Botany = $('#txtMOT_Botany').val();
    var txtMOT_Zoology = $('#txtMOT_Zoology').val();
    var Total_MOT_PCB = 0;

    if (txtMOT_Physics == null || txtMOT_Physics == "") { txtMOT_Physics = 0; }
    if (txtMOT_Chemistry == null || txtMOT_Chemistry == "") { txtMOT_Chemistry = 0; }
    if (txtMOT_Botany == null || txtMOT_Botany == "") { txtMOT_Botany = 0; }
    if (txtMOT_Zoology == null || txtMOT_Zoology == "") { txtMOT_Zoology = 0; }

    Total_MOT_PCB = (parseInt(txtMOT_Physics)) + (parseInt(txtMOT_Chemistry)) + (parseInt(txtMOT_Botany)) + (parseInt(txtMOT_Zoology));
    $('#txtMOT_PCB').text(Total_MOT_PCB);


    var txtTMP_Physics = $('#txtTMP_Physics').val();
    var txtTMP_Chemistry = $('#txtTMP_Chemistry').val();
    var txtTMP_Botany = $('#txtTMP_Botany').val();
    var txtTMP_Zoology = $('#txtTMP_Zoology').val();
    var Total_TMP_PCB = 0;

    if (txtTMP_Physics == null || txtTMP_Physics == "") { txtTMP_Physics = 0; }
    if (txtTMP_Chemistry == null || txtTMP_Chemistry == "") { txtTMP_Chemistry = 0; }
    if (txtTMP_Botany == null || txtTMP_Botany == "") { txtTMP_Botany = 0; }
    if (txtTMP_Zoology == null || txtTMP_Zoology == "") { txtTMP_Zoology = 0; }

    Total_TMP_PCB = (parseInt(txtTMP_Physics)) + (parseInt(txtTMP_Chemistry)) + (parseInt(txtTMP_Botany)) + (parseInt(txtTMP_Zoology));
    $('#txtTMP_PCB').text(Total_TMP_PCB);


    var txtMOP_Physics = $('#txtMOP_Physics').val();
    var txtMOP_Chemistry = $('#txtMOP_Chemistry').val();
    var txtMOP_Botany = $('#txtMOP_Botany').val();
    var txtMOP_Zoology = $('#txtMOP_Zoology').val();
    var Total_MOP_PCB = 0;

    if (txtMOP_Physics == null || txtMOP_Physics == "") { txtMOP_Physics = 0; }
    if (txtMOP_Chemistry == null || txtMOP_Chemistry == "") { txtMOP_Chemistry = 0; }
    if (txtMOP_Botany == null || txtMOP_Botany == "") { txtMOP_Botany = 0; }
    if (txtMOP_Zoology == null || txtMOP_Zoology == "") { txtMOP_Zoology = 0; }


    Total_MOP_PCB = (parseInt(txtMOP_Physics)) + (parseInt(txtMOP_Chemistry)) + (parseInt(txtMOP_Botany)) + (parseInt(txtMOP_Zoology));
    //Total_MOP_PCB = (parseInt(txtTMT_Physics)) + (parseInt(txtTMT_Chemistry)) + (parseInt(txtTMT_Botany)) + (parseInt(txtTMT_Zoology));

    $('#txtMOP_PCB').text(Total_MOP_PCB);


    var txtTMTP_Physics = $('#txtTMTP_Physics').val();
    var txtTMTP_Chemistry = $('#txtTMTP_Chemistry').val();
    var txtTMTP_Botany = $('#txtTMTP_Botany').val();
    var txtTMTP_Zoology = $('#txtTMTP_Zoology').val();
    var Total_TMTP_PCB = 0;

    if (txtTMTP_Physics == null || txtTMTP_Physics == "") { txtTMTP_Physics = 0; }
    if (txtTMTP_Chemistry == null || txtTMTP_Chemistry == "") { txtTMTP_Chemistry = 0; }
    if (txtTMTP_Botany == null || txtTMTP_Botany == "") { txtTMTP_Botany = 0; }
    if (txtTMTP_Zoology == null || txtTMTP_Zoology == "") { txtTMTP_Zoology = 0; }

    Total_TMTP_PCB = (parseInt(txtTMTP_Physics)) + (parseInt(txtTMTP_Chemistry)) + (parseInt(txtTMTP_Botany)) + (parseInt(txtTMTP_Zoology));
    $('#txtTMTP_PCB').text(Total_TMTP_PCB);




    var txtTMOTP_Physics = $('#txtTMOTP_Physics').val();
    var txtTMOTP_Chemistry = $('#txtTMOTP_Chemistry').val();
    var txtTMOTP_Botany = $('#txtTMOTP_Botany').val();
    var txtTMOTP_Zoology = $('#txtTMOTP_Zoology').val();
    var Total_TMOTP_PCB = 0;

    if (txtTMOTP_Physics == null || txtTMOTP_Physics == "") { txtTMOTP_Physics = 0; }
    if (txtTMOTP_Chemistry == null || txtTMOTP_Chemistry == "") { txtTMOTP_Chemistry = 0; }
    if (txtTMOTP_Botany == null || txtTMOTP_Botany == "") { txtTMOTP_Botany = 0; }
    if (txtTMOTP_Zoology == null || txtTMOTP_Zoology == "") { txtTMOTP_Zoology = 0; }

    Total_TMOTP_PCB = (parseInt(txtTMOTP_Physics)) + (parseInt(txtTMOTP_Chemistry)) + (parseInt(txtTMOTP_Botany)) + (parseInt(txtTMOTP_Zoology));
    $('#txtTMOTP_PCB').text(Total_TMOTP_PCB);

    /*End - PCB*/


    /*NIRAJ*/


    if (txtTMT_Maths == 0) {
        //Total_TMOTP_PCM = Total_TMOTP_PCM + (parseInt(txtTMT_Botany));
        $('#lblPCM').hide();
        $('#lblPCB').show();

    } else if (txtTMT_Botany == 0 && txtTMT_Zoology == 0) {
        $('#lblPCB').hide();
        $('#lblPCM').show();

    } else if (txtTMT_Botany == 0) {
        //Total_TMOTP_PCB = Total_TMOTP_PCB + (parseInt(txtTMP_Maths));
        $('#lblPCB').hide();
        $('#lblPCM').show();

    } else {
        $('#lblPCB').show();
        $('#lblPCM').show();
    }

    var lblPCM = (Total_TMOTP_PCM / Total_TMTP_PCM) * 100;

    var lblPCB = Total_TMOTP_PCB / Total_TMTP_PCB * 100;
    $('#lblPCM').text(parseFloat(lblPCM.toFixed(2)) + '%');
    $('#lblPCB').text(parseFloat(lblPCB.toFixed(2)) + '%');
    /*NIRAJ*/
    ValidateMarks();
}

//marks validation
function ValidateMarks() {
    debugger;
    var ExamType = $("input[name='marks']:checked").val();//marks

    if (ExamType == "yes1") {

        //1. Physics
        var txtTMTP_Physics = $('#txtTMTP_Physics').val();
        var txtTMOTP_Physics = $('#txtTMOTP_Physics').val();


        if (txtTMTP_Physics != null | txtTMTP_Physics != "") {
            if (txtTMOTP_Physics != null | txtTMOTP_Physics != "") {
                if (Number(txtTMTP_Physics) < Number(txtTMOTP_Physics)) {
                    $('#txtTMT_Physics').val('');
                    $('#txtMOT_Physics').val('');
                    $('#txtTMP_Physics').val('');
                    $('#txtMOP_Physics').val('');
                    $('#txtTMTP_Physics').val('');
                    $('#txtTMOTP_Physics').val('');
                    alert('Please enter correct total marks & obtained marks !')
                }
            }
        }
        //2. Chemistry
        var txtTMTP_Chemistry = $('#txtTMTP_Chemistry').val();
        var txtTMOTP_Chemistry = $('#txtTMOTP_Chemistry').val();

        //over all
        if (txtTMTP_Chemistry != null | txtTMTP_Chemistry != "") {
            if (txtTMOTP_Chemistry != null | txtTMOTP_Chemistry != "") {
                if (Number(txtTMTP_Chemistry) < Number(txtTMOTP_Chemistry)) {
                    $('#txtTMT_Chemistry').val('');
                    $('#txtMOT_Chemistry').val('');
                    $('#txtTMP_Chemistry').val('');
                    $('#txtMOP_Chemistry').val('');
                    $('#txtTMTP_Chemistry').val('');
                    $('#txtTMOTP_Chemistry').val('');
                    alert('Please enter correct total marks & obtained marks in Chemistry !')
                }
            }
        }
        //3. Mathematics
        var txtTMTP_Mathematics = $('#txtTMTP_Maths').val();
        var txtTMOTP_Mathematics = $('#txtTMOTP_Maths').val();

        //var txtTMT_Mathematics = $('#txtTMT_Maths').val();
        //var txtMOT_Mathematics = $('#txtMOT_Maths').val();
        //var txtTMP_Mathematics = $('#txtTMP_Maths').val();
        //var txtMOP_Mathematics = $('#txtMOP_Maths').val();

        ////Theory
        //if (txtTMT_Mathematics != null | txtTMT_Mathematics != "") {
        //    if (txtMOT_Mathematics != null | txtMOT_Mathematics != "") {
        //        if (Number(txtTMT_Mathematics) < Number(txtMOT_Mathematics)) {
        //            $('#txtTMT_Maths').val('');
        //            $('#txtMOT_Maths').val('');
        //            alert('Please enter correct total marks & obtained marks !')
        //        }
        //    }
        //}

        //over all
        if (txtTMTP_Mathematics != null | txtTMTP_Mathematics != "") {
            if (txtTMOTP_Mathematics != null | txtTMOTP_Mathematics != "") {
                if (Number(txtTMTP_Mathematics) < Number(txtTMOTP_Mathematics)) {
                    $('#txtTMT_Maths').val('');
                    $('#txtMOT_Maths').val('');
                    $('#txtTMP_Maths').val('');
                    $('#txtMOP_Maths').val('');
                    $('#txtTMTP_Maths').val('');
                    $('#txtTMOTP_Maths').val('');
                    alert('Please enter correct total marks & obtained marks in Mathematics !')
                }
            }
        }
        //4. Botany
        var txtTMTP_Botany = $('#txtTMTP_Botany').val();
        var txtTMOTP_Botany = $('#txtTMOTP_Botany').val();

        //over all
        if (txtTMTP_Botany != null | txtTMTP_Botany != "") {
            if (txtTMOTP_Botany != null | txtTMOTP_Botany != "") {
                if (Number(txtTMTP_Botany) < Number(txtTMOTP_Botany)) {
                    $('#txtTMT_Botany').val('');
                    $('#txtMOT_Botany').val('');
                    $('#txtTMP_Botany').val('');
                    $('#txtMOP_Botany').val('');
                    $('#txtTMTP_Botany').val('');
                    $('#txtTMOTP_Botany').val('');
                    alert('Please enter correct total marks & obtained marks in Botany !')
                }
            }
        }
        //5. Zoology
        var txtTMTP_Zoology = $('#txtTMTP_Zoology').val();
        var txtTMOTP_Zoology = $('#txtTMOTP_Zoology').val();

        //over all
        if (txtTMTP_Zoology != null | txtTMTP_Zoology != "") {
            if (txtTMOTP_Zoology != null | txtTMOTP_Zoology != "") {
                if (Number(txtTMTP_Zoology) < Number(txtTMOTP_Zoology)) {
                    $('#txtTMT_Zoology').val('');
                    $('#txtMOT_Zoology').val('');
                    $('#txtTMP_Zoology').val('');
                    $('#txtMOP_Zoology').val('');
                    $('#txtTMTP_Zoology').val('');
                    $('#txtTMOTP_Zoology').val('');
                    alert('Please enter correct total marks & obtained marks in Zoology !')
                }
            }
        }
    } else {
        //1. Physics
        var txtTMT_Physics = $('#txtTMT_Physics').val();
        var txtMOT_Physics = $('#txtMOT_Physics').val();
        var txtTMP_Physics = $('#txtTMP_Physics').val();
        var txtMOP_Physics = $('#txtMOP_Physics').val();
        //Theory
        if (txtTMT_Physics != null | txtTMT_Physics != "") {
            if (txtMOT_Physics != null | txtMOT_Physics != "") {
                if (Number(txtTMT_Physics) < Number(txtMOT_Physics)) {
                    $('#txtTMT_Physics').val('');
                    $('#txtMOT_Physics').val('');
                    alert('Please enter correct total marks & obtained marks !')
                }
            }
        }
        //Practical
        if (txtTMP_Physics != null | txtTMP_Physics != "") {
            if (txtMOP_Physics != null | txtMOP_Physics != "") {
                if (Number(txtTMP_Physics) < Number(txtMOP_Physics)) {
                    $('#txtTMP_Physics').val('');
                    $('#txtMOP_Physics').val('');
                    alert('Please enter correct total marks & obtained marks !')
                }
            }
        }
        //2. Chemistry
        var txtTMT_Chemistry = $('#txtTMT_Chemistry').val();
        var txtMOT_Chemistry = $('#txtMOT_Chemistry').val();
        var txtTMP_Chemistry = $('#txtTMP_Chemistry').val();
        var txtMOP_Chemistry = $('#txtMOP_Chemistry').val();

        //Theory
        if (txtTMT_Chemistry != null | txtTMT_Chemistry != "") {
            if (txtMOT_Chemistry != null | txtMOT_Chemistry != "") {
                if (Number(txtTMT_Chemistry) < Number(txtMOT_Chemistry)) {
                    $('#txtTMT_Chemistry').val('');
                    $('#txtMOT_Chemistry').val('');
                    alert('Please enter correct total marks & obtained marks !')
                }
            }
        }
        //Practical
        if (txtTMP_Chemistry != null | txtTMP_Chemistry != "") {
            if (txtMOP_Chemistry != null | txtMOP_Chemistry != "") {
                if (Number(txtTMP_Chemistry) < Number(txtMOP_Chemistry)) {
                    $('#txtTMP_Chemistry').val('');
                    $('#txtMOP_Chemistry').val('');
                    alert('Please enter correct total marks & obtained marks !')
                }
            }
        }
        //3. Mathematics
        var txtTMTP_Mathematics = $('#txtTMTP_Maths').val();
        var txtTMOTP_Mathematics = $('#txtTMOTP_Maths').val();

        //over all
        if (txtTMTP_Mathematics != null | txtTMTP_Mathematics != "") {
            if (txtTMOTP_Mathematics != null | txtTMOTP_Mathematics != "") {
                if (Number(txtTMTP_Mathematics) < Number(txtTMOTP_Mathematics)) {
                    $('#txtTMT_Maths').val('');
                    $('#txtMOT_Maths').val('');
                    $('#txtTMP_Maths').val('');
                    $('#txtMOP_Maths').val('');
                    $('#txtTMTP_Maths').val('');
                    $('#txtTMOTP_Maths').val('');
                    alert('Please enter correct total marks & obtained marks in Mathematics !')
                }
            }
        }
        //4. Botany
        var txtTMT_Botany = $('#txtTMT_Botany').val();
        var txtMOT_Botany = $('#txtMOT_Botany').val();
        var txtTMP_Botany = $('#txtTMP_Botany').val();
        var txtMOP_Botany = $('#txtMOP_Botany').val();

        //Theory
        if (txtTMT_Botany != null | txtTMT_Botany != "") {
            if (txtMOT_Botany != null | txtMOT_Botany != "") {
                if (Number(txtTMT_Botany) < Number(txtMOT_Botany)) {
                    $('#txtTMT_Botany').val('');
                    $('#txtMOT_Botany').val('');
                    alert('Please enter correct total marks & obtained marks !')
                }
            }
        }
        //Practical
        if (txtTMP_Botany != null | txtTMP_Botany != "") {
            if (txtMOP_Botany != null | txtMOP_Botany != "") {
                if (Number(txtTMP_Botany) < Number(txtMOP_Botany)) {
                    $('#txtTMP_Botany').val('');
                    $('#txtMOP_Botany').val('');
                    alert('Please enter correct total marks & obtained marks !')
                }
            }
        }
        //5. Zology
        var txtTMT_Zoology = $('#txtTMT_Zoology').val();
        var txtMOT_Zoology = $('#txtMOT_Zoology').val();
        var txtTMP_Zoology = $('#txtTMP_Zoology').val();
        var txtMOP_Zoology = $('#txtMOP_Zoology').val();
        //Theory
        if (txtTMT_Zoology != null | txtTMT_Zoology != "") {
            if (txtMOT_Zoology != null | txtMOT_Zoology != "") {
                if (Number(txtTMT_Zoology) < Number(txtMOT_Zoology)) {
                    $('#txtTMT_Zoology').val('');
                    $('#txtMOT_Zoology').val('');
                    alert('Please enter correct total marks & obtained marks !')
                }
            }
        }
        //Practical
        if (txtTMP_Zoology != null | txtTMP_Zoology != "") {
            if (txtMOP_Zoology != null | txtMOP_Zoology != "") {
                if (Number(txtTMP_Zoology) < Number(txtMOP_Zoology)) {
                    $('#txtTMP_Zoology').val('');
                    $('#txtMOP_Zoology').val('');
                    alert('Please enter correct total marks & obtained marks !')
                }
            }
        }
    }

}

function SubmitData() {

    //if (!ValidateForm()) {
    //    return;
    //}
    debugger;
    //$("#btnSubmit").prop('disabled', true);


    var qs = getQueryStrings();
    var uid = qs["UID"];
    var svcid = qs["SvcID"];
    var dpt = qs["DPT"];
    var dist = qs["DIST"];
    var blk = qs["BLK"];
    var pan = qs["PAN"];
    var ofc = qs["OFC"];
    var ofr = qs["OFR"];

    var t_Message = "";
    var result = false;

    var ProfileID = "";
    var qs = getQueryStrings();
    if (qs["ProfileID"] != null && qs["ProfileID"] != "") {

        ProfileID = qs["ProfileID"];
    }

    var temp = "Gunwant";
    var AppID = "";
    var result = false;

    var ResponseType = "C";

    var ExamType = $("input[name='marks']:checked").val();//marks

    if (ExamType == "yes1") {
        //MarksPatarn == "yes1"
        ExamType = "CBSE";
    } else {
        ExamType = "CHSE";
    }

    var TMT_Physics = $("#txtTMT_Physics").val();
    var MOT_Physics = $("#txtMOT_Physics").val();
    var TMP_Physics = $("#txtTMP_Physics").val();
    var MOP_Physics = $("#txtMOP_Physics").val();
    var TMTP_Physics = $("#txtTMTP_Physics").val();
    var TMOTP_Physics = $("#txtTMOTP_Physics").val();

    var TMT_Chemistry = $("#txtTMT_Chemistry").val();
    var MOT_Chemistry = $("#txtMOT_Chemistry").val();
    var TMP_Chemistry = $("#txtTMP_Chemistry").val();
    var MOP_Chemistry = $("#txtMOP_Chemistry").val();
    var TMTP_Chemistry = $("#txtTMTP_Chemistry").val();
    var TMOTP_Chemistry = $("#txtTMOTP_Chemistry").val();

    var TMT_Math = $("#txtTMT_Maths").val();
    var MOT_Math = $("#txtMOT_Maths").val();
    var TMP_Math = $("#txtTMP_Maths").val();
    var MOP_Math = $("#txtMOP_Maths").val();
    var TMTP_Math = $("#txtTMTP_Maths").val();
    var TMOTP_Math = $("#txtTMOTP_Maths").val();

    var TMT_Botany = $("#txtTMT_Botany").val();
    var MOT_Botany = $("#txtMOT_Botany").val();
    var TMP_Botany = $("#txtTMP_Botany").val();
    var MOP_Botany = $("#txtMOP_Botany").val();
    var TMTP_Botany = $("#txtTMTP_Botany").val();
    var TMOTP_Botany = $("#txtTMOTP_Botany").val();

    var TMT_Zoology = $("#txtTMT_Zoology").val();
    var MOT_Zoology = $("#txtMOT_Zoology").val();
    var TMP_Zoology = $("#txtTMP_Zoology").val();
    var MOP_Zoology = $("#txtMOP_Zoology").val();
    var TMTP_Zoology = $("#txtTMTP_Zoology").val();
    var TMOTP_Zoology = $("#txtTMOTP_Zoology").val();

    var PCMPercentage = $("#lblPCM").text();// To Check Again
    var TMT_PCM = $("#txtTMT_PCM").text();
    var MOT_PCM = $("#txtMOT_PCM").text();
    var TMP_PCM = $("#txtTMP_PCM").text();
    var MOP_PCM = $("#txtMOP_PCM").text();
    var TMTP_PCM = $("#txtTMTP_PCM").text();
    var MOTP_PCM = $("#txtTMOTP_PCM").text();

    var TMT_PCB = $("#txtTMT_PCB").text();
    var MOT_PCB = $("#txtMOT_PCB").text();
    var TMP_PCB = $("#txtTMP_PCB").text();
    var MOP_PCB = $("#txtMOP_PCB").text();
    var TMTP_PCB = $("#txtTMTP_PCB").text();
    var MOTP_PCB = $("#txtTMOTP_PCB").text();
    var PCBPercentage = $("#lblPCB").text();// To Check Again



    var FormA_AppID = "";

    var qs9 = getQueryStrings();
    if (qs9["UID"] != null && qs9["AppID"] != null) {


        var ProfileID = qs9["UID"];
        oldAppID = qs9["AppID"];//old ID
        //FormA_AppID = EditAppID;
    }

    //var HandicapType = $("input[name='HandicapType']:checked").val();

    if ($("#HFUIDData").val() != "") {
        ResponseType = "";
    }

    var datavar = {
        'AppID': oldAppID,
        'TMT_Physics': TMT_Physics,
        'MOT_Physics': MOT_Physics,
        'TMP_Physics': TMP_Physics,
        'MOP_Physics': MOP_Physics,
        'TMTP_Physics': TMTP_Physics,
        'TMOTP_Physics': TMOTP_Physics,

        'TMT_Chemistry': TMT_Chemistry,
        'MOT_Chemistry': MOT_Chemistry,
        'TMP_Chemistry': TMP_Chemistry,
        'MOP_Chemistry': MOP_Chemistry,
        'TMTP_Chemistry': TMTP_Chemistry,
        'TMOTP_Chemistry': TMOTP_Chemistry,

        'TMT_Math': TMT_Math,
        'MOT_Math': MOT_Math,
        'TMP_Math': TMP_Math,
        'MOP_Math': MOP_Math,
        'TMTP_Math': TMTP_Math,
        'TMOTP_Math': TMOTP_Math,

        'TMT_Botany': TMT_Botany,
        'MOT_Botany': MOT_Botany,
        'TMP_Botany': TMP_Botany,
        'MOP_Botany': MOP_Botany,
        'TMTP_Botany': TMTP_Botany,
        'TMOTP_Botany': TMOTP_Botany,

        'TMT_Zoology': TMT_Zoology,
        'MOT_Zoology': MOT_Zoology,
        'TMP_Zoology': TMP_Zoology,
        'MOP_Zoology': MOP_Zoology,
        'TMTP_Zoology': TMTP_Zoology,
        'TMOTP_Zoology': TMOTP_Zoology,

        'PCMPercentage': PCMPercentage,
        'TMT_PCM': TMT_PCM,
        'MOT_PCM': MOT_PCM,
        'TMP_PCM': TMP_PCM,
        'MOP_PCM': MOP_PCM,
        'TMTP_PCM': TMTP_PCM,
        'MOTP_PCM': MOTP_PCM,
        'TMT_PCB': TMT_PCB,
        'MOT_PCB': MOT_PCB,
        'TMP_PCB': TMP_PCB,
        'MOP_PCB': MOP_PCB,
        'TMTP_PCB': TMTP_PCB,
        'MOTP_PCB': MOTP_PCB,
        'PCBPercentage': PCBPercentage,
        'ExamType': ExamType,

        'department': dpt,
        'district': dist,
        'block': blk,
        'panchayat': pan,
        'office': ofc,
        'officer': ofr,
        'ServiceID': svcid,

        'KeyField': "",
        'EditAppID': "",
        'ProfileID': ProfileID



    };

    var obj = {
        "prefix": "'" + temp + "'",
        "Data": $.stringify(datavar, null, 4)
    };
    $("#progressbar").show();
    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/Kiosk/OUAT/UGMarksEntry.aspx/InsertUGMarksEntryData',
            data: $.stringify(obj, null, 4),
            processData: false,
            dataType: "json",
            success: function (response) {

            },
            error: function (a, b, c) {
                $("#progressbar").hide();
                $("#btnSubmit").prop('disabled', false);
                result = false;
                alertPopup("Could Not Save the Application, Please try again.", "5. " + a.responseText);
            }
        })
        ).then(function (data, textStatus, jqXHR) {
           
            var obj = jQuery.parseJSON(data.d);
            //alert(obj);
            var html = "";
           var  EditAppID = obj.AppID;
            result = true;

            if (result /*&& jqXHRData_IMG_result*/) {
                $("#progressbar").hide();
                alertPopup("UG Addmission 2017  ", "Application saved successfully. Reference ID : " + oldAppID + "");
                //window.location.href = '/WebApp/Kiosk/Forms/Attachment.aspx?SvcID=403&AppID=' + obj.AppID;
                window.location.href = '/WebApp/Kiosk/Forms/ConfirmPayment.aspx?SvcID=431&AppID=' + EditAppID;
                //window.location.href = '/WebApp/Kiosk/OUAT/OUATProcessBar.aspx?SvcID=405&AppID=' + obj.AppID + '&FormA_AppID=' + FormA_AppID;
            }
            else {
                $("#progressbar").hide();
                alertPopup("Form Validation Failed", "Unable to save Applicatin, Please refresh the browser and try again");
            }

        });// end of Then function of main Data Insert Function

    return false;
}

function getQueryStrings() {
    var assoc = {};
    var decode = function (s) { return decodeURIComponent(s.replace(/\+/g, " ")); };
    var queryString = location.search.substring(1);
    var keyValues = queryString.split('&');

    for (var i in keyValues) {
        var key = keyValues[i].split('=');
        if (key.length > 1) {
            assoc[decode(key[0])] = decode(key[1]);
        }
    }

    return assoc;
}
function HomePage() {
    debugger;
    var qs = getQueryStrings();
    var SvcID = qs["SvcID"];
    var AppID = qs["AppID"];
    var UID = qs["UID"];

    window.location.href = '/WebApp/Kiosk/OUAT/OUATHome.aspx?SvcID=' + SvcID + '&AppID=' + AppID + '&UID=' + UID;
}
///submit ouat ug education percentage details of 10th and 12th
//caluclate 10th education data percentage
function calculatepercentage(TotalMarks, MarksObtained) {
    debugger;
    if (TotalMarks == "") return;

    var result = 0;

    if ($("#ddlPctgeCalclte").val() == "501") {
        //(8.3 - 0.5) * 10

        if (TotalMarks <= 0) TotalMarks = 1;

        if (TotalMarks < 3.5) {
            alert("CGPA cannot be less than 3.5");
            $('#txtTotalMarks').val("");
            return;
        }

        if (TotalMarks > 10.5) {
            alert("Please enterr valid CGPA");
            $('#txtTotalMarks').val("");
            return;
        }

        //result = (TotalMarks - 0.5) * 10;
        result = ((TotalMarks) * 9.5).toFixed(2);
    }
    else {

        if (MarksObtained == "") return;

        if (parseInt(TotalMarks) < parseInt(MarksObtained)) {
            alert("Total Marks must be greater than Marks Obtained");
            $('#txtTotalMarks').val("");
            $('#txtMarkSecure').val("");
            $("#txtPercentage").val("");

            return;
        }

        if (TotalMarks <= 0) TotalMarks = 1;

        result = ((MarksObtained / TotalMarks) * 100).toFixed(2);

    }


    $("#txtPercentage").val(result);

}
//caluclate 12th education data percentage
function calculatepercentageXII(TotalMarks, MarksObtained) {

    if (TotalMarks == "") return;

    var result = 0;

    if ($("#ddlPctgeCalclte2").val() == "501") {
        //(8.3 - 0.5) * 10

        if (TotalMarks <= 0) TotalMarks = 1;

        if (TotalMarks < 3.5) {
            alert("CGPA cannot be less than 3.5");
            $('#txtTotalMarks2').val("");
            return;
        }

        if (TotalMarks > 10.5) {
            alert("Please enterr valid CGPA");
            $('#txtTotalMarks2').val("");
            return;
        }

        //result = (TotalMarks - 0.5) * 10;
        result = ((TotalMarks) * 9.5).toFixed(2);
    }
    else {

        if (MarksObtained == "") return;

        var Category = $("#category option:selected").text();

        var Physicallyhandicaped = 0;
        if ($('#CheckBoxList1_1').is(":checked")) {
            // it is checked
            Physicallyhandicaped = 1;
        }


        if (parseInt(TotalMarks) < parseInt(MarksObtained)) {
            alert("Total Marks must be greater than Marks Obtained");
            $('#txtTotalMarks2').val("");
            $('#txtMarkSecure2').val("");
            $("#txtPercentage2").val("");

            return;
        }

        if (TotalMarks <= 0) TotalMarks = 1;

        result = ((MarksObtained / TotalMarks) * 100).toFixed(2);

        if (Category == "SC" || Category == "ST") {
            if (result < 40) {
                alert("Minimum Percentage is 40 %");
                $('#txtTotalMarks2').val("");
                $('#txtMarkSecure2').val("");
                $("#txtPercentage2").val("");
                result = 0;
            }
        } else if (Physicallyhandicaped == 1) {
            if (result < 40) {
                alert("Minimum Percentage is 40 %");
                $('#txtTotalMarks2').val("");
                $('#txtMarkSecure2').val("");
                $("#txtPercentage2").val("");
                result = 0;
            }
        } else if (Category == "General") {
            if (result < 50) {
                alert("Minimum Percentage is 50 %");
                $('#txtTotalMarks2').val("");
                $('#txtMarkSecure2').val("");
                $("#txtPercentage2").val("");
                result = 0;
            }
        }


    }


    $("#txtPercentage2").val(result);

}
$(document).ready(function () {

    $('#txtTotalMarks').change(function () {

        calculatepercentage($('#txtTotalMarks').val(), $('#txtMarkSecure').val());
    });

    $('#txtTotalMarks2').change(function () {

        calculatepercentageXII($('#txtTotalMarks2').val(), $('#txtMarkSecure2').val());
    });

    $('#txtMarkSecure').change(function () {

        calculatepercentage($('#txtTotalMarks').val(), $('#txtMarkSecure').val());
    });

    $('#txtMarkSecure2').change(function () {

        calculatepercentageXII($('#txtTotalMarks2').val(), $('#txtMarkSecure2').val());
    });
});

function SubmitDataOUATUG() {
    debugger;
    var t_Message = "";
    var result = false;
    var temp = "Gunwant";
    var AppID = "";
    var result = false;

    var ResponseType = "C";
    var FormBAppID = "";

    var qs9 = getQueryStrings();
    if (qs9["UID"] != null && qs9["AppID"] != null) {
       
        var ProfileID = qs9["UID"];
        //ProfileID = qs["ProfileID"];
        FormBAppID = qs9["AppID"];
    }

    //var HandicapType = $("input[name='HandicapType']:checked").val();

    if ($("#HFUIDData").val() != "") {
        ResponseType = "";
    }

    var datavar = {
        'FormBAppID': FormBAppID,
        'ProfileID': ProfileID,
        'CertificateName': $('#HDFCN').val(),
        'EduRollNo': $('#txtBoardRollNo').val(),
        'EduNameOfBoard': $('#txtBoardName').val(),
        'EduNameOfExamination': $('#txtExmntnName').val(),
        'EduPassingYear': $('#txtPssngYr option:selected').text(),//DropDown
        'EduGrade': $('#ddlPctgeCalclte').val(),
        'EduTotalMarks': $('#txtTotalMarks').val(),
        'EduMarkSecured': $('#txtMarkSecure').val(),
        'EduPercentage': $('#txtPercentage').val(),


    };

    var obj = {
        "prefix": "'" + temp + "'",
        "Data": $.stringify(datavar, null, 4)
    };
    $("#progressbar").show();
    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/Kiosk/OUAT/10THMarksEntry.aspx/InsertOUATUGEducationData',
            data: $.stringify(obj, null, 4),
            processData: false,
            dataType: "json",
            success: function (response) {

            },
            error: function (a, b, c) {
                $("#progressbar").hide();
                $("#btnSubmit").prop('disabled', false);
                result = false;
                alertPopup("Could Not Save the Application, Please try again.", "5. " + a.responseText);
            }
        })
        ).then(function (data, textStatus, jqXHR) {

            var obj = jQuery.parseJSON(data.d);
            //alert(obj);
            var html = "";
            var NewAppID = obj.AppID;
            result = true;
            var status = obj.intStatus;
            var SvcID="";
            if ($('#HDFCN').val() = "10") {
                SvcID = "432";
            }
            else {
                SvcID = "433";
            }
            if (status == "1") {
                $("#progressbar").hide();
                alertPopup("OUAT UG Education 2017  ", "Application saved successfully. Reference ID : " + NewAppID + "");
                //window.location.href = '/WebApp/Kiosk/Forms/Attachment.aspx?SvcID=403&AppID=' + obj.AppID;
                window.location.href = '/WebApp/Kiosk/Forms/ConfirmPayment.aspx?SvcID=' + SvcID + '&AppID=' + NewAppID;
                //window.location.href = '/WebApp/Kiosk/OUAT/OUATProcessBar.aspx?SvcID=405&AppID=' + obj.AppID + '&FormA_AppID=' + FormA_AppID;
            }
            else {
                $("#progressbar").hide();
                alertPopup("Form Validation Failed", "Unable to save Applicatin, Please refresh the browser and try again");
            }

        });// end of Then function of main Data Insert Function

    return false;
}