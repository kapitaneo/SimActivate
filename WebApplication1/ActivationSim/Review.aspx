<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Review.aspx.cs" Inherits="WebApplication1.ActivationSim.Review" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<%--    @model AC.Common.CommonView.OrderViewModel
@{
    float subTotal = 0;
    int count = 0;
    float alreadyPaid = 0;
    float requiredFunding = 0;

    ViewBag.Title = "Review Plans";
    var pagecontrols = Model.PageControlList;
}
@if (Session["AlreadyPaid"] != null && Session["AlreadyPaid"] != "")
{ alreadyPaid = Convert.ToSingle(Session["AlreadyPaid"]); }--%>

<link href="../CSS/tables-responsive.css" rel="stylesheet" />
<div class="container summary">
    <h3 style="color:#3BA7D1">CHECKOUT REVIEW</h3>
    <br />
    <div class="table-responsive">
        <div class="table table-striped summary-table review-table" id="tableOrder">
            <div class="customHeader">
                <div class="tr">
                    <div class="mobile-show arrow-container"></div>
                    <div class="th serial"><span id="lblSIMTitle">SIM/IMEI</span></div>
                  <%--  @*<th><span id="lblCarrierTitle">@(pagecontrols.Where(i => i.ControlTypeName == "lblCarrierTitle").FirstOrDefault() != null ? pagecontrols.Where(i => i.ControlTypeName == "lblCarrierTitle").FirstOrDefault().ControlValue : "Carrier")</span></th>*@--%>
                    <div class="th plan-name"><span id="lblPlanNameTitle">Plan Name</span></div>
                    <div class="th plans mobile-hidden"><span id="lblPlansTitle">Plans</span></div>
                    <div class="th spiff mobile-hidden"><span id="lblInstantSpiffTitle">Instant SPIFF</span></div>
                    <div class="th residual mobile-hidden"><span id="lblPinDiscountAmountTitle">First Month Residual (%)</span></div>
                    <div class="th discount mobile-hidden"><span id="lblRefillDiscountAmountTitle"> Refill Discount (%)</span></div>
                    <div class="th cost mobile-hidden"><span id="lblSIMCostTitle">SIM Cost</span></div>
                    <div class="th funding mobile-hidden"><span id="lblPaymentRequiredTitle">Payment Required</span></div>
                </div>
            </div>
            <div class="tbody">
