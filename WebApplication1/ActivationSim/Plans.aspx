<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Plans.aspx.cs" Inherits="WebApplication1.ActivationSim.Plans" %>

<%@ Register Src="~/UserControls/PlansDetail.ascx" TagName="PlansDetail" TagPrefix="PlDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link href="../CSS/tables-responsive.css" rel="stylesheet" type="text/css" />

    <div class="container">
        <div class="row">
            <div class="row  col-xs-12 col-md-6 col-md-offset-3">
                <div class="col-xs-12 col-md-12 alert alert-warning text-center" id="dvMsg" style="display: none">
                    <span id="dvMsgbody"></span>
                    <a href="#" class="close" onclick="hide();" aria-label="close">&times;</a>
                </div>
            </div>
            <div class="row col-xs-8 col-md-8 add-sim-container">
                <div class="form-group row">
                    <div id="dvSIMADD">
                    </div>
                    <div class="col-xs-12 col-md-12">
                        <div class="button-container">
                            <a class="btn-sm btn-primary add-sim" href="Index">Click here to Add More Sim</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="row col-xs-12 col-md-12 table-responsive plan-search-table">
                <div class="table table-bordered" id="tablePlan">
                    <div class="">
                        <div class="tablePlan-header">
                            <div class="th arrow-hider"></div>
                            <div runat="server" id="divserialId" class="th serial">SIM/IMEI</div>
                            <div runat="server" id="divcarrierId" class="th carrier">Carrier</div>
                            <div runat="server" id="divrateplanId" class="th rate-plan mobile-hidden">Selected Plan</div>
                            <div class="th closer-td"></div>
                        </div>
                    </div>
                    <div id="tbodyPlan">
                        <asp:Repeater runat="server" ID="CarrierPlanDetailRpt" OnItemDataBound="CarrierPlanDetailRpt_ItemDataBound">
                            <ItemTemplate>
                                <div class="simDetail" id="simDetail">
                                    <div class="td arrow-hider">
                                        <asp:LinkButton runat="server" CssClass="middle show plan" OnClick="HideShow_ServerClick"><div class="arrow arrow-down"></div></asp:LinkButton>
                                    </div>
                                    <div class="td serial"><span class="form-control middle" style="border: none" id="txtSim"><%#Eval("SIM")%> </span>
                                        <input type="hidden" name="Inventory" value="InventoryId" />
                                    </div>
                                    <div class="td carrier">
                                        <img src="/Images/Carriers/<%#Eval("Image")%>" class="middle col-md-6 col-xs-6 " alt="No Image" /></div>
                                    <div class="td rate-plan mobile-hidden">
                                         <asp:LinkButton runat="server" ID="lbInside" CssClass="middle show plan" OnClick="HideShow_ServerClick">Hide a Plan</asp:LinkButton>
                                    </div>
                                    <div class="td closer-td"><a class="middle" href="#" style="float: left" onclick="Delete()">
                                        <img class="close-button" src="/Images/cross.jpg" /></a></div>
                                </div>
                                <asp:Panel runat="server" ID="planInfo" CssClass="planInfoplan" EnableViewState="true">
                                    <PlDetails:PlansDetail ID="PlansdetailUC" runat="server" />
                                </asp:Panel>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="row col-xs-6 col-md-6">
            </div>
            <div class="col-xs-6 col-md-6 button-container">
                <a href="#" class="btn btn-primary pull-right" id="btnconfirmplan" onclick="return ConfirmPlan();">Confirm
                </a>
            </div>
        </div>
    </div>
</asp:Content>
