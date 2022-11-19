<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Citizen/Master/Citizen.Master" AutoEventWireup="true" CodeBehind="eLibrary.aspx.cs" Inherits="CitizenPortal.WebApp.Citizen.Forms.eLibrary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"/>--%>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <style>
        .tabs-left, .tabs-right {
            border-bottom: none;
            padding-top: 2px;
        }

        .tabs-left {
            /*border-right: 1px solid #ddd;*/
        }

        .tabs-right {
            border-left: 1px solid #ddd;
        }

            .tabs-left > li, .tabs-right > li {
                float: none;
                margin-bottom: 2px;
                border: 1px solid #ddd;
                border-radius: 4px 4px 0px 4px;
            }

        .tabs-left > li {
            margin-right: -1px;
        }

        .tabs-right > li {
            margin-left: -1px;
        }

        .tabs-left > li.active > a,
        .tabs-left > li.active > a:hover,
        .tabs-left > li.active > a:focus {
            border-bottom-color: #ddd;
            border-right-color: transparent;
        }

        .tabs-right > li.active > a,
        .tabs-right > li.active > a:hover,
        .tabs-right > li.active > a:focus {
            border-bottom: 1px solid #ddd;
            border-left-color: transparent;
        }

        .tabs-left > li > a {
            border-radius: 4px 4px 4px 4px;
            margin-right: 0;
            display: block;
            color: #000;
        }

        .tabs-left > li:hover,
        .tabs-left > li:focus {
            color: #fcfcfc;
            background-color: #d9d9d9;
        }

        .tabs-right > li > a {
            border-radius: 4px 4px 4px 4px;
            margin-right: 0;
        }

        .vertical-text {
            margin-top: 50px;
            border: none;
            position: relative;
        }

            .vertical-text > li {
                height: 20px;
                width: 120px;
                margin-bottom: 100px;
            }

                .vertical-text > li > a {
                    border-bottom: 1px solid #ddd;
                    border-right-color: transparent;
                    text-align: center;
                    border-radius: 4px 4px 0px 0px;
                }

                .vertical-text > li.active > a,
                .vertical-text > li.active > a:hover,
                .vertical-text > li.active > a:focus {
                    border-bottom-color: transparent;
                    border-right-color: #ddd;
                    border-left-color: #ddd;
                }

            .vertical-text.tabs-left {
                left: -50px;
            }

            .vertical-text.tabs-right {
                right: -50px;
            }

                .vertical-text.tabs-right > li {
                    -webkit-transform: rotate(90deg);
                    -moz-transform: rotate(90deg);
                    -ms-transform: rotate(90deg);
                    -o-transform: rotate(90deg);
                    transform: rotate(90deg);
                }

            .vertical-text.tabs-left > li {
                -webkit-transform: rotate(-90deg);
                -moz-transform: rotate(-90deg);
                -ms-transform: rotate(-90deg);
                -o-transform: rotate(-90deg);
                transform: rotate(-90deg);
            }

        .tab-content {
            /*min-height:500px;
            overflow:auto;
            border:1px solid re*/ d;
        }

        .nav-tabs {
            border-bottom: 1px solid #ddd;
            /*background-color: #ccc;*/
            color: #000;
        }

            .nav-tabs > li.active > a, .nav-tabs > li.active > a:focus, .nav-tabs > li.active > a:hover {
                color: #fff;
                cursor: default;
                background: #FF9326;
                background: -webkit-linear-gradient(#bdb8b4, #979492);
                background: -o-linear-gradient(#bdb8b4, #979492);
                background: -moz-linear-gradient(#bdb8b4, #979492);
                background: linear-gradient(#bdb8b4, #979492);
                /* background-color: #FF9326; */
            }

        .book-icon {
            
        }
        .nav-tabs > li.active > a {
            min-height: 60px !important;
        }
            .book-icon > a > img {
                margin: 5px;
                width: 100%;
                text-align: center;
            }

            .book-icon > a > p {
                text-wrap: normal;
                text-align: center;
            }

        .tabs-left > li > a > img {
            float: left;
            margin: 5px;
            width: 25px;
            height: 27px;
            text-align: center;
        }
    </style>
    <script>
        function OpenBook(url, name) {
            var newwindow;
            newwindow = window.open(url, name, 'height=1000,width=650,left=50,top=50');
            if (window.focus) { newwindow.focus() }
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="page-wrapper" style="min-height: 329px;">
        <div class="row">
            <div class="col-lg-12 cscPgehd">
                <h2 class="form-heading"><i class="fa fa-book"></i>e-Library </h2>
            </div>
        </div>

        <div class="row">
            <div class="row" style="min-height: 300px;">
                <div class="col-sm-12">

                    <div class="col-xs-3">
                        <!-- required for floating -->
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs tabs-left">
                            <li class="active"><a data-toggle="tab" href="#1">
                                <img src="../../../eBooks/Mcgraw.png"
                                    title="Times Mirror High Education Group, Chicago" />Times Mirror High Education Group, Chicago</a></li>
                            <li><a data-toggle="tab" href="#2">
                                <img src="../../../eBooks/Abacus.png"
                                    title="Abacus" />Abacus</a></li>
                            <li><a data-toggle="tab" href="#3">
                                <img src="../../../eBooks/Academic.png"
                                    title="Academic Publishers Kolkata" />Academic Publishers Kolkata</a></li>
                            <li><a data-toggle="tab" href="#4">
                                <img src="../../../eBooks/Addison.jpg"
                                    title="Addison-Wesley Professional" />Addison-Wesley Professional </a></li>
                            <li><a data-toggle="tab" href="#5">
                                <img src="../../../eBooks/East–West.png"
                                    title="Affiliated East–West Press" />Affiliated East–West Press</a></li>
                            <li><a data-toggle="tab" href="#6">
                                <img src="../../../eBooks/Mcgraw.png"
                                    title="Agrawal publications Agra" />Agrawal publications Agra</a></li>
                            <li><a data-toggle="tab" href="#7">
                                <img src="../../../eBooks/Almetto.png"
                                    title="Almetto, GA, U.S.A." />Almetto, GA, U.S.A.</a></li>
                            <li><a data-toggle="tab" href="#8">
                                <img src="../../../eBooks/Chandra.png"
                                    title="AM & Chandra Satish" />AM & Chandra Satish </a></li>
                            <li><a data-toggle="tab" href="#9">
                                <img src="../../../eBooks/Amazing.png"
                                    title="Amazing Reads" />Amazing Reads</a></li>
                            <li><a data-toggle="tab" href="#10">
                                <img src="../../../eBooks/Ananda.png"
                                    title="Ananda Book Depot" />Ananda Book Depot</a></li>
                        </ul>
                    </div>
                    <div class="col-xs-9">
                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div class="tab-pane active" data-toggle="tab" id="1">
                                <h4>Times Mirror High Education Group, Chicago</h4>
                                <div class="row">
                                    <div class="book-icon col-sm-2" onclick="javascript: OpenBook('../../../eBooks/Machine Drawing 3rd Edition ( PDFDrive ).pdf','Design of Integrated Circuits for Optical Comunication');">
                                        <a href="../../../eBooks/Machine Drawing 3rd Edition ( PDFDrive ).pdf" target="_blank">
                                            <img src="../../../eBooks/Mcgraw%20hills%20ebook.png"
                                                title="Design of Integrated Circuits for Optical Comunication" />
                                        </a>
                                    </div>
                                    <div class="book-icon col-sm-2" onclick="javascript: OpenBook('../../../eBooks/Machine Drawing 3rd Edition ( PDFDrive ).pdf','Design of Integrated Circuits for Optical Comunication');">
                                        <a href="../../../eBooks/Machine Drawing 3rd Edition ( PDFDrive ).pdf" target="_blank">
                                            <img src="../../../eBooks/Mcgraw%20hills%20ebook.png"
                                                title="Design of Integrated Circuits for Optical Comunication" />
                                        </a>
                                    </div>
                                    <div class="book-icon col-sm-2" onclick="javascript: OpenBook('../../../eBooks/Machine Drawing 3rd Edition ( PDFDrive ).pdf','Design of Integrated Circuits for Optical Comunication');">
                                        <a href="../../../eBooks/Machine Drawing 3rd Edition ( PDFDrive ).pdf" target="_blank">
                                            <img src="../../../eBooks/Mcgraw%20hills%20ebook.png"
                                                title="Design of Integrated Circuits for Optical Comunication" />
                                        </a>
                                    </div>
                                    <div class="book-icon col-sm-2" onclick="javascript: OpenBook('../../../eBooks/Machine Drawing 3rd Edition ( PDFDrive ).pdf','Design of Integrated Circuits for Optical Comunication');">
                                        <a href="../../../eBooks/Machine Drawing 3rd Edition ( PDFDrive ).pdf" target="_blank">
                                            <img src="../../../eBooks/Mcgraw%20hills%20ebook.png"
                                                title="Design of Integrated Circuits for Optical Comunication" />
                                        </a>
                                    </div>
                                    <div class="book-icon col-sm-2" onclick="javascript: OpenBook('../../../eBooks/Machine Drawing 3rd Edition ( PDFDrive ).pdf','Design of Integrated Circuits for Optical Comunication');">
                                        <a href="../../../eBooks/Machine Drawing 3rd Edition ( PDFDrive ).pdf" target="_blank">
                                            <img src="../../../eBooks/Mcgraw%20hills%20ebook.png"
                                                title="Design of Integrated Circuits for Optical Comunication" />
                                        </a>
                                    </div>
                                    <div class="book-icon col-sm-2" onclick="javascript: OpenBook('../../../eBooks/Machine Drawing 3rd Edition ( PDFDrive ).pdf','Design of Integrated Circuits for Optical Comunication');">
                                        <a href="../../../eBooks/Machine Drawing 3rd Edition ( PDFDrive ).pdf" target="_blank">
                                            <img src="../../../eBooks/Mcgraw%20hills%20ebook.png"
                                                title="Design of Integrated Circuits for Optical Comunication" />
                                        </a>
                                    </div>
                                    <div class="book-icon col-sm-2" onclick="javascript: OpenBook('../../../eBooks/Machine Drawing 3rd Edition ( PDFDrive ).pdf','Design of Integrated Circuits for Optical Comunication');">
                                        <a href="../../../eBooks/Machine Drawing 3rd Edition ( PDFDrive ).pdf" target="_blank">
                                            <img src="../../../eBooks/Mcgraw%20hills%20ebook.png"
                                                title="Design of Integrated Circuits for Optical Comunication" />
                                        </a>
                                    </div>
                                    <div class="book-icon col-sm-2" onclick="javascript: OpenBook('../../../eBooks/Machine Drawing 3rd Edition ( PDFDrive ).pdf','Design of Integrated Circuits for Optical Comunication');">
                                        <a href="../../../eBooks/Machine Drawing 3rd Edition ( PDFDrive ).pdf" target="_blank">
                                            <img src="../../../eBooks/Mcgraw%20hills%20ebook.png"
                                                title="Design of Integrated Circuits for Optical Comunication" />
                                        </a>
                                    </div>
                                    <div class="book-icon col-sm-2" onclick="javascript: OpenBook('../../../eBooks/Machine Drawing 3rd Edition ( PDFDrive ).pdf','Design of Integrated Circuits for Optical Comunication');">
                                        <a href="../../../eBooks/Machine Drawing 3rd Edition ( PDFDrive ).pdf" target="_blank">
                                            <img src="../../../eBooks/Mcgraw%20hills%20ebook.png"
                                                title="Design of Integrated Circuits for Optical Comunication" />
                                        </a>
                                    </div>
                                    <div class="book-icon col-sm-2" onclick="javascript: OpenBook('../../../eBooks/Machine Drawing 3rd Edition ( PDFDrive ).pdf','Design of Integrated Circuits for Optical Comunication');">
                                        <a href="../../../eBooks/Machine Drawing 3rd Edition ( PDFDrive ).pdf" target="_blank">
                                            <img src="../../../eBooks/Mcgraw%20hills%20ebook.png"
                                                title="Design of Integrated Circuits for Optical Comunication" />
                                        </a>
                                    </div>
                                    <div class="book-icon col-sm-2" onclick="javascript: OpenBook('../../../eBooks/Machine Drawing 3rd Edition ( PDFDrive ).pdf','Design of Integrated Circuits for Optical Comunication');">
                                        <a href="../../../eBooks/Machine Drawing 3rd Edition ( PDFDrive ).pdf" target="_blank">
                                            <img src="../../../eBooks/Mcgraw%20hills%20ebook.png"
                                                title="Design of Integrated Circuits for Optical Comunication" />
                                        </a>
                                    </div>
                                    <div class="book-icon col-sm-2" onclick="javascript: OpenBook('../../../eBooks/Machine Drawing 3rd Edition ( PDFDrive ).pdf','Design of Integrated Circuits for Optical Comunication');">
                                        <a href="../../../eBooks/Machine Drawing 3rd Edition ( PDFDrive ).pdf" target="_blank">
                                            <img src="../../../eBooks/Mcgraw%20hills%20ebook.png"
                                                title="Design of Integrated Circuits for Optical Comunication" />
                                        </a>
                                    </div>

                                </div>
                            </div>
                            <div class="tab-pane" data-toggle="tab" id="2">
                                <h4>Abacus</h4>
                                <div class="book-icon col-sm-2" onclick="javascript: OpenBook('../../../eBooks/Machine Drawing 3rd Edition ( PDFDrive ).pdf','Design of Integrated Circuits for Optical Comunication');">
                                    <a href="../../../eBooks/Machine Drawing 3rd Edition ( PDFDrive ).pdf" target="_blank">
                                        <img src="../../../eBooks/Mcgraw%20hills%20ebook.png"
                                            title="Design of Integrated Circuits for Optical Comunication" />
                                    </a>
                                </div>
                                <div class="book-icon col-sm-2" onclick="javascript: OpenBook('../../../eBooks/Machine Drawing 3rd Edition ( PDFDrive ).pdf','Design of Integrated Circuits for Optical Comunication');">
                                    <a href="../../../eBooks/Machine Drawing 3rd Edition ( PDFDrive ).pdf" target="_blank">
                                        <img src="../../../eBooks/Mcgraw%20hills%20ebook.png"
                                            title="Design of Integrated Circuits for Optical Comunication" />
                                    </a>
                                </div>
                                <div class="book-icon col-sm-2" onclick="javascript: OpenBook('../../../eBooks/Machine Drawing 3rd Edition ( PDFDrive ).pdf','Design of Integrated Circuits for Optical Comunication');">
                                    <a href="../../../eBooks/Machine Drawing 3rd Edition ( PDFDrive ).pdf" target="_blank">
                                        <img src="../../../eBooks/Mcgraw%20hills%20ebook.png"
                                            title="Design of Integrated Circuits for Optical Comunication" />
                                    </a>
                                </div>
                                <div class="book-icon col-sm-2" onclick="javascript: OpenBook('../../../eBooks/Machine Drawing 3rd Edition ( PDFDrive ).pdf','Design of Integrated Circuits for Optical Comunication');">
                                    <a href="../../../eBooks/Machine Drawing 3rd Edition ( PDFDrive ).pdf" target="_blank">
                                        <img src="../../../eBooks/Mcgraw%20hills%20ebook.png"
                                            title="Design of Integrated Circuits for Optical Comunication" />
                                    </a>
                                </div>
                            </div>
                            <div class="tab-pane" data-toggle="tab" id="3">
                                <h4>Academic Publishers Kolkata</h4>
                                <div class="book-icon col-sm-2" onclick="javascript: OpenBook('../../../eBooks/Machine Drawing 3rd Edition ( PDFDrive ).pdf','Design of Integrated Circuits for Optical Comunication');">
                                    <a href="../../../eBooks/Machine Drawing 3rd Edition ( PDFDrive ).pdf" target="_blank">
                                        <img src="../../../eBooks/Mcgraw%20hills%20ebook.png"
                                            title="Design of Integrated Circuits for Optical Comunication" />
                                    </a>
                                </div>
                                <div class="book-icon col-sm-2" onclick="javascript: OpenBook('../../../eBooks/Machine Drawing 3rd Edition ( PDFDrive ).pdf','Design of Integrated Circuits for Optical Comunication');">
                                    <a href="../../../eBooks/Machine Drawing 3rd Edition ( PDFDrive ).pdf" target="_blank">
                                        <img src="../../../eBooks/Mcgraw%20hills%20ebook.png"
                                            title="Design of Integrated Circuits for Optical Comunication" />
                                    </a>
                                </div>
                                <div class="book-icon col-sm-2" onclick="javascript: OpenBook('../../../eBooks/Machine Drawing 3rd Edition ( PDFDrive ).pdf','Design of Integrated Circuits for Optical Comunication');">
                                    <a href="../../../eBooks/Machine Drawing 3rd Edition ( PDFDrive ).pdf" target="_blank">
                                        <img src="../../../eBooks/Mcgraw%20hills%20ebook.png"
                                            title="Design of Integrated Circuits for Optical Comunication" />
                                    </a>
                                </div>
                                <div class="book-icon col-sm-2" onclick="javascript: OpenBook('../../../eBooks/Machine Drawing 3rd Edition ( PDFDrive ).pdf','Design of Integrated Circuits for Optical Comunication');">
                                    <a href="../../../eBooks/Machine Drawing 3rd Edition ( PDFDrive ).pdf" target="_blank">
                                        <img src="../../../eBooks/Mcgraw%20hills%20ebook.png"
                                            title="Design of Integrated Circuits for Optical Comunication" />
                                    </a>
                                </div>
                                <div class="book-icon col-sm-2" onclick="javascript: OpenBook('../../../eBooks/Machine Drawing 3rd Edition ( PDFDrive ).pdf','Design of Integrated Circuits for Optical Comunication');">
                                    <a href="../../../eBooks/Machine Drawing 3rd Edition ( PDFDrive ).pdf" target="_blank">
                                        <img src="../../../eBooks/Mcgraw%20hills%20ebook.png"
                                            title="Design of Integrated Circuits for Optical Comunication" />
                                    </a>
                                </div>
                                <div class="book-icon col-sm-2" onclick="javascript: OpenBook('../../../eBooks/Machine Drawing 3rd Edition ( PDFDrive ).pdf','Design of Integrated Circuits for Optical Comunication');">
                                    <a href="../../../eBooks/Machine Drawing 3rd Edition ( PDFDrive ).pdf" target="_blank">
                                        <img src="../../../eBooks/Mcgraw%20hills%20ebook.png"
                                            title="Design of Integrated Circuits for Optical Comunication" />
                                    </a>
                                </div>
                                <div class="book-icon col-sm-2" onclick="javascript: OpenBook('../../../eBooks/Machine Drawing 3rd Edition ( PDFDrive ).pdf','Design of Integrated Circuits for Optical Comunication');">
                                    <a href="../../../eBooks/Machine Drawing 3rd Edition ( PDFDrive ).pdf" target="_blank">
                                        <img src="../../../eBooks/Mcgraw%20hills%20ebook.png"
                                            title="Design of Integrated Circuits for Optical Comunication" />
                                    </a>
                                </div>
                                <div class="book-icon col-sm-2" onclick="javascript: OpenBook('../../../eBooks/Machine Drawing 3rd Edition ( PDFDrive ).pdf','Design of Integrated Circuits for Optical Comunication');">
                                    <a href="../../../eBooks/Machine Drawing 3rd Edition ( PDFDrive ).pdf" target="_blank">
                                        <img src="../../../eBooks/Mcgraw%20hills%20ebook.png"
                                            title="Design of Integrated Circuits for Optical Comunication" />
                                    </a>
                                </div>
                            </div>
                            <div class="tab-pane" data-toggle="tab" id="4">
                                <h4>Addison-Wesley Professional </h4>
                            </div>
                            <div class="tab-pane" data-toggle="tab" id="5">
                                <h4>Affiliated East–West Press</h4>
                            </div>
                            <div class="tab-pane" data-toggle="tab" id="6">
                                <h4>Agrawal publications Agra</h4>
                            </div>
                            <div class="tab-pane" data-toggle="tab" id="7">
                                <h4>Almetto, GA, U.S.A.</h4>
                            </div>
                            <div class="tab-pane" data-toggle="tab" id="8">
                                <h4>AM & Chandra Satish </h4>
                            </div>
                            <div class="tab-pane" data-toggle="tab" id="9">
                                <h4>Amazing Reads</h4>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
