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
                        <a runat="server" href="javascript:void(0)" onserverclick="PayPalPayment_ServerClick"><img src="../Images/PaymentOptions/Paypal.png" class="col-md-offset-3" width="65%" /></a>
                    </div>
                    <div class="hidden-lg" style="margin-top:30px;"></div>
                    <div class="col-xs-12 col-md-6">
                        <a href="javascript:void(0)" onclick="btnPaymentCard()"><img src="../Images/PaymentOptions/PayButton.png" width="55%" /></a>
                        <img src="../Images/PaymentOptions/Pay2.png" width="75%" />
                    </div>
                </div>
                <br />
            </div>
        </div>
    </div>
</div>

</asp:Content>
