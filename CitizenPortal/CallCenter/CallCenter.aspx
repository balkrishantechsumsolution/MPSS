<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/g2c/master/Home.Master" CodeBehind="CallCenter.aspx.cs" Inherits="CitizenPortal.CallCenter.CallCenter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <%--  ---------------------------%>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1/jquery-ui.js"></script>
<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7/themes/smoothness/jquery-ui.css"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <link rel="stylesheet" type="text/css" media="all" href="jsDatePick_ltr.min.css" />
<link href="jsDatePick_ltr.min.css" rel="stylesheet" />
    <script type="text/javascript" src="jsDatePick.min.1.3.js"></script>
<script src="jsDatePick.min.1.3.js"></script>

 <script type="text/javascript">
	window.onload = function(){
		new JsDatePick({
			useMode:2,
			target: "inputField",
			dateFormat:"%d-%M-%Y"
			/*selectedDate:{				This is an example of what the full configuration offers.
				day:5,						For full documentation about these settings please see the full version of the code.
				month:9,
				year:2006
			},
			yearsRange:[1978,2020],
			limitToToday:false,
			cellColorScheme:"beige",
			dateFormat:"%m-%d-%Y",
			imgPath:"img/",
			weekStartDay:1*/
		});
	};
</script>


  <%--  -------------------------------%>
    <%--<script src="callcenter.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" />--%>



     <%--<script src="js/jquery.min.js"></script>--%>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap-datetimepicker.min.js"></script>

    <link href="css/layout.css" rel="stylesheet" />
    <link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
    <link href="css/bootstrap.css" rel="stylesheet" />
      <script type="text/javascript">
  $(function() {
    $('#datetimepicker1').datetimepicker({
  
    });
  });
    </script>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            border-color: #FF99FF;
           
        }

        .auto-style2 {
            /*width: 86px;
            height: 27px;*/
        }

        .auto-style3 {
            width: 133px;
            height: 27px;
        }

        .auto-style4 {
            font-size: x-large;
        }

        .auto-style5 {
            height: 27px;
        }

        .expt_xs h1 {
            font-family: 'proximanovaaltbold';
            background-color: #F8F8FF;
            font-size: 25px;
            
            text-transform: uppercase;
            padding: 10px 0 10px 8px;
            border-bottom: 4px solid #FF7D01;
        }
       table#cc > tbody > tr > td {
    padding: 10px;
    line-height: 1.42857143;
    vertical-align: top;
    border-top: 1px solid #ddd;
}
        .sndbtn {
                float: right;
    margin: 10px 250px 0 0;
    text-align: center;
        }

        .tblehd {
            font-family: 'proximanovaaltbold';
    background-color: red;
    height: 5px;
    color: #fff;
    font-size: 10px;
    font-weight: normal;
}


    </style>
    <script>

        function validate(evt) {
            var theEvent = evt || window.event;
            var key = theEvent.keyCode || theEvent.which;
            key = String.fromCharCode(key);
            var regex = /[0-9]|\./;
            if (!regex.test(key)) {
                theEvent.returnValue = false;
                if (theEvent.preventDefault) theEvent.preventDefault();
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbody" runat="server">
     <div class="container-fluid">
        <div class="col-lg-12 expt_xs" style="margin-bottom:120px;">

            <div class="row">
                <h1>Call Center</h1>
                <table border="0" id="cc" class="auto-style1 table table-striped table-bordered" style="width: 100%; margin: 0 auto;">
                    <tr>
                        <td colspan="7" style="background: #4879a9 !important; color: #fff !important;"><span class="auto-style4">Verify Candidate Details</span></td>
                    </tr>
                    <tr >
                        <td class="auto-style2" style="background-color: #eceeef !important; width:10%; padding-top:18px;">Reference ID</td>
                        <td class="auto-style5">
                            <asp:TextBox ID="TextBox1" MaxLength="20" onkeypress='validate(event)' runat="server"  CssClass="form-control" ></asp:TextBox>

                        </td>
                         
                        <td class="auto-style2" style="background-color: #eceeef !important;  width:10%; padding-top:18px;">DOB</td>
                        <td class="auto-style5">

                            <asp:TextBox ID="TextBox2" runat="server" MaxLength="20" CssClass="form-control" ReadOnly="true" ></asp:TextBox>

                        </td>

                        <td class="auto-style2" style="background-color: #eceeef !important; padding-top:18px;">Mobile Number</td>
                        <td class="auto-style5">
                            <asp:TextBox ID="TextBox3" MaxLength="20" runat="server" onkeypress='validate(event)' CssClass="form-control"></asp:TextBox>

                        </td> 

                        <td class="auto-style2" style="background-color: #eceeef !important;  width:10%; text-align:center;">

                            <asp:Button ID="btnSearch" runat="server" Text="Search" class="btn btn-success" OnClick="btnSearch_Click" />
                        </td>
                      
                      
                    </tr>
                    <tr>
                        <td colspan="7">
                            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
   
                        <asp:GridView ID="GridView" runat="server" ShowHeaderWhenEmpty="true" AutoPostBack="true" 
                            CssClass="table table-striped table-bordered" EmptyDataText=" No records found!!!.">
                            <%--<EmptyDataTemplate>
                                <div style="font-size: 17px; color: red; font-weight: bold; text-align: center">
                                    No records found!!!.
                                </div>
                            </EmptyDataTemplate>--%>
                        </asp:GridView>
                          
                            <asp:HiddenField ID="hdf_ref" runat="server" />
                            <asp:HiddenField ID="hdf_dob" runat="server" />
                            <asp:HiddenField ID="hdf_referal" runat="server" />
                         
                            <asp:Button ID="btnSend" runat="server" Text="Send" class="btn btn-success sndbtn" OnClick="btnSend_Click" />
                            
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>

   
</asp:Content>
