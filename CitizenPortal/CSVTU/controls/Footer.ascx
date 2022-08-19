<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Footer.ascx.cs" Inherits="CitizenPortal.Sambalpur.controls.Footer" %>
<footer class="col-xs-12 bottom-bg ">
    <div class="col-xs-12 col-sm-2">
        <img src="/Sambalpur/img/university-logo-bottom.png" class="img-responsive" width="141" height="124" alt="Chhattisgarh Swami Vivekanad Technical University Logo" />
    </div>
    <div class="col-xs-12 col-sm-3">
        <p class="p2x">REGISTRAR</p>        <p>
            Prof. Surya Narayan Nayak
                <br />
            Chhattisgarh Swami Vivekanad Technical University,
                <br />
            Raipur, Chhattisgarh - 492001
               <%-- <br />
            Tel. 91-663-2430157 (O) Fax:0663-2430158--%>
                <br />
            E-mail: <a href="mailto:registrar@csvtu.ac.in">registrar@csvtu.ac.in</a>
        </p>
    </div>
    <div class="col-xs-12 col-sm-3">
        <p class="p2x">VICE-CHANCELLOR</p>
        <p>
            Prof. Deepak Behera
                <br />
            Chhattisgarh Swami Vivekanad Technical University,
                <br />
            Raipur, Chhattisgarh - 492001
                <%--<br />
            Tel. 91-663-2430158 (O)--%>
                <br />
            E-mail: <a href="mailto:vc@csvtu.ac.in">vc@csvtu.ac.in</a>
        </p>
    </div>
    <div class="col-xs-12 col-sm-4">
        <p class="p2x">CHAIRMAN, PG CENTRAL OFFICE</p>
        <p>
            Prof. (Dr.) Biswajit Satpathy
                <br />
            Chhattisgarh Swami Vivekanad Technical University,
                <br />
            Raipur, Chhattisgarh - 492001
                <%--<br />
            Ph : 0663-2430776--%>
                <br />
            E-mail: <a href="mailto:pgco@suniv.ac.in">pgco@csvtu.ac.in</a>
        </p>
    </div>
    <div class="clearfix"></div>
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
       <asp:Label ID="TotalVisitor" runat="server" CssClass="tvstor"></asp:Label>
            <asp:Label ID="TodayVisitor" runat="server" CssClass="tdyvstor"></asp:Label>
    </div>

</footer>
<div class="clearfix"></div>
<div class="container-fluid text-center">
    <p class="copyrights">Copyrights © 2013 <b>Chhattisgarh Swami Vivekanad Technical University.</b> All Rights Reserved.</p>
</div>

