<%@ Page Title="" Language="C#" MasterPageFile="~/g2c/master/Home.Master" AutoEventWireup="true" CodeBehind="bank_list.aspx.cs" Inherits="CitizenPortal.PG.bank_list" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../g2c/css/style.admin.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbody" runat="server">
    <div class="row mbtm10">
          
          
              <div class="container mtop15 mbtm15">
                  
              <div class="pymntbox_hd">Choose Payment Options</div>
                  <div class="col-lg-12 pymntbox_bdr3 pleft0 pright0 pbottom15">
              <div class="pymntbox_subhd">
                  <div class="col-xs-10 ptop10"><p>Debit / Credit Card</p></div>
                  <div class="col-xs-2 ptop15"><img src="../g2c/img/payment_prvdr.png" /></div>
              </div>
                      <div class="w98">
                          <a href="#">
                          <div class="col-md-8 bnklstbox pymntbox_bdr2 mtop20 mbtm20">
                              <div class="col-xs-3 bnklogo_rghtbdr ptop5 pbottom10">
                                  <img src="../g2c/img/icici_bnklogo.png" /></div>
                              <div class="col-xs-9 ptop10" style="color:#212121;">
                                  Debit Card - (Below INR 2000/-) - 0.75% Processing Fee, (Above INR 2000/-) - 1.00% Processing Fee<br />
Credit Card - 1.05% Processing Fee
                              </div>
                          </div>
                          </a>
                      </div>
               </div>
                  </div>
          
</div>
</asp:Content>
