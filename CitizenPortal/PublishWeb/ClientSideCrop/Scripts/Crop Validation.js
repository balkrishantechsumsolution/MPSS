
    
    
    function ImagePreview() {
        
        var Form=document.getElementById("frmcrop");  
        if(!Photo_validate()){return false;};
        if(!GetFileSize()){return false;};
           Form.btnPhotoPreview.click();
          return true;
    } 
    function updateCoords(c)
    {
        var Form=document.getElementById("frmcrop");  
        var X =Form.X;
        var Y =Form.Y;
        var W =Form.W;
        var H =Form.H;
        jQuery(X).val(c.x);
        jQuery(Y).val(c.y);
        jQuery(W).val(c.w);
        jQuery(H).val(c.h);
    };
 
 function CropImage()
{
       var Form=document.getElementById("frmcrop");  
       var ImgCrop =Form.ImgCrop;
       jQuery(ImgCrop).Jcrop({
       onChange:   updateCoords,
	   onSelect: updateCoords
		 
	},
	              function()
                {
                    jcrop_api = this;
                    jcrop_api.animateTo([0,10,250,250]);
                    jcrop_api.setOptions({ bgFade: true }); 

                    }
	);
	
}
   
    
    
     
      
     function Photo_validate()
      {
            var Form=document.getElementById("frmcrop");  
            var Photo=Form.PhotoUpload;
            if (Photo.value == '' ) 
            {   
               Photo.focus();                       
               alert("Please upload the Photo");                 
                      
               return false;     
            }
                
             if (Photo.value != 0)
                {  // code to get File Extension..               
                    var imgpath = Photo.value;
                    var arr1 = new Array;
                    arr1 = imgpath.split("\\");
                    var len = arr1.length;                 
                    var img1 = arr1[len - 1];    
                    var filext = img1.substring(img1.lastIndexOf(".") + 1);                
                    // Checking Extension
                   if (filext == "jpeg" || filext == "jpg" || filext == "JPG" ||filext == "JPEG" ||filext == "gif" ||filext == "GIF" ||filext == "png" ||filext == "PNG") 
                    {
                    return true;
                    }                
                    else 
                     {
                          alert("Kindly Upload Photo in JPG ,JPEG ,GIF or PNG Format Only");                                    
                          return false;                 
                     } 
                                 
               }    
               
               

            
            
            return true;
        }
        
function GetFileSize() 
{ 
try 
    { 
    var fileSize = 0; 
    var Form=document.getElementById("frmcrop");  
    var Photo=Form.PhotoUpload;
    //for IE 
        if ($.browser.msie) 
        { 
        return true;
        } 
    //for FF, Safari, Opeara and Others 
        else 
        { 
        fileSize = Photo.files[0].size //size in kb 
        fileSize = fileSize / 1048576; //size in mb  
         if(fileSize>0.200)
        {
          alert("Maximum size of 200 KB allowed" );
          return false; 
        }
        } 
       
    } 
    catch (e) 
    { 
    alert("Error is :" + e); 
    return false; 
    }
     return true;
}
 