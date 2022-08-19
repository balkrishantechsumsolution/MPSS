<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/G2G/Master/G2GMaster.Master" AutoEventWireup="true" CodeBehind="SUDashboard.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.SU.SUDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />

    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script src="/WebApp/Scripts/CommonScript.js"></script>
    <script src="/WebApp/Scripts/AddressScript.js"></script>
    <script src="Script/SUDashboard.js"></script>
    <style>
        .ui-widget-header {
            color: #333 !important;
            font-weight: normal !important;
        }

        .pagination {
            color: #000 !important;
            display: block !important;
            margin: 0 !important;
            padding: 10px;
        }

            .pagination label {
                display: inline-block;
                max-width: 100%;
                margin-bottom: 5px;
                font-weight: bold;
            }

        .SrvDiv {
            background-color: #fce9d147;
            border: solid 1px #F9D0A1;
            color: #045abc;
            width: 24%;
            margin: .5%;
            float: left;
            padding: .5%;
            overflow: auto;
            font-size: 18px;
            border-radius: 5px;
            border-left: solid 5px #B65838;
            min-height: 2.66em;
            z-index: -760;
            line-height: 20px;
        }

            .SrvDiv a {
                color: maroon;
                font-size: .9em;
                text-decoration: none;
                /*font-weight: bold;*/
            }

                .SrvDiv a:hover {
                    color: #5AB1D0;
                    font-size: .9em;
                    text-decoration: none;
                    font-weight: bolder;
                }

            .SrvDiv img {
                margin-right: 10px;
                border: none;
                height: 45px;
                width: 55px;
                background-image: url('/webapp/kiosk/CBCS/img/sambalpur-university-logo.png');
                background-repeat: no-repeat;
                background-size: 55px 45px;
                border: none;
            }

            .SrvDiv span {
                line-height: 20px;
                margin: 5px 0 0 0;
                color: #212121;
                font-size: .65em;
                font-weight: bold;
            }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            window.location.replace("SUDashboardNew.aspx");
            $('#costumModal10').modal('show');

            $('#txtFromDate').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                yearRange: "-150:+0",
                maxDate: '0',

            });

            $('#txtToDate').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                yearRange: "-150:+0",
                maxDate: '0',

            });

        });

        
    </script>
    <style>
        
        .form-heading {
            color: #820000;
            text-align: left;
            border-left: 15px solid #ce6d07;
            border-right: 2px solid #ce6d07;
            border-top: 1px solid #d8d8d8;
            border-bottom: 1px solid #d8d8d8;
            background: rgba(0, 0, 0, .075);
            padding: 10px 20px 10px 15px;
            border-top-right-radius: 2px;
            border-top-left-radius: 2px;
            text-transform: uppercase;
            font-weight: bold;
            font-size: x-large;
        }
          .dropdown-menu > li > a {
            color: #333 !important;
            line-height: 22px;
        }
    p.MsoNormal
	{margin-top:0cm;
	margin-right:0cm;
	margin-bottom:8.0pt;
	margin-left:0cm;
	line-height:107%;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	}
        </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" ClientIDMode="Static">
    <%--Notice Board Modal START Here
        <div id="costumModal10" class="modal" data-easein="bounceIn" tabindex="-1" role="dialog" aria-labelledby="costumModalLabel" aria-hidden="true"> --%> 
    <div>        
    <div class="modal-dialog" style="width:80%; height:80%;display:none;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="opacity:1 !important; color:#B65838 !important; font-size:2.4em !important;">
                            ×
                        </button>
                        <h4 class="modal-title"><i class="fa fa-newspaper-o fa-fw" style="font-size: 0.9em; vertical-align: middle;"></i>Notice Board
                        </h4>
                    </div>
                    <div class="modal-body" style="width:80%; height:80%;overflow:scroll;">
                        <div class="table-responsive">
            <table cellpadding="0" cellspacing="0" class="table table-bordered" style="height:250px; ">
                <thead>
                    <tr>
                        <th style="width:5px"><b>S.No.</b></th>
                        <th style="width:100px"><b>Notice Date</b></th>
                        <th style="width:200px"><b>Notice Type</b></th>
                        <th><b>Details</b></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>89.</td>
                        <td>09-08-2019<br />
                            05:00 PM</td>
                        <td><img alt="Important" style="width:35px" src="../../../g2c/img/NewAlt.gif" />
						<br />Regarding Bulk Payment  
                        </td>
                        <td>Dear Principal / DEO&#39;s<br />
                            While making Online Payment (mainly through Net Banking / Debit Card) 
                            it might be possible the payment gets deducted from Payee's Account but does not get Debited to merchant's account.
                            <br />
                            In such cases DEO's are requested to make payment again (to avoid late Fee) OR they can wait for 48 Hours <br />
                            If double payment is recieved against any Roll No. the later amout will be refunded to payees acount.
                            <br />
                            Thank You

                        </td>
                    </tr>
                    <tr>
                        <td>82.</td>
                        <td>27-07-2019<br />
                            05:00 PM</td>
                        <td>4th SEM Exam-2019, Form Fill-up  
                            <br />Date Extended            
                            </td>
                        <td>Dear Principal / DEO&#39;s<br />
                            Form Fill-up for 4SEM Exam-2019 has been extended till 29-07-2019 5:00 PM with late fee of Rs.300.00<br />
                            Please complete the form fill-up by <b>29-07-2019 5:00 PM</b> date, further no dates will be extended
                            <br />
                            Thank You

                        </td>
                    </tr> 
                    <tr>
                        <td>67.</td>
                        <td>18-07-2019<br />
                            01:00 AM</td>
                        <td>Unregistered Student 
                            <br />2016 Batch                            
                            </td>
                        <td>Dear Principal / DEO&#39;s<br />
                            The student of Batch 2016 who has not been Enrolled / Registered in "http://sambalpur.lokaseba-odisha.in" need to be registered for filling the 4SEM Exam-2019 form fill up. <br />Please follow below steps:
                            <br />
                            1. Click on "<b>REPORT</b>" section link Principal / DEO's dashboard<br />
                            2. Select "<b>Unregistered Student-2016 (Examination Form Fill-up 4SEM-2019)</b>" from Category drop down and 
                            <br /> Apply proper filter <b>a). College, b). Branch, c). Session : 2016 d). Semester : 4SEM</b>  and click on "<b>Search</b>" button<br />
                            3. List of Student of unregistered student of 2016 binds in grid<br />
                            4. Click the <b>VIEW</b> button a forms open 
                            5. Fill the form and click on <b>Registered and Proceed</b> button 
                            6. It will redirect to payment gate way for payment
                            7. Make Payment and print the acknowledgement form.<br />
                            form more reference read NOTICE NO. 55
                            <br />
                            Thank You

                        </td>
                    </tr> 
                    <tr>
                        <td>67.</td>
                        <td>22-06-2019<br />
                            01:00 AM</td>
                        <td>University Registration No.
                            <br />update for 2016 Batch                            
                            </td>
                        <td>Dear Principal / DEO&#39;s<br />
                            University Registration No. for the Batch 2016 student needs to be updated before <b>23th June 2019 11:59:59 PM.</b> The process flow is defined below:
                            <br />
                            1. Click on "<b>Univ. Registration No (2016)</b>" link Principal / DEO's dashboard<br />
                            2. Apply proper filter <b>a). College, b). Branch, c). Session</b>  and click on "<b>Search</b>" button<br />
                            3. List of Student of the selected filters binds in grid<br />
                            4. Click the <b>Check-Boxes</b> whose Registration no is to be entered / update
                            5. Clicking on checkbox will enable the <b>Text-Box</b> for entry 
                            6. Enter the University Registration No. against the Roll No. (no duplicate value will be accepted)
                            7. After entry click on "<b>Update Reg. No.</b> button to update the entered Registration No.
                            <span style="color:red">Please note : University Registration no. should be in correct format<br />
                                Its length should be 8, and it should contain the / (back slash) followed by last 2 digit of admission year for example "<b>12345/16</b>"
                            </span>
                            <br />
                            Please go through the manual before updating the University Registration No. <a href="/Sambalpur/pdf/SU-RegistrationNoUpdate.docx" target="_blank">SU-RegistrationNoUpdate.docx</a>
                            <br />
                            Thank You

                        </td>
                    </tr>
                    <tr>
                        <td>67.</td>
                        <td>01-06-2019<br />
                            10:00 AM</td>
                        <td>Closing Date of 5th SEM Exam-2018
                            <br />of Internal Marks Entry
                            
                            </td>
                        <td>Dear DEO&#39;s<br />
                            <b>Internal Mark</b> Entry of <b>5th Semester Exam-2018</b> shall be closed on <b style="">01-06-2019 5:00 PM</b>
                            <br />
                            <span style="color:red">Please complete all entry of 5th SEM-2018 by today Evening<br /></span>
                            <br />
                            Thank You

                        </td>
                    </tr>
                    <tr>
                        <td>66.</td>
                        <td>30-05-2019<br />
                            10:00 AM</td>
                        <td><b style="color: maroon"></b>Result for 1st SEM Exam-2017
                            <br />
                            
                            </td>
                        <td>Dear DEO&#39;s<br />
                            Result of 1st Semester Examination 2017 is showin in "<b>REPORT</b>" section under "<b>University Result</b>" in category dropdown 
                            <br />Please select <b>Exam Year as 2017</b> & <b>Semester as 1SEM</b> along with other filters to see the result. 
                            <br /> Subject name in Column : A11, A12, A13 and A14 shows fail in Subjective Paper
                            <br />and <br />
                            Subject name in Column : A11I, A12I, A13I and A14I shows fail in Tutorial/Practical Paper
                            <br />
                            Thank You
                        </td>
                    </tr>
                    <tr>
                        <td>58.</td>
                        <td>23-05-2019<br />
                            10:00 AM</td>
                        <td>Closing Date of 4th SEM Exam-2018
                            <br />of Internal Marks Entry
                            
                            </td>
                        <td>Dear DEO&#39;s<br />
                            <b>Internal Mark</b> Entry of <b>4th Semester Exam-2018</b> shall be closed on <b style="">23-05-2019 5:00 PM</b>
                            <br />
                            <span style="color:red">Please complete all entry of 4th SEM-2018 by today Evening<br /></span>
                            <br />
                            Thank You

                        </td>
                    </tr>
                    <tr>
                        <td>58.</td>
                        <td>18-05-2019<br />
                            7:00 PM</td>
                        <td>INTERNAL MARKS REPORT
                            
                            </td>
                        <td>Dear DEO&#39;s<br />
                            Report of Submitted <b>Internal Mark</b> of all Subject & Semester can be seen in <b>REPORT</b> section
                            <br />
                            Please follow below steps:<br />
                            1. REPORT (Tab in Dashboard page after login)<br />
                            2. Apply filter<br />
                                &nbsp;&nbsp; a. <strong>Category</strong> =&gt; &quot;External/Internal Marks&quot; (mandatory)<br />                                
                                &nbsp;&nbsp; b. <strong>Branch</strong> =&gt; &quot;SH / SP / AH / AP / CH / CP&quot; (mandatory)<br />
                                &nbsp;&nbsp; c. <strong>Exam Type</strong> =&gt; &quot;Regular&quot; (mandatory)<br />
                                &nbsp;&nbsp; d. <b></b>ExamYear =&gt; 2017 (1SEM) / 2018 (2/3/4/5 SEM) / 2019 (6SEM) <br />
                                &nbsp;&nbsp; e. Semester =&gt; &quot;1st / 2nd / 3rd / 4th / 5th /6th SEM&quot; (mandatory)<br />
                            3. <strong>Search</strong> (click)<br />
                            4. Students who has filled the Exam Form their Roll & Subject along with mark is shown <br />
                            5. Verify the Enter Marks (in no marks is enter it will be blank)<br />
                            If their is any issue in the INTERNALMARKS REPORT please write a email to Email ID : suniv.helpdesk@gmail.com OR Call in Mobile No.: 7000745655
                            <br />
                            <span style="color:red">Note: Mark shown in REPORT scetion is not in real time. <br />i.e. Entered Marks will be refelected/updated in 24hrs after the marks is submitted</span>

                        </td>
                    </tr>
                    <tr>
                        <td>22.</td>
                        <td>02-11-2018<br />
                            13:30 PM</td>
                        <td>Internal (TP) Marks Entry
                            <br /> <span style="color:red">6th SEM Exam-2018</span>
                        </td>
                        <td>Dear DEO&#39;s<br />
                            Internal Marks Entry for 6th Semester has been enabled for marks entry, 
                            <br />
                            The student who has filled the 6th SEM Examination-2018 Form and paid the examination fee their Internal Marks (Tutorial Practical) shall be entered.<br /> 
                            Please follow below are the steps:
