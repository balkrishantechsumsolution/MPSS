<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestGrid.aspx.cs" Inherits="CitizenPortal.WebApp.TestGrid" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script src="../Scripts/jquery-2.2.3.min.js"></script>
    <script src="../Scripts/angular.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../PortalScripts/OrderLogic.js"></script>
    <link href="/g2c/css/font-awesome.min.css" rel="stylesheet" />

    <link href="../../Styles/style.admin.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/bootstrap-theme.min.css" rel="stylesheet" />
    <style type="text/css">
        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
        }

        .floatingRectangle {
            z-index: 1;
            position: fixed;
            left: 0;
            height: 200px;
            background-color: #ccc;
            color: white;
            padding: 0;
            border: 1px solid #cdcdcd;
            width: 50px;
            top: 200px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 2000px; border: 1px solid #dcdcdc;color:#000 !important;">
            <div class="col-lg-12" style="width: 100%; padding-left: 2px; font-family: Arial, Helvetica, sans-serif !important;">
                <div class="col-xs-12 pleft0">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="background-color: #E6F2FF; border: 2px solid #C4E0FF; padding-left: 15px; font-size: 14px; color: #333; line-height: 22px; margin-bottom: 15px;">
                        <tr>
                            <td width="50%" valign="top" style="padding: 0 5px 0 5px;"><b>There are four steps in applying:</b><br />
                                1.	Fill up the online application
                                <br />
                                2.	Upload the supporting documents and certificates<br />
                                3.	Make payment (no payment for SC, ST candidates)<br />
                                4.	Upload the payment details
                                <br />
                                <b>Unless all the steps are completed, an application will be rejected.
                                    <br />
                                    The candidate will get messages confirming the acceptance of his application.
                                </b>
                                <br />
                            </td>
                            <td width="50%" valign="top" style="padding: 0 5px 0 5px;"><b>Before starting to fill the application, please scan and keep the following ready:</b><br />
                                a.	Candidate’s passport size photo<br />
                                b.	Candidate’s full signature<br />
                                c.	All the mark sheets, certificates and documents<br />
                                Please use only .jpg format for photo and signature; documents may be in<b> .jpg or. pdf</b></td>
                        </tr>
                    </table>


                </div>

                <div class="çol-md-6" style="width: 50%; padding-right: 20px; float: left;">
                    <div class="pretext" style="float: left;"><b>1.</b></div>
                    <div class="text" style="overflow: hidden; padding-left: 5px; line-height: 22px; text-align: left;">Please enter your 12 digit Aadhar Number in the box, if available; else, fill up the details manually.</div>
                    <div class="clearfix" style="clear: both;"></div>
                    <div class="pretext" style="float: left;"><b>2.</b></div>
                    <div class="text" style="overflow: hidden; padding-left: 5px; line-height: 22px; text-align: left;">Please fill all details mentioned in the online application form, failing which the application will be rejected.</div>


                    <div class="pretext" style="float: left; margin-left: 15px;"><b>a)</b></div>
                    <div class="text" style="overflow: hidden; padding-left: 5px; line-height: 22px; text-align: left;">Your recent passport size photograph and signature has to be uploaded, without leaving any item blank. Full Specimen signature of the applicantin “jpg” format should be between 10 kB to 20 kB and Passport size photograph, scanned in the “jpg” format between the ranges of 20 kB to 50 kB for uploading. Photograph and full specimen signature scanned for uploading must be clearly identifiable /visible, otherwise your registration and application will be rejected; no correspondence on this account shall be entertained. All the documents should be scanned in 72 dpi resolution.</div>

                    <div class="col-xs-6 pleft0 pright0">
                        <div class="pretext" style="float: left;"><b>3.</b></div>
                        <div class="text" style="overflow: hidden; padding-left: 5px; text-align: left;">
                            You must provide HSC qualification details, Employment Exchange details like Regn. No., Regn.Date, etc. at the appropriate boxes.

                        </div>
                        <div class="pretext" style="float: left;"><b>4.</b></div>
                        <div class="text" style="overflow: hidden; padding-left: 5px; line-height: 22px; text-align: left;">You must click on self-declaration and Declaration for Physical Efficiency test after carefully entering all the details. By clicking this, you are accepting all the information you have submitted are true, and you will be responsible for any false or misleading information.</div>
                    </div>
                    <div class="col-xs-6" style="padding:5px 0 5px 0">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" style="float: right; background-color: #f9f9f9; border: 1px solid #333; text-align: justify; font-size: 14px; color: #333; line-height: 19px; margin-bottom: 15px;">
                            <tr>
                                <td style="padding: 5px"><b>You can also submit your Application Forms through the <span style="color: red;">CSC - Common Service Centers (Jan Seva Kendra),</span> you can also pay your Application fee through them.
                                    <br />
                                    The CSC will charge the following fees, in addition to the application fees:<br />
                                    For filling up the application: Rs 10/-<br />
                                    For each scanning: Rs 2/-<br />
                                    For each printout: Rs 3/-<br />
                                    For collecting application fee (Rs 200/-) : Rs 10/-<br />
                                    <hr style="padding: 0; margin: 0" />
                                    <a class="btn-link" href="/g2c/forms/CenterList.aspx" target="_blank">Check - CSC Centers in Odisha</a>
                                </b>
                                </td>

                            </tr>                            
                        </table>
                    </div>




                    <div class="clearfix"></div>
                    <div class="pretext" style="float: left;"><b>5.</b></div>
                    <div class="text" style="overflow: hidden; padding-left: 5px; line-height: 22px; text-align: left;">After that, please click on ‘’submit’’ button at the bottom; you will receive a username and password for the website <a href="http://g2cservices.in/g2c/forms/index.aspx" target="_blank">http://g2cservices.in/.</a> Also, the application fee page will appear.</div>

                    <div class="pretext" style="float: left;"><b>6.</b></div>
                    <div class="text" style="overflow: hidden; padding-left: 5px; line-height: 22px; text-align: left;">The application fee of Rs 200/- per applicant<b> (if you belong to SC or ST category, there is no application fee)</b> can be deposited through online payment gateway of SBI using Internet Banking/ Debit Card/ Credit Card of any bank. Also, you can print the Challan form in the application, print it out, and present it to any branch of the State Bank of India (SBI) and pay the fee; the SBI will charge an additional Rs 58/- per application.</div>
                </div>
                <div class="çol-md-6">
                    <div class="pretext" style="float: left; text-align: left;"><b>7.</b></div>
                    <div class="text" style="overflow: hidden; padding-left: 5px;"><b>Fees, once paid, cannot be returned back to you under any circumstances.</b></div>
                    <div class="pretext" style="float: left;"><b>8.</b></div>
                    <div class="text" style="overflow: hidden; padding-left: 5px; line-height: 22px; text-align: left;">Once you pay the fee, you will receive a message confirming the acceptance of your application. </div>

                    <div class="pretext" style="float: left;"><b>9.</b></div>
                    <div class="text" style="overflow: hidden; padding-left: 5px; line-height: 22px; text-align: left;">You must have your own personal E-mail ID and Mobile Number with validity till the completion of the recruitment process; all important communication like username and password, various alerts and downloading e-Pass (admission) Letters and other necessary letters, etc., will be sent to you only by sms and email from <a href="http://g2cservices.in/g2c/forms/index.aspx" target="_blank">http://g2cservices.in/ </a>Under no circumstances, you should share the password for your e-mail ID and Mobile/Cell Number with any other person. If you do not have a valid e-Mail ID, please create a new e-Mail ID </div>

                    <div class="pretext" style="float: left;"><b>10.</b></div>
                    <div class="text" style="overflow: hidden; padding-left: 5px; line-height: 22px; text-align: left;">You will be provided with a username and password to login on to the website<a href="http://g2cservices.in/g2c/forms/index.aspx" target="_blank"> http://g2cservices.in/ </a>for all future references. Your ePass, marks declaration or all details/notice will be available through only online, no separate physical communication would be sent.</div>

                    <div class="pretext" style="float: left;"><b>11.</b></div>
                    <div class="text" style="overflow: hidden; padding-left: 5px; line-height: 22px; text-align: left;">
                        Documents Required (to be scanned and uploaded):<br />
                        For all the candidates: photo, signature, mark sheets and Caste Certificate (if you belong to SEBC SC or ST)<br />
                        Additional documents:<br />
                    </div>
                    <div class="pretext" style="float: left; margin-left: 25px;"><b>a)</b></div>
                    <div class="text" style="overflow: hidden; padding-left: 5px; text-align: left;">For Ex Service Man: Certificate of Discharge</div>

                    <div class="pretext" style="float: left; margin-left: 25px;"><b>b)</b></div>
                    <div class="text" style="overflow: hidden; padding-left: 5px; text-align: left;">For Sportsperson: Certificate of iCard issued by Director of Sports Odisha; certificates in case of participated in National/International sports</div>

                    <div class="pretext" style="float: left; margin-left: 25px;"><b>c)</b></div>
                    <div class="text" style="overflow: hidden; padding-left: 5px; text-align: left;">NCC certificates, if any</div>

                    <div class="pretext" style="float: left; margin-left: 25px;"><b>d)</b></div>
                    <div class="text" style="overflow: hidden; padding-left: 5px; text-align: left;">Registration certificate of Employment Exchange</div>

                    <div class="pretext" style="float: left; margin-left: 25px;"><b>e)</b></div>
                    <div class="text" style="overflow: hidden; padding-left: 5px; text-align: left;">Driving License</div>

                    <div class="pretext" style="float: left; margin-left: 25px;"><b>f)</b></div>
                    <div class="text" style="overflow: hidden; padding-left: 5px; text-align: left;">Any other document you deem relevant.	</div>

                    <div class="text" style="overflow: hidden; padding-left: 5px; line-height: 22px; text-align: left;"><b>Please note : </b>At a later stage, you will be asked to produce the originals of all your certificates and documents for verification. At that time, you must produce the originals of all the documents you have uploaded along with your application. </div>
                </div>
            </div>



            <div class="floatingRectangle">
                <ul>
                    <li>
                        <i class="fa fa-newspaper-o"></i><span title="Advertisement / Notification"></span>
                    </li>
                    <li>
                        <i class="fa fa-map-marker"></i><span title="CSC Centers"></span>
                    </li>
                    <li>
                        <i class="fa fa-viadeo"></i><span title="Video Tutorial"></span>
                    </li>
                    <li>
                        <i class="fa fa-image"></i><span title="How to Resize Image"></span>
                    </li>
                </ul>
            </div>
            <div class="floatingRectangle" style="display: none">
                <ul>
                    <li>
                        <i class="fa fa-locate"></i><span>Advertisement / Notification</span>
                    </li>
                    <li>
                        <i class="fa fa-locate"></i><span>CSC Centers</span>
                    </li>
                    <li>
                        <i class="fa fa-locate"></i><span>Video Tutorial</span>
                    </li>
                    <li>
                        <i class="fa fa-locate"></i><span>How to Resize Image</span>
                    </li>
                </ul>
            </div>
        </div>
        <div>
            <h1>Orders View</h1>
            <div ng-app="ngmodule">
                <div ng-controller="ngcontroller">
                    <table class="table table-bordered table-condensed">
                        <tr>
                            <td>Search By:</td>
                            <td>
                                <select ng-model="SelectedCriteria" ng-options="S for S in Selectors">
                                </select>
                            </td>
                            <td>Enter Search Value:</td>
                            <td>
                                <input type="text" ng-model="filterValue" class="form-control" ng-change="getFilteredData()" />
                            </td>
                        </tr>
                    </table>
                    <table class="table table-bordered table-condensed table-striped">
                        <thead>
                            <tr>
                                <th>OrderId</th>
                                <th>Customer Name</th>
                                <th>Contact No</th>
                                <th>Ordered Item</th>
                                <th>Quantity</th>
                                <th>Sales Agent Name</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr ng-repeat="order in Orders">
                                <td>{{order.orderId}}</td>
                                <td>{{order.customerName}}</td>
                                <td>{{order.customerMobileNo}}</td>
                                <td>{{order.orderedItem}}</td>
                                <td>{{order.orderedQuantity}}</td>
                                <td>{{order.salesAgentName}}</td>
                            </tr>
                        </tbody>
                    </table>
                    <span>{{Message}}</span>
                </div>

            </div>
        </div>
    </form>
</body>
</html>
