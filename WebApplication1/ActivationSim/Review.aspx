<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Review.aspx.cs" Inherits="WebApplication1.ActivationSim.Review" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<%
    float subTotal = 0;
    int count = 0;
    float alreadyPaid = 0;
    float requiredFunding = 0;
    float processingFee = Model.CreditCardProcessingFee * count;
    float grassAmount = subTotal + processingFee;

    //ViewBag.Title = "Review Plans";
    var pagecontrols = Model.PageControlList;

    if (Session["AlreadyPaid"] != null && Session["AlreadyPaid"] != "")
    { alreadyPaid = Convert.ToSingle(Session["AlreadyPaid"]); } %>

<link href="../CSS/tables-responsive.css" rel="stylesheet" />
<div class="container summary">
    <h3 style="color:#3BA7D1">CHECKOUT REVIEW</h3>
    <br />
    <div class="table-responsive">
        <div class="table table-striped summary-table review-table" id="tableOrder">
            <div class="customHeader">
                <div class="tr">
                   <div class="mobile-show arrow-container"></div>
                    <div class="th serial"><span id="lblSIMTitle"><%= (pagecontrols.Where(i => i.ControlTypeName == "lblSIMTitle").FirstOrDefault() != null ? pagecontrols.Where(i => i.ControlTypeName == "lblSIMTitle").FirstOrDefault().ControlValue : "SIM/IMEI") %></span></div>            
                    <div class="th plan-name"><span id="lblPlanNameTitle"><%= (pagecontrols.Where(i => i.ControlTypeName == "lblPlanNameTitle").FirstOrDefault() != null ? pagecontrols.Where(i => i.ControlTypeName == "lblPlanNameTitle").FirstOrDefault().ControlValue : "Plan Name") %></span></div>
                    <div class="th plans mobile-hidden"><span id="lblPlansTitle"><%=(pagecontrols.Where(i => i.ControlTypeName == "lblPlansTitle").FirstOrDefault() != null ? pagecontrols.Where(i => i.ControlTypeName == "lblPlansTitle").FirstOrDefault().ControlValue : "Plans")%></span></div>
                    <div class="th spiff mobile-hidden"><span id="lblInstantSpiffTitle"><%=(pagecontrols.Where(i => i.ControlTypeName == "lblInstantSpiffTitle").FirstOrDefault() != null ? pagecontrols.Where(i => i.ControlTypeName == "lblInstantSpiffTitle").FirstOrDefault().ControlValue : "Instant SPIFF")%></span></div>
                    <div class="th residual mobile-hidden"><span id="lblPinDiscountAmountTitle"><%=(pagecontrols.Where(i => i.ControlTypeName == "lblPinDiscountRateTitle").FirstOrDefault() != null ? pagecontrols.Where(i => i.ControlTypeName == "lblPinDiscountRateTitle").FirstOrDefault().ControlValue : "First Month Residual (%)")%></span></div>
                    <div class="th discount mobile-hidden"><span id="lblRefillDiscountAmountTitle"><%=(pagecontrols.Where(i => i.ControlTypeName == "lblPinDiscountAmountTitle").FirstOrDefault() != null ? pagecontrols.Where(i => i.ControlTypeName == "lblPinDiscountAmountTitle").FirstOrDefault().ControlValue : "Refill Discount (%)")%></span></div>
                    <div class="th cost mobile-hidden"><span id="lblSIMCostTitle"><%=(pagecontrols.Where(i => i.ControlTypeName == "lblSimCost").FirstOrDefault() != null ? pagecontrols.Where(i => i.ControlTypeName == "lblSimCost").FirstOrDefault().ControlValue : "SIM Cost")%></span></div>
                    <div class="th funding mobile-hidden"><span id="lblPaymentRequiredTitle"><%=(pagecontrols.Where(i => i.ControlTypeName == "lblPaymentRequiredTitle").FirstOrDefault() != null ? pagecontrols.Where(i => i.ControlTypeName == "lblPaymentRequiredTitle").FirstOrDefault().ControlValue : "Payment Required")%></span></div>
                </div>
            </div>
            <div class="tbody">
                  <asp:Repeater ID="OrderListRpt" runat="server">
                      <ItemTemplate>
                        <div class="tr">
                        <div class="mobile-show arrow-container"><a href="#" onclick="hideShowReviewDetails(1)"><div class="arrow arrow-right"></div></a></div>
                        <div class="td serial"><%#Eval("InventoryName")%></div>
                        <div class="td plan-name"><%#Eval("PlanName")%></div>
                        <div class="td plans mobile-hidden"><%#Eval("Plans")%></div>
                        <div class="td spiff mobile-hidden" style="color:red"><%#Eval("InstantSPIFF")%></div>
                        <div class="td residual mobile-hidden" style="color:red"><%#Eval("FirstMonthResidualAmount")%></div>
                        <div class="td discount mobile-hidden" style="color:red"><%#Eval("RefillDiscount")%></div>
                        <div class="td cost mobile-hidden"><%#Eval("SIMCost")%></div>
                        <div class="td funding mobile-hidden"><%#Eval("PaymentRequired")%></div>
                    </div>
                      </ItemTemplate>
                  </asp:Repeater>
            </div>
            <div class="tfoot">
                <div class="tr">
                    <div class="td total-text"><span>Total</span></div>
                    <div class="td total">$<span id="lblGrandTotal"></span></div>
                </div>
                <div class="tr">
                    <div class="td total-text">Processing Fee</div>
                    <div class="td total"><strong><%=processingFee.ToString("0.00")%></strong></div>
                </div>
               <% if (alreadyPaid > 0){ %>
                    <div runat="server" visible="false" id="alreadyPaidDivId" class="tr">
                        <div runat="server" class="tdd total-text"><span id="lblalreadypaidTitle">Already Paid</span></div>
                        <div runat="server" class="td total" style="color:red"> alreadyPaid.ToString("0.00")</div>
                    </div>
                <% } %>
                <div class="tr">
                   <% if (alreadyPaid > 0){ %>
                    <div class="tr">
                        <div class="tdd total-text"><span id="lblalreadypaidTitle">Already Paid</span></div>
                        <div class="td total" style="color:red">alreadyPaid.ToString("0.00")</div>
                    </div>
                    <% } %>
                   <% if ((requiredFunding - Convert.ToInt32(Session["AlreadyPaid"])) > 0)
                    {%>

                        <div class="td total-text"><span id="lblTotalTitle">Grand Total</span></div>
                        <div class="td total">
                            <strong>
                             <%=(grassAmount - alreadyPaid).ToString("0.00") %>
                            </strong>
                        </div>
                    <%} %>

                    <%else { %>
                        <div class="td total-text"><span>Grand Total</span></div>
                        <div class="td total"><strong><%=grassAmount.ToString("0.00")%></strong></div>
                    <% } %>
                </div>
                <div class="tr">
                    <div class="td total-text"><span id="lblQuantityTitle">Quantity of plan(s) being purchased:</span></div>
                    <div class="td total"><span id="lblNoOfplans"><%=count%></span></div>
                </div>
            </div>
        </div>
    </div>
    <a href="CardDetail" class="btn btn-primary review-checkout-btn" id="btnCheckOut">Check Out</a>
</div>
<script src="../Scripts/jquery-3.3.1.js"></script>
</asp:Content>
