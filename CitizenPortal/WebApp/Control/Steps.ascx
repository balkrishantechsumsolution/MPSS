<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Steps.ascx.cs" Inherits="CitizenPortal.WebApp.Control.Steps" %>
<style type="text/css">
    .stepfinish {
        background-color: rgb(81, 155, 3);
        border: 1px solid rgb(56, 102, 2);
    }

    .stepactive {
        background-color: rgb(255, 177, 27);
        border: 1px solid rgb(210, 138, 0);
    }
</style>
<div class="row">
    <div class="box-body box-body-open text-danger text-danger-green mt0">
        <div class="col-md-12" style="margin: 0 auto; width: 100%;">
            <div class="step1 stepfinish" id="step1">
                <p class="steptext">
                    1
                </p>
                <p class="optiontext">
                    Application Submited
                </p>
            </div>
            <div class="arrow-line">
            </div>
            <div class="step2 stepfinish" id="step2">
                <p class="steptext">
                    2
                </p>
                <p class="optiontext">
                    Payment Done
                </p>
            </div>
            <div class="arrow-line">
            </div>
            <div class="step3 stepfinish" id="step3">
                <p class="steptext">
                    3
                </p>
                <p class="optiontext">
                    Desk-1
                </p>
            </div>
            <div class="arrow-line">
            </div>
            <div class="step3 stepfinish" id="step4">
                <p class="steptext">
                    4
                </p>
                <p class="optiontext">
                    Desk-2
                </p>
            </div>
            <div class="arrow-line">
            </div>
            <div class="step3 stepfinish" id="step5">
                <p class="steptext">
                    5
                </p>
                <p class="optiontext">
                    Desk-3
                </p>
            </div>
            <div class="arrow-line">
            </div>
            <div class="step4 stepactive" id="step6">
                <p class="steptext">
                    6
                </p>
                <p class="optiontext">
                    Digitally Signing
                </p>
            </div>
            <div class="arrow-line">
            </div>
            <div class="step5" id="step7">
                <p class="steptext">
                    7
                </p>
                <p class="optiontext">
                    Certificate Undelivered
                </p>
            </div>
        </div>
        <div class="clearfix">
        </div>
    </div>
</div>


