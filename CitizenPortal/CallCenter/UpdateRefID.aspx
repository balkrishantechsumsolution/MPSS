<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/g2c/master/Home.Master" CodeBehind="UpdateRefID.aspx.cs" Inherits="CitizenPortal.CallCenter.UpdateRefID" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <%--  ---------------------------%>

<%--<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1/jquery-ui.js"></script>
<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7/themes/smoothness/jquery-ui.css"/>--%>

     <script type="text/javascript">
                   function RestrictSpace() {
                       if (event.keyCode == 32) {
                           return false;
                       }
                   }
                   var alpha = "[ A-Za-z]";
                   var numeric = "[0-9]";
                   var alphanumeric = "[ A-Za-z0-9]";

                   function onKeyValidate(e, charVal) {
                       var keynum;
                       var keyChars = /[\x00\x08]/;
                       var validChars = new RegExp(charVal);
                       if (window.event) {
                           keynum = e.keyCode;
                       }
                       else if (e.which) {
                           keynum = e.which;
                       }
                       var keychar = String.fromCharCode(keynum);
                       if (!validChars.test(keychar) && !keyChars.test(keychar)) {
                           return false
                       } else {
                           return keychar;
                       }
                   }
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
        #cphbody_btnUpdate {
            float:left;
        }


    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbody" runat="server">
     <div class="container-fluid">
        <div class="col-lg-12 expt_xs" style="margin-bottom:120px;">

            <div class="row">
                <h1>Call Center</h1>
                <table border="0" id="cc" class="auto-style1 table table-striped table-bordered" style="width: 100%; margin: 0 auto;">
                    <tr>
                        <td colspan="7" style="background: #4879a9 !important; color: #fff !important;"><span class="auto-style4">Update Reference ID</span></td>
                    </tr>
                    <tr >
                        <td class="auto-style2" style="background-color: #eceeef !important; width:9%; text-align:right; padding-top:18px;">DU Number</td>
                        <td class="auto-style5" style="width:13%;">

                     <%--      <input type="text" id="txtNumeric" class="form-control" onkeypress="return onKeyValidate(event,alpha) RestrictSpace();" />--%>

                            <asp:TextBox ID="TextBox1" MaxLength="15" 
        runat="server"  CssClass="form-control" ></asp:TextBox>

                        </td>
                         
                      
                        <td class="auto-style2" style="background-color: #eceeef !important;  width:10%; text-align:left;">

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
                         
                          
                            
                        </td>

                    </tr>
                    <asp:Panel ID="Panel1" runat="server">
                     <tr >
                        <td class="auto-style2" style="background-color: #eceeef !important; width:9%; text-align:right; padding-top:18px;">Enter Reference ID</td>
                        <td class="auto-style5" style="width:13%;">
                            <asp:TextBox ID="TextBox2" MaxLength="15"  runat="server"  CssClass="form-control" ></asp:TextBox>

                        </td>
                         
                      
                        <td class="auto-style2" style="background-color: #eceeef !important;  width:10%; text-align:left;">
                             <asp:Button ID="btnUpdate" runat="server" Text="Update" class="btn btn-success sndbtn" OnClick="btnSend_Click" />
                            
                        </td>
                      
                      
                    </tr>
                        </asp:Panel>
                </table>
            </div>
        </div>
    </div>

   
</asp:Content>
