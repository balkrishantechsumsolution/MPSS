<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="TestPay.aspx.cs" Inherits="CitizenPortal.WebApp.CSCV2.TestPay" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
                    <asp:Label ID="lblsessiondata" runat="server" Text="Label"></asp:Label>  
        
			<div class="col-lg-12">
				<h4>Example with <strong>3 Products</strong></h4>
			</div>
			<div class="col-lg-4">
				<div class="pricing-box-alt">
					<div class="pricing-heading">
						<h3>.net <strong>Basic</strong></h3>
					</div>
					<div class="pricing-terms">
						<h6> INR 150.00 </h6>
					</div>
					<div class="pricing-content">
						<ul>
							<li><i class="icon-ok"></i> 1 applications</li>
							<li><i class="icon-ok"></i> 24x7 learning</li>
							<li><i class="icon-ok"></i> No hidden fees</li>
							<li><i class="icon-ok"></i> Free 30-days trial</li>
							<li><i class="icon-ok"></i> Stop anytime easily</li>
						</ul>
					</div>
                        
					<div class="pricing-action">
						
                      <asp:Button ID="btnFirstProduct" runat="server" Text="Buy"  class="btn btn-info" 
                            onclick="btnFirstProduct_Click"/>
					</div>
                             
				</div>
			</div>
			<div class="col-lg-4">
				<div class="pricing-box-alt special">
					<div class="pricing-heading">
						<h3>.net <strong>Intermediate</strong></h3>
					</div>
					<div class="pricing-terms">
						<h6>INR 100.00 / Month</h6>
					</div>
					<div class="pricing-content">
						<ul>
							<li><i class="icon-ok"></i> 10 applications</li>
							<li><i class="icon-ok"></i> 24x7 learning</li>
							<li><i class="icon-ok"></i> No hidden fees</li>
							<li><i class="icon-ok"></i> Free 30-days trial</li>
							<li><i class="icon-ok"></i> Stop anytime easily</li>
						</ul>
					</div>
                             
					<div class="pricing-action">
                       
                         <asp:Button ID="btnSeconProduct" runat="server" Text="Buy"  
                             class="btn btn-info" onclick="btnSeconProduct_Click"/>
					</div>
                       

				</div>
			</div>
			<div class="col-lg-4">
				<div class="pricing-box-alt">
					<div class="pricing-heading">
						<h3>.net <strong>Advanced</strong></h3>
					</div>
					<div class="pricing-terms">
						<h6>INR 50.00 / Month</h6>
					</div>
					<div class="pricing-content">
						<ul>
							<li><i class="icon-ok"></i> 100 applications</li>
							<li><i class="icon-ok"></i> 24x7 support available</li>
							<li><i class="icon-ok"></i> No hidden fees</li>
							<li><i class="icon-ok"></i> Free 30-days trial</li>
							<li><i class="icon-ok"></i> Stop anytime easily</li>
						</ul>
					</div>
                          
					<div class="pricing-action">
					
                        
                    
                           <asp:Button ID="btnProduct" runat="server" Text="Buy"  class="btn btn-info" 
                               onclick="btnProduct_Click"/>
					</div>
                             
				</div>
			</div>
		</div>

</asp:Content>
