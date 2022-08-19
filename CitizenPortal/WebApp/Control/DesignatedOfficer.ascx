<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DesignatedOfficer.ascx.cs" Inherits="CitizenPortal.WebApp.Control.DesignatedOfficer" %>
<script src="/webapp/Scripts/AddressScript.js"></script>

<script type="text/javascript">
    


</script>
<div class="row" id="divGrid">
    <div class="col-md-12 box-container">
        <div class="box-heading">
            <h4 class="box-title">Service Delivery Detail
            </h4>
        </div>  
        <div class="box-body box-body-open">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <asp:GridView ID="grdView" runat="server" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" style="margin-bottom:0;" ClientIDMode="Static">
                </asp:GridView>
            </div>
            
            <div class="clearfix">
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-12 box-container">
        <div class="box-heading">
            <h4 class="box-title">{{resourcesData.servicedepartment}}
            </h4>
        </div>  
        <div class="box-body box-body-open">
            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                <div class="form-group">
                    <label class="manadatory" for="ddlServices">
                        {{resourcesData.services}}
                    </label>
                    <select class="form-control" data-val="true" data-val-number="Services"
                        data-val-required="Please select Services" id="ddlServices" name="ddlServices" runat="server">
                        <option>Select Services</option>
                    </select>
                </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                <div class="form-group">
                    <label class="manadatory" for="ddlDistrict">
                        {{resourcesData.department}}
                    </label>
                    <select class="form-control" data-val="true" data-val-number="Department"
                        data-val-required="Please select Department." id="ddlDepartment" name="ddlDepartment" runat="server">
                        <option>Select Department</option>
                    </select>
                </div>
            </div>
            
            <div class="clearfix">
            </div>
        </div>
    </div>
</div>

<div class="row" id="divOfficeOfficer">
    <div class="col-md-12 box-container">
        <div class="box-heading">
            <h4 class="box-title">{{resourcesData.servicedetail}}
            </h4>
        </div>  
        <div class="box-body box-body-open">
            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                <div class="form-group">
                    <label class="manadatory" for="ddlDistrict">
                        {{resourcesData.lblAppDistrict}}
                    </label>
                    <select class="form-control" data-val="true" data-val-number="District."
                        data-val-required="Please select District." id="ddlDistrict" name="ddlDistrict" runat="server">
                        <option>Select District</option>
                    </select>
                </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                <div class="form-group">
                    <label class="manadatory" for="ddlTaluka">
                        {{resourcesData.lblappsubdis}}
                    </label>
                    <select class="form-control" data-val="true" data-val-number="Taluka."
                        data-val-required="Please select block." id="ddlTaluka" name="ddlTaluka" runat="server">
                        <option>Select Block</option>
                    </select>
                </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                <div class="form-group">
                    <label class="manadatory" for="ddlVillage">
                        {{resourcesData.lblAppVillage}}
                    </label>
                    <select class="form-control" data-val="true" data-val-number="State."
                        data-val-required="Please select panchayat" id="ddlVillage" name="ddlVillage" runat="server">
                        <option>Select Panchayat/Village/City</option>
                    </select>
                </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                <div class="form-group">
                    <label class="manadatory" for="ddlOffice">
                        {{resourcesData.concernedOffice}}
                    </label>
                    <select class="form-control" data-val="true" data-val-number="Office"
                        data-val-required="Please select Office" id="ddlOffice" name="ddlOffice" runat="server">
                        <option>Select Concerned Office</option>
                    </select>
                </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                <div class="form-group">
                    <label class="manadatory" for="ddlOfficer">
                        {{resourcesData.designatedOfficer}}
                    </label>
                    <select class="form-control" data-val="true" data-val-number="Officer"
                        data-val-required="Please select Officer" id="ddlOfficer" name="ddlOfficer" runat="server">
                        <option>Select Designated Officer</option>
                    </select>
                </div>
            </div>
            <div class="clearfix">
            </div>
        </div>
    </div>
</div>

<%---Start of Button----%>
<div class="row" id="divButton" runat="server">
    <div class="col-md-12 box-container" id="divBtn">
        <div class="box-body box-body-open" style="text-align: center;">
            <input type="button" id="btnSubmit" class="btn btn-success" value="Next =>>" onclick="fnNext();" />
            <asp:Button ID="btnCancel" runat="server" CausesValidation="True" CommandName="Cancel"
                CssClass="btn btn-danger" PostBackUrl=""
                Text="Cancel" />
        </div>
    </div>
    <div class="clearfix">
    </div>
</div>
<%---End of Button----%>
    <asp:HiddenField ID="HFServiceID" runat="server" Value="996" />
    <asp:HiddenField ID="HFUIDData" runat="server" />
    <asp:HiddenField ID="HFHideOfficerPanel" runat="server" />
