<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DeptService.ascx.cs" Inherits="CitizenPortal.WebApp.Control.DeptService" %>
<script type="text/javascript">
    function showDetails() {
        $('#divBtn').show();
        $('#divDecease').show();
        $('#divBankDtls').show();
    }
</script>
<div class="box-body box-body-open">
    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
        <div class="row">
            <div class="form-group col-lg-4 mandatory">
                <select class="form-control" data-val="true" data-val-number="search application"
                    data-val-required="Please select search type" id="ddlDepartment" name="Search">
                    <option value="0">Select Department</option>
                    <option value="S">SSEPDD</option>
                    <option value="R">Revenue Services</option>
                    <option value="W">WCD (Social Security & Empowerment of Persons with Disabilities )</option>
                    <option value="C">Commerce & Transport Department</option>
                    <option value="F">Finance Department</option>
                    <option value="A">Fisheries & Animal Resources Dev. Department</option>
                    <option value="H">Health & Family Welfare Department</option>
                    <option value="E">Higher Education Department</option>
                    <option value="D">Home Department</option>
                    <option value="U">Housing & Urban Development Department</option>
                    <option value="R">Revenue & Disaster Management Department</option>
                    <option value="B">ST & SC Developement, Minorities & Bakward Classes Welfare Department</option>
                    <option value="M">School & Mass Education Department</option>
                    <option value="I">Industries Department</option>
                    <option value="M">Micro, Small & Medium Enterprises Department</option>
                    <option value="L">Labour & ESI Department</option>
                    <option value="P">Panchayati Raj Department</option>
                    <option value="W">Works Department</option>
                    <option value="E">Excise Department</option>
                    <option value="G">General Administration Department</option>
                    <option value="A">Agriculture Department</option>
                    <option value="T">Employment, Techincal Education & Training Department</option>
                    <option value="C">Cooperation Department</option>
                    <option value="F">Forest & Environment Department</option>
                </select>
            </div>
            <div class="form-group col-lg-4 mandatory">
                <select class="form-control" data-val="true" data-val-number="search application"
                    data-val-required="Please select search type" id="ddlServices" name="Search">
                    <option value="0">Select Service</option>
                    <option value="S">NFBS</option>
                    <option value="R">Senior Citizen</option>
                    <option value="S">Issue of Mortgage Permission of leasehold lands</option>
                    <option value="S">Issue of Conversion Order of leasehold lands</option>
                    <option value="S">Issue of Mutation Order of leasehold lands</option>
                    <option value="S">Registration of Birth/Death</option>
                    <option value="S">Process for grant of liquor license</option>
                    <option value="S">Assistance under National Family Benefit Scheme(NFBS)</option>
                    <option value="S">Finalisation of work bill</option>
                    <option value="S">Issue of Trading License for trading of Minor Forest Produce</option>
                    <option value="S">Repair of hand pumps</option>
                    <option value="S">Distribution of Seedlings to Public-Issue of Orders</option>
                   <%-- <option value="S">Sanction of compassionate amount to the concerned persons in case of crop damage by specified wild animals.</option>
                    <option value="S">Sanction of compassionate amount to the concerned persons in case of cattle kill by specified wild animals.</option>
                    <option value="S">Sanction of compassionate amount to the concerned persons/legal heirs of the victims in case of human injury and casualty respectively by specified wild animals.</option>
                    <option value="S">Issue of Registration Certificate along with fishing license after deposit of prescribed fees under OMFRA</option>--%>
                    <option value="S">Issue of renewal fishing license after deposit of prescribed fees under OMFRA</option>
                    <option value="S">Animal Health Certificate</option>
                    <%--<option value="S">Filling of the application from online as per the beneficiary application and generation of permit by DFO</option>--%>
                    <option value="S">Issue of permits for supply of equipments to vender</option>
                    <option value="S">Building Plan Approval</option>
                    <option value="S">Issue of Occupancy Certificate</option>
                    <option value="S">Marriage Certificate</option>
                    <option value="S">Trade License</option>
                    <option value="S">Pipe Water Connection</option>
                    <option value="S">Correction of Water Bill</option>
                    <option value="S">Repair of Tube Wells</option>
                    <option value="S">Certified Copy of Building Plan Aporoval</option>
                    <option value="S">Booking of Parks/Community Hall</option>
                    <option value="S">Land Use lnformation</option>
                    <option value="S">Issue of Conveyance Deed</option>
                    <option value="S">Issue of No Dues Certificate</option>
                    <option value="S">Transfer of Property in case of Sale</option>
                    <option value="S">Issue of Permission for Mortgage</option>
                    <option value="S">Transfer of Ownership of Holding</option>
                    <option value="S">Issue of duplicate Birth / Death Certificate</option>
                    <option value="S">Repairing of WS pipelines (Minor leakage / Sewerage Over flow / Blockage</option>
                    <%--<option value="S">Building Plan Approval (Applicable to Bhubaneswar Development Authority from 01-02-2013 and other Development authorities & ULBs from 01-05-2013)</option>
                    <option value="S">Issuance of Occupancy Certificate (Applicable to Bhubaneswar Development authority from 01-02-2013 and other development Authorities & ULBs from 01-03-2013)</option>
                    <option value="S">Marriage Certificate (Applicable to Bhubaneswar, Cuttack & Berhampur Municipal Corporations from 01-02-2013 and other ULBs from 01-05-2013)</option>
                    <option value="S">Birth & Death Certificate (Applicable to Bhubaneswar, Cuttack & Berhampur Municipal Corporations from 01-02-2013 and other ULBs from 01-05-2013)</option>
                    <option value="S">Trade License (Applicable to Bhubaneswar, Cuttack & Berhampur Municipal Corporations from 01-02-2013 and other ULBs from 01-05-2013)</option>
                    <option value="S">Pipe Water connection (Applicable to Bhubaneswar, Cuttack & Berhampur Municipal Corporations from 01-02-2013 and other ULBs from 01-05-2013)</option>
                    <option value="S">Correction of Water Bill (Applicable to Bhubaneswar, Cuttack & Berhampur Municipal Corporations from 01-02-2013 and other ULBs from 01-05-2013)</option>
                    <option value="S">Repair of Tube Wells (Applicable to Bhubaneswar, Cuttack & Berhampur Municipal Corporations from 01-02-2013 and other ULBs from 01-05-2013)</option>--%>
                </select>
            </div>
            <div class="form-group col-lg-4 text-right">                
                <input type="button" class="btn btn-primary" value="Apply" id="btnApply" onclick="showDetails();"/>
            </div>
        </div>
    </div>
    <div class="clearfix">
    </div>
</div>
