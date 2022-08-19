<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="LegacyDataInterface.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.DTE.legacy.LegacyDataInterface" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--<script src="/Scripts/jquery-2.2.3.min.js"></script>--%>
    <%-- <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />--%>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />

    <link href="css/legacyDataStylesheet.css" rel="stylesheet" />
    <script src="LegacyDataInterface.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            debugger;
            //$("#marksDtlTble").hide();
            //$("#semesterDtlTble").hide();
            $("#btnSubmit").click(function () {
                //$("#marksDtlTble").show("slow"); 
            });

        });
        //function viewtable() {
        //    //$("#semesterDtlTble").show("slow");
        //    //$("#marksDtlTble").hide("slow");
        //    //$("#cancelBtnMrkDtl").click(function () {
        //        //$("#marksDtlTble").hide("slow");
        //    });
        //    $("#btnSemesterResult").click(function () {
        //        location.reload();
        //    });

        //    $("#cancelBtnSemesterResult").click(function () {
        //        //$("#semesterDtlTble").hide("slow");
        //        //$("#marksDtlTble").show("slow");
        //    });
        //};
    </script>
    <style type="text/css">
        .profile_bg {
            width: 250px !important;
        }

        .legacysearch_tble {
            border: 1px solid #ddd !important;
        }

        #Gridview1 > .table-condensed > tbody > tr > td, .table-condensed > tbody > tr > th,
        .table-condensed > tfoot > tr > td, .table-condensed > tfoot > tr > th,
        .table-condensed > thead > tr > td, .table-condensed > thead > tr > th {
            padding: 3px !important;
        }

        .tbleflowY{overflow-y:scroll !important;}
    </style>

    <style type="text/css"></style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="intrnlContent" ng-app="appmodule">
        <div ng-controller="ctrl">
            <div id="page-wrapper" style="min-height: 500px !important;">
                <div class="row">
                    <div class="col-lg-12 box-container">
                        <h2 class="form-heading ng-binding"><i class="fa fa-pencil-square-o"></i>Legacy Data (Before 2017)
                        </h2>
                    </div>
                </div>
                <div class="row">
                    <div id="CandiadateDetails" runat="server">



                        <div class="col-lg-12 box-container mtop10">
                            <div class="box-heading">
                                <h4 class="box-title">Search Candiadate Details</h4>
                            </div>
                            <div class="box-body box-body-open">
                                <%--  <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="district">District</label>
                                    <select class="form-control" data-val="true" data-val-required="Please select." id="ddlDistrict">

                                        <option value="0">-Select District-</option>
                                    </select>
                                </div>
                            </div>--%>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                    <div class="form-group">
                                        <label for="txtRegistration">
                                            Registration No.
                                        </label>

                                        <asp:TextBox ID="txtRegistration" CssClass="form-control " PlaceHolder="Enter Registration Number" ClientIDMode="Static" runat="server" onchange="javascript:registration();"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                    <div class="form-group">
                                        <label for="txtRegistration">
                                            Student Name
                                        </label>
                                        <asp:TextBox ID="txtStudentName" CssClass="form-control " PlaceHolder="Enter Student  Name" ClientIDMode="Static" runat="server" onchange="javascript:studentname();"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                    <div class="form-group">
                                        <label for="institute">College Name</label>                                        
                                        <asp:DropDownList ID="ddlinstitude" CssClass="form-control " runat="server" onchange="javascript:INSTITUDE();" >
                                            <asp:ListItem Value="0">-Select Institute Name-</asp:ListItem>
                                        </asp:DropDownList>

                                    </div>
                                </div>

                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                    <div class="form-group">
                                        <label for="academicyear">Academic Year</label>                                       
                                        <asp:DropDownList ID="ddladmissionyear" ClientIDMode="Static" CssClass="form-control" runat="server">
                                            <asp:ListItem Value="0">-Select-</asp:ListItem>
                                            <asp:ListItem Value="2016">2016 </asp:ListItem>
                                            <asp:ListItem Value="2015">2015 </asp:ListItem>
                                            <asp:ListItem Value="2014">2014 </asp:ListItem>
                                            <asp:ListItem Value="2013">2013 </asp:ListItem>
                                            <asp:ListItem Value="2012">2012 </asp:ListItem>
                                            <asp:ListItem Value="2011">2011 </asp:ListItem>
                                            <asp:ListItem Value="2010">2010 </asp:ListItem>
                                            <asp:ListItem Value="2009">2009 </asp:ListItem>
                                            <asp:ListItem Value="2008">2008 </asp:ListItem>
                                            <asp:ListItem Value="2007">2007 </asp:ListItem>
                                            <asp:ListItem Value="2006">2006 </asp:ListItem>
                                            <asp:ListItem Value="2005">2005 </asp:ListItem>
                                            <asp:ListItem Value="2004">2004 </asp:ListItem>
                                            <asp:ListItem Value="2003">2003 </asp:ListItem>
                                            <asp:ListItem Value="2002">2002 </asp:ListItem>
                                            <asp:ListItem Value="2001">2001 </asp:ListItem>
                                            <asp:ListItem Value="2000">2000 </asp:ListItem>

                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                    <div class="form-group">
                                        <label for="branchname">Branch Name</label>
                                        <%--<select class="form-control" data-val="true" data-val-required="Please select." runat="server" id="ddlBranch">
                                <option value="0">Select Branch Name</option>
                            </select>--%>

                                        <asp:DropDownList ID="DropDownList1" CssClass="form-control " runat="server" onchange="javascript:INSTITUDE();">

                                            <asp:ListItem Value="0">-Select Branch Name-</asp:ListItem>

                                        </asp:DropDownList>

                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                    <div class="form-group">
                                        <asp:Button ID="btnSubmit" runat="server" CssClass="btn  btn-success mt20" Text="Search" OnClick="btnSubmit_Click" OnClientClick="dropdownselect();" />
                                    </div>
                                </div>

                                <div class="clearfix"></div>
                            </div>
                        </div>


                    </div>
                </div>
              
                <div class="row" id="marksDtlTble">
                    <div class="col-lg-12 box-container">
                        <div class="table-responsive" style="overflow-y: scroll; height: 200px;">
                            <asp:GridView ID="Gridview1" ShowHeaderWhenEmpty="true" runat="server" CssClass="table table-bordered legacysearch_tble" Width="100%" AutoGenerateColumns="false" OnRowCommand="Gridview1_RowCommand">
                                <Columns>
                                    <asp:TemplateField HeaderText="S.No.">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSerialNo" runat="server" Text='<%#(((GridViewRow)Container).RowIndex+1).ToString()%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Roll. No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRollNo" runat="server" Text='<%#Eval("ROLLNO") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Regd. No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRegdNo" runat="server" Text='<%#Eval("REGIS") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Student Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblStudentName" runat="server" Text='<%#Eval("NAME") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="College">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCollege" runat="server" Text='<%#Eval("CENTER") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Branch">
                                        <ItemTemplate>
                                            <asp:Label ID="lblBranch" runat="server" Text='<%#Eval("BRANCH") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Subjects">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSubject" runat="server" Text='<%#Eval("SUBJECTS") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="P Year">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCYEAR" runat="server" Text='<%#Eval("CYEAR") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Grand Total">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTotal" runat="server" Text='<%#Eval("GRANDTOTAL") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Result">
                                        <ItemTemplate>
                                            <asp:Label ID="lblREST" runat="server" Text='<%#Eval("REST") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" Width="85px" OnClick="LinkButton1_Click" CommandArgument='<%# Eval("REGIS" )%>' class="resetBtn mleft10" CommandName="Action" CssClass="btn btn-info">View</asp:LinkButton>
                                            <%--       <asp:Button ID="ActionButton" runat="server" Width="85px" Text="View" class="resetBtn mleft10" CommandName="Action" CssClass="btn btn-danger"
                                    />--%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>No Record Available</EmptyDataTemplate>
                            </asp:GridView>
                        </div>

                    </div>
                </div>


                <div class="row" id="semesterDtlTble" runat="server" visible="false">
                    <div class="col-lg-12 box-container">
                        <div style="overflow: scroll; min-height: 220px;">
                            <asp:GridView ID="Gridview2" runat="server" CssClass="table table-bordered" Width="100%">
                                <%-- <Columns>
                                    <asp:TemplateField HeaderText="S.No.">
                            <ItemTemplate>
                                <asp:Label ID="lblSerialNo" runat="server" CssClass="form-control" Text='<%#(((GridViewRow)Container).RowIndex+1).ToString()%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Roll No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRollNo" runat="server" Text='<%#Eval("RegNo") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>                                    
                                    <asp:TemplateField HeaderText="TH1">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTH1" runat="server" Text='<%#Eval("TH1") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TH2">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTH2" runat="server" Text='<%#Eval("TH2") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TH3">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTH3" runat="server" Text='<%#Eval("TH3") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TH4">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTH4" runat="server" Text='<%#Eval("TH4") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TH5">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTH5" runat="server" Text='<%#Eval("TH5") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TH6">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTH6" runat="server" Text='<%#Eval("TH6") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TH7">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTH7" runat="server" Text='<%#Eval("TH7") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TH8">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTH8" runat="server" Text='<%#Eval("TH8") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TH9">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTH9" runat="server" Text='<%#Eval("TH9") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TH10">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTH10" runat="server" Text='<%#Eval("TH10") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="PR1">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPR1" runat="server" Text='<%#Eval("PR1") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="PR2">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPR2" runat="server" Text='<%#Eval("PR2") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="PR3">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPR3" runat="server" Text='<%#Eval("PR3") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="PR4">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPR4" runat="server" Text='<%#Eval("PR4") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="PR5">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPR5" runat="server" Text='<%#Eval("PR5") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="PR6">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPR6" runat="server" Text='<%#Eval("PR6") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Total">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTotal" runat="server" Text='<%#Eval("Total") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sessional">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSessional" runat="server" Text='<%#Eval("Sessional") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Result">
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%#Eval("Result") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="YearofPassing">
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%#Eval("YearofPassing") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                        --%>
                                    <%-- <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:Button ID="ActionButton" runat="server" Width="85px" Text="View" class="resetBtn mleft10" CommandName="Action" CssClass="btn btn-danger"
                                    OnClientClick="return confirm('Are you sure you want to View house property details?');" />
                            </ItemTemplate>
                        </asp:TemplateField>
                                </Columns>--%>
                            </asp:GridView>

                        </div>

                        <%--                  <div class="col-lg-12 box-container">
                <div class="box-body box-body-open text-center">
                    <input type="button" id="btnSemesterResult" class="btn btn-success" value="Submit" />
                    <input type="button" id="cancelBtnSemesterResult" class="btn btn-danger" value="Back to Result" />
                </div>
            </div>--%>
                    </div>

                </div>

            </div>
        </div>
    </div>
    <asp:HiddenField ID="HFInstitude" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFBranch" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFRegistration" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFStudentName" runat="server" ClientIDMode="Static" />
     <asp:HiddenField ID="HiddenField1" runat="server" ClientIDMode="Static" />
</asp:Content>
