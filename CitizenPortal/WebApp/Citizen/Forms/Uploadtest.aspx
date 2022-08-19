<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Uploadtest.aspx.cs" Inherits="CitizenPortal.WebApp.Citizen.Forms.Uploadtest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../../Scripts/jquery-1.9.1.min.js"></script>
    <script src="../../Scripts/jquery.fileupload.js"></script>
    <script type="text/javascript">
        $(function () {
            $(":file").change(function () {
                if (this.files && this.files[0]) {
                    var reader = new FileReader();
                    reader.onload = imageIsLoaded;
                    reader.readAsDataURL(this.files[0]);
                }
            });
        });

        function imageIsLoaded(e) {
            $('#myImg').attr('src', e.target.result);
        };
        var selectedFile = document.getElementById('File1').files[0];
        $('#btnUpload').click(function () {
            var fileUpload = $("#FileUpload1").get(0);
            var files = fileUpload.files;
            var test = new FormData();
            for (var i = 0; i < files.length; i++) {
                test.append(files[i].name, files[i]);
            }
            //$.ajax({
            //    url: "/Handler/UploadHandler.ashx",
            //    type: "POST",
            //    contentType: false,
            //    processData: false,
            //    data: test,
            //    // dataType: "json",
            //    success: function (result) {
            //        alert(result);
            //    },
            //    error: function (err) {
            //        alert(err.statusText);
            //    }
            //});
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <img class="form-control" src="/webApp/kiosk/Images/photo.png" name="photocustomer" style="height: 220px" id="myImg" />
            <input class="camera"
                id="File1" name="Photoupload" type="file">
        </div>
    </form>
</body>
</html>
