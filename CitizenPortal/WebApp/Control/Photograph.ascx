<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Photograph.ascx.cs" Inherits="CitizenPortal.WebApp.Control.Photograph" %>

<div class="box-body box-body-open">
    <div class="alert alert-info col-xs-12 col-sm-6 col-md-12 col-lg-12" style="display: none">
        Please, upload your recent pasport size photograph size between 200 to 250 pixels.
    </div>
    <div class="col-lg-12">
        <img class="form-control" src="/webApp/kiosk/Images/photo.png" name="photocustomer" style="height: 225px; width: 200px;" id="ProfilePhoto" />
        <input class="camera"
            id="fulPhoto" name="Photoupload" type="file">
    </div>
    <div class="clearfix">
    </div>
</div>
