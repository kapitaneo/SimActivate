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
                                        <%--<a href="#" onclick="Hide(0)" class="middle hide plan"><div class="arrow arrow-down"></div></a>--%>
                                        <%--<a runat="server" href="#" onserverclick="HideShow_ServerClick" id="HideShow" class="middle show plan button-success"><div class="arrow arrow-right"></div></a>--%>
                                        <asp:LinkButton runat="server" CssClass="middle show plan" OnClick="HideShow_ServerClick"></asp:LinkButton>
                                    </div>
                                    <div class="td serial"><span class="form-control middle" style="border: none" id="txtSim"><%#Eval("SIM")%> </span>
                                        <input type="hidden" name="Inventory" value="InventoryId" />
                                    </div>
                                    <div class="td carrier">
                                        <img src="/Images/Carriers/<%#Eval("Image")%>" class="middle col-md-6 col-xs-6 " alt="No Image" /></div>
                                    <div class="td rate-plan mobile-hidden">
                                    <a href="#"  class="hide plan">Hide a Plan</a>
                                    <a href="#"  class="show plan">Show a Plan</a>
                                    </div>
                                    <div class="td closer-td"><a class="middle" href="#" style="float: left" onclick="Delete(0 , planCartId, IsSession)">
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
    <script src="~/Scripts/jquery-1.10.2.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            CheckQueryString();
            LoadCarriers();
            if (GetQueryStringByParameter("ischange") != "")
                GetInventoriesBySession();
            else
                GetFirstInventory();


        });
        $(".button-success").click(function () {
            $(this).next(".planInfoplan").slideToggle("slow", function () {
                // Animation complete.
            });
        });
        var simDetail = 0;
        function ConfirmPlan() {
            var inventories = $("input[name='Inventory']");
            var plansAll = [];
            var inventoriesAll = [];
            var choosenPlan = "";
            var choosenInventories = "";

            inventories.each(function (i, item) {
                var plans = $("input[name='plan" + item.value + "']");
                plans.each(function (i, plan) {
                    if ($(plan).is(":checked")) {
                        plansAll.push($(plan).val() + "-" + $(plan).attr("planpriceid"));
                        inventoriesAll.push(item.value);
                    }
                });
            });

            choosenPlan = plansAll.join();
            choosenInventories = inventoriesAll.join();

            if (choosenPlan == "") {
                showMessage("Please choose a plan.", "alert-danger", "alert-warning");
                return false;
            }
            else {
                $.ajax({
                    async: false,
                    cache: false,
                    type: "POST",
                    url: 'Plans.aspx/Summary',
                    data: { plans: choosenPlan, inventories: choosenInventories },
                    success: function (response) {

                    },
                    failure: function (response) { }
                });
            }

            console.log(plans);
            return false;
        }

        function Hide(num) {
            $(".show" + num).removeClass("plan");
            $("#planInfo" + num).hide();
            $(".hide" + num).addClass("plan");
        }

        function Show(num) {
            $(".hide" + num).removeClass("plan");
            $("#planInfo" + num).show();
            $(".show" + num).addClass("plan");
        }

        function showPlanDetails(num) {
            $("#planDetail" + num).toggleClass("active");
            $(".divider-" + num).toggleClass("active");
        }



        function CheckQueryString() {
            var sim = GetQueryStringByParameter("sim");
            if (sim != null && sim != "") {
                $("#txtSim1").val(sim);
            }
        }

        function Delete(num, planCartId, IsSession) {
            if (IsSession != '') {
                $.ajax({
                    async: false,
                    cache: false,
                    type: "POST",
                    url: '@Url.Action("DeleteSessionPlan", "Search")',
                    data: { planCartId: planCartId },
                    success: function (response) {
                        if (response == false) {
                            return false;
                        }
                    },
                    failure: function (response) { }
                });
            }

            if (planCartId != '') {
                $.ajax({
                    async: false,
                    cache: false,
                    type: "POST",
                    url: '@Url.Action("DeletePlanCart", "Search")',
                    data: { planCartId: planCartId },
                    success: function (response) {
                        if (response == false) {
                            return false;
                        }
                    },
                    failure: function (response) { }
                });
            }

            $("#simDetail" + num).remove();
            $("#planInfo" + num).remove();
            $(".rate-plan" + num).remove();
            if ($("#tbodyPlan >tr").length === 0) {
                var body = "<tr class='trMsg'><td colspan='4'>Please add SIM/IMEI for getting plans</td></tr>";
                $("#tbodyPlan").append(body);
            }
        }

    </script>


</asp:Content>
