<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PlansDetail.ascx.cs" Inherits="WebApplication1.UserControls.PlansDetail" %>
<div class="table table-bordered">
<asp:Repeater runat="server" ID="PlanDeailsRpt" >
    <HeaderTemplate>
     <div class="planInfo-thead">
     <div class="planInfo-thead-inner">
       <div class="td select"></div>
       <div class="td plan-name">Plan Name</div>
       <div class="td plans">Plans</div>
       <div class="td spiff mobile-hidden">Instant SPIFF</div>
       <div class="td residual mobile-hidden">First Month Residual (%)</div>
       <div class="td discount mobile-hidden">Refill Discount (%)</div>
       <div class="td cost mobile-hidden">SIM Cost</div>
       <div class="td funding mobile-hidden">Funding Required</div>
     </div>
   </div>
    </HeaderTemplate>
    <ItemTemplate>
      <div id="trData">
       <div class="trData-inner">
       <div class="td select">
           <input type="radio" name="radCustomer" value='<%#Eval("Name") %>' />
       </div>
       <div class="td plan-name"><%#DataBinder.Eval(Container.DataItem ,"Name")%></div>
       <div class="td plans"><%#DataBinder.Eval(Container.DataItem ,"Value")%></div>
       <div class="td spiff mobile-hidden"><%#DataBinder.Eval(Container.DataItem ,"InstantSpiff")%></div>
       <div class="td residual mobile-hidden"><%#Eval("FirstMonthResidual")%></div>
       <div class="td discount mobile-hidden"><%#Eval("RefillDiscount")%></div>
       <div class="td cost mobile-hidden"><%#Eval("SIMCost")%></div>
       <div class="td funding mobile-hidden"><%#Eval("FundingRequired")%></div>
      </div>
   </div>

    </ItemTemplate>
</asp:Repeater>
    </div>
