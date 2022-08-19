<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="tophead_odia.ascx.cs" Inherits="CitizenPortal.g2c.controls.tophead_odia" %>
<div class="row">
    <div class="col-lg-12 outertop">
        <div class="col-md-6 col-sm-12 col-xs-12  ptop10">
            <p class="support"><i class="fa fa-headphones pright5"></i>For Queries and Customer Support <span class="tollfree">0674-6580 111/222</span><span id="demo"></span>     </p>
        </div>
        <div class="col-md-6 col-sm-12 col-xs-12 ptop10 pull-right">
            <div class="col-sm-3 col-xs-6 pleft0">
                <a href="/g2c/forms/dashboardReports.aspx">
                <div class="dshbrdBtn"><i class="fa fa-tachometer"></i> <b> &nbsp; Dashboard </b></div></a>
            </div>
            <div class="col-sm-3 col-xs-6 pleft0">
               <a href="/g2c/pdf/CMGI_BROCHURE.pdf" target="_blank"> <div class="cmgipdfBtn"><i class="fa fa-file-pdf-o"></i> <b> CMGI Brochure</b></div><%--<img src="/g2c/img/cmgi_achievement_icon.png" alt="CMGI Brochure,Odisha" class="img-responsive"/>--%></a>
                <%--<div class="tsize">
                    <a href="javascript:ts('body',-1)" class="decrs-font">-A</a> <a href="#" class="normal-size">A=</a> <a href="javascript:ts('body',1)" class="incrs-font">A+</a></div>--%>
            </div>
            <div class="col-sm-4 col-xs-12 talgnright">
                <div class="langbxhld">
                    <select name="chooselang" id="chooselang" class="searchbox">
                        <option value="1">English</option>
                        <option value="2">Odia</option>
                    </select>
                </div>
            </div>
            <div class="col-xs-12 col-sm-2 pleft0 pright0">
                <div class="lgnbtn_hold">
                    <% if (Session["LoginID"] == null || (string)Session["LoginID"] == "")
                        {%>
                    <a href="/Account/Login">
                        <div class="lgnbtn">LOGIN <i class="fa fa-unlock-alt"></i></div>
                    </a>
                    <% } %>
                    <% else
                        { %>
                    <% if (Session["Id"] != null && Session["Id"].ToString() == "GuestUser")
                        {%>
                    <a href="/Account/Login">
                        <div class="lgnbtn"><span style="font-size:12px;">Guest User</span> <i class="fa fa-unlock-alt"></i></div>
                    </a>
                    <% } %>
                    <% else
                        { %>
                    <a href="/Account/LogOff">
                        <div class="lgnbtn">Logout<i class="fa fa-unlock-alt pleft5"></i></div>
                    </a>
                    <% }%>
                    <% }%>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="str1 str_wrap ptop10 topmarquee_bg" style="height: 40px;"><div class="str_move str_origin" style="left: 847.95px;">&nbsp; &nbsp;&nbsp; &nbsp; <img src="/g2c/img/NewAlt.gif" alt="Latest News" width="25"/> &nbsp; "Spot Admission : Application for Spot Admission in UG Courses will be accepted from 3rd August 2017 to 9th August 2017"&nbsp;&nbsp; &nbsp;&nbsp;  &nbsp;&nbsp;<img src="/g2c/img/NewAlt.gif" alt="Latest News" width="25"/> &nbsp;Candidates called for  UG counselling & Admission to bring Intimation - cum Rank Card, Form - B, original and photocopy of relevant documents and photographs. &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;</div></div>

