<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Summary.aspx.cs" Inherits="WebApplication1.ActivationSim.Summary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

 <%--   @model AC.Common.CommonView.OrderModel
@{
    ViewBag.Title = "Summary";

    var exceedsACHLimit = Session["ExceedsACHLimit"];
    Session["ExceedsACHLimit"] = false;

    float subTotal = 0;
    int count = 0;

    var pageCtrl = Model.PageControlList;

    var lblSummaryTitle = pageCtrl.Where(m => m.ControlTypeName == "lblSummaryTitle").FirstOrDefault();
    var lblSIMTitle = pageCtrl.Where(m => m.ControlTypeName == "lblSIMTitle").FirstOrDefault();
    var lblCarrierTitle = pageCtrl.Where(m => m.ControlTypeName == "lblCarrierTitle").FirstOrDefault();
    var lblPlanNameTitle = pageCtrl.Where(m => m.ControlTypeName == "lblPlanNameTitle").FirstOrDefault();
    var lblPlansTitle = pageCtrl.Where(m => m.ControlTypeName == "lblPlansTitle").FirstOrDefault();
    var lblInstantSpiffTitle = pageCtrl.Where(m => m.ControlTypeName == "lblInstantSpiffTitle").FirstOrDefault();
    var lblPinDiscountAmountTitle = pageCtrl.Where(m => m.ControlTypeName == "lblPinDiscountAmountTitle").FirstOrDefault();
    var lblPinDiscountRate = pageCtrl.Where(m => m.ControlTypeName == "lblPinDiscountRate").FirstOrDefault();
    var lblPaymentRequiredTitle = pageCtrl.Where(m => m.ControlTypeName == "lblPaymentRequiredTitle").FirstOrDefault();
    var lblPinDiscountRateTitle = pageCtrl.Where(m => m.ControlTypeName == "lblPinDiscountRateTitle").FirstOrDefault();
    var btnChangeTitle = pageCtrl.Where(m => m.ControlTypeName == "btnChangeTitle").FirstOrDefault();
    var btnConfirmTitle = pageCtrl.Where(m => m.ControlTypeName == "btnConfirmTitle").FirstOrDefault();
    var lblSimCost = pageCtrl.Where(m => m.ControlTypeName == "lblSimCost").FirstOrDefault();
}--%>
<link href="../CSS/tables-responsive.css" rel="stylesheet" />

<div class="modal fade" id="achModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" style="display:none">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Information</h4>
            </div>
            <div class="modal-body">
                You have exceeded your ACH Limit.  Please contact your support to pay the outstanding ACH balance.  You may continue to pay for this Plan with a valid Credit Card or PayPal
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"> Cancel</button>
              
                <a href="#" class="btn btn-primary btn-ach-pay"> Pay Now</a>
            </div>
        </div>
    </div>
</div>

