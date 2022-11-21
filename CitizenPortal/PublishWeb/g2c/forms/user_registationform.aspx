<%@ Page Title="" Language="C#" MasterPageFile="~/g2c/master/Home.Master" AutoEventWireup="true" CodeBehind="user_registationform.aspx.cs" Inherits="CitizenPortal.g2c.forms.user_registationform" EnableSessionState="False"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbody" runat="server">
    <div class="row">
        <div class="w95">
            <h1>User Registration Form</h1>
            <div class="box-container row">
                <div class="col-md-12 p0 mbtm15 mleft5">
                    <div class="usrregbox">
                        <div class="usrhd">
                            <div class="usrstep">
                                <img src="../img/user_reg_step1.png" />
                            </div>
                            <h4>Applicant Detail</h4>

                        </div>

                        <div class="usrfrmbox">
                            <div class="col-xs-12">
                                <div class="row mtop10 mbtm10">
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                        Salutation *
                                <select class="form-control inputbox_bluebdr" id="Salutation_Value" name="Salutation_Value">
                                    <option value="">---Select---</option>
                                    <option value="advocare">Advocate</option>
                                    <option value="kumar">Kumar</option>
                                    <option value="kumari">Kumari</option>
                                    <option value="mr.">Mr.</option>
                                    <option value="mrs">Mrs</option>
                                    <option value="ms">Ms</option>
                                    <option value="shri">Shri</option>
                                    <option value="shrimati">Shrimati</option>
                                </select>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
                                        Full Name (English) *
                                <input class="form-control inputbox_bluebdr" id="FullNme" maxlength="99" name="FullNme" type="text" value="" autocomplete="off"/>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
                                        Full Name (Odiya) *
                                <input class="form-control inputbox_bluebdr" id="FullNmeOdya" maxlength="99" name="FullNmeOdya" type="text" value="" autocomplete="off"/>
                                    </div>

                                </div>
                                <div class="row mtop10 mbtm10">
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                        Father's Salutation *
                                <select class="form-control inputbox_bluebdr" id="FatherSal_Value" name="FatherSal_Value">
                                    <option value="">---Select---</option>
                                    <option value="advocare">Advocate</option>
                                    <option value="kumar">Kumar</option>
                                    <option value="kumari">Kumari</option>
                                    <option value="mr.">Mr.</option>
                                    <option value="mrs">Mrs</option>
                                    <option value="ms">Ms</option>
                                    <option value="shri">Shri</option>
                                    <option value="shrimati">Shrimati</option>
                                </select>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
                                        Father's Name (English) *
                                <input class="form-control inputbox_bluebdr" id="FatherNmeEng" maxlength="99" name="FatherNmeEng" type="text" value="" autocomplete="off"/>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
                                        Father's Name (Odiya) *
                                <input class="form-control inputbox_bluebdr" id="FatherNmeOdsh" maxlength="99" name="FatherNmeOdsh" type="text" value="" autocomplete="off"/>
                                    </div>

                                </div>

                                <div class="row mtop10 mbtm10">
                                    <div class="col-xs-12 col-sm-6 col-md-2" id="divDOB">
                                        <div class="form-group">
                                            <label class="manadatory" for="DateofBirth">Date of Birth</label>
                                            <input class="form-control inputbox_bluebdr" id="DoB" maxlength="99" name="DoB" type="text" value="" autocomplete="off"/>
                                        </div>
                                        <!-- form-group -->
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-2 col-lg-1" style="display: block">
                                        <div class="form-group">
                                            <label class="manadatory" for="age">Age</label>
                                            <input class="form-control inputbox_bluebdr" id="Age" maxlength="99" name="Age" type="text" value="" autocomplete="off"/>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-2" id="divGender">
                                        <div class="form-group">
                                            <label class="manadatory" for="ApplicantGender">Gender</label>
                                            <select class="form-control inputbox_bluebdr" id="Gender_Value" name="Gender_Value">
                                                <option value="">---Select---</option>
                                                <option value="3d771b42-24ff-445e-b49f-5ef7ed2b5c85">M</option>
                                                <option value="d86f450b-f353-452d-bd88-86f293f6af99">F</option>
                                                <option value="ba69678e-c145-4396-8366-df2ea4b92f53">T</option>
                                            </select>
                                            <input id="SelectedGender" name="SelectedGender" type="hidden" value=""/>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display: block">
                                        <div class="form-group">
                                            <label for="ApplicantOccupation">Occupation</label>
                                            <select class="form-control inputbox_bluebdr" id="Occupation_Value" name="Occupation_Value">
                                                <option value="">---Select---</option>
                                                <option value="6b4e4dd8-f8ae-43ba-94b7-ec4a03d60d09">Artist</option>
                                                <option value="b30e8fe7-4636-4327-a4e5-71ee5b9ab4af">B.A</option>
                                                <option value="899ba63a-842c-4750-aa7b-907db4554b7b">B.E</option>
                                                <option value="f5281965-a08f-4cbc-b5e6-61c7e6dffdeb">Bussiness</option>
                                                <option value="e45829b0-3281-45ca-a6cc-16e5ed8830e3">Doctor</option>
                                                <option value="0c7d0cd0-459b-4d54-89ee-395201f7b2ab">Engineer</option>
                                                <option value="246b8a76-a895-4cc8-83dd-7702388b9a7f">Farm Wages</option>
                                                <option value="61d38294-af7c-4ce3-b969-187d8a957826">Farmer</option>
                                                <option value="e2cdd7b5-29fd-48fd-bc18-14e04931b460">Government Employee</option>
                                                <option value="8ce21ed4-8865-4b4f-ad3d-accbaa461554">Hardware Professional</option>
                                                <option value="f59e1261-0626-4e8c-a651-49f07d01dcdd">Housewife</option>
                                                <option value="eec75bbb-60fa-4380-9ba1-f87fe989bb5c">Industrialist</option>
                                                <option value="9b15fd54-200b-4069-b138-e6c351f660d5">Lawyer</option>
                                                <option value="2974ef2d-86cb-4c9a-8d17-579b09936f8b">Nurse</option>
                                                <option value="226c6084-58ce-4dc0-ba07-b0f62545d8a0">Others</option>
                                                <option value="73f564c2-5e65-4940-9190-61230734128b">Private Service</option>
                                                <option value="49881c53-f3e3-4e5b-84c5-2505d2757e07">Professor</option>
                                                <option value="aae74114-99d3-4a3f-9420-4846f26f2b69">Software Professional</option>
                                                <option value="61e7297a-81a1-4ca4-ad8c-992fb9eefa6a">Student</option>
                                                <option value="4d64ba26-b7b3-48f6-848a-66fa8be61816">Teacher</option>
                                                <option value="71283e5a-1ec2-4a28-ae37-80a11c31cbc0">Wages</option>
                                                <option value="a4e61d60-bb7c-42e5-aaa3-9e6f7f475e46">Worker</option>
                                                <option value="3d5d2c3e-3c81-49d1-b8a2-e0bc6cf7db15">Writer</option>
                                            </select>
                                            <input class="form-control" id="ApplicantOccupation" name="ApplicantOccupation" type="hidden" value=""/>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="usrregbox">
                        <div class="usrhd">
                            <div class="usrstep">
                                <img src="../img/user_reg_step2.png" />
                            </div>
                            <h4>Applicant’s Address [As per document]</h4>

                        </div>

                        <div class="usrfrmbox">
                            <div class="col-xs-12">
                                <div class="row mtop10 mbtm10">
                                    <div class="col-md-3">
                                        Address (English)  *
                                <input class="form-control inputbox_bluebdr" id="AddEng" maxlength="99" name="AddEng" type="text" value="" autocomplete="off"/>
                                    </div>
                                    <div class="col-md-3">
                                        Address (Odisha)  *
                                <input class="form-control inputbox_bluebdr" id="AddOdha" maxlength="99" name="AddOdha" type="text" value="" autocomplete="off"/>
                                    </div>
                                    <div class="col-md-3">
                                        Street (English)  *
                                <input class="form-control inputbox_bluebdr" id="StreetEng" maxlength="99" name="StreetEng" type="text" value="" autocomplete="off"/>
                                    </div>
                                    <div class="col-md-3">
                                        Street (Odiya)  *
                                <input class="form-control inputbox_bluebdr" id="StreetOdha" maxlength="99" name="StreetOdha" type="text" value="" autocomplete="off"/>
                                    </div>

                                </div>
                                <div class="row mtop10 mbtm10">
                                    <div class="col-md-3">
                                        Section (English) *
                                <input class="form-control inputbox_bluebdr" id="SectionEng" maxlength="99" name="SectionEng" type="text" value="" autocomplete="off"/>
                                    </div>
                                    <div class="col-md-3">
                                        Section (Odisha) *
                                <input class="form-control inputbox_bluebdr" id="SectionOdha" maxlength="99" name="SectionOdha" type="text" value="" autocomplete="off"/>
                                    </div>
                                    <div class="col-md-3">
                                        Building (English)  *
                                <input class="form-control inputbox_bluebdr" id="BuildingEng" maxlength="99" name="BuildingEng" type="text" value="" autocomplete="off"/>
                                    </div>
                                    <div class="col-md-3">
                                        Building (Odiya)  *
                                <input class="form-control inputbox_bluebdr" id="BuildingOdha" maxlength="99" name="BuildingOdha" type="text" value="" autocomplete="off"/>
                                    </div>

                                </div>

                                <div class="row mtop10 mbtm10">
                                    <div class="col-md-3">
                                        Landmark (English) *
                                <input class="form-control inputbox_bluebdr" id="LandmarkEng" maxlength="99" name="LandmarkEng" type="text" value="" autocomplete="off"/>
                                    </div>
                                    <div class="col-md-3">
                                        Landmark (Odisha) *
                                <input class="form-control inputbox_bluebdr" id="LandmarkOdha" maxlength="99" name="LandmarkOdha" type="text" value="" autocomplete="off"/>
                                    </div>
                                    <div class="col-md-3">
                                        District *
                                <input class="form-control inputbox_bluebdr" id="District" maxlength="99" name="District" type="text" value="" autocomplete="off"/>
                                    </div>

                                    <div class="col-md-3">
                                        Taluka *
                                <input class="form-control inputbox_bluebdr" id="Taluka" maxlength="99" name="Taluka" type="text" value="" autocomplete="off"/>
                                    </div>

                                </div>

                                <div class="row mtop10 mbtm10">


                                    <div class="col-md-3">
                                        Village *
                                <input class="form-control inputbox_bluebdr" id="Village" maxlength="99" name="Village" type="text" value="" autocomplete="off"/>
                                    </div>

                                    <div class="col-md-3">
                                        Pincode *
                                <input class="form-control inputbox_bluebdr" id="Pincode" maxlength="99" name="Pincode" type="text" value="" autocomplete="off"/>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="usrregbox">
                        <div class="usrhd">
                            <div class="usrstep">
                                <img src="../img/user_reg_step3.png" />
                            </div>
                            <h4>Mobile No. & Username Verification</h4>

                        </div>

                        <div class="usrfrmbox">
                            <div class="col-xs-12">
                                <div class="row mtop10 mbtm10">
                                    <div class="col-md-3">
                                        10 digit Mobile Number  *
                                        <label class="sr-only" for="exampleInputAmount">
                                            + 91</label>
                                        <div class="input-group">
                                            <div class="input-group-addon">
                                                + 91
                                            </div>
                                            <input autocompletetype="Disabled" autocompelete="Off" class="form-control inputbox_bluebdr" id="MobileNo" maxlength="10" name="MobileNo" onblur="return MobileNoValidation();" onkeypress="return onlyNumbers(event); " type="text" value="" autocomplete="off"/>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        One Time Password (OTP)  *
                                <input class="form-control inputbox_bluebdr" id="Otp" maxlength="99" name="Otp" type="text" value="" autocomplete="off"/>
                                    </div>
                                    <div class="col-md-3">
                                        PAN No
                                <input class="form-control inputbox_bluebdr" id="PAN" maxlength="99" name="PAN" type="text" value="" autocomplete="off"/>
                                    </div>
                                    <div class="col-md-3">
                                        UID Number
                                <input class="form-control inputbox_bluebdr" id="Uid" maxlength="99" name="Uid" type="text" value="" autocomplete="off"/>
                                    </div>

                                </div>
                                <div class="row mtop10 mbtm10">
                                    <div class="col-md-6 col-lg-3">
                                        User Name *
                                <input class="form-control inputbox_bluebdr" id="UserNme" maxlength="99" name="UserNme" type="text" value="" autocomplete="off"/>
                                    </div>
                                    <div class="col-md-6 col-lg-3">
                                        Email ID *
                                <input class="form-control inputbox_bluebdr" id="EmlId" maxlength="99" name="EmlId" type="text" value="" autocomplete="off"/>
                                    </div>
                                       <div class="col-md-3 col-lg-3">
                                        Password *
                                <input class="form-control inputbox_bluebdr" id="Pswd" maxlength="99" name="Pswd" type="text" value="" autocomplete="off"/>
                                    </div>
                                    <div class="col-md-3 col-lg-3">
                                        Confirm Password *
                                <input class="form-control inputbox_bluebdr" id="CnfmPwd" maxlength="99" name="CnfmPwd" type="text" value="" autocomplete="off"/>
                                    </div>

                                </div>

                                
                                <div class="row mtop10 mbtm10">

                                    <div class="w95 whitebg mleft15 pleft5 pright5">
                                        <p>
                                            <i class="fa fa-info-circle"></i>&nbsp; Password must contains one digit from 0-9,and contains atleast one lowercase characters and one uppercase characters,Must contains one special symbols in thelist @#$% and Password length atleast 7 character and maximum 20 character.Example- Citizen@123
                                        </p>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="usrregbox">
                        <div class="usrhd">
                            <div class="usrstep">
                                <img src="../img/user_reg_step4.png" />
                            </div>
                            <h4>Upload Photograph</h4>

                        </div>

                        <div class="usrfrmbox">
                            <div class="col-xs-12">
                                <div class="row mtop10 mbtm10">
                                    <div class="col-md-4">
                                        <div class="row pleft15"><b>Instructions for issued photo:</b></div>

                                        <ul>
                                            <li>Size of the photograph should fall between 5KB to 20KB</li>
                                            <li>Photograph Format should be JPEG.</li>
                                            <li>The width of the photograph should be 160 pixels.</li>
                                            <li>The height of the photograph should fall between 200 to 212 pixels.</li>
                                        </ul>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="row pleft15"><b>Add Photo</b></div>
                                        <img src="../img/upload_img.png" />

                                    </div>
                                    <div class="col-md-4">
                                        <div class="row pleft15"><b>Well Composed Photo Examples</b></div>
                                        <img src="../img/usrreg_demopic.jpg" />
                                    </div>

                                    <div class="col-md-12 mtop15">
                                        Photo Edit & Upload Manual
                                        <input type="file" class="btn-file btn-grey" id="Photoupload" name="Photoupload" onchange="showimagepreview(this,'Photo')"/>
                                    </div>


                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="usrregbox">
                        <div class="usrhd">
                            <div class="usrstep">
                                <img src="../img/user_reg_step5.png" />
                            </div>
                            <h4>Proof Of Identity (Any -1)</h4>

                        </div>

                        <div class="usrfrmbox">
                            <div class="col-xs-12">
                                <div class="row mtop10 mbtm10">
                                    <div class="col-md-4">
                                        <ul class="addinforound">
                                            <li>Document Format should be JPEG/ PDF.</li>
                                            <li>The size of the documents between 75 KB to 100 KB.</li>
                                        </ul>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <ul class="doc-upload list-inline list-group">
                                                <li class="col-lg-4 col-sm-4  inline-label col-md-4">
                                                    <input data-val="true" data-val-required="The IsChecked field is required." id="chk_1_4" name="elem.IsChecked" onclick="javascript: return ValidateDocuments(this, 1, 4, 1);" type="checkbox" value="true"/>
                                                    <input name="elem.IsChecked" type="hidden" value="false"/>
                                                    <label for="PAN_Card" id="lbl_1_4">PAN Card</label>
                                                    <input id="PanNo" name="PanNo" type="hidden" value="PAN Card"/>
                                                    <input type="file" id="file_1_4" name="file_1_4" style="display: none"/>
                                                </li>
                                                <li class="col-lg-4 col-sm-4  inline-label col-md-4">
                                                    <input id="chk_1_8" name="elem.IsChecked" onclick="javascript: return ValidateDocuments(this, 1, 8, 1);" type="checkbox" value="true"/>
                                                    <input name="elem.IsChecked" type="hidden" value="false"/>
                                                    <label for="Voter_ID_Card__POI_" id="lbl_1_8">Voter ID Card (POI)</label>
                                                    <input id="VtrNo" name="VtrNo" type="hidden" value="Voter ID Card (POI)"/>
                                                    <input type="file" id="file_1_8" name="file_1_8" style="display: none"/>
                                                </li>
                                                <li class="col-lg-3 col-sm-4  inline-label col-md-4">
                                                    <input id="chk_1_3" name="elem.IsChecked" onclick="javascript: return ValidateDocuments(this, 1, 3, 1);" type="checkbox" value="true"/>
                                                    <input name="elem.IsChecked" type="hidden" value="false"/>
                                                    <label for="Passport__POI_" id="lbl_1_3">Passport (POI)</label>
                                                    <input id="PssptNo" name="PssptNo" type="hidden" value="Passport (POI)"/>
                                                    <input type="file" id="file_1_3" name="file_1_3" style="display: none"/>
                                                </li>
                                                <li class="col-lg-4 col-sm-4  inline-label col-md-4">
                                                    <input id="chk_1_7" name="elem.IsChecked" onclick="javascript: return ValidateDocuments(this, 1, 7, 1);" type="checkbox" value="true"/>
                                                    <input name="elem.IsChecked" type="hidden" value="false"/>
                                                    <label for="Aadhaar_Card__POI_" id="lbl_1_7">Aadhaar Card (POI)</label>
                                                    <input id="AdhrCdNo" name="AdhrCdNo" type="hidden" value="Aadhaar Card (POI)"/>
                                                    <input type="file" id="file_1_7" name="file_1_7" style="display: none"/>
                                                </li>
                                                <li class="col-lg-4 col-sm-4  inline-label col-md-4">
                                                    <input id="chk_1_1" name="elem.IsChecked" onclick="javascript: return ValidateDocuments(this, 1, 1, 1);" type="checkbox" value="true"/>
                                                    <input name="elem.IsChecked" type="hidden" value="false"/>
                                                    <label for="Driving_License__POI_" id="lbl_1_1">Driving License (POI)</label>
                                                    <input id="DLNo" name="DLNo" type="hidden" value="Driving License (POI)"/>
                                                    <input type="file" id="file_1_1" name="file_1_1" style="display: none"/>
                                                </li>
                                                <li class="col-lg-3 col-sm-4  inline-label col-md-4">
                                                    <input id="chk_1_2" name="elem.IsChecked" onclick="javascript: return ValidateDocuments(this, 1, 2, 1);" type="checkbox" value="true"/>
                                                    <input name="elem.IsChecked" type="hidden" value="false"/>
                                                    <label for="MNREGA_Job_Card" id="lbl_1_2">MNREGA Job Card</label>
                                                    <input id="MngaJbcrd" name="MngaJbcrd" type="hidden" value="MNREGA Job Card"/>
                                                    <input type="file" id="file_1_2" name="file_1_2" style="display: none"/>
                                                </li>
                                                <li class="col-sm-4  inline-label col-md-4">
                                                    <input id="chk_1_5" name="elem.IsChecked" onclick="javascript: return ValidateDocuments(this, 1, 5, 1);" type="checkbox" value="true"/>
                                                    <input name="elem.IsChecked" type="hidden" value="false"/>
                                                    <label for="RSBY_Card" id="lbl_1_5">RSBY Card</label>
                                                    <input id="RsbycrdNo" name="RsbycrdNo" type="hidden" value="RSBY Card"/>
                                                    <input type="file" id="file_1_5" name="file_1_5" style="display: none"/>
                                                </li>
                                                <li class="col-lg-7 col-sm-4  inline-label col-md-4">
                                                    <input id="chk_1_6" name="elem.IsChecked" onclick="javascript: return ValidateDocuments(this, 1, 6, 1);" type="checkbox" value="true"/>
                                                    <input name="elem.IsChecked" type="hidden" value="false"/>
                                                    <label for="Government___Semi_-_Government_ID_Proof" id="lbl_1_6">Government / Semi - Government ID Proof</label>
                                                    <input id="GvtidPrf" name="GvtidPrf" type="hidden" value="Government / Semi - Government ID Proof"/>
                                                    <input type="file" id="file_1_6" name="file_1_6" style="display: none"/>
                                                </li>
                                                
                                                

                                                <div class="clearfix">
                                                </div>
                                            </ul>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="usrregbox">
                        <div class="usrhd">
                            <div class="usrstep">
                                <img src="../img/user_reg_step6.png" />
                            </div>
                            <h4>Proof Of Address (Any -1)</h4>

                        </div>

                        <div class="usrfrmbox">
                            <div class="col-xs-12">
                                <div class="row mtop10 mbtm10">
                                    <div class="col-md-4">
                                        <ul class="addinforound">
                                            <li>Document Format should be JPEG/ PDF.</li>
                                            <li>The size of the documents between 75 KB to 100 KB.</li>
                                        </ul>
                                    </div>
                                    <div class="col-sm-8 col-md-8">
                                        <div class="form-group">
                                            <ul class="doc-upload list-inline list-group">
                                                <li class="col-lg-4 col-sm-4  inline-label col-md-4">
                                                    <input id="chk_2_33" name="elem.IsChecked" onclick="javascript: return ValidateDocuments(this, 2, 33, 1);" type="checkbox" value="true"/>
                                                    <input name="elem.IsChecked" type="hidden" value="false"/>
                                                    <label for="Ration_Card" id="lbl_2_33">Ration Card</label>
                                                    <input id="RtnCrd" name="RtnCrd" type="hidden" value="Ration Card"/>
                                                    <input type="file" id="file_2_33" name="file_2_33" style="display: none"/>
                                                </li>
                                                <li class="col-lg-4 col-sm-4  inline-label col-md-4">
                                                    <input id="chk_2_35" name="elem.IsChecked" onclick="javascript: return ValidateDocuments(this, 2, 35, 1);" type="checkbox" value="true"/>
                                                    <input name="elem.IsChecked" type="hidden" value="false"/>
                                                    <label for="Passport__POA_" id="lbl_2_35">Passport (POA)</label>
                                                    <input id="PoaNo" name="PoaNo" type="hidden" value="Passport (POA)"/>
                                                    <input type="file" id="file_2_35" name="file_2_35" style="display: none"/>
                                                </li>
                                                <li class="col-lg-3 col-sm-4  inline-label col-md-4">
                                                    <input id="chk_2_36" name="elem.IsChecked" onclick="javascript: return ValidateDocuments(this, 2, 36, 1);" type="checkbox" value="true"/>
                                                    <input name="elem.IsChecked" type="hidden" value="false"/>
                                                    <label for="Aadhaar_Card__POA_" id="lbl_2_36">Aadhaar Card (POA)</label>
                                                    <input id="AdhrPoaNo" name="AdhrPoaNo" type="hidden" value="Aadhaar Card (POA)"/>
                                                    <input type="file" id="file_2_36" name="file_2_36" style="display: none"/>
                                                </li>
                                                <li class="col-lg-4 col-sm-4  inline-label col-md-4">
                                                    <input id="chk_2_32" name="elem.IsChecked" onclick="javascript: return ValidateDocuments(this, 2, 32, 1);" type="checkbox" value="true"/>
                                                    <input name="elem.IsChecked" type="hidden" value="false"/>
                                                    <label for="Driving_License__POA_" id="lbl_2_32">Driving License (POA)</label>
                                                    <input id="DvgLseNo" name="DvgLseNo" type="hidden" value="Driving License (POA)"/>
                                                    <input type="file" id="file_2_32" name="file_2_32" style="display: none"/>
                                                </li>
                                                <li class="col-lg-4 col-sm-4  inline-label col-md-4">
                                                    <input id="chk_2_34" name="elem.IsChecked" onclick="javascript: return ValidateDocuments(this, 2, 34, 1);" type="checkbox" value="true"/>
                                                    <input name="elem.IsChecked" type="hidden" value="false"/>
                                                    <label for="Voter_ID_Card__POA_" id="lbl_2_34">Voter ID Card (POA)</label>
                                                    <input id="VtrCrdNo" name="VtrCrdNo" type="hidden" value="Voter ID Card (POA)"/>
                                                    <input type="file" id="file_2_34" name="file_2_34" style="display: none"/>
                                                </li>
                                                <li class="col-lg-3 col-sm-4  inline-label col-md-4">
                                                    <input id="chk_2_39" name="elem.IsChecked" onclick="javascript: return ValidateDocuments(this, 2, 39, 1);" type="checkbox" value="true"/>
                                                    <input name="elem.IsChecked" type="hidden" value="false"/>
                                                    <label for="Extracts_of_7_12_and_8_A" id="lbl_2_39">Extracts of 7/12 and 8 A</label>
                                                    <input id="elem_AttachmentName" name="elem.AttachmentName" type="hidden" value="Extracts of 7/12 and 8 A"/>
                                                    <input type="file" id="file_2_39" name="file_2_39" style="display: none"/>
                                                </li>
                                                <li class="col-lg-4 col-sm-4  inline-label col-md-4">
                                                    <input id="chk_2_41" name="elem.IsChecked" onclick="javascript: return ValidateDocuments(this, 2, 41, 1);" type="checkbox" value="true"/>
                                                    <input name="elem.IsChecked" type="hidden" value="false"/>
                                                    <label for="Property_Tax_Receipt" id="lbl_2_41">Property Tax Receipt</label>
                                                    <input id="PtyTRNo" name="PtyTRNo" type="hidden" value="Property Tax Receipt"/>
                                                    <input type="file" id="file_2_41" name="file_2_41" style="display: none"/>
                                                </li>
                                                <li class="col-lg-4 col-sm-4  inline-label col-md-4">
                                                    <input id="chk_2_42" name="elem.IsChecked" onclick="javascript: return ValidateDocuments(this, 2, 42, 1);" type="checkbox" value="true"/>
                                                    <input name="elem.IsChecked" type="hidden" value="false"/>
                                                    <label for="Property_Agreement_Copy" id="lbl_2_42">Property Agreement Copy</label>
                                                    <input id="PgCpy" name="PgCpy" type="hidden" value="Property Agreement Copy"/>
                                                    <input type="file" id="file_2_42" name="file_2_42" style="display: none"/>
                                                </li>
                                                <li class="col-lg-3 col-sm-4  inline-label col-md-4">
                                                    <input id="chk_2_38" name="elem.IsChecked" onclick="javascript: return ValidateDocuments(this, 2, 38, 1);" type="checkbox" value="true"/>
                                                    <input name="elem.IsChecked" type="hidden" value="false"/>
                                                    <label for="Water_Bill" id="lbl_2_38">Water Bill</label>
                                                    <input id="WtrBllNo" name="WtrBllNo" type="hidden" value="Water Bill"/>
                                                    <input type="file" id="file_2_38" name="file_2_38" style="display: none"/>
                                                </li>
                                                <li class="col-lg-4 col-sm-4  inline-label col-md-4">
                                                    <input id="chk_2_37" name="elem.IsChecked" onclick="javascript: return ValidateDocuments(this, 2, 37, 1);" type="checkbox" value="true"/>
                                                    <input name="elem.IsChecked" type="hidden" value="false"/>
                                                    <label for="Electricity_Bill" id="lbl_2_37">Electricity Bill</label>
                                                    <input id="ElctyBllNo" name="ElctyBllNo" type="hidden" value="Electricity Bill"/>
                                                    <input type="file" id="file_2_37" name="file_2_37" style="display: none"/>
                                                </li>
                                                <li class="col-lg-4 col-sm-4  inline-label col-md-4">
                                                    <input id="chk_2_40" name="elem.IsChecked" onclick="javascript: return ValidateDocuments(this, 2, 40, 1);" type="checkbox" value="true"/><input name="elem.IsChecked" type="hidden" value="false"/>
                                                    <label for="Telephone_Bill" id="lbl_2_40">Telephone Bill</label>
                                                    <input id="TelephBill" name="TelephBill" type="hidden" value="Telephone Bill"/>
                                                    <input type="file" id="file_2_40" name="file_2_40" style="display: none"/>
                                                </li>
                                                <li class="col-lg-3 col-sm-4  inline-label col-md-4">
                                                    <input id="chk_2_43" name="elem.IsChecked" onclick="javascript: return ValidateDocuments(this, 2, 43, 1);" type="checkbox" value="true"/>
                                                    <input name="elem.IsChecked" type="hidden" value="false"/>
                                                    <label for="Rent_Receipt" id="lbl_2_43">Rent Receipt</label>
                                                    <input id="RentRecpt" name="RentRecpt" type="hidden" value="Rent Receipt"/>
                                                    <input type="file" id="file_2_43" name="file_2_43" style="display: none"/>
                                                </li>

                                                <div class="clearfix">
                                                </div>
                                            </ul>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="usrregbox">
                        <div class="warnbox pleft5 pright5">
                            <p>
                                I declare that that above mentioned information submitted by me is true and correct to my knowledge and belief. I hereby agree to be liable for legal consequences for any informationfound incorrect or false under section 200 of Indian penal code 1960.
                            </p>
                            <p>
                                <label class="btn">
                                    <input type="checkbox" runat="server" class="radio-check" id="NormalCheckbox"/>
                                    </label>
                                I accept
                            </p>
                        </div>

                    </div>
                    <div class="col-xs-12 col-md-10 text-center mtop10">
                        <button class="btn btn-orange" id="btnRegister" type="submit" name="Command" value="Register">Register</button>
                        <a href="#" class="btn btn-darkblue inline">Back</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
