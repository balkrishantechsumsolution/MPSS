<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/G2G/Master/G2GMaster.Master" AutoEventWireup="true" CodeBehind="OISF_DistrictWiseReportV2.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.OISF.OISF_DistrictWiseReportV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        table#grdDistrict {
            border: 1px solid #D1D9DC;
            font-size: 14px;
        }

            table#grdDistrict th {
                background-color: #1C3048;
                color: #fff;
                padding-left: 5px;
                text-align: left;
            }

            table#grdDistrict tr:nth-child(even) {
                background: #EDF2F5; /* For browsers that do not support gradients */
                background: -webkit-linear-gradient(#FFFFFF, #EDF2F5); /* For Safari 5.1 to 6.0 */
                background: -o-linear-gradient(#FFFFFF, #EDF2F5); /* For Opera 11.1 to 12.0 */
                background: -moz-linear-gradient(#FFFFFF, #EDF2F5); /* For Firefox 3.6 to 15 */
                background: linear-gradient(#FFFFFF, #EDF2F5); /* Standard syntax */
                color: #1C3048 !important;
            }

            table#grdDistrict tr:nth-child(odd) {
                background: #EAEDF4; /* For browsers that do not support gradients */
                background: -webkit-linear-gradient(#EAEDF4, #FFFFFF); /* For Safari 5.1 to 6.0 */
                background: -o-linear-gradient(#EAEDF4, #FFFFFF); /* For Opera 11.1 to 12.0 */
                background: -moz-linear-gradient(#EAEDF4, #FFFFFF); /* For Firefox 3.6 to 15 */
                background: linear-gradient(#EAEDF4, #FFFFFF); /* Standard syntax */
                color: #1C3048 !important;
            }

        #LeftPanel_pnlMenu{
            display:none;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" ClientIDMode="Static">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div>
         <asp:UpdatePanel ID="UpdatePanel1"
         runat="server" UpdateMode="Conditional">
    <ContentTemplate>
    <table>
        <tr><td>

            <asp:DropDownList ID="drpDistrict" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpDistrict_SelectedIndexChanged"></asp:DropDownList>
            </td></tr>
         <tr><td>

<asp:GridView ID="grdDistrict" runat="server"></asp:GridView>
             </td></tr>
        
    </table>
           </ContentTemplate>
    </asp:UpdatePanel> 
 
    </div>
</asp:Content>