<br />1.	DEO need to login using their Login ID in https://sambalpur.lokaseba-odisha.in
<br />2.	In dashboard of the DEO/Principal, there is a “<b>INTERNAL MARKS ENTRY</b>” section. Clicking on it a new window / tab opens
<br />3.	Apply proper filter – <b>Branch, Exam Type (Regular), Session (2018), Semester (6th SEM) and Paper</b> as (applicable), then click “<b>Search</b>”
<br />4.	List of the 6th Semester student who’s examination form is approved by University, binds in grid 
<br />5.	<span style="color:maroon;">Click on <b>CHECK</b> box to check (second column of the grid) the candidate whose marks is to be entered. Checking the check box will <b>enable the text</b> for marks entry. The text box will accept <b>0 to 50</b> numbers and <b>AB</b> or <b>ab</b>. 
<br />6.	Enter marks between <b>0-50</b> and if any candidate is absent then enter “<b>AB</b>” / “<b>ab</b>” in the marks text box.</span>   
<br />7.	After marks are entered click on <b>SAVE</b> button to save the marks on server (saved marks can be edited later, till the <b>Send for Approval</b> button is clicked).
<br />8.	After submission of all mark, click on Send for Approval button to submitted the entered marks to university. 
<br />9.	Once the Marks is Send for Approval button is clicked, the marks cannot be modified or changed.
<br />
<span style="color:red;"><b>Important</b>: Please ensure all the marks are entered for all student before clicking on Send for Approval button, once marks are submitted to university it cannot be rolled back. The Candidate whose marks is not entered shall be considered as 0 (zero)</span>
<br />
<span style="color:maroon"> 
<br />
Please check the manual for Internal Mark Entry (<a href="" target="_blank">SU-InternalMarkEntry.pdf</a>)</span>
                            Thank You&nbsp;&nbsp;&nbsp;&nbsp; </span></td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td>13-02-2019<br />
                            7:00 PM</td>
                        <td>Admit Card
                            <br />
                            for +3 6th Semester Examination-2019</td>
                        <td>Dear DEO&#39;s<br />
                            Admit Card can be downloaded from <b>BULK ADMIT CARD</b> section<br />
                            Please follow below steps:<br />
                            1. BULK ADMIT CARD (Tab in Dashboard page after login)<br />
                            2. Apply filter<br />
                                &nbsp;&nbsp; a. <strong>Branch</strong> =&gt; &quot;SH / SP / AH / AP / CH / CP&quot; (mandatory)<br />
                                &nbsp;&nbsp; b. <strong>Exam Type</strong> =&gt; &quot;Regular&quot; (mandatory)<br />
                                &nbsp;&nbsp; c. Session/Exam Year =&gt; &quot;2019&quot; (mandatory)<br />
                                &nbsp;&nbsp; d. Semester =&gt; &quot;6th SEM&quot; (mandatory)<br />
                                &nbsp;&nbsp; e. Range =&gt; set of 25 (mandatory)<br />
                            3. <strong>Search</strong> (click)<br />
                            4. Students Admit Card (binds in grid who has paid 6th Sem Exam-2019 Fee)<br />
                            5. Click on <b>PRINT</b> button to download (as .pdf) OR Print the admit card of the student in popup (please ensure POPUP is not blocked)<br />
                            6. Click on &quot;Print&quot; button to print admit card.<br />&nbsp;<br />
                            <span style="color:red">Note: Please check all the inforamtion before Printing the Admit Card</span>

                        </td>
                    </tr>
                    <tr>
                        <td>23.</td>
                        <td>27-03-2019<br />
                            16:00</td>
                        <td>CNR for 6th SEM Exam - 2019</td>
                        <td>Dear Principal / DEO&#39;s<br />
                            CRN for 6th Semester has been shown in <b>"REPORT SECTION"</b> in <b>Candidate Nominal Role (CNR)</b> under category dropdown. The student who has paid the examination fee their name is shown in CNR.
                            <br />
                            Please fallow bellow steps:
                            <br/>
                            1. <strong>Report</strong> (Section in Dashoad page)<br />
                            2. Apply below filters<br />
                            &nbsp;&nbsp; a. Category drop down (Candidate Nominal Role (CNR))<br />
                            &nbsp;&nbsp; b. Branch (AH, AP, CH, CP, SH, SP)<br />
                            &nbsp;&nbsp; c. Exam Type (Regular)<br />
                            &nbsp;&nbsp; d. Exam Year (2019)<br />
                            &nbsp;&nbsp; e. Semester (6th SEM)<br />
                            3. Click <strong>SEARCH</strong> button<br />
                            4. Student lists binds in grid
                            5. Click on <b>EXCEL</b> button to download the list in excel sheet
                            <br />   
                            <br />
                            Thank You&nbsp;&nbsp;&nbsp;&nbsp; 
                            <br />
                            <b style="color:red">Note : Please check all the information in CNR before Printing,<br /> 
                                if any correction done in CNR need to communicated to email id : suniv.helpdesk@gmail.com for update in software </b>

                        </td>                    
                    </tr>
                    <tr>
                        <td>23.</td>
                        <td>25-03-2019<br />
                            16:00</td>
                        <td>Enrollment Process for 2018-19 Batch </td>
                        <td>Dear Principal / DEO&#39;s<br />
                            +3 Exam. Enrollment process (CBCS) for 2018-19 Batch shall be closed on <span style="color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">
                            27-03-2018 12 Noon.</span>
                                <br />
                            Colleges are requested to complete all the pending process of the Enrolled Student.<br />
                            University Roll No. will be generation/ allocated for the 2018-19 batch, for those Student who has completed and paid the enrollment fee of Rs. 59.00
                            <br />
                            <b style="">Those stuent who has not paid the Enrollment Fee of Rs. 59.00 their University Roll NO. Shall not be generated.</b>
                            <br />
                            Thank You&nbsp;&nbsp;&nbsp;&nbsp; </td>
                    </tr>
                    <tr>
                        <td>51.</td>
                        <td>18-03-2019 12:30 PM</td>
                        <td><b style="color:maroon">SEC-D, Subject Change</b> 
                            <br />for 6th SEM Exam-2019<br/>(AP & SP Student of 2016-17 Batch Only) 
                            </td>
                        <td>Dear DEO's 
                            <br />
                            To change SEC-D Subject for AH/SH student
                            <br />
                            Please follow below steps:
                            <br />
                            1. Change Subject (Tab in Dashboard page after login) 
                            <br />
                            2. Apply filter 
                            <br />
                            a. Branch => "AP / SP" (mandatory)
                            <br />
                            b. Exam Type => "Regular" (mandatory) 
                            <br />
                            c. Session => "2016" mandatory) 
                            <br />
                            d. Semester => "6h SEM" (mandatory)
                            <br />
                            3. Search (click) 
                            <br />
                            4. Record of student with SEC-D subject binds in grid
                            <br />
                            5. Check the check box against the roll no whose SEC-D subject is to be changed
                            <br />
                            6. <b>On checking the check box enable the drop down – select the subject from drop down</b>
                            <br />
                            7. Enter the proper remark in the text box below the grid and click on Update Subject button 
                            <br />
                            8. Alert message displaying the update of records
                            <br />
                            9. The grid re-binds displaying the updated GE-II subject
                            <br /><br />
                            for reference please read the notice no 38 and also check manual for Changing Subject : <a href="/Sambalpur/pdf/BulkSubjectChange.pdf" target="_blank">BulkSubjectChange.pdf </a>
							<br />
							<br />
                            <span style="color:red">Note: Subject Change <b>DROP DOWN</b> will not work if the <b>CHECK BOX</b> is not <b>CHECKED</b></span>
                            <br />
                            <br />
                            Thank You<br />
                        <br />
                        </td>
                    </tr>
                    <tr>
                        <td>27.</td>
                        <td>16-04-2019<br />
                            14:00 </td>
                        <td><img alt="Important" style="width:35px" src="../../../g2c/img/NewAlt.gif" /> &nbsp; Colleges NOT submitted <b style="color:maroon">INTERNAL MARK</b>For 1st Semester Exam-2017</td>
                        <td>Dear DEO&#39;s<br />
                            List of Colleges who has NOT submitted Internal MARK FOR 1ST Semester Exam-2017 Branch wise ARE AS below:
                            <b>Arts Honours - AH :</b>
		                            <br />001,002,004,005,006,007,009,010,011,014,016,017,019,025,030,035,036,037,038,040,
		                            <br />044,046,054,058,062,063,064,066,074,079,085,086,087,094,100,104,106,107,109,111,
		                            <br />117,118,127,129,131,134,137,142,146,147,156,168,170,177,181,183,192,203,209,210,220,221
                                    <br />
                            <b>Arts Pass - AP :</b>
		                            <br />004,007,014,030,046,055,074,100,107,113,127,137,142,147,164,180,181
                                    <br />
                            <b>Science Honours - SH :</b>
		                            <br />001,004,005,006,007,010,014,016,019,028,030,035,036,038,039,042,045,046,054,060,
		                            <br />061,063,064,071,085,086,087,095,117,124,129,146,157,165,184,189,190,193,196,197,
		                            <br />199,200,202,203,217
                                    <br />
                            <b>Science Pass - SP :</b>
		                            <br />004,007,030,094
                                    <br />
                            <b>Commerce Honours - CH :</b>
		                            <br />001,014,019,036,058,063,082,086,087,127,147,172,203,206
                                    <br />
                            <b>Commerce Pass - CP :</b>
		                            <br />014
                            <br /><br />
                            Thank You&nbsp;&nbsp;&nbsp;&nbsp; </td>
                    </tr>
                    <tr>
                        <td>24.</td>
                        <td>14-03-2019<br />
                            11:00 AM</td>
                        <td>+3 6th Semester Examination-2019 Form Fillup</td>
                        <td>Dear Principal / DEO&#39;s
                            <br />
                            <strong>+3 6th SEM examination</strong> form fill-up has been enabled and it can be done through &quot;<strong>BULK PAYMENT</strong>&quot; section in Dashboard. 
                            <br />Please fallow below steps:
                            <br />
                            1. Login into the system
                            <br />
                            2. Bulk Payment section
                            <br />
                            3. Apply necessary filters
                            <br />
                            4. List of student eligible for appearing in 6th SEM displays in grid
                            <br />
                            5. Check the check box against the student whose Examination Fee is to be collected
                            <br />
                            6. Payable amount displayed in bottom of the grid
                            <br />
                            7. Enter appropriate remark and click on &quot;<strong>SUBMIT</strong>&quot;button
                            <br />
                            8. Acknowledgement displaying the names of student with payment details against which the amount <br />
                            9. Confirming it will take to Payment gateway for payment
                            <br />
                            10. On successful payment, Payment Receipt and Acknowledgement is displayed<br />
