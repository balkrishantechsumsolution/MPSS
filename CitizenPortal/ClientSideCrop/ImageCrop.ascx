<%@ Control Language="C#" AutoEventWireup="true" Inherits="ImageCrop" EnableViewState="true" Codebehind="ImageCrop.ascx.cs" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <style type="text/css">

      img 
        {
            border: none;
        }
        a 
        {
            color: #0052af;
        }       
        
        /*------------------POPUPS------------------------*/
        #fade 
        {
	        display: none;
	        background: #000; 
	        position: fixed; 
	        left: 0; 
	        top: 0; 
	        width: 100%; 
	        height: 100%;
	        opacity: .60;
	        z-index: 9999;
        }
        .popup_block
        {
        
	        display: none;
	        height:620px;
	        background: bluemask;
	        padding: 15px; 	
	        float: left;
	        font-size: 1.2em;
	        position: fixed;
	        top: 46%; 
	        left: 50%;
	        z-index: 999999;
	    
        }
        img.btn_close 
        {
	        float: right; 
	        margin: 2% -0px 0 750px;
	        position:absolute;
        }

</style>

  <script type="text/javascript">  
    function UploadMenuItemImage()
    {            
        RequestServer('None', 'ImageUpload');         
    }
    
    function ReceiveServerData(result, context)
    { 
        var FinalId;
         var id=result.split("=");
         var FinalResult= id[1].split("&");        
         document.getElementById("<%=hdntemp.ClientID %>").value = FinalResult[0];
        var randomnumber=Math.floor(Math.random()*11);
        document.getElementById("<%=imgSample.ClientID %>").src= result + '?rnd=' + randomnumber;
    }  
    </script>
</head>
<body>
    <asp:Label ID="lblMsg" runat="server" ForeColor="Red" Visible="False"></asp:Label>
    <center>
        <div id="content">
            <div class="post" >
                <table border="1" align="center" cellpadding="5" cellspacing="0" bordercolor="#cdcdcd"
                    style="border-collapse: collapse;">
                    <tr>
                        <td align="center">
                            <asp:Image ID="imgSample"  runat="server" BorderWidth="1px"  Width="120px"  ImageUrl="/Quick Links/Crop/NotFound.jpg"  />
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2">
                            <a id="Security" runat="server" href="/ClientSideCrop/CropImage.aspx" rel="popup1" class="poplight"
                                style="font: normal 10px Verdana, Arial, Helvetica, sans-serif;">Upload Image
                                </a>
                                </td>
                    </tr>
                </table>
                <asp:HiddenField ID="hdntemp" runat="server"  />
            </div>
        </div>
    </center>
    <div id="popup1" class="popup_block">
        <iframe id="frmImage" scrolling="no" src="/ClientSideCrop/CropImage.aspx" runat="server"
            allowtransparency="true" style="width: 100%; height: 100%; background-color: Transparent;"
            frameborder="0"></iframe>
    </div>
    
    <script type="text/javascript" src="/ClientSideCrop/Scripts/jquery.min.js"></script>

    <script type="text/javascript">

    $(document).ready(OnReady);

    function OnReady()
    {
    
        //When you click on a link with class of poplight and the href starts with a # 
        $('a.poplight').click(onPopUpClick);   
        //Close Popups and Fade Layer 
        $('a.close, #fade').live('click', onCloseClick);
    }
						   		   
	//When you click on a link with class of poplight and the href starts with a # 
	function onPopUpClick() 
	{	
		var popID = $(this).attr('rel'); //Get Popup Name		
		var popURL = $(this).attr('href'); //Get Popup href to define size			
		
        var popWidth = 800; 
		
		//Fade in the Popup and add close button
        $('#' + popID).fadeIn().css({ 'width': Number(popWidth) }).prepend('<a onclick="onCloseClick();" class="close"><img src="/Quick Links/Crop/close_pop.png" width="40px" height="40px" class="tclose" title="Close Window" alt="Close" /></a>');
		
		//Define margin for center alignment (vertical + horizontal) - we add 80 to the height/width to accomodate for the padding + border width defined in the css
		var popMargTop = ($('#' + popID).height()) / 2;
		var popMargLeft = ($('#' + popID).width()) / 2;
		//Apply Margin to Popup
		$('#' + popID).css({ 
			'margin-top' : -popMargTop,
			'margin-left' : -popMargLeft
		});
		
		//Fade in Background
		$('body').append('<div id="fade"></div>'); //Add the fade layer to bottom of the body tag.
		$('#fade').css({'filter' : 'alpha(opacity=20)'}).fadeIn(); //Fade in the fade layer 
		
		return false;
	}
	
	
	//Close Popups and Fade Layer
	function onCloseClick() 
	{ 
	    //When clicking on the close or fade layer...
	    UploadMenuItemImage();
	  	$('#fade , .popup_block').fadeOut(OnFadeOut);
	  	return false;
	}
	  	
  	function OnFadeOut() 
  	{
		$('#fade, a.close').remove();  
    } 

    </script>

</body>
</html>
