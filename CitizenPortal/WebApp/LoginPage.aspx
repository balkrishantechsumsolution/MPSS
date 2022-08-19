<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="CitizenPortal.WebApp.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="description" content="Login Screen"/>
    <meta name="CompanyName" content="MPOnline LTD."/>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="cache-control" content="no-cache, no store" />
    <meta http-equiv="cache-control" content="private" />
    <meta http-equiv="cache-control" content="must-revalidate" />
    <meta http-equiv="cache-control" content="post-check=0" />
    <meta name="viewport" id="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
    <meta http-equiv="cache-control" content="pre-check=0" />
    <meta http-equiv="pragma" content="no-cache" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <%--<link href="../Styles/jquery.simplyscroll.css" rel="stylesheet" type="text/css" />--%>
    <script src="../Scripts/jquery-2.2.3.min.js"></script>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
<%--    <link href="../Styles/NetPost.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/timeline.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/metisMenu.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/StyleSheet2.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/StyleSheet3.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/sb-admin-2.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery.simplyscroll.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.slimscroll.js" type="text/javascript"></script>
    <script src="../Scripts/scrollsaver.min.js" type="text/javascript"></script>
    <link href="../Styles/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/StyleSheet4.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/style.admin.css" rel="stylesheet" type="text/css" />--%>
    <title>Application Login</title>
    <script type="text/javascript" language="javascript">
        //var UnivName = document.getElementById("hdfUnivName").value;
        $(document).ready(function () {
            //$("#progressbar").hide();                        
            $("#divMsg").hide();           
        });

        function MoveToProfile() {
            window.location = "Registration/KioskRegistration.aspx";
        }
        function CheckUser() {
            debugger;
            var UserID = "";
            var Password = "";
            UserID = document.getElementById("txtUserID").value;
            Password = document.getElementById("txtPassword").value;
            if (UserID == null || UserID == "") {
                errormsg.innerHTML = "User Name is blank. Please enter User Name";
                $("#txtUserID").addClass('has-error');
                document.getElementById("txtUserID").focus();
                $("#divMsg").show();
            }
            else if (Password == null || Password == "") {
                errormsg.innerHTML = "Password is blank. Please enter Password";
                document.getElementById("txtPassword").focus();
                $("#txtPassword").addClass('has-error');
                $("#divMsg").show();
            }
            else {
                $("#divMsg").hide();
                getUser();
            }
        }
        function getUser() {

            var UserID = document.getElementById("txtUserID").value;
            var Password = document.getElementById("txtPassword").value;

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '<%=ResolveUrl("~/Registration/KioskRegistration.aspx/GetUser") %>',
                data: '{"prefix": ""}',
                data: '{"UserName": "' + UserID + '","Password": "' + Password + '"}',
                processData: false,
                dataType: "json",
                success: function (response) {
                    var UserDtls = eval(response.d);
                    var html = "";
                    $.each(UserDtls, function () {

                        var profileId = this.profileId;
                        var college_code = this.college_code;
                        var is_active = this.is_active;

                        if (profileId == null || profileId == "") {
                            errormsg.innerHTML = "Invalid User Name or Password. Please enter valid details";
                            document.getElementById("txtPassword").focus();
                            $("#divMsg").show();
                        }
                        else if (is_active == "N") {
                            errormsg.innerHTML = UserID + " user is blocked. Please contact admin";
                            document.getElementById("txtPassword").focus();
                            $("#divMsg").show();
                        }
                        else { $("#divMsg").hide(); window.location = ""; }
                    });


                },
                error: function (a, b, c) {
                    alert("1.Login User" + a.responseText);
                }
            });
        }
    </script>
    <style type="text/css">
        .has-error {
            border-color: #a94442;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div id="progressbar" class="modalBackground" runat="server" clientidmode="Static"
            style="display: none;">
            <center style="z-index: 105; left: 45%; position: absolute; top: 50%">
            <img id="imgloader" alt="" runat="server" src="../Images/waiting.gif"
                style="width: 150px;" />
            <center style="font-size: 15px; font-weight: bold; color: Maroon">
                <br />
                Please Wait It's Processing</center>
        </center>
        </div>
        <div>
            <div class="container">
                <div class="row">
                    <div class="col-md-4 col-md-offset-4">
                        <div class="login-panel panel panel-success">
                            <div class="panel-heading">
                                <h3 class="panel-title">Sign In</h3>
                            </div>
                            <div class="panel-body">
                                <form role="form" id="frmlogin">
                                    <fieldset>
                                            <div class="form-group">
                                                <label for="UserName">
                                                    User Name</label>
                                                <input id="txtUserID" class="form-control" placeholder="Enter User Name" name="UserName"
                                                    data-bv-notempty="true"
                                                    data-bv-notempty-message="Please enter validate User Name"
                                                    type="text" autofocus />
                                            </div>
                                            <div class="form-group input-icon icon-right input-group-xl">
                                                <label for="Password">
                                                    Password</label>
                                                <input id="txtPassword" class="form-control" placeholder="Enter Password" name="password" type="password"
                                                    data-bv-notempty="true"
                                                    data-bv-notempty-message="The password is required and cannot be empty"                                                    
                                                    value="" />
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input name="remember" type="checkbox" value="Remember Me" />Remember Me
                                                </label>
                                            </div>
                                            <div id="divMsg" class="error form-group has-error alert alert-danger">
                                                <label id="errormsg" class="control-label">
                                                    Invalid User Name or Password</label>

                                            </div>
                                        
                                        <div class="row">
                                            <div class="col-md-6 text-left">
                                                <input class="btn btn-success" id="btnLogin" value="Login" type="button" onclick="CheckUser();" />
                                            </div>


                                            <div class="col-md-6 text-right">
                                                <input class="btn btn-primary" id="btnProfile" type="button" onclick="MoveToProfile();"
                                                    value="Register Kiosk" />
                                            </div>
                                        </div>
                                    </fieldset>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <asp:HiddenField ID="hdfUnivName" runat="server"></asp:HiddenField>
    </form>
    <script src="../Scripts/jquery-2.2.3.min.js"></script>
    <script src="../Scripts/bootstrap.min.js" type="text/javascript"></script>
<%--    <script src="../Scripts/metisMenu.js" type="text/javascript"></script>
    <script src="../Scripts/sb-admin-2.js" type="text/javascript"></script>--%>
    <script type="text/javascript">
        function DisableButton() {
            $("#progressbar").show();
            document.getElementById("<%=progressbar.ClientID %>").show = true;
        }
        window.onbeforeunload = DisableButton;
    </script>

</body>
</html>
