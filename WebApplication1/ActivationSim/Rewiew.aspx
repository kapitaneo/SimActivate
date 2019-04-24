<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Rewiew.aspx.cs" Inherits="WebApplication1.ActivationSim.Rewiew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    @model AC.Common.CommonView.OrderViewModel
@{
    float subTotal = 0;
    int count = 0;
    float alreadyPaid = 0;
    float requiredFunding = 0;

    ViewBag.Title = "Review Plans";
    var pagecontrols = Model.PageControlList;
}
@if (Session["AlreadyPaid"] != null && Session["AlreadyPaid"] != "")
{ alreadyPaid = Convert.ToSingle(Session["AlreadyPaid"]); }

<link href="~/Content/tables-responsive.css" rel="stylesheet" />
<div class="container summary">
    <h3 style="color:#3BA7D1">  @(pagecontrols.Where(i => i.ControlTypeName == "lblCHECKOUTREVIEW").FirstOrDefault() != null ? pagecontrols.Where(i => i.ControlTypeName == "lblCHECKOUTREVIEW").FirstOrDefault().ControlValue : "CHECKOUT REVIEW")</h3>
    <br />
    <div class="table-responsive">
        <div class="table table-striped summary-table review-table" id="tableOrder">
            <div class="customHeader">
                <div class="tr">
                    <div class="mobile-show arrow-container"></div>
                    <div class="th serial"><span id="lblSIMTitle">@(pagecontrols.Where(i => i.ControlTypeName == "lblSIMTitle").FirstOrDefault() != null ? pagecontrols.Where(i => i.ControlTypeName == "lblSIMTitle").FirstOrDefault().ControlValue : "SIM/IMEI")</span></div>
                    @*<th><span id="lblCarrierTitle">@(pagecontrols.Where(i => i.ControlTypeName == "lblCarrierTitle").FirstOrDefault() != null ? pagecontrols.Where(i => i.ControlTypeName == "lblCarrierTitle").FirstOrDefault().ControlValue : "Carrier")</span></th>*@
                    <div class="th plan-name"><span id="lblPlanNameTitle">@(pagecontrols.Where(i => i.ControlTypeName == "lblPlanNameTitle").FirstOrDefault() != null ? pagecontrols.Where(i => i.ControlTypeName == "lblPlanNameTitle").FirstOrDefault().ControlValue : "Plan Name")</span></div>
                    <div class="th plans mobile-hidden"><span id="lblPlansTitle">@(pagecontrols.Where(i => i.ControlTypeName == "lblPlansTitle").FirstOrDefault() != null ? pagecontrols.Where(i => i.ControlTypeName == "lblPlansTitle").FirstOrDefault().ControlValue : "Plans")</span></div>
                    <div class="th spiff mobile-hidden"><span id="lblInstantSpiffTitle">@(pagecontrols.Where(i => i.ControlTypeName == "lblInstantSpiffTitle").FirstOrDefault() != null ? pagecontrols.Where(i => i.ControlTypeName == "lblInstantSpiffTitle").FirstOrDefault().ControlValue : "Instant SPIFF")</span></div>
                    <div class="th residual mobile-hidden"><span id="lblPinDiscountAmountTitle">@(pagecontrols.Where(i => i.ControlTypeName == "lblPinDiscountRateTitle").FirstOrDefault() != null ? pagecontrols.Where(i => i.ControlTypeName == "lblPinDiscountRateTitle").FirstOrDefault().ControlValue : "First Month Residual (%)")</span></div>
                    <div class="th discount mobile-hidden"><span id="lblRefillDiscountAmountTitle">@(pagecontrols.Where(i => i.ControlTypeName == "lblPinDiscountAmountTitle").FirstOrDefault() != null ? pagecontrols.Where(i => i.ControlTypeName == "lblPinDiscountAmountTitle").FirstOrDefault().ControlValue : "Refill Discount (%)")</span></div>
                    <div class="th cost mobile-hidden"><span id="lblSIMCostTitle">@(pagecontrols.Where(i => i.ControlTypeName == "lblSimCost").FirstOrDefault() != null ? pagecontrols.Where(i => i.ControlTypeName == "lblSimCost").FirstOrDefault().ControlValue : "SIM Cost")</span></div>
                    <div class="th funding mobile-hidden"><span id="lblPaymentRequiredTitle">@(pagecontrols.Where(i => i.ControlTypeName == "lblPaymentRequiredTitle").FirstOrDefault() != null ? pagecontrols.Where(i => i.ControlTypeName == "lblPaymentRequiredTitle").FirstOrDefault().ControlValue : "Payment Required")</span></div>
                </div>
            </div>
            <div class="tbody">
                @foreach (var item in Model.OrderList)
                {
                    //float total = item.Plans - (item.InstantSPIFF + item.PinDiscountAmount);
                    requiredFunding = item.PaymentRequired;
                    subTotal = subTotal + item.PaymentRequired;
                    count++;
                    <div class="tr">
                        <div class="mobile-show arrow-container review-@count"><a href="#" onclick="hideShowReviewDetails(@count)"><div class="arrow arrow-right"></div></a></div>
                        <div class="td serial">@item.InventoryName</div>
                        @*<td>@item.CarrierName</td>*@
                        <div class="td plan-name">@item.PlanName</div>
                        <div class="td plans mobile-hidden">$@item.Plans.ToString("0.00")</div>
                        <div class="td spiff mobile-hidden" style="color:red">$@item.InstantSPIFF.ToString("0.00")</div>
                        <div class="td residual mobile-hidden" style="color:red">$@item.FirstMonthResidualAmount.ToString("0.00")</div>
                        <div class="td discount mobile-hidden" style="color:red">$@item.RefillDiscount.ToString("0.00")</div>
                        <div class="td cost mobile-hidden">$@item.SIMCost.ToString("0.00")</div>
                        <div class="td funding mobile-hidden">$@item.PaymentRequired.ToString("0.00")</div>
                    </div>
                    <div id="reviewListDetail-@count" class="orderlist-mobile-details mobile-show">
                        <div class="td plans"><label>Plans :</label><span>$@item.Plans.ToString("0.00")</span></div>
                        <div class="td spiff" style="color:red"><label>Instant SPIFF :</label><span>$@item.InstantSPIFF.ToString("0.00")</span></div>
                        <div class="td residual" style="color:red"><label>First Month Residual (%) :</label><span>$@item.FirstMonthResidualAmount.ToString("0.00")</span></div>
                        <div class="td discount" style="color:red"><label>Refill Discount (%) :</label><span>$@item.RefillDiscount.ToString("0.00")</span></div>
                        <div class="td cost"><label>SIM Cost :</label><span>$@item.SIMCost.ToString("0.00")</span></div>
                        <div class="td funding"><label>Funding Required :</label><span>$@item.PaymentRequired.ToString("0.00")</span></div>
                    </div>
                }
            </div>
            @{
                float processingFee = Model.CreditCardProcessingFee * count;
                float grassAmount = subTotal + processingFee;

            }
            <div class="tfoot">
                <div class="tr">
                    <div class="td total-text"><span id="lblTotalTitle">@(pagecontrols.Where(i => i.ControlTypeName == "lblTotalTitle").FirstOrDefault() != null ? pagecontrols.Where(i => i.ControlTypeName == "lblTotalTitle").FirstOrDefault().ControlValue : "Total")</span></div>
                    <div class="td total">$<span id="lblGrandTotal">@subTotal.ToString("0.00")</span></div>
                </div>
                <div class="tr">
                    <div class="td total-text">Processing Fee</div>
                    <div class="td total"><strong>$@processingFee.ToString("0.00")</strong></div>
                </div>
                @if (alreadyPaid > 0)
                {
                    <div class="tr">
                        <div class="tdd total-text"><span id="lblalreadypaidTitle">Already Paid</span></div>
                        <div class="td total" style="color:red">-$@alreadyPaid.ToString("0.00")</div>
                    </div>
                }
                <div class="tr">
                    @if ((requiredFunding - Convert.ToInt32(Session["AlreadyPaid"])) > 0)
                    {
                        <div class="td total-text"><span id="lblTotalTitle">@(pagecontrols.Where(i => i.ControlTypeName == "lblTotalTitlea").FirstOrDefault() != null ? pagecontrols.Where(i => i.ControlTypeName == "lblTotalTitle").FirstOrDefault().ControlValue : "Grand Total")</span></div>
                        <div class="td total">
                            <strong>
                                $@((grassAmount - alreadyPaid).ToString("0.00"))
                            </strong>
                        </div>
                    }
                    else
                    {
                        <div class="td total-text"><span id="lblTotalTitle">@(pagecontrols.Where(i => i.ControlTypeName == "lblTotalTitlea").FirstOrDefault() != null ? pagecontrols.Where(i => i.ControlTypeName == "lblTotalTitle").FirstOrDefault().ControlValue : "Grand Total")</span></div>
                        <div class="td total"><strong>$@grassAmount.ToString("0.00")</strong></div>
                    }
                </div>
                <div class="tr">
                    <div class="td total-text"><span id="lblQuantityTitle">@(pagecontrols.Where(i => i.ControlTypeName == "lblQuantityTitle").FirstOrDefault() != null ? pagecontrols.Where(i => i.ControlTypeName == "lblQuantityTitle").FirstOrDefault().ControlValue : "Quantity of plan(s) being purchased:")</span></div>
                    <div class="td total"><span id="lblNoOfplans">@count</span></div>
                </div>
            </div>
        </div>
    </div>
    <a href="@Url.Action("carddetail", "checkout", new { isMobile = ViewBag.IsMobile})" class="btn btn-primary review-checkout-btn" id="btnCheckOut">@(pagecontrols.Where(i => i.ControlTypeName == "btnCheckOut").FirstOrDefault() != null ? pagecontrols.Where(i => i.ControlTypeName == "btnCheckOut").FirstOrDefault().ControlValue : "Check Out")</a>
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
