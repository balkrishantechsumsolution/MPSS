
 function Notification()
    {debugger
       Visible('popup1');
       DivVisible('divImage');
    }
function Visible(obj)
{
	obj = document.getElementById(obj);
	obj.style.visibility = (obj.style.visibility == 'visible') ? 'hidden' : 'visible';
}

function DivVisible(obj)
{
	obj = document.getElementById(obj);
	obj.style.visibility ='hidden';
}

