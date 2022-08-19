<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PhotoUpload.aspx.cs" Inherits="CitizenPortal.WebApp.PhotoUpload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../Scripts/jquery-2.2.3.min.js"></script>
    
    <%--<script>
        // Another block of code to upload files using Javascript and a Generic File Handler

        var _URL = window.URL || window.webkitURL;

        $(document).ready(function () {

            $("#btnUpload").bind("click", function (e) { return CheckImage(); });

            //$("#btnUpload").on('click', function () {
            //});

        });

        function CheckImage() {
            alert('1');
            var file, img;
            if ((file = $("#f_UploadImage").get(0).files[0])) {
                img = new Image();
                img.onload = function () {
                    sendFile(file);
                };
                img.onerror = function () {
                    alert("Not a valid file:" + file.type);
                };
                img.src = _URL.createObjectURL(file);
            }

        }

        function sendFile(file) {

            var formData = new FormData();
            formData.append('file', $('#f_UploadImage')[0].files[0]);
            $.ajax({
                type: 'post',
                url: 'fileUploader.ashx',
                data: formData,
                success: function (status) {
                    if (status != 'error') {
                        var my_path = "../Uploads/" + status;
                        $("#myUploadedImg").attr("src", my_path);
                    }
                },
                processData: false,
                contentType: false,
                error: function () {
                    alert("Whoops something went wrong!");
                }
            });
        }

    </script>--%>

    <script type="text/javascript">
        $(function () {
            $('#btnUpload').click(function () {
                var fileUpload = $("#FileUpload1").get(0);
                var files = fileUpload.files;
                var test = new FormData();
                for (var i = 0; i < files.length; i++) {
                    test.append(files[i].name, files[i]);
                }
                test.append("key", "123456");
                $.ajax({
                    url: "fileUploader.ashx",
                    type: "POST",
                    contentType: false,
                    processData: false,
                    data: test,
                    // dataType: "json",
                    success: function (result) {
                        alert(result);
                    },
                    error: function (err) {
                        alert(err.statusText);
                    }
                });
            });
        })


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

    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
<%--    <input type="file" class="upload"  id="f_UploadImage"><br />
<img id="myUploadedImg" alt="Photo" style="width:180px;" />
        <input type="button" value="Upload" id="btnUpload" />--%>
        <img class="form-control" src="../Images/photo.png" name="photocustomer" style="height: 220px" id="myImg" />     
                <div>
            <input type="file" id="FileUpload1" />
            <input type="button" id="btnUpload" value="Upload Files" />
        </div>
    </div>
    </form>
</body>
</html>