&nbsp;
                            <br />
Please check the university proceedings:
                            <br />a. (<a href="" target="_blank">6th SEM EXAM-2019 Form Fill-up.pdf</a>)
                            <br />b. (<a href="" target="_blank">6th SEM EXAM-2019 PROGRAMME.pdf</a>)
                        </td>
                    </tr>
                    <tr>
                        <td>23.</td>
                        <td>13-11-2018<br />
                            16:00 PM</td>
                        <td>Internal Marks (Reopen)</td>
                        <td>Dear Principal / DEO&#39;s<br />
                            Any request for re-opening for entering marks for any paper (T/P subject) in Internal Marks Entry is to be addressed by email at . <span style="color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">
                            <br />
                            Thank You&nbsp;&nbsp;&nbsp;&nbsp; </span></td>
                    </tr>
                    <tr>
                        <td>27.</td>
                        <td>12-04-2019<br />
                            16:30 </td>
                        <td><span style="color:maroon">Last Date </span><br />for 1st SEM-2017 Internal (TP) Marks Entry</td>
                        <td>Dear DEO&#39;s<br />
                            Last date for submission of Internal Marks Entry for 1st Semester is<span style="color:maroon"> 15-03-2018 23:59</span>. 
                            <br />
                            All college are request to check the marks and send the marks for approval, if the internal marks are not submitted the result shall not be processed.
                            Thank You&nbsp;&nbsp;&nbsp;&nbsp; </td>
                    </tr>
                    <tr>
                        <td>27.</td>
                        <td>04-03-2019<br />
                            14:30 </td>
                        <td>Internal (TP) Marks Entry for <br />SEC-B 4th SEM-2017</td>
                        <td>Dear DEO&#39;s<br />
                            Internal Marks Entry for 4th Semester (SEC-B) subject has been enabled for marks entry. The maximum permissible mark is 10 <span style="color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">
                            <br />
                            Thank You&nbsp;&nbsp;&nbsp;&nbsp; </span></td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td>13-02-2019<br />
                            7:00 PM</td>
                        <td>Admit Card
                            <br />
                            for +3 3rd Semester Examination Year 2018</td>
                        <td>Dear DEO&#39;s
                            <br />
                            Admit Card can be downloaded from <b>BULK ADMIT CARD</b> section<br />
                            Please follow below steps:<br />
                            1. BULK ADMIT CARD (Tab in Dashboard page after login)
                            <br />
                            2. Apply filter
                            <br />
&nbsp;&nbsp; a. <strong>Branch</strong> =&gt; &quot;SH / SP / AH / AP / CH / CP&quot; (mandatory)<br />
&nbsp;&nbsp; b. <strong>Exam Type</strong> =&gt; &quot;Regular/Back&quot; (mandatory)
                            <br />
&nbsp;&nbsp; c. Session/Exam Year =&gt; &quot;2018&quot; (mandatory)
                            <br />
&nbsp;&nbsp; d. Semester =&gt; &quot;3rd SEM&quot; (mandatory)
                            <br />
&nbsp;&nbsp; e. Range =&gt; set of 25 (mandatory)
                            <br />
                            3. <strong>Search</strong> (click)
                            <br />
                            4. Students Admit Card (binds in grid who has paid 3rd Sem Exam. Fee)<br />
                            5. Click on <b>PRINT</b> button to download (as .pdf) OR Print the admit card of the student in popup (please ensure POPUP is not blocked)<br />
                            6. Click on &quot;Print&quot; button to print admit card.<br />
