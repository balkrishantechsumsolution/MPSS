<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PhotoSignText.aspx.cs" Inherits="CitizenPortal.WebApp.PhotoSignText" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
 <script src="/Scripts/jquery-2.2.3.min.js"></script>
    <script src="/Scripts/angular.min.js"></script>
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
    <script src="/Scripts/fileupload/jquery.iframe-transport.js"></script>
    <script src="/Scripts/fileupload/jquery.fileupload.js"></script>
    <script src="/PortalScripts/ServiceLanguage.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script type="text/javascript">

       

        function EL(id) { return document.getElementById(id); } // Get el by ID helper function

        $(document).ready(function () {
            //debugger;
            //$(function () {
            //    $("#Photo").change(function () {
            //        if (this.files && this.files[0]) {
            //            var reader = new FileReader();
            //            reader.onload = imageIsLoaded;
            //            reader.readAsDataURL(this.files[0]);
            //        }
            //    });
            //});

            //function imageIsLoaded(e) {
            //    $('#imgPhoto').attr('src', e.target.result);
            //};
            //m_ServiceID = $('#HFServiceID').val();

            EL("File1").addEventListener("change", readFile, false);
            EL("File2").addEventListener("change", readFile2, false);
        });


        function readFile() {
            debugger;

            if (this.files && this.files[0]) {
                //if (this.files[0].size > '5000') { alert('The Applicant Phograph size should be less than 5000 Bytes.'); return false; }
                //var imgType = this.files[0].type;
                //if (imgType != 'jpg' || imgType != 'jpeg') { alert('The Applicant Phograph image type should be .jpeg or .jpg'); return false; }


                //var PhotoUpload1 = $("#myImg");

                //var Photoarray = ['JPEG', ' PNG', ' TIFF', 'JPG'];
                //var Extension = PhotoUpload1.val().substring(PhotoUpload1.val().lastIndexOf('.') + 1).toUpperCase();

                //if (Photoarray.indexOf(Extension) <= -1) {
                //    alert("Photo must be in JPEG / PNG form.");
                //    return false;
                //}

                var imgsizee = this.files[0].size;
                var sizekb = imgsizee / 1024;
                sizekb = sizekb.toFixed(0);

                if (sizekb < 10 || sizekb > 50) {
                    // $('#imgupload').attr('src', null);
                    alert('The size of the photograph should fall between 20KB to 50KB. Your Photo Size is ' + sizekb + 'kb.');
                    return false;
                }
                var ftype = this;
                var fileupload = ftype.value;
                if (fileupload == '') {
                    alert("Photograph only allows file types of PNG, JPG, JPEG. ");
                    return;
                }
                else {
                    var Extension = fileupload.substring(fileupload.indexOf('.') + 1);
                    if (Extension == "png" || Extension == "jpeg" || Extension == "jpg") {
                        //if (ftype.files && ftype.files[0]) {
                        //    var reader = new FileReader();
                        //    reader.onload = function (e) {
                        //        $('#File1').attr('src', e.target.result)

                        //    }
                        //    reader.readAsDataURL(ftype.files[0]);
                        //}
                    }
                    else {
                        alert("Photograph only allows file types of PNG, JPG, JPEG. ");
                        return;
                    }
                }

                var FR = new FileReader();
                FR.onload = function (e) {
                    EL("myImg").src = e.target.result;
                    $("textarea#TextArea1").val(e.target.result);
                };
                FR.readAsDataURL(this.files[0]);
            }
        }

        function readFile2() {
            debugger;

            if (this.files && this.files[0]) {
                //if (this.files[0].size > '5000') { alert('The Applicant Phograph size should be less than 5000 Bytes.'); return false; }
                //var imgType = this.files[0].type;
                //if (imgType != 'jpg' || imgType != 'jpeg') { alert('The Applicant Phograph image type should be .jpeg or .jpg'); return false; }


                //var PhotoUpload1 = $("#myImg");

                //var Photoarray = ['JPEG', ' PNG', ' TIFF', 'JPG'];
                //var Extension = PhotoUpload1.val().substring(PhotoUpload1.val().lastIndexOf('.') + 1).toUpperCase();

                //if (Photoarray.indexOf(Extension) <= -1) {
                //    alert("Photo must be in JPEG / PNG form.");
                //    return false;
                //}

                var imgsizee = this.files[0].size;
                var sizekb = imgsizee / 1024;
                sizekb = sizekb.toFixed(0);
                
                if (sizekb < 5 || sizekb > 20) {
                    // $('#imgupload').attr('src', null);
                    alert('The size of the signature should fall between 10KB to 20KB. Your signature Size is ' + sizekb + 'kb.');
                    return false;
                }

                var ftype = this; //document.getElementById('File1');
                var fileupload = ftype.value;
                if (fileupload == '') {
                    alert("Signature only allows file types of PNG, JPG, JPEG. ");
                    return;
                }
                else {
                    var Extension = fileupload.substring(fileupload.indexOf('.') + 1);
                    if (Extension == "png" || Extension == "jpeg" || Extension == "jpg") {
                        //if (ftype.files && ftype.files[0]) {
                        //    var reader = new FileReader();
                        //    reader.onload = function (e) {
                        //        $('#File1').attr('src', e.target.result)

                        //    }
                        //    reader.readAsDataURL(ftype.files[0]);
                        //}
                    }
                    else {
                        alert("Signature only allows file types of PNG, JPG, JPEG. ");
                        return;
                    }
                }

                var FR = new FileReader();
                FR.onload = function (e) {
                    EL("mySign").src = e.target.result;
                    $("textarea#TextArea2").val(e.target.result);

                };
                FR.readAsDataURL(this.files[0]);
            }
        }



    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div id="divPhoto" class="col-md-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title manadatory">Photograph
                    </h4>
                </div>
                <div class="box-body box-body-open p0">
                    <div class="col-lg-12">
                        <img class="form-control" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="height: 220px" id="myImg" />
                        <input class="camera" id="File1" name="Photoupload" type="file" />
                        <textarea id="TextArea1" cols="20" name="S1" rows="2"></textarea></div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
            <div id="divSign" class="col-md-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title manadatory">Signature
                    </h4>
                </div>
                <div class="box-body box-body-open p0">
                    <div class="col-lg-12">
                        <img class="form-control" src="/WebApp/Kiosk/OISF/img/signature.png" name="signaturecustomer" style="height: 150px" id="mySign" />
                        <input class="camera" id="File2" name="Photoupload" type="file" />
                        <textarea id="TextArea2" cols="20" name="S2" rows="2"></textarea></div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