<%--                @foreach (var item in Model.OrderList)
                {
                    //float total = item.Plans - (item.InstantSPIFF + item.PinDiscountAmount);
                    requiredFunding = item.PaymentRequired;
                    subTotal = subTotal + item.PaymentRequired;
                    count++;--%>
                    <div class="tr">
                        <div class="mobile-show arrow-container review-@count"><a href="#" onclick="hideShowReviewDetails(@count)"><div class="arrow arrow-right"></div></a></div>
                        <div class="td serial"><%--@item.InventoryName--%></div>
                        <div class="td plan-name"><%--@item.PlanName--%></div>
                        <div class="td plans mobile-hidden"><%--$@item.Plans.ToString("0.00")--%></div>
                        <div class="td spiff mobile-hidden" style="color:red"><%--$@item.InstantSPIFF.ToString("0.00")--%></div>
                        <div class="td residual mobile-hidden" style="color:red"><%--$@item.FirstMonthResidualAmount.ToString("0.00")--%></div>
                        <div class="td discount mobile-hidden" style="color:red"><%--$@item.RefillDiscount.ToString("0.00")--%></div>
                        <div class="td cost mobile-hidden"><%--$@item.SIMCost.ToString("0.00")--%></div>
                        <div class="td funding mobile-hidden"><%--$@item.PaymentRequired.ToString("0.00")--%></div>
                    </div>
            </div>
          <%--  @{
                float processingFee = Model.CreditCardProcessingFee * count;
                float grassAmount = subTotal + processingFee;

            }--%>
            <div class="tfoot">
                <div class="tr">
                    <div class="td total-text"><span>Total</span></div>
                    <div class="td total">$<span id="lblGrandTotal"></span></div>
                </div>
                <div class="tr">
                    <div class="td total-text">Processing Fee</div>
                    <div class="td total"><strong><%--$@processingFee.ToString("0.00")--%></strong></div>
                </div>
               <% if (alreadyPaid > 0){ %>
                    <div runat="server" visible="false" id="alreadyPaidDivId" class="tr">
                        <div runat="server" class="tdd total-text"><span id="lblalreadypaidTitle">Already Paid</span></div>
                        <div runat="server" class="td total" style="color:red"><%---$@alreadyPaid.ToString("0.00")--%></div>
                    </div>
                <% } %>
                <div class="tr">
                   <% if (alreadyPaid > 0){ %>
                   <%-- @if ((requiredFunding - Convert.ToInt32(Session["AlreadyPaid"])) > 0)
                    {--%>

                        <div class="td total-text"><span id="lblTotalTitle">Grand Total</span></div>
                        <div class="td total">
                            <strong>
                             <%--   $@((grassAmount - alreadyPaid).ToString("0.00"))--%>
                            </strong>
                        </div>
                    <% } %>

                    <%else { %>
                        <div class="td total-text"><span>Grand Total</span></div>
                        <div class="td total"><strong><%--$@grassAmount.ToString("0.00")--%></strong></div>
                    <% } %>
                </div>
                <div class="tr">
                    <div class="td total-text"><span id="lblQuantityTitle">Quantity of plan(s) being purchased:</span></div>
                    <div class="td total"><span id="lblNoOfplans"><%--@count--%></span></div>
                </div>
            </div>
        </div>
    </div>
    <a href="CardDetail" class="btn btn-primary review-checkout-btn" id="btnCheckOut">Check Out</a>
</div>
<script src="~/Scripts/jquery-1.10.2.js"></script>
<script type="text/javascript">
    window.history.forward();
    $(document).ready(function () {
        //GetOrderDetails();

    });

    function hideShowReviewDetails(num) {
        $("#reviewListDetail-" + num).toggleClass("active");
        $(".review-" + num).toggleClass("active");
    }

    function GetOrderDetails() {
        var orderId, noOfPlans = 0, grandTotal = 0, request = {};
        //orderId = GetQueryStringByParameter("OrderId");

        request.WsUserGUid = wsUserGUid;
        $.ajax({
            async: false,
            cache: false,
            type: "POST",
            url: serviceUrl + "GetOrderDetail/" + wsUserGUid,
            data: request,
            success: function (response) {
                noOfPlans = response.Data != null ? response.Data.length : 0;
                if (response.IsSuccess) {
                    if (response.Data != null && response.Data.length <= 0) {
                        var orderData = ' <div class="tr">' +
                            ' <div class="td text-center" colspan="7">There are no details.</div>' +
                            '</div>';
                        $("#tableOrder").append(orderData);
                    }

                    $.each(response.Data, function (i, item) {
                        var total = 0, orderData = "";
                        total = parseFloat(item.Plans) + parseFloat(item.InstantSPIFF) - parseFloat(item.FirstMonthResidualAmount);
                        grandTotal += total;
                        orderData = '<div class="tr">' +
                            '<div class="td">' + item.InventoryName + '</td>' +
                            '<div class="td">' + item.CarrierName + '</td>' +
                            '<div class="td">' + item.PlanName + '</td>' +
                            '<div class="td">$' + item.Plans + '</td>' +
                            '<div class="td">$' + item.InstantSPIFF + '</td>' +
                            '<div class="td">$' + item.FirstMonthResidualAmount + '</td>' +
                            '<div class="td">$' + total.toFixed(2) + '</td>' +
                            '</div>';
                        $("#tableOrder").append(orderData);
                    });

                    $("#lblGrandTotal").text(grandTotal.toFixed(2));
                    $("#lblNoOfplans").text(noOfPlans);
                }
                else {
                    alert("Error: " + response.Message);
                }
            },
            failure: function (response) { }
        });



    }
</script>
</asp:Content>