&nbsp;<br />
                            <span style="color:red">
                            Note: Please check all the inforamtion before Printing the Admit Card</span>

                        </td>
                    </tr>
                    <tr>
                        <td>39.</td>
                        <td>18-01-2019 16:30 </td>
                        <td>College Transfer
                            </td>
                        <td>Dear Principal/DEO's,
                            <br />College Transfered Student, the concern colleges are requested to e-mail at <b style="color:maroon">suniv.helpdesk@gmail.com; univccsu@gmail.com</b> the student details along with college code in which the student has taken transfer 
                            <br />Thank You<br /></td>
                    </tr>
                    <tr>
                        <td>37.</td>
                        <td>18-01-2019 12:30 PM</td>
                        <td>&nbsp;<b>GE-II, Subject Change <br />for 3rd Examination - 2018 </b>
                            </td>
                        <td>Dear DEO's 
                            <br />
                            To change GE-II Subject for AH/SH student
                            <br />
                            Please follow below steps:
                            <br />
                            1. Change Subject (Tab in Dashboard page after login) 
                            <br />
                            2. Apply filter 
                            <br />
                            a. Branch => "SH / AH" (mandatory)
                            <br />
                            b. Exam Type => "Regular" (mandatory) 
                            <br />
                            c. Session => "2017" mandatory) 
                            <br />
                            d. Semester => "3rd SEM" (mandatory)
                            <br />
                            3. Search (click) 
                            <br />
                            4. Record of student with GE-II subject (same as GE) binds in grid
                            <br />
                            5. Check the check box against the roll no whose GE-II subject is to be changed
                            <br />
                            6. <b>On checking the check box enable the drop down – select the subject from drop down</b>
                            <br />
                            7. Enter the proper remark in the text box below the grid and click on Update Subject button 
                            <br />
                            8. Alert message displaying the update of records
                            <br />
                            9. The grid re-binds displaying the updated GE-II subject
                            <br />
                            Please find the manual for Changing GE-II Subject : BulkSubjectChange.pdf 
                            <br />
                            <span style="color:red">Note: Subject Change <b>DROP DOWN</b> will not work if the <b>CHECK BOX</b> is not <b>CHECKED</b></span>
                            <br />
                            Thank You
                        <br />
                        </td>
                    </tr>
                    <tr>
                        <td>36.</td>
                        <td>17-01-2019 11:30 AM</td>
                        <td>&nbsp;<b>GE-II, Subject Change <br />for 3rd Examination - 2018 </b>
                            </td>
                        <td>Dear Principal/DEO's,
                            <br />Option for changing GE-II Subject for AH & SH shall be Opend on <b>Monday 21/01/2019</b>.
                            <br />Thank You for cooperation<br /></td>
                    </tr>
                    <tr>
                        <td>35.</td>
                        <td>21-12-2018 16:00</td>
                        <td>&nbsp;Slowness
                            </td>
                        <td>Dear User,
                            <br />Our Website http://sambalpur.lokaseba-odisha.in is responding very slow due <b>maintenance</b>. We apologies for the inconvenience caused. We hope the issue will get normal by <b>Monday 24-12-2018</b>.
                            <br />Thank You for cooperation<br /></td>
                    </tr>
                    <tr>
                        <td>31.</td>
                        <td>07-12-2018 16:00</td>
                        <td>&nbsp;+3 5th Semester Examination-2018 Form Fill-up
                            </td>
                        <td>Dear Principal/DEO's
                           <br/>This is to bring under your kind notice that today <b>17-12-2018</b> is the last date for <b>accepting payment</b> for +3 5th SEM EXAM-2018, 
                           <br/>
                           <br/>The payment will be accepted till <b>5:00 PM</b>, no request will be accepted after due date and time is over. 
                           <br/>If any payment <b>STATUS</b> is unpaid please make payment again, if any multiple payment against any Roll No (the extra amount) will refunded.
                            <br />
                           <br/>Thank You<br /></td>
                    </tr>
                    <tr>
                        <td>31.</td>
                        <td>07-12-2018 16:00</td>
                        <td>&nbsp;5th Semester Examination Attendance Sheet-2018
                            </td>
                        <td>Dear Principal/DEO's
                           <br/>Exam Attendance Sheet can be downloaded from ATTENDANCE SHEET section in Principal/DEO's dashboard, 
                           <br/>
                           <br/>Please follow bellow steps to download Exam Attendance Sheet: 
                           <br/>1. <b>ATTENDANCE SHEET</b> (Section in Dashboard page)
                           <br/>2. Apply below filters 
                           <br/>&nbsp;&nbsp;&nbsp;a. Branch (<b>AH/AP/CH/CP/SH/SP</b>)
                           <br/>&nbsp;&nbsp;&nbsp;b. Exam Type (<b>Regular</b>)
                           <br/>&nbsp;&nbsp;&nbsp;c. Session/Exam Year (<b>2018</b>)
                           <br/>&nbsp;&nbsp;&nbsp;d. Semester (<b>5th SEM</b>)
                           <br/>3. Click <b>SEARCH</b> button
                           <br/>4. Student who has paid the 5th SEM exam fee their lists binds in grid (it might take few minutes to load the page)
                           <br/>5. Click on <b>PRINT</b> button, (please ensure the POPUP is not blocked)
                           <br/>6. A popup window opens with Student PHOTO / SIGNATURE and other details.
                           <br/>7. Save the file is<b> PDF </b>format, check all the information and then<b> PRINT</b> the <b>5th SEM Exam Attendance Sheet</b> 
                           <br/>If any information is missing/incorrect please inform through email <b>suniv.helpdesk@gmail.com</b> to get it corrected in due time.
                           <br/>
                            Please find the manual for Saving & Printing Attendance Sheet : AttendanceSheet.pdf
                            <br />
                           <br/>Thank You<br /></td>
                    </tr>
                    <tr>
                        <td>30</td>
                        <td>07-12-2018 10:00</td>
                        <td>EXAM FORM FILL-UP DATE EXTENDED<br />
                            (5th SEMESTER EXAMINATION-2018)<br /><b style="color:maroon"> TILL 17-12-2018 5:00 PM</b>
                            </td>
                        <td>Dear Principal / DEO&#39;s<br />
                            5th Semester Examination Date has been extend till 17-12-2018 5:00 PM with fine of Rs.600/-<br />
                            The process for payment will be same as made earlier<br />
                            1. For Registered Student (through BULK PAYMENT)<br />
                            2. For Unregistered Student (through REPORT SECTION)<br />
                            <br />
                            Please find the circular regarding the same  <br />
                            Thank You
                        </td>
                    </tr>
                    <tr>
                        <td>30</td>
                        <td>04-12-2018 13:00</td>
                        <td>5th SEMESTER EXAMINATION-2018<br />
                            (Correction in CNR, STUDENT INFORMATION and GE SUBJECT EDIT (AP))</td>
                        <td>Dear Principal / DEO&#39;s<br />
                            Its to bring under notice that <b>LAST DATE</b> for Correction in <b>CNR & Student Information</b> is <b>10-12-2018</b>.<br />
                            Its requested to EDIT GE subject before <b>10-12-2018</b><br />
                            As Admit Card will be issued on <b>11-12-2018</b>.<br />

                            No request for correction (CNR, SUBJECT & STUDENT INFORMATION) for 2016-17 bacth student shall be entertained after ADMIT CARD is issued.<br />
                            Thank You<br />
                        </td>
                    </tr>
                    <tr>
                        <td>28</td>
                        <td>26-11-2018</td>
                        <td>Correction in Student Information<br />
                            (2016 &amp; 2017 Batch Student Only)</td>
                        <td>Dear Principal / DEO&#39;s<br />
                            Any correction in <strong>STUDENT INFORMATION</strong> for Batch 2016 &amp; 2017, may be emailed to <a href="mailto:suniv.helpdesk@gamil.com">suniv.helpdesk@gamil.com</a> and <a href="mailto:univccsu@gmail.com">univccsu@gmail.com</a> in cc in the attched excel format.<br />
                            Excel Format for Correction : Correction.xlsx</td>
                    </tr>
                    <tr>
                        <td>27.</td>
                        <td>21-11-2018</td>
                        <td>&nbsp;GE Subject Edit of 5th SEM
                            <br />
                            (only for Arts Pass student)</td>
                        <td>Dear Principal / DEO's
                            GE Subject of 5th Semester for AP Student can be <b>EDITED</b> from both <b>DEO</b> and <b>Student</b> Login.

                            DEO's to follow bellow steps: 
                            1. <b>Report</b> (Section in Dashboard page)
                            2. Apply below filters 
                               a. Category <b>Edit Subject</b>
                               b. Branch (<b>AP</b>)
                               c. Exam Type (<b>Regular</b>)
                               d. Session/Exam Year (<b>2016</b>)
                               e. Semester (<b>5th SEM</b>)
                            3. Click <b>SEARCH</b> button
                            4. Student who has paid the 5th SEM exam fee their lists binds in grid 
                            5. Click on <b>VIEW</b> button in the grid, 
                            6. A popup window opens giving the option to change GE subject.
                            7. Click the dropdown in GE subject to change it, 
                            8. Click on “<b>Update Subject</b>”button to change the subject 

                            Thank You</td>
                    </tr>
                    <tr>
                        <td>26.</td>
                        <td>19-11-2018</td>
                        <td>5th SEM Regular Student Enrollmnt &amp; Exam Form Fill-up<br />
                            (2016-17 batch Unregisterd Student)</td>
                        <td>Dear Principal / DEO&#39;s<br />
                            5th Semester Regular Unregistered Student has been shown in <b>"REPORT SECTION"</b> in <b>Registration &amp; Examination Form Fill-up (5th SEM Regular Student)</b> under category dropdown.&nbsp;
                            <br />
                            Please fallow bellow steps:
                            <br/>
                            1. <strong>Report</strong> (Section in Dashoad page)<br />
                            2. Apply below filters
                            <br />
