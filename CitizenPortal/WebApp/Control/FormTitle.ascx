<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormTitle.ascx.cs" Inherits="CitizenPortal.WebApp.Control.FormTitle" %>
<style type="text/css">
    .rbt-grp {
        padding-left: 0;
    }

    .form-heading {
        color: #820000;
        text-align: left;
        border-left: 15px solid #ce6d07;
        border-right: 2px solid #ce6d07;
        border-top: 1px solid #d8d8d8;
        border-bottom: 1px solid #d8d8d8;
        background: rgba(0, 0, 0, .075);
        padding: 10px 20px 10px 15px;
        border-top-right-radius: 2px;
        border-top-left-radius: 2px;
        text-transform: uppercase;
        font-weight: bold;
    }
</style>
<div>
    <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>  {{titleData.lblTitle}} {{ServiceNameData.lblSvcName}}
    </h2>
</div>
