<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FileUploadTest.aspx.cs" Inherits="CitizenPortal.WebApp.FileUploadTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<!-- Force latest IE rendering engine or ChromeFrame if installed -->
<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
<head runat="server">
    <title></title>
    <%--2016-07-13: Old Logic--%>
    <%--    <script src="../Scripts/jquery-2.2.3.min.js"></script>
    <script src="../Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
    <script src="../Scripts/fileupload/jquery.iframe-transport.js"></script>
    <script src="../Scripts/fileupload/jquery.fileupload.js"></script>--%>


    <script src="../Scripts/jquery-2.2.3.min.js"></script>
    <!-- The jQuery UI widget factory, can be omitted if jQuery UI is already included -->
    <script src="../Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
    <!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
    <script src="../Scripts/fileupload/jquery.iframe-transport.js"></script>
    <!-- The basic File Upload plugin -->
    <script src="../Scripts/fileupload/jquery.fileupload.js"></script>
    <!-- The File Upload processing plugin -->
    <script src="../Scripts/fileupload/jquery.fileupload-process.js"></script>
    <!-- The File Upload validation plugin -->
    <script src="../Scripts/fileupload/jquery.fileupload-validate.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <span class="btn btn-success fileinput-button">
            <i class="glyphicon glyphicon-plus"></i>
            <span>Add files...</span>
            <!-- The file input field used as target for the file upload widget -->
            <input id="fileupload" type="file" name="files[]" multiple>
        </span>
        <br>
        <br>
        <!-- The global progress bar -->
        <div id="progress" class="progress">
            <div class="progress-bar progress-bar-success"></div>
        </div>
        <!-- The container for the uploaded files -->
        <div id="files" class="files"></div>
        <br>

        <script>
            /*jslint unparam: true, regexp: true */
            /*global window, $ */
            $(function () {
                'use strict';
                // Change this to the location of your server-side upload handler:
                var url = '../UploadHandler_4_0.aspx',
                    uploadButton = $('<button/>')
                        .addClass('btn btn-primary')
                        .prop('disabled', true)
                        .text('Processing...')
                        .on('click', function () {
                            var $this = $(this),
                                data = $this.data();
                            $this
                                .off('click')
                                .text('Abort')
                                .on('click', function () {
                                    $this.remove();
                                    data.abort();
                                });
                            data.submit().always(function () {
                                $this.remove();
                            });
                        });
                $('#fileupload').fileupload({
                    url: url,
                    dataType: 'json',
                    autoUpload: false,
                    acceptFileTypes: /(\.|\/)(gif|jpe?g|png|pdf)$/i,
                    maxFileSize: 999000
                }).on('fileuploadadd', function (e, data) {
                    data.context = $('<div/>').appendTo('#files');
                    $.each(data.files, function (index, file) {
                        var node = $('<p/>')
                                .append($('<span/>').text(file.name));
                        if (!index) {
                            node
                                .append('<br>')
                                .append(uploadButton.clone(true).data(data));
                        }
                        node.appendTo(data.context);
                    });
                }).on('fileuploadprocessalways', function (e, data) {
                    var index = data.index,
                        file = data.files[index],
                        node = $(data.context.children()[index]);
                    if (file.preview) {
                        node
                            .prepend('<br>')
                            .prepend(file.preview);
                    }
                    if (file.error) {
                        node
                            .append('<br>')
                            .append($('<span class="text-danger"/>').text(file.error));
                    }
                    if (index + 1 === data.files.length) {
                        data.context.find('button')
                            .text('Upload')
                            .prop('disabled', !!data.files.error);
                    }
                }).on('fileuploadprogressall', function (e, data) {
                    var progress = parseInt(data.loaded / data.total * 100, 10);
                    $('#progress .progress-bar').css(
                        'width',
                        progress + '%'
                    );
                }).on('fileuploaddone', function (e, data) {
                    $.each(data.result.files, function (index, file) {
                        if (file.url) {
                            var link = $('<a>')
                                .attr('target', '_blank')
                                .prop('href', file.url);
                            $(data.context.children()[index])
                                .wrap(link);
                        } else if (file.error) {
                            var error = $('<span class="text-danger"/>').text(file.error);
                            $(data.context.children()[index])
                                .append('<br>')
                                .append(error);
                        }
                    });
                }).on('fileuploadfail', function (e, data) {
                    $.each(data.files, function (index) {
                        var error = $('<span class="text-danger"/>').text('File upload failed.');
                        $(data.context.children()[index])
                            .append('<br>')
                            .append(error);
                    });
                }).prop('disabled', !$.support.fileInput)
                    .parent().addClass($.support.fileInput ? undefined : 'disabled');
            });
        </script>
    </form>
    <%--2016-07-13: Old Logic--%>
    <%--<form id="form1" runat="server">
        <div>
            <input id="fileupload_IMG" type="file" name="file" data-url="../UploadHandler_4_0.aspx">
            <input id="fileupload_PDF" type="file" name="file" data-url="../UploadHandler_4_0.aspx">
            
            <input type="button" id="btnUpload" value="Upload" onclick="return CheckUpload()" />
        </div>
        <script>

            // jqXHRData needed for grabbing by data object of fileupload scope
            var jqXHRData_IMG;
            var jqXHRData_PDF;

            $(document).ready(function () {

                //Initialization of fileupload
                initSimpleFileUpload();

            });


            function initSimpleFileUpload() {
                'use strict';

                $('#fileupload_IMG').fileupload({
                    //url: '/File/UploadFile',
                    dataType: 'json',
                    add: function (e, data) {
                        jqXHRData_IMG = data
                    },
                    done: function (event, data) {
                        if (data.result.isUploaded) {

                        }
                        else {

                        }
                        alert(data.result.message);
                    },
                    fail: function (event, data) {
                        if (data.files[0].error) {
                            alert(data.files[0].error);
                        }
                    }
                });

                $('#fileupload_PDF').fileupload({
                    //url: '/File/UploadFile',
                    dataType: 'json',
                    add: function (e, data) {
                        jqXHRData_PDF = data
                    },
                    done: function (event, data) {
                        if (data.result.isUploaded) {

                        }
                        else {

                        }
                        alert(data.result.message);
                    },
                    fail: function (event, data) {
                        if (data.files[0].error) {
                            alert(data.files[0].error);
                        }
                    }
                });

            }

            function CheckUpload() {

                var result = true;

                if (result) {

                    if (jqXHRData_IMG) {
                        jqXHRData_IMG.formData = { "AppID": "123456", "KioskID": "", "FileName": "File1" };
                        jqXHRData_IMG.submit();
                    }

                    if (jqXHRData_PDF) {
                        jqXHRData_PDF.formData = { "AppID": "123456", "KioskID": "", "FileName": "File2" };
                        jqXHRData_PDF.submit();
                    }

                }

            }

        </script>
    </form>--%>
</body>
</html>