&nbsp;&nbsp; a. Registration &amp; From Fill-Up (5th SEM Regular Student)<br />
&nbsp;&nbsp; b. Branch (AH, AP, CH, CP, SH, SP)<br />
&nbsp;&nbsp; c. Exam Type (Regular)<br />
&nbsp;&nbsp; d. Session/Exam Year (2016)<br />
&nbsp;&nbsp; e. Semester (5th SEM)<br />
                            3. Click <strong>SEARCH</strong> button<br />
                            4. Student lists binds in grid
                            <br />
                            5. Click on <b>VIEW</b> button to fill the exam form &amp; make payment.
                            <br />   
                            <br />
                            Thank You</td>
                    </tr>
                    <tr>
                        <td>25.</td>
                        <td>17-11-2018</td>
                        <td>Help Desk Support Mobile No &amp; Email ID</td>
                        <td>Dear Principal/DEO&#39;s<br />
                            We request to mail you <b>Problem</b> / <b>Suggestion</b> / <b>Feedback</b> / <b>Grivance</b> at "<b>suniv.helpdesk@gmail.com</b>", please mention your contact no. in mail.<br />
                            You can call at <strong>7000745655</strong> in working days between 10:00 am to 5:00 pm </td>
                    </tr>
                    <tr>
                        <td>24.</td>
                        <td>14-11-2018<br />
                            19:00 PM</td>
                        <td>Candidate Nominal Role (CNR)</td>
                        <td>Dear Principal / DEO&#39;s<br />
                            CRN for 5th Semester has been shown in <b>"REPORT SECTION"</b> in <b>Candidate Nominal Role (CNR)</b> under category dropdown. The student who has paid the examination fee their name is shown in CNR.
                            <br />
                            Please fallow bellow steps:
                            <br/>
                            1. <strong>Report</strong> (Section in Dashoad page)<br />
                            2. Apply below filters
                            <br />
&nbsp;&nbsp; a. Category drop down (Candidate Nominal Role (CNR))<br />
&nbsp;&nbsp; b. Branch (AH, AP, CH, CP, SH, SP)<br />
&nbsp;&nbsp; c. Exam Type (Regular)<br />
&nbsp;&nbsp; d. Exam Year (2018)<br />
&nbsp;&nbsp; e. Semester (5th SEM)<br />
                            3. Click <strong>SEARCH</strong> button<br />
                            4. Student lists binds in grid
                            5. Click on <b>EXCEL</b> button to download the list in excel sheet
                            <br />   
                            <br />
                            Thank You&nbsp;&nbsp;&nbsp;&nbsp; </td>
                    </tr>
                    <tr>
                        <td>24.</td>
                        <td>14-11-2018<br />
                            11:00 AM</td>
                        <td>+3 5th Semester Examination Form Fillup</td>
                        <td>Dear Principal / DEO&#39;s
                            <br />
                            <strong>+3 5th SEM examination</strong> form fill-up can be done through &quot;<strong>BULK PAYMENT</strong>&quot; section in Dashboard. Please fallow below steps
                            <br />
                            1. Login into the system
                            <br />
                            2. Bulk Payment section
                            <br />
                            3. Apply necessary filters
                            <br />
                            4. List of student eligible for appearing in 5th Sem displays in grid
                            <br />
                            5. Check the check box against the student whose Examination Fee is to be collected
                            <br />
                            6. Payable amount displayed in bottom of the grid
                            <br />
                            7. Enter appropriate remark and click on &quot;<strong>Proceed for Payment</strong>&quot;
                            <br />
                            8. Acknowledgement displaying the names of student with payment details against which the payment will be collected <br />
                            9. Confirming it will take to Payment gateway
                            <br />
                            10. On successful payment, Payment Receipt and Acknowledgement is displayed<br />
&nbsp;
                            <br />
Please check the university proceedings (<a href="" target="_blank">5th sem 2018 form fill up.pdf</a>)
                        </td>
                    </tr>
                    <tr>
                        <td>23.</td>
                        <td>13-11-2018<br />
                            16:00 PM</td>
                        <td>Internal Marks (Reopen)</td>
                        <td>Dear Principal / DEO&#39;s<br />
                            Any request for re-opening for entering marks for any paper (T/P subject) in Internal Marks Entry is to be addressed by email at . <span style="color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">
                            <br />
                            Thank You&nbsp;&nbsp;&nbsp;&nbsp; </span></td>
                    </tr>
                    <tr>
                        <td>22.</td>
                        <td>02-11-2018<br />
                            13:30 PM</td>
                        <td>Internal (TP) Marks Entry</td>
                        <td>Dear DEO&#39;s<br />
                            Internal Marks Entry for 1st Semester shall be enabled for marks entry by Monday 5th November 2018, you are requested to go through the process flow and manuals. <span style="color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">
                            <br />
                            The student who has filled the Examination Form and paid the examination fee for 1st Semester (exam held in April-2018) their Internal Marks (Tutorial Practical) shall be entered. Below are the steps:
