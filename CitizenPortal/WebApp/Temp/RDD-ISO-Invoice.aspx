<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RDD-ISO-Invoice.aspx.cs" Inherits="CitizenPortal.WebApp.Temp.RDD_ISO_Invoice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function CallPrint(strid) {
            var prtContent = document.getElementById(strid);
            var WinPrint = window.open('', '', 'letf=0,top=0,width=860,height=2010,toolbar=0,scrollbars=0,status=0');
            WinPrint.document.write(prtContent.innerHTML);
            WinPrint.document.close();
            WinPrint.focus();
            WinPrint.print();
            WinPrint.close();
        }
    </script>
    
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div id="divPrint" style="margin: 0 auto; width: 100%;">
                <div style="margin: 0 auto; height: auto; width: 980px; border: 3px solid #000; padding: 1px; font-family: Arial">
                    <div style="margin: 0 auto; height: auto; width: 100%; border: 1px solid #000;">

                        <%---------Start Header section --------%>
                        <div style="height: 90px; width: 100%; border-bottom: 1px solid #999;margin-top:10px">
                            <table cellpadding="5" cellspacing="0" style="width: 100%; margin: 0 auto; text-align: center">
                                <tr>
                                    <td style="vertical-align: middle">
                                        <img alt="Logo" src="image/S2Logo.png" style="width: 100px; margin: 0 auto" />
                                    </td>
                                    <td style="vertical-align: middle">
                                        <asp:Label runat="server" ID="lblCertificateName" Style="font-size: 22px; font-weight: bolder; text-transform: uppercase; text-align: center">
                                RDO-ISO <br />Grampanchayat
                                        </asp:Label>
                                    </td>
                                    <td style="vertical-align: middle">
                                        <img alt="Logo" src="image/S2Infotech.png" style="width: 100px; margin: 0 auto" />
                                    </td>
                                </tr>
                            </table>


                        </div>

                    </div>
                    <%----------End Header section ---------%><%---------Start Title section --------%>
                    <div style="text-align: center; font-size: 20px; font-weight: bolder; padding: 5px; background-color: #808080; color: #fff;">
                        <span style="font-size: 20px">TAX INVOICE</span>
                    </div>
                    <%----------End title section ---------%><%---------Start Applicant Section --------%>
                    <div style="margin: 10px 0; font-size: 13px;" class="auto-style1">
                        <%--Programme Table--%>
                        <table style="width: 98%; margin: 0 auto; border: 1px solid #999;" cellpadding="7" cellspacing="0">
                            <tbody>
                                <tr>
                                    <td colspan="2" style="padding: 8px; color: #fff; font-size: 14px; text-align: left; background-color: #383E4B; -webkit-print-color-adjust: exact;"><b>INVOICE DETAILS</b></td>
                                </tr>
                                <tr>
                                    <td style="border-right: 1px solid #999; width: 50%; margin: 0 auto; text-align: left; vertical-align: top">

                                        <table cellpadding="5" cellspacing="0">
                                            <tr>
                                                <td><b>Invoice No.</b>: <span>20‐21/NOV/000001</span></td>
                                            </tr>
                                            <tr>
                                                <td><b>Supplier's Ref.</b>: 123456‐1</td>
                                            </tr>
                                        </table>

                                    </td>
                                    <td style="width: 50%; margin: 0 auto; text-align: left; vertical-align: top">

                                        <table cellpadding="5" cellspacing="0">
                                            <tr>
                                                <td><b>Dated</b>: 09.11.2021</td>
                                            </tr>
                                            <tr>
                                                <td><b>Buyer's Order No.</b>: ISO‐201S/CR.01/ASK</td>
                                            </tr>
                                            <tr>
                                                <td><b>Work Order Date</b>: 20th September 2019</td>
                                            </tr>
                                        </table>

                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="border-top-style: solid; border-top-width: 1px; border-top-color: #999">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="border-top-style: solid; border-right-style: solid; border-top-width: 1px; border-right-width: 1px; border-top-color: #999">
                                        <b style="font-size: 15px;">S2 INFOTECH INTERNATIONAL LTD.</b></td>
                                    <td style="border-top-style: solid; border-top-width: 1px; border-top-color: #999;">
                                        <b style="font-size: 15px;">GRAM PANCHAYAT PAUD</b></td>
                                </tr>
                                <tr>
                                    <td style="border-top-style: solid; border-right-style: solid; border-top-width: 1px; border-right-width: 1px; border-top-color: #999;">1205‐1208, Raheja Chambers, 
                                        <br />
                                        12th Floor, Free Press Journal Marg, 
                                        <br />
                                        Nariman Point, Mumbai‐400 021.</td>
                                    <td style="border-top-style: solid; border-top-width: 1px; border-top-color: #999;">Taluka:
                                        <br />
                                        District:
                                        <br />
                                        State:
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border-top-style: solid; border-right-style: solid; border-top-width: 1px; border-right-width: 1px; border-top-color: #999"><b>Company&#39;s PAN</b>: AAJCS1128H&nbsp;
                                    </td>
                                    <td style="border-top-style: solid; border-top-width: 1px; border-top-color: #999;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="border-top-style: solid; border-right-style: solid; border-top-width: 1px; border-right-width: 1px; border-top-color: #999"><b>Branch &amp; IFSC</b>: Fort, Mumbai &amp; HDFC0000060</td>
                                    <td style="border-top-style: solid; border-top-width: 1px; border-top-color: #999;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="border-top-style: solid; border-right-style: solid; border-top-width: 1px; border-right-width: 1px; border-top-color: #999"><b>GSTIN/UIN</b>: 27AAJCS1128H1ZE</td>
                                    <td style="border-top-style: solid; border-top-width: 1px; border-top-color: #999;"><b>GSTIN/UIN</b>:</td>
                                </tr>
                            </tbody>
                        </table>
                        <br />
                        <div>
                            <table width="600" cellpadding="5" cellspacing="0" style="width: 98%; margin: 0 auto;">
                                <tbody>
                                    <tr>
                                        <td colspan="6" style="padding: 8px; color: #fff; font-size: 14px; text-align: left; background-color: #383E4B; -webkit-print-color-adjust: exact;"><b>PARTICULARS DETAILS</b></td>
                                    </tr>
                                </tbody>
                                <tbody>
                                    <tr>
                                        <th style="width: 5%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: center;">Sl.</th>
                                        <th style="width: 55%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                            <span>DESCRIPTION</span></th>
                                        <th style="width: 5%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; text-align: center;">UNIT</th>

                                        <th style="width: 5%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; text-align: center;">QUANTITY</th>

                                        <th style="width: 10%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; text-align: center;white-space:nowrap">UNIT PRICE</th>
                                        <th style="width: 10%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: center;">
                                            <label>AMOUNT</label>
                                        </th>
                                    </tr>
                                    <tr>
                                        <td style="border-style: none solid none solid; border-right-width: 1px; border-right-color: #999; border-left-width: 1px; border-left-color: #999;">1</td>
                                        <td style="border-right-width: 1px; border-right-color: #999; border-top-style: none; border-right-style: solid; border-bottom-style: none;">
                                            <span>􀅤ामपंचायतीचं े ISO ९००१:२०१५ 􀅮िश􀆗ण मधील पिहला ट􀉔ा ( Stage 1 ) "
