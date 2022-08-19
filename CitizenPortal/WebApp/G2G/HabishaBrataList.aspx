<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/G2G/Master/G2GMaster.Master" AutoEventWireup="true" CodeBehind="HabishaBrataList.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.HabishaBrataList" %>

<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="../../Scripts/jquery.msgBox.js"></script>
    <link href="../../PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="../../Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
    <script src="../../Scripts/fileupload/jquery.iframe-transport.js"></script>
    <script src="../../PortalScripts/ServiceLanguage.js"></script>
    <style type="text/css">
        .pentaskhd {
            background-color: #B20000;
            border: 1px solid #B20000;
        }

        .apprhd {
            background-color: #227d04;
            border: 1px solid #227d04;
        }

        .penapphd {
            background-color: #001482;
            border: 1px solid #001482;
        }

        .rejhd {
            background-color: #ff5722;
            border: 1px solid #ff5722;
        }

        .tasklistbox {
            border: 1px solid #CCC;
            height: 200px;
        }

        .taskhd {
            padding: 5px;
            transform: rotate(-90deg);
            white-space: nowrap;
            width: 200px;
            transform-origin: left;
            top: 183px;
            position: relative;
            margin-left: 15px;
            color: #fff;
            font-weight: bolder;
        }

        .listview {
            height: 100%;
            width: 87%;
            margin: -33px 13% 0 13%;
        }

            .listview ul {
                padding: 0;
                overflow-y: scroll;
                height: 165px;
            }

            .listview li {
                color: #878787;
                border-bottom: 1px solid #e5e5e5;
                line-height: 28px;
                padding: 10px 0 5px 8px;
                margin-top: 0;
                list-style: none;
            }

                .listview li:nth-child(odd) {
                    background-color: #e0e0e0;
                }

                .listview li span {
                    float: right;
                    width: 25px;
                    height: 25px;
                    text-align: center;
                    color: #fff;
                    background-color: #878787;
                    -moz-border-radius: 25px;
                    -webkit-border-radius: 25px;
                    -ms-border-radius: 25px;
                    font-size: 0.9em;
                    margin-right: 5px;
                }

        .pagination {
            color: #000 !important;
            display: block !important;
            padding: 10px;
        }

            .pagination label {
                display: inline-block;
                max-width: 100%;
                margin-bottom: 5px;
                font-weight: bold;
            }
    </style>


    <script>

        $(document).ready(function () {
            //$.ajax({
            //    type: "POST",
            //    contentType: "application/json; charset=utf-8",
            //    url: '../Registration/KioskRegistration.aspx/GetState',
            //    data: '{"prefix": ""}',
            //    processData: false,
            //    dataType: "json",
            //    success: function (response) {
            //        var arr = eval(response.d);
            //        var html = "";
            //        $("[id*=ddlState]").empty();
            //        $("[id*=ddlState]").append('<option value = "0">-Select-</option>');
            //        $.each(arr, function () {
            //            $("[id*=ddlState]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            //            console.log(this.Id + ',' + this.Name);
            //        });

            //    },
            //    error: function (a, b, c) {
            //        alert("1." + a.responseText);
            //    }
            //});

            //$("#ddlState").bind("change", function (e) { return GetDistrict(""); });
            //$("#ddlDistrict").bind("change", function (e) { return GetSubDistrict(""); });
            //$("#ddlTaluka").bind("change", function (e) { return GetVillage(""); });

        });

        function GetDistrict(category) {
            var SelIndex = $("#ddlState").val();

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '../Registration/KioskRegistration.aspx/GetDistrict',
                data: '{"prefix":"' + category + '","StateCode":"' + SelIndex + '"}',
                processData: false,
                dataType: "json",
                success: function (response) {
                    var Category = eval(response.d);
                    var html = "";
                    var catCount = 0;
                    $("[id=ddlDistrict]").empty();
                    $("[id=ddlDistrict]").append('<option value = "0">-Select-</option>');
                    $.each(Category, function () {
                        $("[id=ddlDistrict]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                        //console.log(this.Id + ',' + this.Name);
                        catCount++;
                    });


                },
                error: function (a, b, c) {
                    alert("2." + a.responseText);
                }
            });

        }

        function GetSubDistrict(category) {
            var SelIndex = $("#ddlDistrict").val();

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '../Registration/KioskRegistration.aspx/GetSubDistrict',
                data: '{"prefix":"' + category + '","DistrictCode":"' + SelIndex + '"}',
                processData: false,
                dataType: "json",
                success: function (response) {
                    var Category = eval(response.d);
                    var html = "";
                    var catCount = 0;
                    $("[id=ddlTaluka]").empty();
                    $("[id=ddlTaluka]").append('<option value = "0">-Select-</option>');
                    $.each(Category, function () {
                        $("[id=ddlTaluka]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                        //console.log(this.Id + ',' + this.Name);
                        catCount++;
                    });


                },
                error: function (a, b, c) {
                    alert("3." + a.responseText);
                }
            });

        }

        function GetVillage(category) {
            var SelIndex = $("#ddlTaluka").val();

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '../Registration/KioskRegistration.aspx/GetVillage',
                data: '{"prefix":"' + category + '","SubDistrictCode":"' + SelIndex + '"}',
                processData: false,
                dataType: "json",
                success: function (response) {
                    var Category = eval(response.d);
                    var html = "";
                    var catCount = 0;
                    $("[id=ddlVillage]").empty();
                    $("[id=ddlVillage]").append('<option value = "0">-Select-</option>');
                    $.each(Category, function () {
                        $("[id=ddlVillage]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                        //console.log(this.Id + ',' + this.Name);
                        catCount++;
                    });

                },
                error: function (a, b, c) {
                    alert("4." + a.responseText);
                }
            });

        }


        var baseUrl = "<%= Page.ResolveUrl("~/") %>";

        function ResolveUrl(url) {
            if (url.indexOf("~/") == 0) {
                url = baseUrl + url.substring(2);
            }
            return url;
        }

        function ViewDoc(p_URL, p_ServiceID, p_AppID) {
            var t_URL = ResolveUrl(p_URL);
            
            t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID;
            window.open(t_URL, 'ViewDoc', 'titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes');
            return false;
        }

        function TakeAction(p_URL, p_ServiceID, p_AppID) {
            //var t_URL = ResolveUrl(p_URL);
            var t_URL = "/WebApp/Kiosk/Habisha/Acknowledgement.aspx";

            //if ($("[id=HFSelection]").val() != "0") {
            //    t_URL = "G2GAction.aspx";
            //}


            t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=387";
            window.open(t_URL, 'ViewDoc', 'height=' + screen.height + ',width=' + screen.width + ',titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes');
            return false;
        }

        function ConfirmMessage(ActionType) {
            var t_Message = "";
            var result = false;
            if (ActionType == 1) {
                t_Message = "Please confirm to approve the selected records";
            }
            else {
                t_Message = "Please confirm to reject the selected records";
            }

            if (confirm(t_Message)) {
                result = true;
            }

            return result;
        }

        function PendingForAcceptance(Selection, SvcID) {
            $("[id=HFSelection]").val(Selection);
            $("[id=HFSelectedSvcID]").val(SvcID);
            window.document.forms[0].submit();
            return false;
        }

        function PendingForApproval(Selection, SvcID) {
            $("[id=HFSelection]").val(Selection);
            $("[id=HFSelectedSvcID]").val(SvcID);
            window.document.forms[0].submit();
            return false;
        }

        function PendingForAction(Selection, SvcID) {
            $("[id=HFSelection]").val(Selection);
            $("[id=HFSelectedSvcID]").val(SvcID);
            window.document.forms[0].submit();
            return false;
        }


        function SelectAll(id) {
            var allElts = document.forms['form1'].elements;
            var i;
            for (i = 0; i < allElts.length; i++) {
                var elt = allElts[i];
                if (elt.type == "checkbox") {
                    elt.checked = document.getElementById(id).checked;
                }
            }
        }



    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="intrnlContent" ng-app="appmodule">
        <div ng-controller="ctrl">
            <asp:HiddenField ID="HFServiceID" runat="server" Value="994" />
            <asp:HiddenField ID="HFSelection" runat="server" />
            <asp:HiddenField ID="HFSelectedSvcID" runat="server" />
            <div id="page-wrapper" style="min-height: 500px !important;">
                <div class="row">
                    <div class="col-lg-12">
                    </div>
                </div>
                <%--<uc1:FormTitle runat="server" ID="FormTitle" />--%>
                <%---Start of Application Details----%>
                <div class="row">
                    <div class="col-md-12 box-container mt20">

                        <div class="box-heading">
                            <h4 class="box-title register-num">List of Habisha Brata Scheme Application
                            </h4>
                        </div>
                        <div class="box-body box-body-open">

                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12" style="overflow: auto; height: 250px;">
                                <div class="form-group">
                                    <asp:GridView ID="grdView" runat="server" ShowHeaderWhenEmpty="true" AutoGenerateColumns="false"
                                        CssClass="table table-striped table-bordered" OnPageIndexChanging="grdView_PageIndexChanging" OnRowDataBound="grdView_RowDataBound">
                                    </asp:GridView>
                                </div>
                            </div>

                            <div class="text-center col-md-12 col-sm-12 col-xs-12" style="display:none;">
                                <ul class="pagination">
                                    <li class="col-md-3 col-sm-3 text-center">
                                        <label for="TotalRecords">Total Records</label>
                                        <label id="lblTotalRecords" runat="server" for="TotalRecords"></label>
                                        <input type="hidden" id="TotalRecords" name="TotalRecords" value="2" /></li>
                                    <li class="col-md-3 col-sm-2 text-center">
                                        <label for="CurrentPage">Page:</label>
                                        1
    <input type="hidden" id="CurrentPage" name="CurrentPage" value="1" />
                                        <label for="TotalPages">of</label>
                                        1
                                    </li>

                                    <li class="col-md-4 col-sm-5 text-center">
                                        <input type="hidden" id="TotalPages" name="TotalPages" value="1" />

                                        <button class="btn btn-primary " type="submit" id="btnFirst" name="Command" value="First" disabled="disabled">
                                            First</button>
                                        <button class="btn btn-default " type="submit" id="btnPrevious" name="Command" value="Previous" disabled="disabled">
                                            Previous</button>
                                        <button class="btn btn-default " type="submit" id="btnNext" name="Command" value="Next" disabled="disabled">
                                            Next</button>
                                        <button class="btn btn-primary " type="submit" id="btnLast" name="Command" value="Last" disabled="disabled">
                                            Last</button>
                                        <button class="btn btn-success " type="submit" id="btnRefresh" name="Command" style="display: none" value="Refresh">
                                            Refresh</button>
                                    </li>
                                    <li class="col-md-2 col-sm-2">


                                        <input class="form-control text-align-center" data-val="true" data-val-number="The field PageSize must be a number." placeholder="Search..." data-val-required="The PageSize field is required." id="PageSize" name="PageSize" type="text" value="" autocomplete="off" />
                                        <div class="clearfix"></div>

                                    </li>
                                    <div class="clearfix"></div>
                                </ul>
                            </div>
                            <div class="clearfix">
                            </div>
                            
                        </div>
                    </div>
                </div>
                <%----END of Application Details-----%>
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container" id="">
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <div class="form-group">
                                    <label class="manadatory" for="txtReason">
                                        Remarks
                                    </label>
                                    <textarea runat="server" name="txtRemark" rows="2" cols="20" id="txtRemark" placeholder="Enter Remark" class="form-control" onkeyup="javascript:Count(this);" onchange="javascript:Count(this);">
                    </textarea>
                                </div>

                            </div>
                            <div class="clearfix">
                            </div>
                        </div>

                    </div>

                    <div class="clearfix">
                    </div>
                </div>
                <%---Start of Button----%>
                <div class="row">
                    <div class="col-md-12 box-container" id="divBtn">
                        <div class="box-body box-body-open" style="text-align: center;">                            
                            <asp:Button ID="btnAccept" runat="server" CssClass="btn btn-success" OnClientClick="return ConfirmMessage(1);"
                                Text="Approve" OnClick="btnAccept_Click" />
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
                <%----END of Button-----%>
            </div>
        </div>

    </div>
</asp:Content>