<br />1.	DEO need to login using their Login ID in Sambalpur Information System (https://sambalpur.lokaseba-odisha.in) 
<br />2.	In dashboard of the DEO, there is a “<b>INTERNAL MARKS ENTRY</b>” section. Clicking on it a new window opens
<br />3.	Apply proper filter – <b>Branch, Exam Type, Session, Semester and Paper</b> as (applicable), then click “<b>Search</b>”
<br />4.	List of the 1st Semester student who’s examination form is approved by University, binds in grid 
<br />5.	<span style="color:maroon;">Click on <b>CHECK</b> box to check (second column of the grid) the candidate whose marks is to be entered. Checking the check box will <b>enable the text</b> for marks entry. The text box will accept <b>0 to 50</b> numbers and <b>AB</b> or <b>ab</b>. 
<br />6.	Enter marks between <b>0-50</b> and if any candidate is absent then enter “<b>AB</b>” / “<b>ab</b>” in the marks text box.</span>   
<br />7.	After marks are entered click on <b>SAVE</b> button to save the marks on server (saved marks can be edited later, till the <b>Send for Approval</b> button is clicked).
<br />8.	After submission of all mark, click on Send for Approval button to submitted the entered marks to university. 
<br />9.	Once the Send for Approval button is clicked, the marks cannot be modified or changed.
<br />
<span style="color:red;"><b>Important</b>: Please ensure all the marks are entered for all student before clicking on Send for Approval button, once marks are submitted to university it cannot be rolled back. The Candidate whose marks is not entered shall be considered as 0 (zero)</span>
<br />
<span style="color:maroon"> 
<br />
Please check the manual for Internal Mark Entry (<a href="" target="_blank">SU-InternalMarkEntry.pdf</a>)</span>
                            Thank You&nbsp;&nbsp;&nbsp;&nbsp; </span></td>
                    </tr>
                    <tr>
                        <td>21.</td>
                        <td>02-11-2018<br />
                            13:00 PM</td>
                        <td>Check e-Mail Regular & Reply</td>
                        <td>Dear Principal / DEO&#39;s<br />
                            You are requested to check the registered email (with the system) regularly and reply accrodingly. <span style="color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">
                            <br />
                            Thank You&nbsp;&nbsp;&nbsp;&nbsp; </span></td>
                    </tr>
                    <tr>
                        <td>20.</td>
                        <td>24-10-2018<br />
                            13:00 AM</td>
                        <td>Status in +3 Examination Enrollment (CBCS) Report</td>
                        <td>Dear DEO&#39;s<br />
                            STATUS column in +3 Examination Enrollment report represents the current position of the application. The status in chronological order is as below:<br />
                            1. <span style="color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;"><strong>INITIATED</strong> =&gt; when form is submitted by DEO&#39;s<br />
                            2. <strong>UNPAID</strong> =&gt; when student has completed the form but not paid the Enrollment Fee<br />
                            3. <strong>PAID</strong> =&gt; when student has paid the Enrollment Fee<br />
                            4. <strong>FORM SUBITTED</strong> =&gt; When DEO&#39;s has edited the FORM irrespective of payment
                            <br />
                            5.<strong>PENDING at DEO</strong> =&gt; When student has complete the fom (upploaded the document &amp; paid the enrollment fee)<br />
                            6. <strong>PENDING at PRINCIPAL</strong> =&gt; when DEO has verified the Application andhas SEND it to PRINCIPAL for approval<br />
                            7. <strong>PENDING at EG-II</strong> =&gt; when PRINCIPAL has approved the application and has sent it to University for ROLL NO generation&nbsp;&nbsp;&nbsp;&nbsp; </span></td>
                    </tr>
                    <tr>
                        <td>19.<br />
                            </td>
                        <td>23-10-2018<br />
                            11:00 AM</td>
                        <td>Student Login ID and Password</td>
                        <td>Dear DEO&#39;s<br />
                            Student password&#39;s are encrypted in the system, it is not visible in plain text. If student is unable to login please ask them to reset their password from &quot;<strong>FORGET PASSWORD</strong>&quot; link in Login page.<br />
                            Below are the steps to change the password<br />
                            1. Login Page<br />
                            2. Select &quot;<strong>Student</strong>&quot; as user type<br />
                            3. Enter &quot;<strong>Roll No</strong>&quot; or &quot;<strong>Admission No</strong>&quot; and <strong>Captcha</strong><br />
                            4. An <strong>OTP</strong> will SMS to registered mobile no. of the student<br />
                            5. Enter the OTP - it redirect to reset password page<br />
                            6. Enter <strong>LOGIN ID</strong> of the student, <strong>New Password</strong> and <strong>Confirm Password</strong>, on submit system will change the Password</td>
                    </tr>
                    <tr>
                        <td>18.</td>
                        <td>20-10-2018<br />
                            16:00 PM</td>
                        <td>Support Desk Details</td>
                        <td>Dear DEO&#39;s,<br />
                            For any support and help please contact us on below details<br />
                            Mobile No.: <span style="color: rgb(51, 51, 51); font-family: Heebo-Regular, Helvetica, Arial, sans-serif; font-size: 13px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(249, 249, 249); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;"><strong>7000745655 / 9078570345</strong></span><br />
                            Email ID : <span style="color: rgb(51, 51, 51); font-family: Heebo-Regular, Helvetica, Arial, sans-serif; font-size: 13px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(249, 249, 249); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;"><strong>sambhalpur.university@gmail.com</strong><br />
                            (Requested to call during working days from 10:00 AM to 5:00 PM)<br />
                            In email, please mark university in cc.<br />
                            </span></td>
                    </tr>
                    <tr>
                        <td>17.</td>
                        <td>15-10-2018<br />
                            3:30 PM</td>
                        <td>Admission No. Doubts</td>
                        <td>Dear DEO&#39;s,<br />
                            <strong>Admission No</strong> is just a unique no to track the student details unless an until <strong>ROLL NO</strong> is assigned. It does not requires any correction, please try maintaining uniqueness of it.</td>
                    </tr>
                    <tr>
                        <td>16.</td>
                        <td>15.10.2018</td>
                        <td>GE-II Subject for Science &amp; Arts Honours</td>
                        <td>Dear DEO&#39;s<br />
                            <strong>GE-II</strong> subject need to be selected at the time Enrollment process only in <strong>Science &amp; Arts Honours</strong> student. GE-II is an <strong>optional</strong> subject for the student who want to study different GE subject in 3rd &amp; 4th Semester.<br />
                            <br />
                            For the student whose enrollment already done their <strong>subject can be edited</strong>.
                            <br />
                            <br />
                            Their will be <strong>provision to change</strong> the GE-II paper at the time of <strong>3rd Semester Examination Form</strong> Fill Up.
                            <br />
                            <br />
                            DEO&#39;s are requested to refresh the web browser by pressing CTRL + F5 simultaneously on keyboard</td>
                    </tr>
                    <tr>
                        <td>15.</td>
                        <td>08-10-2018<br />
                            4:00 PM</td>
                        <td>Edit Functionality </td>
                        <td>Dear DEO&#39;s
                            <br />
                            Student information can be edited after the student has submitted their details<br />
                            Please follow below step to edit information:<br />
                            1. <strong>Report</strong> (Section in Dashoad page)<br />
                            2. Apply below filters
                            <br />
&nbsp;&nbsp; a. Category (+3 Examination Enrollment (CBCS))<br />
&nbsp;&nbsp; b. Branch (AH, AP, CH, CP, SH, SP)<br />
&nbsp;&nbsp; c. Session (2018)<br />
                            3. Click <strong>SEARCH</strong> button
                            <br />
                            4. Data bind in grid<br />
                            5. Click on <strong>EDIT</strong> button (2nd last column in grid)<br />
                            6. Popup window opens with student details<br />
                            7. Clikc on <strong>UPDATE</strong> button to update the record<br />
                            8. Acknowledgement pages is shown on succesful update.</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>14.</td>
                        <td>06-10-2018<br />
                            12:00 Noon</td>
                        <td>Support Contact Details</td>
                        <td>Dear DEO&#39;s
                            <br />
                            For any queries and support please
                            <br />
                            Mail at <a href="mailto:sambhalpur.university@gmail.com">sambhalpur.university@gmail.com</a><br />
                            Mobile No. 7000745655 (please call in working hours 10 am to 5 pm Monday to Friday only)</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>06-10-2018<br />
                            9:00 AM</td>
                        <td>Enrollment Process for 2018</td>
                        <td>Dear DEO&#39;s<br />
                            Enrollment process for the year 2018 has been enabled<br />
                            <br />
                            <strong>Enrollment Process</strong>
<br />1. College Admin (DEO) will fill the through the ling on Dashboard "<strong>+3 Examination Enrollment (CBCS)</strong>"
<br />&nbsp;&nbsp;a. Basic information
<br />&nbsp;&nbsp;b. Admission Details
<br />&nbsp;&nbsp;c. Subject assigned
<br />of the Admitted Candidate (after login)
<br />2. The Candidate will be informed to complete the admission process through
<br />&nbsp;&nbsp;a. SMS
<br />&nbsp;&nbsp;b. Email
<br />&nbsp;&nbsp;c. Notice on NOTICE BOARD
                            (The respective college will publish notice on NOTICE BOARD displaying the candidate details and screen to complete the Admission Process Online)
<br />3. Student will search the Application Form by entering Admission No, Date of Birth, Mobile No, Name etc to access the Admission Form (if any candidate is unable to access the Admission Form they can take help to DEO, CSC etc)
<br />4. The prefilled admission form will be fetched. The candidate has to enter
<br />&nbsp;&nbsp;a. Basic Details
<br />&nbsp;&nbsp;b. Upload Photo & Signature
<br />&nbsp;&nbsp;c. Address (Present & Permanent)
<br />&nbsp;&nbsp;d. Education Qualification
<br />&nbsp;&nbsp;e. Upload the supporting Documents
<br />&nbsp;&nbsp;f. Make payment of Enrollment Fee
<br />&nbsp;&nbsp;g. On submission of Application a LOGIN ID and PASSWORD shall be generated, they can use it to complete the process – Payment of Enrollment Fee and Upload of relevant Document & Check the status.
                            <br />
                            5. The details of the Enrolled student can be seen in <strong>REPORT</strong> section under <strong>+3 Examination Enrollment (CBCS) </strong>after applying proper filters (Category, Branc &amp; Session)<br />
                           <span style="color:maroon"> 
                            <br />
                            Please check for process flow (<a href="" target="_blank">EnrollmentProcess.pdf</a>)</span>

                            </span></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>24-09-2018<br />
                            11:00 AM</td>
                        <td>Payment &amp; Editing of AECC-II subject of 2nd SEM</td>
                        <td>Dear DEO&#39;s <br />
                            Editing of Subject &amp; Payment has been enabled till today 24-09-2018 1:00 PM</td>
                    </tr>
                    <tr>
                        <td>11.</td>
                        <td>20-09-2018<br />
                            2:00 PM</td>
                        <td>Editing of AECC-II Subject</td>
                        <td>Dear DEO&#39;s
                            <br />
                            AECC-II subject is opened for Editing as per the instruction from University.<br />
                            <span style="color:red">
                            Note: Admit Card and CNR to be printed after editing of subject is done</span>.</td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td>18-09-2018<br />
                            7:00 PM</td>
                        <td>Printing of Admit Card
                            <br />
                            for 2nd Semester Examination Year 2018</td>
                        <td>Dear DEO&#39;s
                            <br />
                            Admit Card can be downloaded &amp; Printed from REPORT section<br />
                            Please follow below steps:<br />
                            1. Report (Tab in Dashboard page after login)
                            <br />
                            2. Apply filter
                            <br />
&nbsp;&nbsp; a. <strong>Category</strong> =&gt; &quot;Download Admit Card&quot;
                            <br />
&nbsp;&nbsp; b. <strong>Branch</strong> =&gt; &quot;SH / SP / AH / AP / CH / CP&quot; (mandatory)<br />
&nbsp;&nbsp; c. <strong>Exam Type</strong> =&gt; &quot;Regular/Back&quot; (not mandatory)
                            <br />
&nbsp;&nbsp; d. Session/Exam Year =&gt; &quot;2018&quot; (not mandatory)
                            <br />
&nbsp;&nbsp; e. Semester =&gt; &quot;2nd SEM&quot; (mandatory)<br />
                            3. <strong>Search</strong> (click)
                            <br />
                            4. Student records (binds in grid who has paid 2nd Sem Exam. Fee)<br />
                            5. Click on View button to open the admit card of the student in popup (please check POPUP is not blocked )<br />
                            6. Click on &quot;Print&quot; button to print admit card.<br />
&nbsp;<br />
                            <span style="color:red">
                            Note: Please check all the inforamtion before Printing the Admit Card</span></td>
                    </tr>
                    <tr>
                        <td>9.</td>
                        <td>18-09-2018<br />
                            11:30 AM</td>
                        <td>Printing of Admit Card &amp; CNR<br />
                            (<strong>2nd Semester Examination - 2018</strong>)</td>
                        <td>Dear DEO&#39;s<br />
                            Printing of Admit Card shall be enabled after &quot;<strong>Editing of AECC-II</strong>&quot; subject is closed i.e. after 18-09-2018 6:30 PM<br />
                            <br /><span style="color:red">
                            Important Note : <b>Printing of CNR and Admit Card to be done after AECC-II subject editing is done</b></span></td>
                    </tr>
                    <tr>
                        <td>8.</td>
                        <td>18-09-2018<br />
                            10:30 AM</td>
                        <td>AECC-II Subject Edit<br />
                            (<strong>Opened for editing till 18-09-2018 6:00 PM</strong>)</td>
                        <td>Dear DEO&#39;s<br />
                            Editing of <strong>AECC-II</strong> subject for regular student (Batch - 2017) has been listed for editing till 18-09-2018 16:00 PM<br />
                            Please fallow below steps to Edit AECC-II subject for Regular student (Batch-2017)
                            <br />
                            1. Report (Tab in Dashboard page after login)
                            <br />
                            2. Apply filter
                            <br />
&nbsp;&nbsp; a. <strong>Category</strong> =&gt; &quot;Edit Subject&quot;
                            <br />
&nbsp;&nbsp; b. <strong>Branch</strong> =&gt; &quot;SH / SP / AH / AP / CH / CP &quot;
                            <br />
&nbsp;&nbsp; c. <strong>Exam Type</strong> =&gt; &quot;Regular&quot; d. Session =&gt; &quot;2017&quot;
                            <br />
                            3. <strong>Search</strong> (click)
                            <br />
                            4. Regular Student List (binds in grid who has paid the 2nd SEM Examination Fee)
                            <br />
                            5. Click on &quot;V<span class="ui-priority-primary">iew</span>&quot; button, popup window opens
                            <br />
                            6. Select the <strong>AECC-II subject</strong> from drop down
                            <br />
                            7. Click on <strong>Update Subject</strong> button to save the subject</td>
                    </tr>
                    <tr>
                        <td>7</td>
                        <td>15-09-2018<br />
                            7:00 PM</td>
                        <td>Candidate Nominal Role (CNR)
                            <br />
                            for 2nd Semester Examination Year 2018</td>
                        <td>Dear DEO&#39;s
                            <br />
                            We&#39;ve shown the CNR of 2nd Semester in REPORT section<br />
                            Please apply below filters to check<br />
                            1. Report (Tab in Dashboard page after login)
                            <br />
                            2. Apply filter
                            <br />
&nbsp;&nbsp; a. <strong>Category</strong> =&gt; &quot;Candidate Nominal Role (CNR)&quot;
                            <br />
&nbsp;&nbsp; b. <strong>Branch</strong> =&gt; &quot;SH / SP / AH / AP / CH / CP&quot; (mandatory)<br />
&nbsp;&nbsp; c. <strong>Exam Type</strong> =&gt; &quot;Regular/Back&quot; (not mandatory)
                            <br />
&nbsp;&nbsp; d. Session/Exam Year =&gt; &quot;2018&quot; (not mandatory)
                            <br />
&nbsp;&nbsp; e. Semester =&gt; &quot;2nd SEM&quot; (mandatory)<br />
                            3. <strong>Search</strong> (click)
                            <br />
                            4. Student Results (binds in grid of 2nd SEM)</td>
                    </tr>
                    <tr>
                        <td>6.</td>
                        <td>15-09-2018<br />
                            01:30 PM</td>
                        <td>University Result
                            <br />
                            (for 2nd Semester)</td>
                        <td>Dear DEO&#39;s
                            <br />
                            We&#39;ve shown the Result of 2nd Semester in REPORT section<br />
                            Please apply below filters to check<br />
                            1. Report (Tab in Dashboard page after login)
                            <br />
                            2. Apply filter
                            <br />
&nbsp;&nbsp; a. <strong>Category</strong> =&gt; &quot;University Result&quot;
                            <br />
&nbsp;&nbsp; b. <strong>Branch</strong> =&gt; &quot;SH / SP / AH / AP / CH / CP&quot; (mandatory)<br />
&nbsp;&nbsp; c. <strong>Exam Type</strong> =&gt; &quot;Regular/Back&quot; (for PASS &amp; FAIL - not mandatory)
                            <br />
&nbsp;&nbsp; d. Session/Exam Year =&gt; &quot;2017&quot; (not mandatory)
                            <br />
&nbsp;&nbsp; e. Semester =&gt; &quot;2nd SEM&quot; (mandatory)<br />
                            3. <strong>Search</strong> (click)
                            <br />
                            4. Student Results (binds in grid of 2nd SEM)</td>
                    </tr>
                    <tr>
                        <td>5.</td>
                        <td>13-09-2018<br />
                            5:00 PM</td>
                        <td>AECC-II Subject Edit<br />
                            (<strong>Data is listed / enabled,
                            <br />
                            edit of subject is restriced / blocked</strong>)</td>
                        <td>Dear DEO&#39;s<br />
                            Editing of <strong>AECC-II</strong> subject for regular student (Batch - 2017) has been listed (but presently editing is restriced presently)<br />
                            Please follow below steps to Edit AECC-II subject for Regular student (Batch-2017)
                            <br />
                            1. Report (Tab in Dashboard page after login)
                            <br />
                            2. Apply filter
                            <br />
&nbsp;&nbsp; a. <strong>Category</strong> =&gt; &quot;Edit Subject&quot;
                            <br />
&nbsp;&nbsp; b. <strong>Branch</strong> =&gt; &quot;SH / SP / AH / AP / CH / CP &quot;
                            <br />
&nbsp;&nbsp; c. <strong>Exam Type</strong> =&gt; &quot;Regular&quot; d. Session =&gt; &quot;2017&quot;
                            <br />
                            3. <strong>Search</strong> (click)
                            <br />
                            4. Regular Student List (binds in grid who has paid the 2nd SEM Examination Fee)
                            <br />
                            5. Click on &quot;V<span class="ui-priority-primary">iew</span>&quot; button, popup window opens
                            <br />
                            6. Select the <strong>AECC-II subject</strong> from drop down
                            <br />
                            7. Click on <strong>Update Subject</strong> button to save the subject&nbsp; </td>
                    </tr>
                    <tr>
                        <td>1.</td>
                        <td>11-09-2018<br />
                            3:00 PM</td>
                        <td>Back Stutudent of &quot;CH&quot; &amp; &quot;CP&quot; </td>
                        <td>Back Student of &quot;CH&quot; &amp; &quot;CP&quot; has not been enabled for Bluk Payment (will be done in mean time)</td>
                    </tr>
                    <tr>
                        <td>1. </td>
                        <td>11-09-2018<br />
                            11:00 AM</td>
                        <td>Bulk Payment for Back Student</td>
                        <td>Dear DEO&#39;s
                            <br />
                            Bulk Payment for Back Student has been enabled</td>
                    </tr>
                    <tr>
                        <td>1.</td>
                        <td>11-09-2018<br />
                            2:00 PM</td>
                        <td>Back Payment of Unregistered Student<br />
                            (currently only list is vissible
                            <br />
                            Registration and Payment is blocked)</td>
                        <td>Dear DEO&#39;s,<br />
                            Please follow below steps to Edit AECC-II subject for Regular student (Batch-2017)
                            <br />
                            1. Report (Tab in Dashboard page after login)
                            <br />
                            2. Apply filter
                            <br />
&nbsp;&nbsp; a. <strong>Category</strong> =&gt; &quot;Edit Subject&quot;
                            <br />
&nbsp;&nbsp; b. <strong>Branch</strong> =&gt; &quot;SH / SP / AH / AP / CH / CP &quot;
                            <br />
&nbsp;&nbsp; c. <strong>Exam Type</strong> =&gt; &quot;Regular&quot; d. Session =&gt; &quot;2017&quot;
                            <br />
                            3. <strong>Search</strong> (click)
                            <br />
                            4. Regular Student List (binds in grid who has paid the 2nd SEM Examination Fee) <br />
                            5. Click on &quot;V<span class="ui-priority-primary">iew</span>&quot; button, popup window opens
                            <br />
                            6. Select the <strong>AECC-II subject</strong> from drop down
                            <br />
                            7. Click on <strong>Update Subject</strong> button to save the subject </td>
                    </tr>
                    <tr>
                        <td>2.&nbsp;</td>
                        <td>08-09-2018<br />
                            10:00 AM</td>
                        <td>2nd SEM EXAMINATION FEE (BULK PAYMENT)</td>
                        <td>Dear DEO's,<br />
                            Examination fee for 2nd Semester shall be collected in three different ways, <br />
                            1st for Regular Student (is active)<br />
                            2nd for Back Student who has registered in the system 
                            (shall be made active on Monday 10-09-2018 02:00 PM) and <br />
                            3rd for Back Student who has not registered in the system (shall be made active on Wednesday 12-09-2018)</td>
                    </tr>
                </tbody>
            </table>
        </div>
                    </div>
                   <%-- <div class="modal-footer text-center">
                        <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">
                            Close
                        </button>
                    </div>--%>
                </div>
            </div>
        </div>
    <%--Notice Board Modal END Here--%>
    <div id="page-wrapper" style="min-height: 500px !important;">
        <div class="row mt20">
            <div class="col-lg-12">
            </div>
        </div>
        <%--<uc1:G2GInfomation runat="server" ID="G2GInfomation" />--%>
        <div class="">
            <div class="SrvDiv" id="Div1" runat="server">
                <a href="/WebApp/G2G/DTE/StudentHistory.aspx" target="_blank">
                    <img alt="" align="left" />
                    <b>Student History</b><br />
                    <span>View Student Detail Data</span>
                </a>
            </div>
            <div class="SrvDiv" id="DivLegacy" runat="server" style="display:none" visible="false">
                <a href="/WebApp/Kiosk/DTE/legacy/LegacyDataInterface.aspx" target="_blank">
                    <img alt="" align="left" /><b>Legacy Data</b>
                    <br />
                    <span>View Student Detail 2003-2007</span>
                </a>
            </div>
            <div class="SrvDiv" id="DivReport" runat="server">
                <a href="/WebApp/G2G/DTE/DTEReport.aspx" target="_blank">
                    <img alt="" align="left" />
                    <b>Reports</b><br />
                    <span>View Reports & Export Data</span>
                </a>
            </div>
            <div class="SrvDiv" id="DivAdmission" runat="server">
                <a href="/WebApp/Kiosk/CBCS/DEOAdmissionForm.aspx" target="_blank">
                    <img alt="" align="left" />
                    <b>+3 Exam. Enrollment (CBCS)</b><br />
                    <span>New Student Enrollment</span>
                </a>
            </div>
            <div class="SrvDiv" id="DivRollNo" runat="server">
                <a href="/WebApp/G2G/SU/SURollNumber.aspx" target="_blank">
                    <img alt="" align="left" />
                    <b>Generate Roll No</b>
                    <span>Generate Roll No For +3 Admission</span>
                </a>
            </div>
            <div class="SrvDiv" id="DivRegNo" runat="server">
                <a href="/WebApp/G2G/SU/SURegNumber.aspx" target="_blank">
                    <img alt="" align="left" />
                    <b>Generate Registration No</b><br />
                    <span>Generate Reg No For +3 Admission</span>
                </a>
            </div>
            <div class="SrvDiv" id="divBulk" runat="server">
                <a href="/WebApp/G2G/SU/BulkApproval.aspx" target="_blank">
                    <img alt="" align="left" />
                    <b>Bulk Approval</b><br />
                    <span>Approve Application in Bulk</span>
                </a>
            </div>
            <div class="SrvDiv" id="divBulkPayment" runat="server">
                <a href="/WebApp/G2G/BulkPayment/BulkPayAppList.aspx" target="_blank">
                    <img alt="" align="left" />
                    <b>Bulk Payment</b><br />
                    <span>Payment of Bulk Application</span></a>
            </div>
            <div class="SrvDiv" id="div2" runat="server">
                <a href="/WebApp/G2G/DTE/PGSummary.aspx" target="_blank">
                    <img alt="" align="left" />
                    <b>Payment Summary</b><br />
                    <span>Payment Detail & Summary</span></a>
            </div>
            <div class="SrvDiv" id="divMark" runat="server">
                <a href="/WebApp/G2G/MarkEntry/InternalMarks.aspx" target="_blank">
                    <img alt="" align="left" />
                    <b>Internal Marks Entry</b>
                    <br />
                    <span>Internal Marks Entry</span></a>
            </div>
            <div class="SrvDiv" id="divAttendance" runat="server">
                <a href="/WebApp/G2G/SU/AttendanceSheet.aspx" target="_blank">
                    <img alt="" align="left" />
                    <b>Attendance Sheet</b>
                    <br />
                    <span>Examination Attendance Sheet</span></a>
            </div>
            <div class="SrvDiv" id="div3" runat="server">
                <a href="/WebApp/G2G/MarkEntry/SubjectEdit.aspx" target="_blank">
                    <img alt="" align="left" />
                    <b>Change Subject (Edit)</b>
                    <br />
                    <span>Change Subject in Bulk</span></a>
            </div>
            <div class="SrvDiv" id="divReg" runat="server">
                <a href="/WebApp/G2G/MarkEntry/RegistrationUpdate.aspx" target="_blank">
                    <img alt="" align="left" />
                    <b>Univ. Registration No (2016)</b>
                    <br />
                    <span>Update University Registration No.</span></a>
            </div>
            <div class="clearfix"></div>
        </div>
        <%---Start of Filter----%>
        <div class="row" style="">
            <div class="col-md-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title register-num">Search Filter
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory" for="txtFromDate">
                                From Date
                            </label>
                            <asp:TextBox ID="txtFromDate" runat="server" CssClass="form-control" placeholder="DD/MM/YYYY"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory" for="txtToDate">
                                To Date
                            </label>
                            <asp:TextBox ID="txtToDate" runat="server" CssClass="form-control" placeholder="DD/MM/YYYY"></asp:TextBox>

                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory" for="category">
                                Category</label>
                            <asp:DropDownList ID="ddlServices" runat="server" Width="95%" CssClass="form-control">
                            </asp:DropDownList>
                        </div>
                    </div>      
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display:none">
                        <div class="form-group">
                            <label class="manadatory" for="ddlDistrict">
                                District</label>
                            <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="form-control">
                            </asp:DropDownList>
                        </div>
                    </div>                                 
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="" for="ddlStatus">
                                Application Status
                            </label>
                            <asp:DropDownList ID="ddlStatus" runat="server" AppendDataBoundItems="True"
                                CssClass="form-control" ToolTip="Select Status">
                                <asp:ListItem>-Select Status-</asp:ListItem>
                                <asp:ListItem Value="P">Pending</asp:ListItem>
                                <asp:ListItem Value="A">Approved</asp:ListItem>
                                <asp:ListItem Value="R">Rejected</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="" for="txtAppID">Application No.</label>
                            <asp:TextBox runat="server" ID="txtAppID" class="form-control" placeholder="Application No" name="txtAppID" MaxLength="12" onkeypress="return isNumberKey(event);"
                                type="text" value=""></asp:TextBox>
                        </div>
                    </div>
                    
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2 text-right">
                        <div class="form-group">
                            <label>
                                &nbsp;</label><asp:Button ID="btnSearch" runat="server" CausesValidation="False" CssClass="btn btn-success"
                                    Text="Search" />
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>

                </div>
            </div>
        &nbsp;&nbsp;&nbsp;
        </div>

        <%----END of Filter-----%>


        <%---Start of Application Details----%>
        <div class="row">
            <div class="col-md-12 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">List of Application
                    </h4>
                </div>
                <div class="box-body box-body-open p0" style="height: 250px; overflow: auto;">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12 p0">
                        <div class="form-group p0">
                            <asp:GridView ID="grdView" runat="server" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" OnPageIndexChanging="grdView_PageIndexChanging" OnRowDataBound="grdView_RowDataBound">
                            </asp:GridView>
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
            <div class="text-center col-md-12 col-sm-12 col-xs-12">

                <ul class="pagination">

                    <li class="col-md-2 col-sm-2 text-center">
                        <label for="TotalRecords">Total Records</label>
                        <label id="lblTotalRecords" runat="server" for="TotalRecords"></label>
                        <input type="hidden" id="TotalRecords" name="TotalRecords" value="2" /></li>
                    <li class="col-md-2 col-sm-2 text-center">
                        <label for="CurrentPage">Page:</label>
                        1
    <input type="hidden" id="CurrentPage" name="CurrentPage" value="1" />
                        <label for="TotalPages">of</label>
                        1
                    </li>
                    <li class="col-md-4 col-sm-4 text-center">
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
                    <li class="col-md-2 col-sm-2">
                        <button class="btn btn-success " type="submit" id="btnExcel" name="Command" value="Last" disabled="disabled">
                            Export to Excel</button>
                        <div class="clearfix"></div>
                    </li>
                    <div class="clearfix"></div>
                </ul>

            </div>
        </div>
        <%----END of Application Details-----%>
    </div>
</asp:Content>