<%--<div class="str1 str_wrap ptop10 topmarquee_bg" style="height: 40px;"><div class="str_move str_origin" style="left: 847.95px;">&nbsp; &nbsp; <img src="/g2c/img/NewAlt.gif" alt="Latest News" width="25"/> Submission of Form - B for OUAT UG Admission- 2017 date extended till 25.06.2017 &nbsp; &nbsp;| &nbsp; &nbsp;Candidates seeking correction in domicile and reservation details in Form - B to send e- mail to <a href="mailto:coeouat@gmail.com" style="color:#FFFF4D; text-decoration:underline;">coeouat@gmail.com</a>  or submit application to Controller of examination, OUAT latest by 22.06.2017 &nbsp; &nbsp;</div></div>--%>
<%--<div class="str1 str_wrap ptop10 topmarquee_bg" style="height: 40px;"><div class="str_move str_origin" style="left: 847.95px;">&nbsp; &nbsp; <img src="/g2c/img/NewAlt.gif" alt="Latest News" width="25"> Candidate can apply for OUAT Common Entrance Exam 2017 by providing Aadhaar Enrollment No. also.</div></div>--%>
<%--<div class="str1 str_wrap ptop10 topmarquee_bg">&nbsp; &nbsp; <img src="/g2c/img/NewAlt.gif" alt="Latest News" width="25">"Advertisement for written examination for the post of
Constables in 9th India Reserve Battalion (Specialised)." <a href="/pdf/writtenExamination_IRBS_English.PDF" style="background-color: #e53935;
    color: #fff; padding: 5px 8px; border-radius: 2px; font-size:12px;"><i class="fa fa-download mtop10"></i> Download PDF (English Version)</a>  <a href="/pdf/writtenExamination_IRBS_Odia.PDF" style="background-color: #e53935;
    color: #fff; padding: 5px 8px; border-radius: 2px; font-size:12px;"><i class="fa fa-download mtop10"></i> Download PDF (Odia Version)</a> <img src="/g2c/img/NewAlt.gif" alt="Latest News" width="25">Notice of Written Examination for Recruitment of Constables in 9<sup>th</sup> India Reserve Battalion (Specialised) will be held on 09.04.2017 <a href="/pdf/writtenExamination_IRBS_English.PDF" style="background-color: #e53935;
    color: #fff; padding: 5px 8px; border-radius: 2px; font-size:12px;"><i class="fa fa-download mtop10"></i> Download PDF (English Version)</a>  <a href="/pdf/writtenExamination_IRBS_Odia.PDF" style="background-color: #3498db;
    color: #fff; padding: 5px 8px; border-radius: 2px; font-size:12px;"><i class="fa fa-download mtop10"></i> Download PDF (Odia Version)</a>  &nbsp;  &nbsp;  <img src="/g2c/img/NewAlt.gif" alt="Latest News" width="25"> Guidance to Fill OMR Answer Sheet <a href="/pdf/guidance_for_omr_answersheet.pptx" style="background-color: #3498db; color: #fff; padding: 5px 8px; border-radius: 2px; font-size: 13px;"><i class="fa fa-file-text-o"></i> Download PPT</a> &nbsp; &nbsp; <a href="#" onClick="MyWindow=window.open('https://youtu.be/vdFCOu90fcY','MyWindow','toolbar=no,location=no,directories=no,status=no, menubar=no,scrollbars=no,resizable=no,width=600,height=300'); return false;"target="_blank" style="background-color: #e53935; color: #fff; padding: 5px 8px; border-radius: 2px; font-size: 13px;"><i class="fa fa-youtube-play"></i> Watch This Video</a> &nbsp;  &nbsp;  <img src="/g2c/img/NewAlt.gif" alt="Latest News" width="25"> Route Map How to Reach Written Exam Venue 9th SIRB 2016-17 <a href="#" onClick="MyWindow=window.open('https://youtu.be/d7Vi-rkj1K8','MyWindow','toolbar=no,location=no,directories=no,status=no, menubar=no,scrollbars=no,resizable=no,width=600,height=300'); return false;"target="_blank" style="background-color: #e53935; color: #fff; padding: 5px 8px; border-radius: 2px; font-size: 13px;"><i class="fa fa-youtube-play"></i> Check This Video</a></div>--%>
