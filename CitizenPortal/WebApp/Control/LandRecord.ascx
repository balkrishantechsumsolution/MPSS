<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LandRecord.ascx.cs" Inherits="CitizenPortal.WebApp.Control.LandRecord" %>
<%---Start of LandRecord----%>
<div class="box-body box-body-open">

    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
        <div class="form-group">
            <label class="manadatory" for="ddlGender">
                {{resourcesData.lblAppState}}
            </label>
            <select class="form-control" data-val="true" data-val-number="State."
                data-val-required="Please select gender." id="ddlState" name="State">
                <option>Select State</option>
                <%--<option>Assam</option>
                        <option>Bihar</option>
                        <option>Sikkim</option>--%>
            </select>
        </div>
    </div>
    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
        <div class="form-group">
            <label class="manadatory" for="ddlGender">
                {{resourcesData.lblAppDistrict}}
            </label>
            <select class="form-control" data-val="true" data-val-number="District."
                data-val-required="Please select District." id="ddlDistrict" name="District">
                <option>Select District</option>
                <%-- <option>Assam</option>
                        <option>Bihar</option>
                        <option>Sikkim</option>--%>
            </select>
        </div>
    </div>
    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
        <div class="form-group">
            <label class="manadatory" for="ddlGender">
                {{resourcesData.lblappsubdis}}
            </label>
            <select class="form-control" data-val="true" data-val-number="Taluka."
                data-val-required="Please select gender." id="ddlTaluka" name="Taluka">
                <option>Select Taluka</option>
                <%-- <option>Assam</option>
                        <option>Bihar</option>
                        <option>Sikkim</option>--%>
            </select>
        </div>
    </div>
    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
        <div class="form-group">
            <label class="manadatory" for="ddlGender">
                RI Circle
            </label>
            <select class="form-control" data-val="true" data-val-number="Taluka."
                data-val-required="Please select gender." id="ddlTaluka" name="Taluka">
                <option>Select RI Circle</option>
                <%-- <option>Assam</option>
                        <option>Bihar</option>
                        <option>Sikkim</option>--%>
            </select>
        </div>
    </div>
    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
        <div class="form-group">
            <label class="manadatory" for="ddlGender">
                Mouza (Revenue Village)
            </label>
            <select class="form-control" data-val="true" data-val-number="State."
                data-val-required="Please select gender." id="ddlVillage" name="State">
                <option>Select Village</option>
                <%--<option>Assam</option>
                        <option>Bihar</option>
                        <option>Sikkim</option>--%>
            </select>
        </div>
    </div>
    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
        <div class="form-group">
            <label class="manadatory" for="ddlYearTerm">
                Police Station
            </label>
            <input id="txtPolice" class="form-control" placeholder="Police Station Name" name="Police Station Name" type="text" value=""
                autofocus />
        </div>
    </div>
    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
        <div class="form-group">
            <label class="manadatory" for="ddlYearTerm">
                Khata No
            </label>
            <input id="txtKhata" class="form-control" placeholder="Enter Khata No." name="Enter Khata No." type="text" value=""
                autofocus />
        </div>
    </div>
    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-8">
        <div class="form-group">
            <label class="manadatory" for="ddlYearTerm">
                Recorded Tenent (Land Owner)
            </label>
            <input id="txtKhata" class="form-control" placeholder="Enter Khata No." name="Enter Khata No." type="text" value=""
                autofocus />
        </div>
    </div>
    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
        <div class="form-group">
            <label class="manadatory" for="PIN">
                Relation of the applicant with Recorded Tenant
            </label>
            <input id="PinCode" class="form-control" placeholder="Relation of the applicant with Recorded Tenant" name="Relation of the applicant with Recorded Tenant" type="text" value="" maxlength="6"
                autofocus />
        </div>
    </div>
    <div class="clearfix">
    </div>
</div>
<%---END of LandRecord-----%>