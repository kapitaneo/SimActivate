<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Summary.aspx.cs" Inherits="WebApplication1.ActivationSim.Summary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<link href="../CSS/tables-responsive.css" rel="stylesheet" />

<div runat="server" visible="false" class="modal fade" id="achModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1">
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
        <span runat="server" visible="false" id="errorMessage"/>
    </div>
    <div class="table-responsive">
        <div class="table table-striped summary-table">
            <div class="customHeader">
                <div class="tr">
                    <div class="mobile-show arrow-container"></div>
                    <div class="th serial">SIM/IMEI</div>
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
                <asp:Repeater runat="server">
                    <ItemTemplate>
                        <div class="tr">
                        <div class="mobile-show arrow-container order-@count"><a href="#"><div class="arrow arrow-right"></div></a></div>
                        <div class="td serial"><%#Eval("InventoryName")%></div>
                        <div class="td plan-name"><%#Eval("PlanName")%></div>
                        <div class="td plans mobile-hidden"><%#Eval("Plans")%></div>
                        <div class="td spiff mobile-hidden" style="color:red"><%#Eval("InstantSPIFF")%></div>
                        <div class="td residual mobile-hidden" style="color:red"><%#Eval("FirstMonthResidualAmount")%></div>
                        <div class="td discount mobile-hidden" style="color:red"><%#Eval("RefillDiscount")%></div>
                        <div class="td cost mobile-hidden"><%#Eval("SIMCost")%></div>
                        <div class="td funding mobile-hidden"><%#Eval("PaymentRequired")%></div>
                    </div>
                    <div class="tr">
                        <div class="td total-text">Total</div>
                        <div class="td total" style="font-weight:bold"><%#Eval("Total")%></div>
                    </div>
                       <div class="tr">
                        <div class="td quantity-text">Quantity of plan(s) being purchased:</div>
                        <div class="td quantity"><%#Eval("Count")%></div>
                    </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 summary-btn-container">
            <a runat="server" href="#" class="btn btn-primary summary-submit-btn left" onserverclick="ChangePlan_ServerClick">Change</a>
            <a runat="server" href="#" class="btn btn-primary pull-right" id="btnCheckOut">Confirm</a>
        </div>
    </div>
</div>

</asp:Content>
