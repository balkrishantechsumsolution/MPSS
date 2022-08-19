<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="footer.ascx.cs" Inherits="WebApplication1.lokaseba_adhikar.controls.footer" %>
<footer id="bottom">
    <div class="row ptop15 pbottom15">

        <div class="col-lg-8 col-xs-12">
            <nav class="bottomnavbar">
                <ul>
                    <li><a href="#">Disclaimer and Policies</a></li>
                    <li><a href="../forms/sitemap.aspx">Sitemap</a></li>
                    <%--<li><a href="#">Help</a>|</li>--%>
                    <li><a href="#">Terms and Condition</a></li>
                    <li><a target="_blank" href="/g2c/forms/CenterList.aspx">List of CSC Centers in Odisha</a></li>
                </ul>


            </nav>
            <asp:Label ID="TotalVisitor" runat="server" CssClass="tvstor"></asp:Label>
            <asp:Label ID="TodayVisitor" runat="server" CssClass="tdyvstor"></asp:Label>
            <div class="clearfix"></div>
            <p class="pleft15 ptop15">
                Technology Partner, CSC SPV.
                <br />
                Contents on this website is owned, updated and managed by the CMGI. © 2017
            </p>
        </div>
        <div class="col-lg-4 col-sm-12 col-xs-12 btm_logo">
            <a href="https://validator.w3.org/" target="_blank"><img src="/g2c/img/w3c_html_validationIcon.png" alt="W3C Html Validate" class="img-responsive inline-block" /></a> 
            <a href="https://jigsaw.w3.org/css-validator/" target="_blank"> <img src="/g2c/img/w3c_css_validate.gif" alt="W3C CSS Validate" /></a>
            <img src="/g2c/img/btm_cmgi_logo.png" alt="CMGI LOGO" class="img-responsive inline-block" />
            <img src="/g2c/img/csc_logo.png" alt="" class="img-responsive inline-block" />
        </div>
    </div>
</footer>
<script type="text/javascript">
    $(document).ready(function () {
        // Activate Carousel
        $("#myCarousel").carousel("pause");

        // Click on the button to start sliding
        $("#myBtn").click(function () {
            $("#myCarousel").carousel("cycle");
        });

        // Click on the button to stop sliding
        $("#myBtn2").click(function () {
            $("#myCarousel").carousel("pause");
        });

        // Enable Carousel Indicators
        $(".item1").click(function () {
            $("#myCarousel").carousel(0);
        });
        $(".item2").click(function () {
            $("#myCarousel").carousel(1);
        });
        $(".item3").click(function () {
            $("#myCarousel").carousel(2);
        });
        $(".item4").click(function () {
            $("#myCarousel").carousel(3);
        });

        // Enable Carousel Controls
        $(".left").click(function () {
            $("#myCarousel").carousel("prev");
        });
        $(".right").click(function () {
            $("#myCarousel").carousel("next");
        });
    });
</script>
