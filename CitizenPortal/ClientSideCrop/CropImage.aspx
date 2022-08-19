<%@ Page Language="C#" AutoEventWireup="true" Inherits="CropImage" Codebehind="CropImage.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Crop</title>
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7,IE=8,IE=9" />
    <link href="/ClientSideCrop/Styles/jquery.Jcrop.css" rel="stylesheet" type="text/css" />
    <link href="/ClientSideCrop/Styles/CropStyle.css" rel="stylesheet" type="text/css" />
  
    <script type="text/javascript" src="/ClientSideCrop/Scripts/jquery-1.4.1.min.js"></script>
    <script language="javascript" type="text/javascript">
        $(window).load(function () {
            $('#imgLoader').hide();
        });
    </script>
    <script type="text/javascript" src="/ClientSideCrop/Scripts/jquery.Jcrop.js"></script>

    <script type="text/javascript" src="/ClientSideCrop/Scripts/Crop Validation.js"></script>

    <script type="text/javascript">
        function Hide() {
            window.parent.onCloseClick();

        }
        function Crop_validate() {
            var Form = document.getElementById("frmcrop");
            var Crop = Form.W;
            var Image = Form.ImgCrop.src;
            var match = Image.split("/");
            for (var i = 0; i < match.length; i++) {
                if (match[i] == 'NotFount.jpg') {
                    Crop.focus();
                    alert("Please upload the Photo");

                    return false;
                }
            }

            if (Crop.value == '' || Crop.value == '0') {
                Crop.focus();
                alert("Please Select the Crop Area");
                return false;
            }
            return true;

        }
    </script>
</head>
<body>
    <form id="frmcrop" runat="server" enctype="multipart/form-data">
        <div style="z-index: 99999; width: 100%;">
            <asp:Label ID="lblMsg" runat="server" ForeColor="Red" Visible="False"></asp:Label>
        </div>
        <div id="CropOutrtBox" style="margin-top: 2%;">
            <div style="margin: 0px auto; width: 100%;">
                <table id="Table1" runat="server" style="box-shadow: -2px 19px 39px rgb(170, 170, 170);" width="80%" border="0" cellspacing="0" cellpadding="0" align="center">

                    <tr>

                        <td bgcolor="#F9F9F9">
                            <table id="CropTable" border="1" cellpadding="8" cellspacing="0" style="border-collapse: collapse;"
                                width="100%" align="center" bordercolor="#cdcdcd">
                                <tr>
                                    <td>
                                        <asp:Label ID="Label1" runat="server" Text="Photo upload" Font-Bold="True" />
                                    </td>
                                    <td>

                                        <asp:FileUpload runat="server" ID="PhotoUpload" onchange="ImagePreview();" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" style="font-size: 9px;">You can upload a <strong>JPEG, JPG, GIF, or PNG</strong> file. (Do not upload pictures containing celebrities,nudity, artwork or copyrighted images.) 
                                        <br />
                                        <strong>Note:</strong>The photo you specify here will be used across all services which display your public photo. Maximum Photo size of 200 KB is allowed.</td>
                                </tr>
                                <tr>
                                    <td align="center" valign="top" colspan="2">
                                        <div id="imgLoader" style="position: absolute; z-index: 0; text-align: center; width: 100%; margin-top: 50px; left: 0px;">
                                            <img src="/Quick Links/Crop/preload.gif" />
                                        </div>
                                        <asp:HiddenField ID="X" runat="server" />
                                        <asp:HiddenField ID="Y" runat="server" />
                                        <asp:HiddenField ID="W" runat="server" />
                                        <asp:HiddenField ID="H" runat="server" />
                                        <asp:HiddenField ID="hdnValue" runat="server" />
                                        <asp:HiddenField ID="hdntemp" runat="server" />
                                        <asp:Image runat="server" ID="ImgCrop" ImageUrl="/Quick Links/Crop/NotFound.jpg" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        <div style="visibility: hidden;">
                                            <asp:Button ID="btnPhotoPreview" runat="server" OnClick="btnPreview_Click" Text="Upload" />
                                        </div>
                                        <asp:Button ID="btnCrop" runat="server" Text="Crop" OnClick="btnCrop_Click"
                                            OnClientClick="return Crop_validate();" />

                                        <asp:HiddenField ID="HdnImageBytes" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </td>

                    </tr>

                </table>
            </div>
        </div>
    </form>
</body>
</html>