􀅤ामपंचायतीचं े ISO९००१:२०१५ 􀅮िश􀆗ण “ISO९००१:२०१५‐ जागृतता आिण
गुणव􀈅ा 􀊩व􀌾थापनाची त􀈕े ”</span>
                                        </td>
                                        <td style="border-right-width: 1px; border-right-color: #999; border-top-style: none; border-right-style: solid; border-bottom-style: none; text-align: center">NOS</td>
                                        <td style="border-right-width: 1px; border-right-color: #999; border-top-style: none; border-right-style: solid; border-bottom-style: none; text-align: left">1</td>
                                        <td style="border-right-width: 1px; border-right-color: #999; border-top-style: none; border-right-style: solid; border-bottom-style: none; text-align: right">6,600.00</td>
                                        <td style="border-right-width: 1px; border-right-color: #999; border-top-style: none; border-right-style: solid; border-bottom-style: none; text-align: right">6,600</td>
                                    </tr>
                                    <tr>
                                        <td style="border-width: 1px; border-color: #999; border-style: solid;">&nbsp;</td>
                                        <td style="border-right-width: 1px; border-bottom-width: 1px; border-right-color: #999; border-bottom-color: #999; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-top-width: 1px; border-top-color: #999;">&nbsp;</td>
                                        <td style="border-right-width: 1px; border-bottom-width: 1px; border-right-color: #999; border-bottom-color: #999; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-top-width: 1px; border-top-color: #999;">&nbsp;</td>
                                        <td style="border-right-width: 1px; border-bottom-width: 1px; border-right-color: #999; border-bottom-color: #999; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-top-width: 1px; border-top-color: #999;">&nbsp;</td>
                                        <td style="border-right-width: 1px; border-bottom-width: 1px; border-right-color: #999; border-bottom-color: #999; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-top-width: 1px; border-top-color: #999;">&nbsp;</td>
                                        <td style="border-right-width: 1px; border-bottom-width: 1px; border-right-color: #999; border-bottom-color: #999; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-top-width: 1px; border-top-color: #999;">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="border-style: none solid solid solid; border-right-width: 1px; border-bottom-width: 1px; border-right-color: #999; border-bottom-color: #999; border-left-width: 1px; border-left-color: #999;">&nbsp;</td>
                                        <td style="border-right-width: 1px; border-bottom-width: 1px; border-right-color: #999; border-bottom-color: #999; border-top-style: none; border-right-style: solid; border-bottom-style: solid;">&nbsp;</td>
                                        <td style="border-right-width: 1px; border-bottom-width: 1px; border-right-color: #999; border-bottom-color: #999; border-top-style: none; border-right-style: solid; border-bottom-style: solid;">&nbsp;</td>
                                        <td style="border-right-width: 1px; border-bottom-width: 1px; border-right-color: #999; border-bottom-color: #999; border-top-style: none; border-right-style: solid; border-bottom-style: solid; text-align: right">SGST</td>
                                        <td style="border-right-width: 1px; border-bottom-width: 1px; border-right-color: #999; border-bottom-color: #999; border-top-style: none; border-right-style: solid; border-bottom-style: solid; text-align: left">@ 9%</td>
                                        <td style="border-right-width: 1px; border-bottom-width: 1px; border-right-color: #999; border-bottom-color: #999; border-top-style: none; border-right-style: solid; border-bottom-style: solid; text-align: right">594</td>
                                    </tr>
                                    <tr>
                                        <td style="border-style: none solid solid solid; border-right-width: 1px; border-bottom-width: 1px; border-right-color: #999; border-bottom-color: #999; border-left-width: 1px; border-left-color: #999;">&nbsp;</td>
                                        <td style="border-right-width: 1px; border-bottom-width: 1px; border-right-color: #999; border-bottom-color: #999; border-top-style: none; border-right-style: solid; border-bottom-style: solid;">&nbsp;</td>
                                        <td style="border-right-width: 1px; border-bottom-width: 1px; border-right-color: #999; border-bottom-color: #999; border-top-style: none; border-right-style: solid; border-bottom-style: solid;">&nbsp;</td>
                                        <td style="border-right-width: 1px; border-bottom-width: 1px; border-right-color: #999; border-bottom-color: #999; border-top-style: none; border-right-style: solid; border-bottom-style: solid; text-align: right">CGST</td>
                                        <td style="border-right-width: 1px; border-bottom-width: 1px; border-right-color: #999; border-bottom-color: #999; border-top-style: none; border-right-style: solid; border-bottom-style: solid; text-align: left">@ 9%</td>
                                        <td style="border-right-width: 1px; border-bottom-width: 1px; border-right-color: #999; border-bottom-color: #999; border-top-style: none; border-right-style: solid; border-bottom-style: solid; text-align: right">594</td>
                                    </tr>
                                    <tr>
                                        <td style="border-style: none solid solid solid; border-right-width: 1px; border-bottom-width: 1px; border-right-color: #999; border-bottom-color: #999; border-left-width: 1px; border-left-color: #999; text-align: right; font-size: 14px; font-weight: bolder" colspan="2">GRAND TOTAL</td>
                                        <td style="border-right-width: 1px; border-bottom-width: 1px; border-right-color: #999; border-bottom-color: #999; border-top-style: none; border-right-style: solid; border-bottom-style: solid; text-align: right; font-size: 14px; font-weight: bolder" colspan="4">7,788</td>
                                    </tr>
                                    <tr>
                                        <td style="border-style: none solid solid solid; border-right-width: 1px; border-bottom-width: 1px; border-right-color: #999; border-bottom-color: #999; border-left-width: 1px; border-left-color: #999; text-align: left; font-size: 14px;" colspan="6">Amount Chargeable (in words)
                                            <br />
                                            <b>Indian Rupees</b>: <span>Seven Thousand Seven Hundred and Eighty Eight Only.</span>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <br />
                        <div>
                            <table width="600" cellpadding="5" cellspacing="0" style="width: 98%; margin: 0 auto;">
                                <tbody>
                                </tbody>
                                <tbody>
                                    <tr>
                                        <th style=" width:50%;padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: center;">HSN/SAC</th>
                                        <th style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; text-align: center;white-space:nowrap">Taxable Value</th>
                                        <th style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; text-align: center;white-space:nowrap" colspan="2">Central Tax</th>
                                        <th style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; text-align: center;white-space:nowrap" colspan="2">State Tax</th>
                                    </tr>
                                    <tr>
                                        <td style="border-right-width: 1px; border-right-color: #999; border-left-width: 1px; border-left-color: #999; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-bottom-width: 1px; border-bottom-color: #999;">&nbsp;</td>
                                        <td style=" width:10%;border-right-width: 1px; border-right-color: #999; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-bottom-width: 1px; border-left-width: 1px; border-bottom-color: #999; border-left-color: #999;background-color: #F8F8F8; text-align: center;font-weight:bold">&nbsp;</td>
                                        <td style=" width:10%;border-right-width: 1px; border-right-color: #999; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-bottom-width: 1px; border-left-width: 1px; border-bottom-color: #999; border-left-color: #999;background-color: #F8F8F8; text-align: center;font-weight:bold">Rate</td>
                                        <td style=" width:10%;border-right-width: 1px; border-right-color: #999; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-bottom-width: 1px; border-left-width: 1px; border-bottom-color: #999; border-left-color: #999;background-color: #F8F8F8; text-align: center;font-weight:bold">Amount</td>
                                        <td style=" width:10%;border-right-width: 1px; border-right-color: #999; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-bottom-width: 1px; border-left-width: 1px; border-bottom-color: #999; border-left-color: #999;background-color: #F8F8F8; text-align: center;font-weight:bold">Rate</td>
                                        <td style=" border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999; width:10%; background-color: #F8F8F8; text-align: center;" class="auto-style3">Amount</td>
                                    </tr>
                                    <tr>
                                        <td style="border-style: none solid solid solid; border-right-width: 1px; border-bottom-width: 1px; border-right-color: #999; border-bottom-color: #999; border-left-width: 1px; border-left-color: #999;">998311</td>
                                        <td style="border-right-width: 1px; border-bottom-width: 1px; border-right-color: #999; border-bottom-color: #999; border-top-style: none; border-right-style: solid; border-bottom-style: solid;text-align:right">6,600</td>
                                        <td style="border-right-width: 1px; border-bottom-width: 1px; border-right-color: #999; border-bottom-color: #999; border-top-style: none; border-right-style: solid; border-bottom-style: solid;">9%</td>
                                        <td style="border-right-width: 1px; border-bottom-width: 1px; border-right-color: #999; border-bottom-color: #999; border-top-style: none; border-right-style: solid; border-bottom-style: solid;text-align:right">594</td>
                                        <td style="border-right-width: 1px; border-bottom-width: 1px; border-right-color: #999; border-bottom-color: #999; border-top-style: none; border-right-style: solid; border-bottom-style: solid;">9%</td>
                                        <td style="border-right-width: 1px; border-bottom-width: 1px; border-right-color: #999; border-bottom-color: #999; border-top-style: none; border-right-style: solid; border-bottom-style: solid;text-align:right">594</td>
                                    </tr>
                                    <tr>
                                        <td style="border-style: none solid solid solid; border-right-width: 1px; border-bottom-width: 1px; border-right-color: #999; border-bottom-color: #999; border-left-width: 1px; border-left-color: #999;">&nbsp;</td>
                                        <td style="border-right-width: 1px; border-bottom-width: 1px; border-right-color: #999; border-bottom-color: #999; border-top-style: none; border-right-style: solid; border-bottom-style: solid;">&nbsp;</td>
                                        <td style="border-right-width: 1px; border-bottom-width: 1px; border-right-color: #999; border-bottom-color: #999; border-top-style: none; border-right-style: solid; border-bottom-style: solid; text-align: left">&nbsp;</td>
                                        <td style="border-right-width: 1px; border-bottom-width: 1px; border-right-color: #999; border-bottom-color: #999; border-top-style: none; border-right-style: solid; border-bottom-style: solid; text-align: left">&nbsp;</td>
                                        <td style="border-right-width: 1px; border-bottom-width: 1px; border-right-color: #999; border-bottom-color: #999; border-top-style: none; border-right-style: solid; border-bottom-style: solid; text-align: left">&nbsp;</td>
                                        <td style="border-right-width: 1px; border-bottom-width: 1px; border-right-color: #999; border-bottom-color: #999; border-top-style: none; border-right-style: solid; border-bottom-style: solid; text-align: right">&nbsp;</td>
                                    </tr>
                                    <tr style="font-weight:bold">
                                        <td style="border-style: none solid solid solid; border-right-width: 1px; border-bottom-width: 1px; border-right-color: #999; border-bottom-color: #999; border-left-width: 1px; border-left-color: #999;text-align: right;font-weight:bold">Total</td>
                                        <td style="border-right-width: 1px; border-bottom-width: 1px; border-right-color: #999; border-bottom-color: #999; border-top-style: none; border-right-style: solid; border-bottom-style: solid;text-align:right">594</td>
                                        <td style="border-right-width: 1px; border-bottom-width: 1px; border-right-color: #999; border-bottom-color: #999; border-top-style: none; border-right-style: solid; border-bottom-style: solid; text-align: left">&nbsp;</td>
                                        <td style="border-right-width: 1px; border-bottom-width: 1px; border-right-color: #999; border-bottom-color: #999; border-top-style: none; border-right-style: solid; border-bottom-style: solid; text-align: right">594</td>
                                        <td style="border-right-width: 1px; border-bottom-width: 1px; border-right-color: #999; border-bottom-color: #999; border-top-style: none; border-right-style: solid; border-bottom-style: solid; text-align: left">&nbsp;</td>
                                        <td style="border-right-width: 1px; border-bottom-width: 1px; border-right-color: #999; border-bottom-color: #999; border-top-style: none; border-right-style: solid; border-bottom-style: solid; text-align: right">594</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <br />
                        <div>
                            <table style="width: 98%; margin: 0 auto; border: 1px solid #999;" cellpadding="7" cellspacing="0">
                                <tbody>
                                    <tr>
                                        <td style="vertical-align: top; width: 50%">
                                            <b>Remarks</b>: </td>
                                        <td style="line-height: 1.5; width: 50%; border-left: 1px solid #999;" rowspan="3">
                                            <b>Company&#39;s Bank Details</b><br />
                                            Bank Name : HDFC Bank<br />
                                            A/c No. : 00600330005084<br />
                                            Branch &amp; IFSC : Fort, Mumbai &amp; HDFC0000060</td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: bottom; font-weight: bold; font-size: 14px;"></td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: bottom; font-weight: bold; font-size: 14px;">Company&#39;s PAN : AAJCS1128H</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <br />
                        <table cellpadding="5" cellspacing="0" width="600" style="margin: 0 auto; width: 98%;">
                            <tr>
                                <td style="padding: 5px; text-align: justify; vertical-align: middle">
                                    <b>Declaration</b>: I/We hereby certify that my/our Registration certificate under the Central Goods and Services Tax Act,2017 is in force on the date on which the sale of the goods specified
in this tax invoice is made by me/us and that the transaction of sale covered by this tax invoice has been effected by me/us and is shall be accounted for in the turnover of sales while
filling of return and the due tax, if any, payable on the sale has been paid or shall be paid.

                                </td>
                            </tr>
                        </table>
                    </div>
                    <%---------End Applicant Section --------%>
                </div>
            <div style="text-align:center;font-size:10px;font-family:Arial;margin:10px">This is a computer generated invoice hense does not require any stamp or sign</div>
            </div>
        </div>
        <br />
        <div style="text-align: center; margin-top: 15px; margin-bottom: 10px;">
            <input type="button" id="btnSubmit" class="btn btn-info" style="background-color: #0040FF !important;" value="Print" onclick="javascript: CallPrint('divPrint');" />
        </div>
    </form>
</body>
</html>
