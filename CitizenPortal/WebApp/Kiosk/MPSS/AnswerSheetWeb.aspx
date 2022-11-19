<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/MPSSMaster.Master" AutoEventWireup="true" CodeBehind="AnswerSheetWeb.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.MPSS.AnswerSheetWeb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <meta http-equiv="Page-Enter" content="blendTrans(Duration=0.0)" />
    <meta http-equiv="Page-Exit" content="blendTrans(Duration=0.0)" />
   <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7"/>     
    <script type="text/javascript" src="../../Scripts/viewer.js"></script>
    <script src="//mozilla.github.io/pdf.js/build/pdf.js"></script>
    <%--  <script type="module" src="../../Scripts/pdfjs-3.0.279-dist/build/pdf.js"></script>
      <script type="module" src="../../Scripts/pdfjs-3.0.279-dist/build/pdf.worker.js"></script>
     <script type="module" src="../../Scripts/pdfjs-3.0.279-dist/build/pdf.sandbox.js"></script>--%>
      <script type="text/javascript" src="../../Scripts/jscolor.js"></script>
    <script type="text/javascript">   


        var pdfjsLib = window['pdfjs-dist/build/pdf'];

        pdfjsLib.GlobalWorkerOptions.workerSrc = '//mozilla.github.io/pdf.js/build/pdf.worker.js';

        var canvas;
        var ctx;
        var x = 75;
        var y = 50;
        //Width and Height of the canvas
        var WIDTH = 1024;
        var HEIGHT = 740;
        //    var dragok = false;
        //Global color variable which will be used to store the selected color name.
        var Colors = "";
        var newPaint = false;
        var DrawingTypes = "";

        //Circle default radius size
        var radius = 30;
        var radius_New = 30;

        // Rectangle array
        rect = {},
            //drag= false defult to test for the draging
            drag = false;

        // Array to store all the old Shanpes drawing details
        var rectStartXArray = new Array();
        var rectStartYArray = new Array();
        var rectWArray = new Array();
        var rectHArray = new Array();
        var rectColor = new Array();
        var DrawType_ARR = new Array();
        var radius_ARR = new Array();

        var Text_ARR = new Array();

        // Declared for the Free hand pencil Drawing.
        var prevX = 0,
            currX = 0,
            prevY = 0,
            currY = 0;


        var myState = {
            pdf: null,
            currentPage: 1,
            zoom: 1
        }



        var url = 'http://localhost:53056/WebApp/Kiosk/MPSS/canvasImages/R100H320620200070_9.pdf';
        // Asynchronous download of PDF
        var loadingTask = pdfjsLib.getDocument(url);
        loadingTask.promise.then(function (pdf) {
            console.log('PDF loaded');

            // Fetch the first page
            var pageNumber = 1;
            pdf.getPage(pageNumber).then(function (page) {
                console.log('Page loaded');

                var scale = 1.5;
                var viewport = page.getViewport({ scale: scale });

                // Prepare canvas using PDF page dimensions
                var canvas = document.getElementById('canvas');
                var context = canvas.getContext('2d');
                canvas.height = viewport.height;
                canvas.width = viewport.width;

                // Render PDF page into canvas context
                var renderContext = {
                    canvasContext: context,
                    viewport: viewport
                };
                var renderTask = page.render(renderContext);
                renderTask.promise.then(function () {
                    console.log('Page rendered');
                });
            });
        }, function (reason) {
            // PDF loading error
            console.error(reason);
        }); document.getElementById('zoom_in').addEventListener('click', (e) => {
            if (myState.pdf == null) return;
            myState.zoom += 0.5;
            render();
        });

        document.getElementById('zoom_out').addEventListener('click', (e) => {
            if (myState.pdf == null) return;
            myState.zoom -= 0.5;
            render();
        });
       

       

        //Initialize the Canvas and Mouse events for Canvas
        function init(DrawType) {
            newPaint = true;
            canvas = document.getElementById("canvas");
            x = 5;
            y = 5;
            DrawingTypes = DrawType;
            ctx = canvas.getContext("2d");
            radius = 30;
            radius_New = radius;
            canvas.addEventListener('mousedown', mouseDown, false);
            canvas.addEventListener('mouseup', mouseUp, false);
            canvas.addEventListener('mousemove', mouseMove, false);


            renderPDF(url, canvas);

            return setInterval(draw, 10);
        }

        //Mouse down event method
        function mouseDown(e) {
            rect.startX = e.pageX - this.offsetLeft;
            rect.startY = e.pageY - this.offsetTop;
            radius_New = radius;
            prevX = e.clientX - canvas.offsetLeft;
            prevY = e.clientY - canvas.offsetTop;
            currX = e.clientX - canvas.offsetLeft;
            currY = e.clientY - canvas.offsetTop;
            drag = true;
        }

        //Mouse UP event Method
        function mouseUp() {
            rectStartXArray[rectStartXArray.length] = rect.startX;
            rectStartYArray[rectStartYArray.length] = rect.startY;
            rectWArray[rectWArray.length] = rect.w;
            rectHArray[rectHArray.length] = rect.h;
            Colors = document.getElementById("SelectColor").value;
            rectColor[rectColor.length] = "#" + Colors;
            DrawType_ARR[DrawType_ARR.length] = DrawingTypes
            radius_ARR[radius_ARR.length] = radius_New;
            Text_ARR[Text_ARR.length] = $('#txtInput').val();
            drag = false;

        }


        //mouse Move Event method
        function mouseMove(e) {
            if (drag) {
                rect.w = (e.pageX - this.offsetLeft) - rect.startX;

                rect.h = (e.pageY - this.offsetTop) - rect.startY;

                drawx = e.pageX - this.offsetLeft;
                drawy = e.pageY - this.offsetTop;

                prevX = currX;
                prevY = currY;
                currX = e.clientX - canvas.offsetLeft;
                currY = e.clientY - canvas.offsetTop;
                if (drag = true) {
                    radius_New += 2;

                }
                draw();
                if (DrawingTypes == "FreeDraw" || DrawingTypes == "Erase") {
                }
                else {
                    ctx.clearRect(0, 0, canvas.width, canvas.height);
                }

            }

            drawOldShapes();
        }

        //Darw all Shaps,Text and add images 
        function draw() {

            ctx.beginPath();
            Colors = document.getElementById("SelectColor").value;
            ctx.fillStyle = "#" + Colors;
            switch (DrawingTypes) {
                case "FillRect":
                    ctx.rect(rect.startX, rect.startY, rect.w, rect.h);
                    break;
                case "FillCircle":
                    ctx.arc(rect.startX, rect.startY, radius_New, rect.w, rect.h);
                    break;
                case "Images":
                    ctx.drawImage(imageObj, rect.startX, rect.startY, rect.w, rect.h);

                    break;
                case "DrawText":
                    ctx.font = '40pt Calibri';

                    ctx.fillText($('#txtInput').val(), rect.startX, rect.startY);

                    break;
                case "FreeDraw":
                    ctx.beginPath();
                    ctx.moveTo(prevX, prevY);
                    ctx.lineTo(currX, currY);
                    ctx.strokeStyle = "#" + Colors;
                    ctx.lineWidth = $('#selSize').val();
                    ctx.stroke();
                    ctx.closePath();
                    //                ctx.beginPath();
                    //                ctx.moveTo(drawx, drawy);
                    //                ctx.rect(drawx, drawy,  6, 6);
                    //                ctx.fill();
                    break;

                case "Erase":


                    ctx.beginPath();
                    ctx.moveTo(prevX, prevY);
                    ctx.lineTo(currX, currY);
                    ctx.strokeStyle = "#FFFFFF";
                    ctx.lineWidth = 6;
                    ctx.stroke();
                    ctx.closePath();
                    //                ctx.beginPath();
                    //                ctx.moveTo(drawx, drawy);
                    //                ctx.rect(drawx, drawy,  6, 6);
                    //                ctx.fill();
                    break;
            }

            ctx.fill();
            // ctx.stroke();
        }

        //Redraw all shapes and images
        function drawOldShapes() {
            if (DrawingTypes == "ClearAll") {
                return;
            }
            for (var i = 0; i < rectStartXArray.length; i++) {
                if (rectStartXArray[i] != rect.startX && rectStartYArray[i] != rect.startY && rectWArray[i] != rect.w && rectHArray[i] != rect.h) {
                    ctx.beginPath();
                    ctx.fillStyle = rectColor[i];
                    // ctx.rect(rectStartXArray[i], rectStartYArray[i], rectWArray[i], rectHArray[i]);

                    switch (DrawType_ARR[i]) {
                        case "FillRect":
                            ctx.rect(rectStartXArray[i], rectStartYArray[i], rectWArray[i], rectHArray[i]);
                            break;
                        case "FillCircle":
                            ctx.arc(rectStartXArray[i], rectStartYArray[i], radius_ARR[i], rectWArray[i], rectHArray[i]);
                            break;
                        case "Images":
                            ctx.drawImage(imageObj, rectStartXArray[i], rectStartYArray[i], rectWArray[i], rectHArray[i]);
                            break;
                        case "DrawText":
                            ctx.font = '40pt Calibri';

                            ctx.fillText(Text_ARR[i], rectStartXArray[i], rectStartYArray[i]);

                            break;
                    }
                    ctx.fill();
                    // ctx.stroke();
                }
            }
        }

        //Save as Image file     
        function ShanuSaveImage() {
            var m = confirm("Are you sure to Save ");
            if (m) {
                // generate the image data     
                var image_NEW = document.getElementById("canvas").toDataURL("image/png");
                image_NEW = image_NEW.replace('data:image/png;base64,', '');
                $.ajax({
                    type: 'POST',
                    url: '/WebApp/Kiosk/MPSS/AnswerSheetWeb.aspx/SaveImage',
                    data: '{ "imageData" : "' + image_NEW + '" }',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (msg) {
                        alert('Image saved to your root Folder !');
                    }
                });
            }
        }
        //new Canvas Drawing
        function ClearAll() {
            var m = confirm("Are you sure to clear All ");
            if (m) {
                DrawingTypes = "ClearAll";
                rectStartXArray.length = 0;
                rectStartYArray.length = 0;
                rectWArray.length = 0;
                rectHArray.length = 0;

                rectColor.length = 0;
                DrawType_ARR.length = 0
                radius_ARR.length = 0;
                ctx.clearRect(0, 0, canvas.width, canvas.height);
            }
        }
        $(document).ready(function () {
            ShanuSaveImage();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="page-wrapper" style="min-height: 500px !important;">
        <div class="row">
            <div class="col-lg-12 cscPgehd">
                <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>Answer Sheet Viewer</h2>
            </div>
        </div>


        <div  runat="server" id="divCollege">




            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">



              


                <table width="99%" class="search">
                    <tr>

                        <td class="search_es">New Draw
                        </td>
                        <td class="form_es">
                            <img src="canvasImages/New.png" onclick="ClearAll()" />
                            <%-- <INPUT TYPE ="Button" VALUE=" Clear ALL " onClick="ClearAll()">--%>
                        </td>

                        <td class="search_es">Select Color</td>
                        <td class="form_es">
                            <%--  <input type="color" id="favcolor"> --%>
                            <input class="color" value="FF1251" id="SelectColor">
                        </td>

                        <td class="search_es">Fill Rectange</td>
                        <td class="form_es">
                            <img src="canvasImages/rect.png" onclick="init('FillRect')" />
                            <%--<INPUT TYPE ="Button" id="btnFillRect" VALUE=" FillRect " onClick="init('FillRect')">--%>
                        </td>

                        <td class="search_es">Fill Circle</td>
                        <td class="form_es">
                            <img src="canvasImages/Circle.png" onclick="init('FillCircle')" />
                            <%--<INPUT TYPE ="Button" id="btnFillCircle" VALUE=" Circle " onClick="init('FillCircle')">--%>
                        </td>

                        <td class="search_es">Text</td>
                        <td class="form_es">
                            <input type="text" id="txtInput" value="SHANU" />
                        </td>
                        <td class="form_es">
                            <img src="canvasImages/Font.png" onclick="init('DrawText')" />
                            <%-- <INPUT TYPE ="Button" id="btnText" VALUE=" Text " onClick="init('DrawText')">--%>
                        </td>
                        <td class="search_es">Stroke Size</td>
                        <td class="form_es">
                            <select id="selSize">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4" selected="selected">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                            </select>
                        </td>
                        <td class="search_es">Pencil</td>
                        <td class="form_es">
                            <img src="canvasImages/Pencil.png" onclick="init('FreeDraw')" />
                            <%-- <INPUT TYPE ="Button" id="btnDraw" VALUE=" Draw " onClick="init('FreeDraw')">--%>
                        </td>

                        <td class="search_es">Add Image</td>
                        <td class="form_es">
                            <img src="canvasImages/Image.png" onclick="init('canvasImages')" />
                            <%--  <INPUT TYPE ="Button" id="btnImage" VALUE=" canvasImages " onClick="init('canvasImages')">--%>
                        </td>
                        <td class="search_es">Save Image
                        </td>
                        <td class="form_es">
                            <img src="canvasImages/Save.png" onclick="ShanuSaveImage()" />
                            <%--    <INPUT TYPE ="Button" VALUE=" SaveImage " onClick="ShanuSaveImage()">--%>
                        </td>


                        <%-- <td class="search_es">Erase</td>
    <td class="form_es"> <INPUT TYPE ="Button" id=btnErase" VALUE=" Erase " onClick="init('Erase')"></td>--%>
                    </tr>
                </table>


                <section style="border-style: solid; border-width: 2px; width: 1024px;height:750px">
                     
                 
                      <div id="canvas_container">
            <canvas id="canvas"  style="border-style: solid; border-width: 2px; width: 1024px;height:750px;scroll-behavior:auto" ></canvas>
        </div>
 
        <div id="navigation_controls">
            <button id="go_previous">Previous</button>
            <input id="current_page" value="1" type="number"/>
            <button id="go_next">Next</button>
        </div>
 
        <div id="zoom_controls">  
            <button id="zoom_in">+</button>
            <button id="zoom_out">-</button>
        </div>

                </section>


                <input type="hidden" name="imageData" id="imageData" runat="server" />
            </div>
        </div>



    </div>



</asp:Content>
