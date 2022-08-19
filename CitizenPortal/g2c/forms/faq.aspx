<%@ Page Title="" Language="C#" MasterPageFile="~/g2c/master/Home.Master" AutoEventWireup="true" CodeBehind="faq.aspx.cs" Inherits="WebApplication1.lokaseba_adhikar.forms.faq" EnableSessionState="False"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .faq-block {
            width: auto;
            max-width: 900px;
            margin-right: auto;
            margin-left: auto;
            padding: 25px;
            margin-bottom: 5px;
        }

        .dsplyflx {
            display: flex;
            padding-top: 4px;
            padding-left: 3px;
            line-height:20px;
            font-size:14px;
            
        }

        .pleft32 {
            padding-left:32px !important;
        }
    </style>

    <script>
        $(document).ready(function () {
            $('.collapse.in').prev('.panel-headingfaq').addClass('active');
            $('#accordion, #bs-collapse')
                .on('show.bs.collapse', function (a) {
                    $(a.target).prev('.panel-heading').addClass('active');
                })
                .on('hide.bs.collapse', function (a) {
                    $(a.target).prev('.panel-headingfaq').removeClass('active');
                });
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbody" runat="server">
    <div class="row">
        <div class="w95">
            <h1>Frequently Asked Questions</h1>
            <div class="panel-group wrap" id="bs-collapse">

                <div class="panel">
                    <div class="panel-headingfaq">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#bs-collapse" href="#one">1. What is Odisha Right to Public Services Act?
                            </a>
                        </h4>
                    </div>
                    <div id="one" class="panel-collapse collapse in">
                        <div class="panel-body-faq">
                            <b class="fltleft">Ans:</b> <span class="dsplyflx"> It is an Act passed by Odisha Legislative Assembly in September, 2012 to provide public services to the citizens in the State of Odisha within the stipulated time.</span>
                       
                        </div>
                    </div>

                </div>
                <!-- end of panel -->

                <div class="panel">
                    <div class="panel-headingfaq">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#bs-collapse" href="#two">2. How does it help to citizen?
                            </a>
                        </h4>
                    </div>
                    <div id="two" class="panel-collapse collapse">
                        <div class="panel-body-faq">

                            <b>Ans:</b> This Act will help the citizen to provide the notified public services within the stipulated time.

                       
                        </div>

                    </div>
                </div>
                <!-- end of panel -->

                <div class="panel">
                    <div class="panel-headingfaq">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#bs-collapse" href="#three">3. What will the citizen get after filing of application for the notified service?
                            </a>
                        </h4>
                    </div>
                    <div id="three" class="panel-collapse collapse">
                        <div class="panel-body-faq">
                            <b>Ans:</b> The citizen shall receive an acknowledgement after receipt of the application by the Designated Officer or his/her authorised representative.
                       
                        </div>
                    </div>
                </div>
                <!-- end of panel -->

                <div class="panel">
                    <div class="panel-headingfaq">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#bs-collapse" href="#four">4. What does the acknowledgement contain?
                            </a>
                        </h4>
                    </div>
                    <div id="four" class="panel-collapse collapse">
                        <div class="panel-body-faq">
                            <b class="fltleft">Ans:</b> <span class="dsplyflx">The acknowledgement will be issued to the applicant in the prescribed format containing the last date of the given time limit if all the essential documents are attached with the application. Otherwise the last date of the given time limit will not be mentioned.</span>
                       
                        </div>
                    </div>
                </div>
                <!-- end of panel -->

                <div class="panel">
                    <div class="panel-headingfaq">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#bs-collapse" href="#five">5. How can a citizen know the status of his/her application?
                            </a>
                        </h4>
                    </div>
                    <div id="five" class="panel-collapse collapse">
                        <div class="panel-body-faq">
                            <b>Ans:</b>The citizen can get the information of the status of the application by giving his No. and Date of receiving application in the office of the Designated Officer, which are mentioned in the acknowledgement.
                       
                        </div>
                    </div>
                </div>
                <!-- end of panel -->

                <div class="panel">
                    <div class="panel-headingfaq">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#bs-collapse" href="#six">6. Where shall a citizen get to know the services covered under this Act?
                            </a>
                        </h4>
                    </div>
                    <div id="six" class="panel-collapse collapse">
                        <div class="panel-body-faq">
                            <b class="fltleft">Ans:</b> <span class="dsplyflx">Each Public Office who is providing services under this Act will display all information relating to Public Services, given time limit, Appellate Authority and Revisional Authority in the Notice Board in Odia language for convenience of the public.</span>
                       
                        </div>
                    </div>
                </div>
                <!-- end of panel -->

                <div class="panel">
                    <div class="panel-headingfaq">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#bs-collapse" href="#seven">7. Who will receive the application in the office of the Designated Officer?
                            </a>
                        </h4>
                    </div>
                    <div id="seven" class="panel-collapse collapse">
                        <div class="panel-body-faq">
                            <b>Ans:</b> The Designated Officer can authorise any of his/her subordinate staff to receive the application and issue acknowledgement. The name of the authorised officer is displayed in the Notice Board.
                       
                        </div>
                    </div>
                </div>
                <!-- end of panel -->


                <div class="panel">
                    <div class="panel-headingfaq">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#bs-collapse" href="#eight">8. What are the documents are necessary to be attached alongwith the application?
                            </a>
                        </h4>
                    </div>
                    <div id="eight" class="panel-collapse collapse">
                        <div class="panel-body-faq">
                            <b class="fltleft">Ans:</b><span class="dsplyflx"> For each service, the essential documents to be attached alongwith the application are to be displayed on the Notice Board by the Designated Officer. Accordingly, the applicant has to submit the essential documents alongwith the application to make it complete in all respect. Last date for time limit will be mentioned by the officer concerned only when the application is complete in all respect.</span>
                       
                        </div>
                    </div>
                </div>
                <!-- end of panel -->

                <div class="panel">
                    <div class="panel-headingfaq">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#bs-collapse" href="#nine">9. If the Designated denied or delayed to provide the service, how could he communicate to the applicant?
                            </a>
                        </h4>
                    </div>
                    <div id="nine" class="panel-collapse collapse">
                        <div class="panel-body-faq">
                            <b>Ans:</b> The Designated Officer shall communicate the applicant describing following aspects.<br />
                            <ul>
                                <li>The Reasons for such denial or delay</li>
                                <li>The Period within which an appeal against such denial or delay be preferred</li>
                                <li>The particulars including all available contact information of the Appellate Authority</li>
                            </ul>

                        </div>
                    </div>
                </div>
                <!-- end of panel -->

                <div class="panel">
                    <div class="panel-headingfaq">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#bs-collapse" href="#ten">10. Whether the time limit specified for each service includes the public Holidays?
                            </a>
                        </h4>
                    </div>
                    <div id="ten" class="panel-collapse collapse">
                        <div class="panel-body-faq">
                            <b>Ans:</b> No, the public holidays shall not be included in the given time limit for providing the service.
                        </div>
                    </div>
                </div>
                <!-- end of panel -->


                <div class="panel">
                    <div class="panel-headingfaq">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#bs-collapse" href="#eleven">11. Who may file appeal?
                            </a>
                        </h4>
                    </div>
                    <div id="eleven" class="panel-collapse collapse">
                        <div class="panel-body-faq">
                            <b>Ans:</b> The applicant whose application has been rejected by the Designated Officer or who is not provided the with the service within the given time limit may file an appeal.
                        </div>
                    </div>
                </div>
                <!-- end of panel -->


                <div class="panel">
                    <div class="panel-headingfaq">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#bs-collapse" href="#tweleve">12. Within how many days the aggrieved applicant can file an appeal against the order of the Designated Officer?
                            </a>
                        </h4>
                    </div>
                    <div id="tweleve" class="panel-collapse collapse">
                        <div class="panel-body-faq">
                            <b class="fltleft">Ans:</b><span class="dsplyflx">The applicant can file the appeal within 30 days from the date of receipt of the order of rejection of application or the expiry of the given time limit. Further, the Appellate Authority may admit the appeal within 90 days if he is satisfied that the appellant was prevented by the sufficient cause for not preferring the appeal in time.</span> 
                        </div>
                    </div>
                </div>
                <!-- end of panel -->

                <div class="panel">
                    <div class="panel-headingfaq">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#bs-collapse" href="#thirteen">13.	How can an applicant file an appeal against the order of the Designated Officer?  </a>
                        </h4>
                    </div>
                    <div id="thirteen" class="panel-collapse collapse">
                        <div class="panel-body-faq">
                            <b>Ans:</b> The applicant aggrieved by the order of the Designated Officer file appeal before the Appellate Authority alongwith following information.<br />
                            <ul>
                                <li>Name and address of applicant or person asking for Appeals.</li>
                                <li>To the extent possible, name and address of Designated Officer against whose decision the Appeal has been presented.</li>
                                <li>Gist of the order against which the Appeal lies.</li>
                                <li>Date of application along with name and address of the Designated Officer if the appeal is made against non-receipt of acknowledgement of the applications.</li>
                                <li>Basis for Appeal.</li>
                                <li>Relief asked for.</li>
                                <li>Any other related information that may be necessary for determining the Appeal.</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- end of panel -->

                <div class="panel">
                    <div class="panel-headingfaq">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#bs-collapse" href="#forteen">14.	What are the documents required to be enclosed along with the application of appeal?</a>
                        </h4>
                    </div>
                    <div id="forteen" class="panel-collapse collapse">
                        <div class="panel-body-faq">
                            <b>Ans:</b> The following documents are required to be enclosed with the appeal.<br />
                            <ul>
                                <li>Table of Contents of documents enclosed with Appeal.</li>
                                <li>Self attested copy of the order against which the Appeal is being made.</li>
                                <li>Copies of documents mentioned in the application for Appeal.</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- end of panel -->

                <div class="panel">
                    <div class="panel-headingfaq">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#bs-collapse" href="#fifteen">15.	Is there any prescribed time to dispose the appeal by the Appellate Authority?</a>
                        </h4>
                    </div>
                    <div id="fifteen" class="panel-collapse collapse">
                        <div class="panel-body-faq">
                            <b>Ans:</b> The Appellate Authority shall dispose of the appeal within 30 days from the date of filing of the appeal and direct the Designated Officer to provide the service within the time limit mention in the order.
                        </div>
                    </div>
                </div>
                <!-- end of panel -->

                <div class="panel">
                    <div class="panel-headingfaq">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#bs-collapse" href="#sixteen">16. Can an applicant file an application directly to the Secretary of the department or the State Government?</a>
                        </h4>
                    </div>
                    <div id="sixteen" class="panel-collapse collapse">
                        <div class="panel-body-faq">
                            <b class="fltleft">Ans:</b><span class="dsplyflx"> Yes, an applicant can file an application directly to the Secretary of the department or the State Government. In this case, the application will be sent directly to the concerned Appellate Authority and the appellate Authority will dispose off the application in the same manner as in case of appeal.</span>
                        </div>
                    </div>
                </div>
                <!-- end of panel -->

                <div class="panel">
                    <div class="panel-headingfaq">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#bs-collapse" href="#seventeen">17.	Who will prefer for filing revision?</a>
                        </h4>
                    </div>
                    <div id="seventeen" class="panel-collapse collapse">
                        <div class="panel-body-faq">
                            <b>Ans:</b> An appellant aggrieved in the order of the Appellate Authority will prefer to file revision before the Revisional Authority.
                        </div>
                    </div>
                </div>
                <!-- end of panel -->

                <div class="panel">
                    <div class="panel-headingfaq">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#bs-collapse" href="#eighteen">18. What is the time limit for filing revision?</a>
                        </h4>
                    </div>
                    <div id="eighteen" class="panel-collapse collapse">
                        <div class="panel-body-faq">
                            <b class="fltleft">Ans:</b><span class="dsplyflx"> The appellant or the Designated Officer aggrieved by the order of the Appellate Authority shall file revision before the Revisional authority within 30 days from the date of that order or the expiry of the time, as the case may be.</span>
                        </div>
                    </div>
                </div>
                <!-- end of panel -->

                <div class="panel">
                    <div class="panel-headingfaq">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#bs-collapse" href="#nineteen">19.	How can an applicant file revision against the order of the Appellate Authority?</a>
                        </h4>
                    </div>
                    <div id="nineteen" class="panel-collapse collapse">
                        <div class="panel-body-faq">
                            <b>Ans:</b> The applicant aggrieved by the order of the Appellate Authority file revsion before the Revisional Authority alongwith following information.<br />
                            <ul>
                                <li>Name and address of applicant or person asking for Revisions.</li>
                                <li>To the extent possible, name and address of Designated Officer/ Appellate Authority against whose decision the Revision has been presented.</li>
                                <li>Gist of the order against which the Revision lies.</li>
                                <li>Date of application along with name and address of the Designated Officer if the appeal is made against non-receipt of acknowledgement of the applications.</li>
                                <li>Basis for Appeal or Revision.</li>
                                <li>Relief asked for.</li>
                                <li>Any other related information that may be necessary for determining the Revision.</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- end of panel -->

                <div class="panel">
                    <div class="panel-headingfaq">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#bs-collapse" href="#twenty">20. What are the documents required to be enclosed along with the application of revision?</a>
                        </h4>
                    </div>
                    <div id="twenty" class="panel-collapse collapse">
                        <div class="panel-body-faq">
                            <b>Ans:</b> The following documents are required to be enclosed with the revision.<br />
                            <p>
                               <span class="pleft32"> 1. Table of Contents of documents enclosed with Revision.</span><br />
                               <span class="pleft32"> 2. Self attested copy of the order against which the Revision is being made.</span><br />
                               <span class="pleft32"> 3. Copies of documents mentioned in the application for Revision.</span>
                            </p>
                        </div>
                    </div>
                </div>
                <!-- end of panel -->

                <div class="panel">
                    <div class="panel-headingfaq">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#bs-collapse" href="#twentyone">21. What are the process followed in taking decision on appeal or revision?</a>
                        </h4>
                    </div>
                    <div id="twentyone" class="panel-collapse collapse">
                        <div class="panel-body-faq">
                            <b>Ans:</b> The following process is followe in taking decision on Appeal or Revision, Concerned documents, public records or their copies shall be reviewed.<br />
                            <p>
                                <span class="pleft32">In exceptional circumstances, any officer may be authorized for required investigation.<br /></span>
                               <span class="pleft32"> The Designated Officer or Appellate Authority or Sub-ordinate staff may be summoned at the time of review for a hearing.</span>
                            </p>
                        </div>
                    </div>
                </div>
                <!-- end of panel -->

                <div class="panel">
                    <div class="panel-headingfaq">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#bs-collapse" href="#twentytwo">22. How the date of hearing of appeal and revision is being communicated to the party concerned?</a>
                        </h4>
                    </div>
                    <div id="twentytwo" class="panel-collapse collapse">
                        <div class="panel-body-faq">
                            <b>Ans:</b> In all situations, the hearing date shall be communicated to applicant/ Designated Officer/ Appellate Authority/ Sub-ordinate staff at least seven days in advance.
                        </div>
                    </div>
                </div>
                <!-- end of panel -->

                <div class="panel">
                    <div class="panel-headingfaq">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#bs-collapse" href="#twentythree">23.	How many days prior notice is required to present before the Appellate Authority and Revisional Authority?</a>
                        </h4>
                    </div>
                    <div id="twentythree" class="panel-collapse collapse">
                        <div class="panel-body-faq">
                            <b>Ans:</b> Information of hearing of the application for Appeal or Revision shall be communicated in one of the following manners:-<br />
                            <p>
                                <span class="pleft32">By the party himself/herself.<br/></span>
                                <span class="pleft32">By hand delivery through special messenger.<br/></span>
                                <span class="pleft32">By registered post with acknowledgment</span>
                            </p>
                        </div>
                    </div>
                </div>
                <!-- end of panel -->

                <div class="panel">
                    <div class="panel-headingfaq">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#bs-collapse" href="#twentyfour">24.	Whether there is provision for communication of the order of the Appeal and Revision?</a>
                        </h4>
                    </div>
                    <div id="twentyfour" class="panel-collapse collapse">
                        <div class="panel-body-faq">
                            <b>Ans:</b> Yes, there is provision for communication of the order of the Appeal and Revision.<br />
                            <p>
                               <span class="pleft32"> Appeal or Revision order, as the case may be, shall be read during the hearing and shall also be in writing.<br /></span>
                               <span class="pleft32"> Copy of appeal order shall be given to applicant and Designated Officer.<br/></span>
                               <span class="pleft32"> Copy of revision order shall be given to applicant, Designated Officer, Sub-ordinate staff and Appellate Authority.</span>
                            </p>
                        </div>
                    </div>
                </div>
                <!-- end of panel -->

                <div class="panel">
                    <div class="panel-headingfaq">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#bs-collapse" href="#twentyfive">25. Is there any provision for imposition of penalty upon the Designated Officer concerned who failed to provide the service?</a>
                        </h4>
                    </div>
                    <div id="twentyfive" class="panel-collapse collapse">
                        <div class="panel-body-faq">
                            <b class="fltleft">Ans:</b><span class="dsplyflx"> While hearing the revision, the Revisional Authority may impose a penalty upon the Designated Officer and the Appellate Authority on failing to provide the service without any sufficient and reasonable cause. Further he may impose penalty for delay in providing public services.</span>
                        </div>
                    </div>
                </div>
                <!-- end of panel -->

                <div class="panel">
                    <div class="panel-headingfaq">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#bs-collapse" href="#twentysix">26. What is the amount of penalty?</a>
                        </h4>
                    </div>
                    <div id="twentysix" class="panel-collapse collapse">
                        <div class="panel-body-faq">
                            <b class="fltleft">Ans:</b><span class="dsplyflx"> The Revisional Authority may impose a penalty of not more than Five thousand rupees upon the Designated Officer or the Appellate Authority or the concerned subordinate staffs who fail to provide the service without sufficient and reasonable cause.<br />
                            The Revisional Authority may also impose a penalty not more than Two hundred fifty rupees per each day of delay.</span>
                        </div>
                    </div>
                </div>
                <!-- end of panel -->

                <div class="panel">
                    <div class="panel-headingfaq">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#bs-collapse" href="#twentyseven">27.	How the penalty will be recovered?</a>
                        </h4>
                    </div>
                    <div id="twentyseven" class="panel-collapse collapse">
                        <div class="panel-body-faq"><b class="fltleft">Ans:</b><span class="dsplyflx"> The penalty imposed under the provisions of this Act shall be recovered from the salary/ honorarium/ remuneration of the concerned Designated Officer, or Appellate Authority or concerned subordinate staff, as the case may be.<br />
                            The Head of Account for depositing amount of penalty as determined by the Finance Department is "0070-Other Administrative Services-60-Other Services-800-Other Receipts-0097-Misc. Receipts-02214-Fines under Odisha Right to Public Service Act."</span>
                        </div>
                    </div>
                </div>
                <!-- end of panel -->


                <div class="panel">
                    <div class="panel-headingfaq">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#bs-collapse" href="#twentyeight">28. What are the powers of the court of Appellate Authority and Revisional Authority?</a>
                        </h4>
                    </div>
                    <div id="twentyeight" class="panel-collapse collapse">
                        <div class="panel-body-faq">
                            <b class="fltleft">Ans:</b> <span class="dsplyflx">The Appellate Authority and the Revisional Authority shall have the same powers as are vested in the Civil Court while deciding an appeal and revision under this Act.<br /></span>
                            <ul>
                              <li>Requiring the production and inspection of documents;</li>
                              <li>Issuing summons for hearing to the Designated Officer and appellant; and</li>
                              <li>Any other matter which may be prescribed</li>
                           </ul>
                        </div>
                    </div>
                </div>
                <!-- end of panel -->

                <div class="panel">
                    <div class="panel-headingfaq">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#bs-collapse" href="#twentynine">29. Whether there is any fee required for the appeal or revision?</a>
                        </h4>
                    </div>
                    <div id="twentynine" class="panel-collapse collapse">
                        <div class="panel-body-faq">
                            <b>Ans:</b> No fee shall be charged for appeals and revisions.
                        </div>
                    </div>
                </div>
                <!-- end of panel -->

                <div class="panel">
                    <div class="panel-headingfaq">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#bs-collapse" href="#thirty">30. What will happen if the order of the Revisional Authority is not implemented by the concerned officer?</a>
                        </h4>
                    </div>
                    <div id="thirty" class="panel-collapse collapse">
                        <div class="panel-body-faq">
                            <b>Ans:</b> Non compliance of the orders of Revisional Authority shall amount to misconduct and accordingly Revisional Authority may recommend for disciplinary action.
                        </div>
                    </div>
                </div>
                <!-- end of panel -->

                <div class="panel">
                    <div class="panel-headingfaq">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#bs-collapse" href="#thirtyone">31. Whether any civil court can intervene in the orders of Appellate authority and Revsional authority?</a>
                        </h4>
                    </div>
                    <div id="thirtyone" class="panel-collapse collapse">
                        <div class="panel-body-faq">
                            <b class="fltleft">Ans:</b><span class="dsplyflx"> No Civil Court shall entertain any suit, application or other proceeding in respect of any order made under this Act and no such order shall be called in question otherwise than by way of an appeal as specified under this Act.</span>
                        </div>
                    </div>
                </div>
                <!-- end of panel -->

                 <div class="panel">
                    <div class="panel-headingfaq">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#bs-collapse" href="#thirtytwo">32. Is there any provision of award towards motivation of the officer who provided service to the public unfailingly?</a>
                        </h4>
                    </div>
                    <div id="thirtytwo" class="panel-collapse collapse">
                        <div class="panel-body-faq">
                            <b class="fltleft">Ans:</b><span class="dsplyflx">The State Government may give a reward to the officer against whom no default is reported in one year so as to encourage and enhance the efficiency of the government servants. The award shall be cash incentive not exceeding Rupees Five Thousand in aggregate along with a certificate of appreciation.</span>
                        </div>
                    </div>
                </div>
                <!-- end of panel -->

                 <div class="panel">
                    <div class="panel-headingfaq">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#bs-collapse" href="#thirtythree">33.	Whether the records relating to this act are to be preserved?</a>
                        </h4>
                    </div>
                    <div id="thirtythree" class="panel-collapse collapse">
                        <div class="panel-body-faq">
                            <b class="fltleft">Ans:</b><span class="dsplyflx">The Designated Officer, Appellate Authority and Revisional Authority shall maintain records of all the cases in the prescribed formats.</span> 
                        </div>
                    </div>
                </div>
                <!-- end of panel -->

            </div>
            <!-- end of #bs-collapse  -->


            <%--<div class="col-lg-12">
                <div class="faq-block">
                    <div class="question-row"><p><b>1. What is Odisha Right to Public Services Act?</b></p></div>
                    <div class="answer-row"><p><b>Ans:</b> It is an Act passed by Odisha Legislative Assembly in September, 2012 to provide public services to the citizens in the State of Odisha within the stipulated time.</p></div>
                </div>
                
            

            <p><b>2. How does it help to citizen?</b></p>
            <p><b>Ans:</b> This Act will help the citizen to provide the notified public services within the stipulated time.</p>

            <p><b>3. What will the citizen get after filing of application for the notified service?</b></p>
            <p><b>Ans:</b> The citizen shall receive an acknowledgement after receipt of the application by the Designated Officer or his/her authorised representative.</p>

            <p><b>4. What does the acknowledgement contain?</b></p>
            <p><b>Ans:</b> The acknowledgement will be issued to the applicant in the prescribed format containing the last date of the given time limit if all the essential documents are attached with the application. Otherwise the last date of the given time limit will not be mentioned.</p>

            <p><b>5. How can a citizen know the status of his/her application?</b></p>
            <p><b>Ans:</b> The citizen can get the information of the status of the application by giving his No. and Date of receiving application in the office of the Designated Officer, which are mentioned in the acknowledgement.</p>

            <p><b>6. Where shall a citizen get to know the services covered under this Act?</b></p>
            <p><b>Ans:</b> Each Public Office who is providing services under this Act will display all information relating to Public Services, given time limit, Appellate Authority and Revisional Authority in the Notice Board in Odia language for convenience of the public.</p>

            <p><b>7. Who will receive the application in the office of the Designated Officer?</b></p>
            <p><b>Ans:</b> The Designated Officer can authorise any of his/her subordinate staff to receive the application and issue acknowledgement. The name of the authorised officer is displayed in the Notice Board.</p>

            <p><b>8. What are the documents are necessary to be attached alongwith the application?</b></p>
            <p><b>Ans:</b>	For each service, the essential documents to be attached alongwith the application are to be displayed on the Notice Board by the Designated Officer. Accordingly, the applicant has to submit the essential documents alongwith the application to make it complete in all respect. Last date for time limit will be mentioned by the officer concerned only when the application is complete in all respect.</p>

            <p><b>9. If the Designated denied or delayed to provide the service, how could he communicate to the applicant?</b></p>
            <p><b>Ans:</b> The Designated Officer shall communicate the applicant describing following aspects.</p>
            <ul>
                <li>The Reasons for such denial or delay</li>
                <li>The Period within which an appeal against such denial or delay be preferred</li>
                <li>The particulars including all available contact information of the Appellate Authority</li>
            </ul>

            <p><b>10. Whether the time limit specified for each service includes the public Holidays?</b></p>
            <p><b>Ans:</b> No, the public holidays shall not be included in the given time limit for providing the service.</p>

            <p><b>11. Who may file appeal?</b></p>
            <p><b>Ans:</b> The applicant whose application has been rejected by the Designated Officer or who is not provided the with the service within the given time limit may file an appeal.</p>

            <p><b>12. Within how many days the aggrieved applicant can file an appeal against the order of the Designated Officer?</b></p>
            <p><b>Ans:</b> The applicant can file the appeal within 30 days from the date of receipt of the order of rejection of application or the expiry of the given time limit. Further, the Appellate Authority may admit the appeal within 90 days if he is satisfied that the appellant was prevented by the sufficient cause for not preferring the appeal in time.</p>

            <p><b>13.	How can an applicant file an appeal against the order of the Designated Officer?</b></p>
            <p><b>Ans:</b> The applicant aggrieved by the order of the Designated Officer file appeal before the Appellate Authority alongwith following information.</p>
            <ul>
                <li>Name and address of applicant or person asking for Appeals.</li>
                <li>To the extent possible, name and address of Designated Officer against whose decision the Appeal has been presented.</li>
                <li>Gist of the order against which the Appeal lies.</li>
                <li>Date of application along with name and address of the Designated Officer if the appeal is made against non-receipt of acknowledgement of the applications.</li>
                <li>Basis for Appeal.</li>
                <li>Relief asked for.</li>
                <li>Any other related information that may be necessary for determining the Appeal.</li>
            </ul>

            <p><b>14.	What are the documents required to be enclosed along with the application of appeal?</b></p>
            <p><b>Ans:</b>	The following documents are required to be enclosed with the appeal.</p>
            <ul>
                <li>Table of Contents of documents enclosed with Appeal.</li>
                <li>Self attested copy of the order against which the Appeal is being made.</li>
                <li>Copies of documents mentioned in the application for Appeal.</li>
            </ul>

            <p><b>15.	Is there any prescribed time to dispose the appeal by the Appellate Authority?</b></p>
            <p><b>Ans:</b> The Appellate Authority shall dispose of the appeal within 30 days from the date of filing of the appeal and direct the Designated Officer to provide the service within the time limit mention in the order.</p>

            <p><b>16. Can an applicant file an application directly to the Secretary of the department or the State Government?</b></p>
            <p><b>Ans:</b> Yes, an applicant can file an application directly to the Secretary of the department or the State Government. In this case, the application will be sent directly to the concerned Appellate Authority and the appellate Authority will dispose off the application in the same manner as in case of appeal.</p>

            <p><b>17.	Who will prefer for filing revision?</b></p>
            <p><b>Ans</b>: An appellant aggrieved in the order of the Appellate Authority will prefer to file revision before the Revisional Authority.</p>

            <p><b>18. What is the time limit for filing revision?</b></p>
            <p><b>Ans:</b> The appellant or the Designated Officer aggrieved by the order of the Appellate Authority shall file revision before the Revisional authority within 30 days from the date of that order or the expiry of the time, as the case may be.</p>
            <p>Futrther, the Revisional Authority may entertain the revsion upto 60 days if he is satisfied that the petitioner was prevented by sufficient cause for not preferring the revision in time.</p>

            <p><b>19.	How can an applicant file revision against the order of the Appellate Authority?</b></p>
            <p><b>Ans:</b> The applicant aggrieved by the order of the Appellate Authority file revsion before the Revisional Authority alongwith following information.</p>
            <ul>
                <li>Name and address of applicant or person asking for Revisions.</li>
                <li>To the extent possible, name and address of Designated Officer/ Appellate Authority against whose decision the Revision has been presented.</li>
                <li>Gist of the order against which the Revision lies.</li>
                <li>Date of application along with name and address of the Designated Officer if the appeal is made against non-receipt of acknowledgement of the applications.</li>
                <li>Basis for Appeal or Revision.</li>
                <li>Relief asked for.</li>
                <li>Any other related information that may be necessary for determining the Revision.</li>
            </ul>

            <p><b>20. What are the documents required to be enclosed along with the application of revision?</b></p>
            <p>
                <b>Ans:</b> The following documents are required to be enclosed with the revision.</b>
        <p>
            1. Table of Contents of documents enclosed with Revision.<br>
            2. Self attested copy of the order against which the Revision is being made.<br>
            3. Copies of documents mentioned in the application for Revision.
                </p>

                <p><b>21. What are the process followed in taking decision on appeal or revision?</b></p>
                <p>
                    <b>Ans:</b> The following process is followe in taking decision on Appeal or Revision,
        Concerned documents, public records or their copies shall be reviewed.
                </p>
                <p>
                    In exceptional circumstances, any officer may be authorized for required investigation.<br>
                    The Designated Officer or Appellate Authority or Sub-ordinate staff may be summoned at the time of review for a hearing.
                </p>

                <p><b>22. How the date of hearing of appeal and revision is being communicated to the party concerned?</b></p>
                <p><b>Ans:</b> Information of hearing of the application for Appeal or Revision shall be communicated in one of the following manners:-</p>
                <p>
                    By the party himself/herself.<br>
                    By hand delivery through special messenger.<br>
                    By registered post with acknowledgment
                </p>

                <p><b>23.	How many days prior notice is required to present before the Appellate Authority and Revisional Authority?</b></p>
                <p><b>Ans:</b> In all situations, the hearing date shall be communicated to applicant/ Designated Officer/ Appellate Authority/ Sub-ordinate staff at least seven days in advance.</p>

                <p><b>24.	Whether there is provision for communication of the order of the Appeal and Revision?</b></p>
                <p><b>Ans: </b>Yes, there is provision for communication of the order of the Appeal and Revision.</p>
                <p>
                    Appeal or Revision order, as the case may be, shall be read during the hearing and shall also be in writing.<br>
                    Copy of appeal order shall be given to applicant and Designated Officer.<br>
                    Copy of revision order shall be given to applicant, Designated Officer, Sub-ordinate staff and Appellate Authority.
                </p>

                <p><b>25. Is there any provision for imposition of penalty upon the Designated Officer concerned who failed to provide the service?</b></p>
                <p><b>Ans:</b> While hearing the revision, the Revisional Authority may impose a penalty upon the Designated Officer and the Appellate Authority on failing to provide the service without any sufficient and reasonable cause. Further he may impose penalty for delay in providing public services.</p>

                <p><b>26. What is the amount of penalty?</b></p>
                <p>
                    <b>Ans:</b> The Revisional Authority may impose a penalty of not more than Five thousand rupees upon the Designated Officer or the Appellate Authority or the concerned subordinate staffs who fail to provide the service without sufficient and reasonable cause.<br>
                    The Revisional Authority may also impose a penalty not more than Two hundred fifty rupees per each day of delay.
                </p>

                <p><b>27.	How the penalty will be recovered?</b></p>
                <p>
                    <b>Ans:</b> The penalty imposed under the provisions of this Act shall be recovered from the salary/ honorarium/ remuneration of the concerned Designated Officer, or Appellate Authority or concerned subordinate staff, as the case may be.<br>
                    The Head of Account for depositing amount of penalty as determined by the Finance Department is "0070-Other Administrative Services-60-Other Services-800-Other Receipts-0097-Misc. Receipts-02214-Fines under Odisha Right to Public Service Act."
                </p>

                <p><b>28. What are the powers of the court of Appellate Authority and Revisional Authority?</b></p>
                <p><b>Ans:</b> The Appellate Authority and the Revisional Authority shall have the same powers as are vested in the Civil Court while deciding an appeal and revision under this Act.</p>
                <p>
                    Requiring the production and inspection of documents;<br>
                    Issuing summons for hearing to the Designated Officer and appellant; and<br>
                    Any other matter which may be prescribed
                </p>

                <p><b>29. Whether there is any fee required for the appeal or revision?</b></p>
                <p><b>Ans:</b> No fee shall be charged for appeals and revisions.</p>

                <p><b>30. What will happen if the order of the Revisional Authority is not implemented by the concerned officer?</b></p>
                <p><b>Ans:</b> Non compliance of the orders of Revisional Authority shall amount to misconduct and accordingly Revisional Authority may recommend for disciplinary action.</p>

                <p><b>31. Whether any civil court can intervene in the orders of Appellate authority and Revsional authority?</b></p>
                <p><b>Ans:</b> No Civil Court shall entertain any suit, application or other proceeding in respect of any order made under this Act and no such order shall be called in question otherwise than by way of an appeal as specified under this Act.</p>

                <p><b>32. Is there any provision of award towards motivation of the officer who provided service to the public unfailingly?
       <p><b>Ans:</b> The State Government may give a reward to the officer against whom no default is reported in one year so as to encourage and enhance the efficiency of the government servants. The award shall be cash incentive not exceeding Rupees Five Thousand in aggregate along with a certificate of appreciation.</p>

                        <p><b>33.	Whether the records relating to this act are to be preserved?</b></p>
                        <p><b>Ans:</b> The Designated Officer, Appellate Authority and Revisional Authority shall maintain records of all the cases in the prescribed formats.</p>
            </div>--%>
        </div>
    </div>
</asp:Content>
