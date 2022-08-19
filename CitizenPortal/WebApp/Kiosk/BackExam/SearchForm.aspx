<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="SearchForm.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.BackExam.SearchForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <%--For Date Picker--%>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <link href="../../Styles/style.admin.css" rel="stylesheet" />   

     <%--<script src="/WebApp/Scripts/CommonScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>--%>
    <%--<script src="/WebApp/Scripts/ValidationScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>--%>
    <script src="/WebApp/Scripts/AddressScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Kiosk/BackExam/BackExam.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <%--<script src="/WebApp/Citizen/Script/ValidateUser.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="page-wrapper" style="min-height: 500px !important;">
         <div class="row">
             <div class="col-lg-12">
                <h2 class="form-heading mtop5"><i class="fa fa-pencil-square-o fa-fw pright10"></i>Search Form
                </h2>
            </div>
         </div>
         <div class="row">
              <div class="col-md-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title">Search Details 
                    </h4>
                </div>

                <div class="box-body box-body-open">

                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">
                                Branch</label>
                            <select  class="form-control" id="ddlBranchName">
                                <option value="Select">--Select--</option>
                            </select>

                        </div>
                    </div>

                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory" for="DOB">
                                Roll No</label>
                            <input name="" type="text" maxlength="15" id="txtRollNo" class="form-control" placeholder="Roll No" value=""/>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory">
                                Semester</label>
                            <select  class="form-control" id="ddlSemester">
                                <option value="Select">--Select--</option>
                                <option value="1st">First Semester</option>
                            </select>

                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="">
                               Name of the Student</label>
                            <input name="" type="text" maxlength="100" id="txtStudentName" class="form-control" placeholder="Student Full Name"/>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                    <input type="submit" name="" value="Search Application" id="btnSubmit" class="btn btn-primary mtop20"  />
                    
                            </div></div>
                    <div class="form-group col-lg-12 text-center">
                        <label class="" for="">
                            &nbsp;
                        </label>
                        
                       <%-- <input id="btnHome" type="button" class="btn btn-danger" value="Close" onclick="window.close();"/>--%>
                    </div>
                    <div class="clearfix"></div>
                    <div class="mt10"></div>
        
        
        
                </div>
                  </div>
         </div>
         </div>
</asp:Content>
