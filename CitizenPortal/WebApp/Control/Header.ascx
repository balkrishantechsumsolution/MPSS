<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="CitizenPortal.WebApp.Control.Header" %>
<%@ Register Src="~/g2c/controls/tophead.ascx" TagPrefix="uc1" TagName="tophead" %>
<%@ Register Src="~/g2c/controls/mainhead.ascx" TagPrefix="uc1" TagName="mainhead" %>
<%@ Register Src="~/g2c/controls/topnavigation.ascx" TagPrefix="uc1" TagName="topnavigation" %>

<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<link href="/g2c/css/style.css" rel="stylesheet" />
<link href="/g2c/css/responsive_media.css" rel="stylesheet" />
<link href="/g2c/css/bootstrap.min.css" rel="stylesheet" />

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<link href="/g2c/css/ie10-viewport-bug-workaround.css" rel="stylesheet" />
<script src="/g2c/js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->

<script type="text/javascript">
    function SetLanguage(p_Lang) {
        document.getElementById('HFLang').value = p_Lang;
        //alert(p_Lang);
        //alert(document.getElementById('HFLang').value);
        //window.location.reload();
        document.forms[0].submit();
        return true;
    }
</script>
<%--<style type="text/css">
    .odisalogo {
        border-right: 2px solid #ddd;
    }

    .title {
        margin: 10px auto 0 95px;
    }
</style>--%>


<header>
    <uc1:tophead runat="server" ID="tophead" />
    <uc1:mainhead runat="server" ID="mainhead" />
    <uc1:topnavigation runat="server" ID="topnavigation" />
</header>
