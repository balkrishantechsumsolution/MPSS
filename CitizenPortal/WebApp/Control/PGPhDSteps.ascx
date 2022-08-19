<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PGPhDSteps.ascx.cs" Inherits="CitizenPortal.WebApp.Control.PGPhDSteps" %>
<style>
    .custom-breadcrumb {
        list-style: none;
        overflow: hidden;
    }

        .custom-breadcrumb li {
            text-decoration: none;
            padding: 10px 0 10px 50px;
            position: relative;
            display: block;
            float: left;
            margin: 15px 0;
        }

            .custom-breadcrumb li:after {
                content: " ";
                display: block;
                width: 0;
                height: 0;
                border-top: 50px solid transparent;
                border-bottom: 50px solid transparent;
                position: absolute;
                top: 50%;
                margin-top: -50px;
                left: 100%;
                z-index: 2;
            }

            .custom-breadcrumb li:before {
                content: " ";
                display: block;
                width: 0;
                height: 0;
                border-top: 50px solid transparent;
                border-bottom: 50px solid transparent;
                border-left: 30px solid white;
                position: absolute;
                top: 50%;
                margin-top: -50px;
                margin-left: 1px;
                left: 100%;
                z-index: 1;
            }

    .blue-crumb {
        background-color: #2980b9;
        color: white;
    }

        .blue-crumb:after {
            border-left: 30px solid #2980b9;
        }

    .gray-crumb {
        background-color: #bdc3c7;
    }

        .gray-crumb:after {
            border-left: 30px solid #bdc3c7;
        }

    .light-blue-crumb:after {
        border-left: 30px solid #3498db;
    }

    .light-blue-crumb {
        background: #3498db;
        color: white;
    }

    .faded-crumb:after {
        border-left: 30px solid #ecf0f1;
    }

    .faded-crumb {
        background: #ecf0f1;
        color: #95a5a6;
    }

    .current {
        background-color: #2980b9;
        color: white;
    }

        .current:after {
            border-left: 30px solid #2980b9;
        }

    .stepnum {
        float: left;
        font-size: 40px;
        font-weight: bold;
        margin: -4px 5px 0 0;
    }

    .stepheading {
        font-size: 15px;
        font-weight: bold;
    }

    .stepsubheading {
        font-size: 12px;
    }

    #liDC {
        padding-left: 20px;
    }

    .auto-style1 {
        font-size: 15px;
        color: #FFFFFF;
    }
</style>


    <ul class="custom-breadcrumb">
        <li id="liDC" class="faded-crumb">
            <div class="stepnum">1</div>
            <div style="float: right; margin: 7px 0px">
                <span class="stepheading">Registration & Submit Application</span><br />
                <span class="stepsubheading">Login Creation & Submission of Application</span>
            </div>
        </li>
        <li id="liME" class="gray-crumb">
            <div class="stepnum">2</div>
            <div style="float: right; margin: 7px 0px">
                <span class="stepheading">Upload Document</span><br />
                <span class="stepsubheading">Upload supporting document</span>
            </div>
        </li>
        <li id="liDP" class="gray-crumb">
            <div class="stepnum">3</div>
            <div style="float: right; margin: 7px 0px">
                <span class="stepheading">Payment</span><br />
                <span class="stepsubheading">Online Payment of Entrance fee</span>
            </div>
        </li>
        <li id="liDA" class="gray-crumb">
            <div class="stepnum">4</div>
            <div style="float: right; margin: 7px 0px">
                <span class="stepheading">Acknowledgement</span><br />
                <span class="stepsubheading">Print submitted application</span>
            </div>
        </li>

    </ul>