<div class="container summary">
    <h3 style="color:#3BA7D1">Summary </h3>
    <br />
    <div class="col-md-12 alert alert-danger text-center" id="dvMsg" style="display:none">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <span runat ="server" id="errorMessage"/>
    </div>
    <div class="table-responsive">
        <div class="table table-striped summary-table">
            <div class="customHeader">
                <div class="tr">
                    <div class="mobile-show arrow-container"></div>
                    <div class="th serial">SIM/IMEI</div>
                    <%--@*<th>@(lblCarrierTitle != null ? lblCarrierTitle.ControlValue : "Carrier")</th>*@--%>
                    <div class="th plan-name">Plan Name</div>
                    <div class="th plans mobile-hidden">Plans</div>
                    <div class="th spiff mobile-hidden" style="color:#f0f0f0">Instant SPIFF</div>
                    <div class="th residual mobile-hidden" style="color:#f0f0f0">First Month Residual (%)</div>
                    <div class="th discount mobile-hidden" style="color:#f0f0f0">Refill Discount (%)</div>
                    <div class="th cost mobile-hidden">SIM Cost</div>
                    <div class="th funding mobile-hidden" style="color:#f0f0f0">Funding Required</div>
                </div>
            </div>
            <div class="tbody">

               <%-- @foreach (var item in Model.OrderList)
                {
                    //float total = item.Plans - (item.InstantSPIFF + item.PinDiscountAmount);
                    subTotal = subTotal + item.PaymentRequired;
                    count++;--%>
                    <div class="tr">
                        <div class="mobile-show arrow-container order-@count"><a href="#" onclick="hideShowOrderDetails(@count)"><div class="arrow arrow-right"></div></a></div>
                        <div class="td serial"><%--@item.InventoryName--%></div>
                       <%-- @*<td>@item.CarrierName</td>*@--%>
                        <div class="td plan-name">@item.PlanName</div>
                        <div class="td plans mobile-hidden">$@item.Plans.ToString("0.00")</div>
                        <div class="td spiff mobile-hidden" style="color:red">$@item.InstantSPIFF.ToString("0.00")</div>
                        <div class="td residual mobile-hidden" style="color:red">@item.FirstMonthResidualAmount.ToString("0.00")</div>
                        <div class="td discount mobile-hidden" style="color:red">@item.RefillDiscount.ToString("0.00")</div>
                        <div class="td cost mobile-hidden">$@item.SIMCost.ToString("0.00")</div>
                        <div class="td funding mobile-hidden">$@item.PaymentRequired.ToString("0.00")</div>
                    </div>
                    <div id="orderListDetail-@count" class="orderlist-mobile-details mobile-show">
                        <div class="td plans"><label>Plans :</label><span>$@item.Plans.ToString("0.00")</span></div>
                        <div class="td spiff"><label>Instant SPIFF :</label><span>$@item.InstantSPIFF.ToString("0.00")</span></div>
                        <div class="td residual"><label>First Month Residual (%) :</label><span>@item.FirstMonthResidualAmount.ToString("0.00")</span></div>
                        <div class="td discount"><label>Refill Discount (%) :</label><span>@item.RefillDiscount.ToString("0.00")</span></div>
                        <div class="td cost"><label>SIM Cost :</label><span>$@item.SIMCost.ToString("0.00")</span></div>
                        <div class="td funding"><label>Funding Required :</label><span>$@item.PaymentRequired.ToString("0.00")</span></div>
                    </div>
                }
                <div class="tr">
                    <div class="td total-text">Total</div>
                    <div class="td total" style="font-weight:bold">$@(subTotal.ToString("0.00"))</div>
                </div>
                <div class="tr">
                    <div class="td quantity-text">Quantity of plan(s) being purchased:</div>
                    <div class="td quantity">@count</div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-8 summary-btn-container">
            <a runat="server" href="#" class="btn btn-primary summary-submit-btn left" onserverclick="ChangePlan_ServerClick">Change</a>
        </div>
        @using (Html.BeginForm("init", "checkout", new { isMobile = ViewBag.IsMobile }, FormMethod.Post, new { id = "checkout-form"}))
        {
            <input type="hidden" value="false" name="isForcedACHToPay" id="isForcedACHToPay"/>
            <div class="col-xs-4 summary-btn-container">
<%--                @*<a href="@Url.Action("paymentoption", "checkout")" id="btnCheckOut" class="btn btn-primary pull-right">@(btnConfirmTitle != null ? btnConfirmTitle.ControlValue : "Check Out")</a>*@--%>
                <input type="submit" value="@(btnConfirmTitle != null ? btnConfirmTitle.ControlValue : "Check Out")" class="btn btn-primary summary-submit-btn pull-right" />
            </div>
        }
    </div>
</div>
<script src="../Scripts/jquery-3.3.1.js"></script>

<script type="text/javascript">

    window.history.forward();

    $(document).ready(function () { 

        if ('@exceedsACHLimit' == 'True') {
            $('#achModal').modal('show');
        }
        $(document).on('click', '.btn-ach-pay', function (e) {
            e.preventDefault();
            $('#isForcedACHToPay').val(true);

            $('#checkout-form').submit();

        });
        CheckMessage();
    });

    function CheckMessage() {
        var msg = '@TempData["msg"]';
        if (msg != null && msg != "" && msg != undefined) {
            $("#dvMsg").show();
        }

        setTimeout(function () {
            $("#dvMsg").hide();
        }, 3000);
    }

    function hideShowOrderDetails(num) {
        $("#orderListDetail-" + num).toggleClass("active");
        $(".order-" + num).toggleClass("active");
    } 

</script>
    </span>
</asp:Content>
