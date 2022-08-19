<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SubmitterDetail.ascx.cs" Inherits="CitizenPortal.WebApp.Control.SubmitterDetail" %>
<%---Start of Submitter Details----%>
<div class="box-body box-body-open">
    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
        <div class="form-group">
            <label class="manadatory col-lg-6 rbt-grp" for="ddlYearTerm">
                Is applicant and submitter are same?
            </label> 
            <label class="col-lg-3" for="rbtYes">
                <asp:RadioButton ID="rbtYes" runat="server"/> Yes
            </label> 
            <label class="col-lg-3" for="rbtNo">
                <asp:RadioButton ID="rbtNo" runat="server" />No
            </label>                       
        </div>
    </div>
    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
        <div class="form-group">
            <label class="manadatory" for="txtSubmitter">
                Submitter's Name
            </label>
            <input id="txtSubmitter" class="form-control" placeholder="Submitter's Name" name="Submitter's Name" type="text" value="" 
                autofocus />
        </div>
    </div>
    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
        <div class="form-group">
            <label class="manadatory" for="txtRelation">
                Relation with applicant
            </label>
            <input id="txtRelation" class="form-control" placeholder="Relation with applicant" type="text" value="" 
                autofocus />
        </div>
    </div>
    <div class="clearfix">
    </div>
</div>
<%---END of PostalAddress-----%>