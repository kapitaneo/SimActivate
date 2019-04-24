<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PaymentOption.aspx.cs" Inherits="WebApplication1.ActivationSim.PaymentOption" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="row">
    <div class="col-xs-12 col-md-12">
        <div class="col-xs-12 col-md-3">
        </div>
        <div class="col-xs-12 col-md-6">
            <div class="row col-xs-12 col-md-12" style="border:1px solid #e1e1e1">
                <h3 style="color:#3BA7D1">RETAILER PAYMENT OPTION</h3><br />
                <div class="row">
                    <div class="col-xs-12 col-md-6">
                        <form id="frmPaypal" action="~/checkout/paypal" method="post">
                            <a href="javascript:void(0)" onclick="btnPaymentPayPal()"><img src="~/Images/Paypal.png" class="col-md-offset-3" width="65%" /></a>
                        </form>
                    </div>
                    <div class="hidden-lg" style="margin-top:30px;"></div>
                    <div class="col-xs-12 col-md-6">
                        <form id="frmCard" action="@("/checkout/card" +  (@ViewBag.IsMobile ? "?isMobile=true" : "") )" method="post">
                            <a href="javascript:void(0)" onclick="btnPaymentCard()"><img src="~/Images/PayButton.png" width="55%" /></a>
                        </form>
                        <img src="~/Images/Pay2.png" width="75%" />
                    </div>
                </div>
                <br />
            </div>
        </div>
    </div>
</div>
<%--<script type="text/javascript">
    window.history.forward();
    function btnPaymentPayPal() {
        $("#frmPaypal").submit();
    }
    function btnPaymentCard() {
        $("#frmCard").submit();
    }
</script>--%>

</asp:Content>
