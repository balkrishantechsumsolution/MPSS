<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Attachment.ascx.cs" Inherits="CitizenPortal.WebApp.Control.Attachment" %>
<div class="box-body box-body-open">
    <div id="divPhotoUpload" class="col-xs-12 col-sm-6 col-md-6 col-lg-12">

        <div class="list-group">
            <label class="" for="ddlYearTerm">
                {{resourcesData.lblDocAge}}</label>
            <input class="list-group-item list-group-item-danger btn-file col-lg-12"
                id="FileAge" name="Photoupload" type="file">
            <label class="" for="ddlYearTerm">
                {{resourcesData.lblDocRes}}</label>
            <input class="list-group-item list-group-item-danger btn-file col-lg-12"
                id="FileResidence" name="Photoupload" type="file">
            <label class="" for="ddlYearTerm">
                {{resourcesData.lblDocDomicile}}</label>
            <input class="list-group-item list-group-item-danger btn-file col-lg-12"
                id="FileDomicile" name="Photoupload" type="file">
            <label class="" for="ddlYearTerm">
                {{resourcesData.lblDocOther}}</label>
            <input class="list-group-item list-group-item-danger btn-file col-lg-12"
                id="FileOther" name="Photoupload" type="file">
        </div>

    </div>
    <div class="clearfix">
    </div>
</div>
