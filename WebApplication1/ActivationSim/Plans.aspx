<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Plans.aspx.cs" Inherits="WebApplication1.ActivationSim.Plans" %>
<%@ Register src="~/UserControls/PlansDetail.ascx" Tagname="PlansDetail" Tagprefix="PlDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<%--    ViewBag.Title = "Choose Plan";
    var lblSIM = Model.Where(m => m.ControlTypeName == "lblSIM").FirstOrDefault();
    var lblSIMTitle = Model.Where(m => m.ControlTypeName == "lblSIMTitle").FirstOrDefault();
    var lblCarrierTitle = Model.Where(m => m.ControlTypeName == "lblCarrierTitle").FirstOrDefault();
    var lblRatePlanTitle = Model.Where(m => m.ControlTypeName == "lblRatePlanTitle").FirstOrDefault();
    var lblHidePlan = Model.Where(m => m.ControlTypeName == "lblHidePlan").FirstOrDefault();
    var lblShowPlan = Model.Where(m => m.ControlTypeName == "lblShowPlan").FirstOrDefault();
    var lblPlanNameTitle = Model.Where(m => m.ControlTypeName == "lblPlanNameTitle").FirstOrDefault();
    var lblPlansTitle = Model.Where(m => m.ControlTypeName == "lblPlansTitle").FirstOrDefault();
    var lblInstantSpiffTitle = Model.Where(m => m.ControlTypeName == "lblInstantSpiffTitle").FirstOrDefault();
    var lblPinDiscountRateTitle = Model.Where(m => m.ControlTypeName == "lblPinDiscountRateTitle").FirstOrDefault();
    var lblPinDiscountAmountTitle = Model.Where(m => m.ControlTypeName == "lblPinDiscountAmountTitle").FirstOrDefault();
    var lblSimCost = Model.Where(m => m.ControlTypeName == "lblSimCost").FirstOrDefault();
    var lblPaymentRequiredTitle = Model.Where(m => m.ControlTypeName == "lblPaymentRequiredTitle").FirstOrDefault();
    var btnConfirmPlan = Model.Where(m => m.ControlTypeName == "btnConfirmPlan").FirstOrDefault();
    var btnChange = Model.Where(m => m.ControlTypeName == "btnChangeTitle").FirstOrDefault();
}--%>

    
<link href="../CSS/tables-responsive.css" rel="stylesheet" type="text/css" />

<div class="container">
    <div class="row">
        <div class="row  col-xs-12 col-md-6 col-md-offset-3">
            <div class="col-xs-12 col-md-12 alert alert-warning text-center" id="dvMsg" style="display:none">
                <span id="dvMsgbody"></span>
                <a href="#" class="close" onclick="hide();" aria-label="close">&times;</a>
                <center> </center>
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
                        <div class="th arrow-hider"><!--@(lblRatePlanTitle != null ? lblRatePlanTitle.ControlValue : "Rate Plan")--></div>
                        <div runat="server" id="divserialId" class="th serial"><%--@(lblSIMTitle != null ? lblSIMTitle.ControlValue : --%>SIM/IMEI</div>
                        <div runat="server" id="divcarrierId" class="th carrier">Carrier</div>
                        <div runat="server" id="divrateplanId" class="th rate-plan mobile-hidden">Selected Plan</div>
                        <%--@*<div class="th rate-plan mobile-hidden">"Rate Plan"</div>*@--%>
                        <div class="th closer-td"></div>
                    </div>
                </div>
                <div id="tbodyPlan">
                    <asp:Repeater runat="server" ID="CarrierPlanDetailRpt" OnItemDataBound="CarrierPlanDetailRpt_ItemDataBound">
                        <ItemTemplate>
                            <div class="simDetail" id="simDetail">
                            <div class="td arrow-hider">
                                <a href="#" onclick="Hide(0)" class="middle hideplan"><div class="arrow arrow-down"></div></a>
                                <a href="#" onclick="Show(0)" class="middle showplan"><div class="arrow  arrow-right"></div></a>
                            </div>
                            <div class="td serial"><span name="txtSIM" class="form-control middle" style="border:none" id="txtSim"> <%#Eval("SIM")%> </span><input type="hidden" name="Inventory" value="InventoryId" /> </div>
                            <div class="td carrier"><img src="/Images/Carriers/<%#Eval("Image")%>" class="middle col-md-6 col-xs-6 " alt="No Image" /></div>
                                <div class="td rate-plan mobile-hidden">
                                <a href="#" onclick="Hide()" class="hide plan">Hide a Plan</a>
                                <a href="#" onclick="Show()" class="show plan">Show a Plan</a>
                            </div>
                            <div class="td closer-td"><a class="middle" href="#" style="float:left" onclick="Delete(0 , planCartId, IsSession)"><img  class="close-button" src="/Images/cross.jpg"/></a></div>
                        </div>
                        <div id="planInfo" class="planInfoplan">
                            <div colspan="5">
                                <PlDetails:PlansDetail ID="PlansdetailUC" runat="server"/>
                                <%--<div class="table table-bordered">
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
                                    <div id="trData">
                                         <div class="trData-inner">
                                            <div class="td select">
                                                <input  class="radio-plan" type="radio"/>
                                            </div>
                                            <div class="td plan-name"><%#Eval("Name")%></div>
                                            <div class="td plans"><%#Eval("Value")%></div>
                                            <div class="td spiff mobile-hidden"><%#Eval("InstantSpiff")%></div>
                                            <div class="td residual mobile-hidden"><%#Eval("FirstMonthResidual")%></div>
                                            <div class="td discount mobile-hidden"><%#Eval("RefillDiscount")%></div>
                                            <div class="td cost mobile-hidden"><%#Eval("SIMCost")%></div>
                                            <div class="td funding mobile-hidden"><%#Eval("FundingRequired")%></div>
                                        </div>
                                    </div>
                                </div>--%>
                            </div>
                        </div>
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
            <a href="#" class="btn btn-primary pull-right" id="btnconfirmplan" onclick="return ConfirmPlan();">
                Confirm
            </a>
        </div>
    </div>
</div>
<script src="~/Scripts/jquery-1.10.2.js"></script>
<script type="text/javascript">
    if ('@Session["OrderId"]' != "") {
        window.history.forward();
    }

    $(document).ready(function () {
        CheckQueryString();
        LoadCarriers();
        if (GetQueryStringByParameter("ischange") != "")
            GetInventoriesBySession();
        else
            GetFirstInventory();

        $(document).on('change', '.radio-plan', function () {
            var thisRadio =  $(this);
            var sessionId = '@Session.SessionID';
            var inventoryId = thisRadio.attr('inventoryid');
            var planId = thisRadio.attr('planid');
            var planPriceId = thisRadio.attr('planpriceid');
            var fundingRequired = thisRadio.attr('fundingrequired');
            var planName = thisRadio.attr('planname');
            var num = thisRadio.attr('num');

            $.ajax({
                type: 'POST',
                url: '/Search/SelectPlan',
                data: { sessionId: sessionId, inventoryId: inventoryId, planId: planId, planPriceId: planPriceId, fundingRequired: fundingRequired },
                success: function () {

                }
            });

            $('#simDetail' + num).find('.selected-plan').text(planName);
            $('.planNameMobile' + num).text(planName);
            //selected-plan

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
                    plansAll.push($(plan).val()+"-"+$(plan).attr("planpriceid"));
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
        $("#planDetail"+num).toggleClass("active");
        $(".divider-"+num).toggleClass("active");
    }

    function SearchClick(num, inventoryId, ItemId, PlanName = '') {
        var request = {};
        request.ItemId = ItemId;
        request.CompanyGUID = '@Session["CompanyGUID"]';
        $.ajax({
            async: false,
            cache: false,
            type: "POST",
            url: serviceUrl + "GetCarrierPlanDetail/" + wsUserGUid,
            data: request,
            success: function (response) {
                if (response.IsSuccess) {
                    $("#trData" + num).empty();
                    if (response.Data != null && response.Data.length <= 0) {
                        var planData = ' <div>' +
                                          ' <div class="text-center" colspan="8">There are no plans.</div>' +
                                       '</div>';
                        $("#trData" + num).append(planData);
                        $("#btnconfirmplan").hide();
                        return;
                    }

                    $.each(response.Data, function (i, item) {
                        var planData = ' <div class="trData-inner">' +
                                            '<div class="td select">' +
                                                '<div class="divider divider-'+item.PlanId+'" onclick="showPlanDetails('+item.PlanId+')"> <div class="arrow  arrow-right mobile-show"></div> </div>'+
                                                '<input  class="radio-plan" type="radio" ' + (PlanName == item.Name ? 'checked="checked"' : '')  + ' num="' + num + '" planname="' + item.Name + '" fundingrequired="' + parseFloat(item.FundingRequired).toFixed(2) + '"  planid="' + item.PlanId + '"  inventoryid="' + inventoryId + '" planpriceid="' + item.PlanPriceId + '" id="PlanId' + item.PlanId + '' + inventoryId + '" name="plan' + inventoryId + '" value="' + item.PlanId + '" /></div>' +
                                            '<div class="td plan-name">' + item.Name + '</div>' +
                                            '<div class="td plans">$' + parseFloat(item.Value).toFixed(2) + '</div>' +
                                            '<div class="td spiff mobile-hidden">$' + parseFloat(item.InstantSpiff).toFixed(2) + '</div>' +
                                            '<div class="td residual mobile-hidden">' + parseFloat(item.FirstMonthResidual).toFixed(2) + '</div>' +
                                            '<div class="td discount mobile-hidden">' + parseFloat(item.RefillDiscount).toFixed(2) + '</div>' +
                                            '<div class="td cost mobile-hidden">$' + parseFloat(item.SIMCost).toFixed(2) + '</div>' +
                                            '<div class="td funding mobile-hidden">$' + parseFloat(item.FundingRequired).toFixed(2) + '</div>' +
                                        '</div>' +
                                        '<div id="planDetail'+ item.PlanId +'" class="plan-more-details mobile-show">'+
                                            '<div class="td spiff"><label>Instant SPIFF : </label> $' + parseFloat(item.InstantSpiff).toFixed(2) + '</div>' +
                                            '<div class="td residual"><label>First Month Residual (%) : </label> ' + parseFloat(item.FirstMonthResidual).toFixed(2) + '</div>' +
                                            '<div class="td discount"><label>Refill Discount (%) : </label> ' + parseFloat(item.RefillDiscount).toFixed(2) + '</div>' +
                                            '<div class="td cost"><label>SIM Cost : </label> $' + parseFloat(item.SIMCost).toFixed(2) + '</div>' +
                                            '<div class="td funding"><label>Funding Required : </label> $' + parseFloat(item.FundingRequired).toFixed(2) + '</div>' +
                                        '</div>';
                        $("#trData" + num).append(planData);
                    });
                }
                else {
                    alert("Error: " + response.Message);
                }
            },
            failure: function (response) { }
        });

        //$.post(serviceUrl + "GetCarrierPlanDetail/" + wsUserGUid, { inventoryGuid: InventoryGuid }, function (response) {

        //});
    }

    function CheckQueryString() {
        var sim = GetQueryStringByParameter("sim");
        if (sim != null && sim != "") {
            $("#txtSim1").val(sim);
        }
    }

    function ADDSIMDetails(InventoryId, ItemId, SIM, Image, planCartId, IsSession, PlanName = '') {

        $(".trMsg").remove();
        var acceptableCount;
        //image = $("#hdn" + carrierServiceGUID).val();
        acceptableCount = Math.floor(100000000 + Math.random() * 900000000);

        var tableBody = '<div class="simDetail" id="simDetail' + acceptableCount + '" name="simDetail">' +
                            '<div class="td arrow-hider">' +
                                '<a href="#" onclick="Hide(' + acceptableCount + ');" class="middle hide' + acceptableCount + ' ' + (simDetail > 0 ? "plan" : "") + '"><div class="arrow arrow-down"></div></a>' +
                                '<a href="#" onclick="Show(' + acceptableCount + ');" class="middle show' + acceptableCount + ' ' + (simDetail > 0 ? "" : "plan") + '"><div class="arrow  arrow-right"></div></a>' +
                            '</div>' +
                            '<div class="td serial"><span name="txtSIM" class="form-control middle" style="border:none" id="txtSim' + acceptableCount + '">' + SIM + '</span><input type="hidden" name="Inventory" value="' + InventoryId + '" /> </div>' +
                            '<div class="td carrier"><img src="/Images/Carriers/' + Image + '" class="middle col-md-6 col-xs-6 " alt="No Image" /></div>' +
                            '<div class="td rate-plan mobile-hidden">' +
                                '<a href="#" onclick="Hide(' + acceptableCount + ');" class="hide' + acceptableCount + ' ' + (simDetail > 0 ? "plan" : "") + '">@(lblHidePlan != null ? lblHidePlan.ControlValue : "Hide a Plan")</a>' +
                                '<a href="#" onclick="Show(' + acceptableCount + ');" class="show' + acceptableCount + ' ' + (simDetail > 0 ? "" : "plan") + '">@(lblShowPlan != null ? lblShowPlan.ControlValue : "Show a Plan")</a>' +
                                '<br/> <span class="selected-plan"> ' + PlanName + ' </span> '+
                            '</div>' +
                            '<div class="td closer-td"><a class="middle" href="#" style="float:left" onclick="Delete(' + acceptableCount + ',\'' + planCartId + '\',\'' + IsSession + '\')"><img  class="close-button" src="/Images/cross.jpg" /></a></div>' +
                        '</div>' +
                      '<div class="td rate-plan mobile-show rate-plan' + acceptableCount + '">' +
                                '<div class="wrapper">' +
                                    '<label>Selected Plan : </label>' +
                                    '<a href="#" onclick="Hide(' + acceptableCount + ');" class="hide' + acceptableCount + ' ' + (simDetail > 0 ? "plan" : "") + '">@(lblHidePlan != null ? lblHidePlan.ControlValue : "Hide a Plan")</a>' +
                                    '<a href="#" onclick="Show(' + acceptableCount + ');" class="show' + acceptableCount + ' ' + (simDetail > 0 ? "" : "plan") + '">@(lblShowPlan != null ? lblShowPlan.ControlValue : "Show a Plan")</a>' +
                                    '<span class="selected-plan planNameMobile' + acceptableCount + '"> ' + PlanName + ' </span> '+
                                '</div>' +
                            '</div>' +
                        '<div id="planInfo' + acceptableCount + '" class="planInfo '+ (simDetail > 0 ? "plan" : "") + '">' +
                            '<div colspan="5">' +
                                '<div class="table table-bordered">' +
                                    '<div class="planInfo-thead">' +
                                        '<div class="planInfo-thead-inner">' +
                                            '<div class="td select"></div>' +
                                            '<div class="td plan-name">@(lblPlanNameTitle != null ? lblPlanNameTitle.ControlValue : "Plan Name")</div>' +
                                            '<div class="td plans">@(lblPlansTitle != null ? lblPlansTitle.ControlValue : "Plans")</div>' +
                                            '<div class="td spiff mobile-hidden">@(lblInstantSpiffTitle != null ? lblInstantSpiffTitle.ControlValue : "Instant SPIFF")</div>' +
                                            '<div class="td residual mobile-hidden">@(lblPinDiscountRateTitle != null ? lblPinDiscountRateTitle.ControlValue : "First Month Residual (%)")</div>' +
                                            '<div class="td discount mobile-hidden">@(lblPinDiscountAmountTitle != null ? lblPinDiscountAmountTitle.ControlValue : "Refill Discount (%)")</div>' +
                                            '<div class="td cost mobile-hidden">@(lblSimCost != null ? lblSimCost.ControlValue : "SIM Cost")</div>' +
                                            '<div class="td funding mobile-hidden">@(lblPaymentRequiredTitle != null ? lblPaymentRequiredTitle.ControlValue : "Funding Required")</div>' +
                                        '</div>' +
                                    '</div>' +
                                    '<div id="trData' + acceptableCount + '"></div>' +
                                '</div>' +
                            '</div>' +
                        '</div>';
        $("#tbodyPlan").append(tableBody);
        simDetail = simDetail + 1;

        SearchClick(acceptableCount, InventoryId, ItemId, PlanName);
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

    function LoadCarriers() {
        $.ajax({
            url: serviceUrl + "GetCarriers/" + wsUserGUid,
            type: "Post",
            async: false,
            success: function (response) {
                if (response.IsSuccess) {
                    $("#ddlCarrier").append("<option value=''>Select a Carrier</option>");
                    $.each(response.Data, function (i, item) {
                        var planData = '<option value="' + item.CarrierServiceGuid + '">' + item.Name + '</option>';
                        $("#ddlCarrier").append(planData);

                        var ImageBody = '<input type="hidden" value="' + item.Logo + '" id="hdn' + item.CarrierGuid + '">';
                        $("#dvSIMADD").append(ImageBody);
                    });
                }
                else {
                    alert("Error: " + response.Message);
                }
            },
            failure: function (response) { }

        });
    }

    function CheckSIMStatus() {
        var SIM, CarrierGUID;
        carrierServiceGUID = $("#ddlCarrier").val();
        SIM = $("#txtAddSim").val();
        GetSIMDetails(SIM, carrierServiceGUID, wsUserGUid, '', '');
    }

    function GetFirstInventory() {
        var sessionId;
        sessionId = '@Session.SessionID';

        $.ajax({
            async: false,
            cache: false,
            type: "GET",
            url: '@Url.Action("GetSelectedSIMDetails", "Search")',
            data: { sessionId: sessionId },
            success: function (response) {
                if (response.length > 0) {
                    $.each(response, function (i, item) {
                        ADDSIMDetails(item.InventoryId, item.ItemId, item.InventoryName, item.Image, item.PlanCartId, '', item.PlanName);
                    });
                }
            },
            failure: function (response) { }
        });
    }

    function GetSIMDetails(SIM, carrierServiceGUID, WsUserGUid, PlanCartId, IsSession) {
        $("#dvMsgbody").empty();
        var added = 0;
        var SIMDetails = document.getElementsByName("txtSIM");
        $.each(SIMDetails, function (i, item) {
            if (item.textContent === SIM) {
                added = added + 1;
            }
        });

        if (added > 0) {
            showMessage("SIM/IMEI is already added.", "alert-danger", "alert-warning");
            return false;
        }

        if (SIM != undefined, SIM != null && SIM != "") {
            if (carrierServiceGUID == "") {
                showMessage("Please select a carrier.", "alert-danger", "alert-warning");
                return false;
            }

            var request = {};
            request.DeviceId = "";
            request.CarrierServiceGUID = carrierServiceGUID;
            request.WsUserGUid = WsUserGUid;
            request.CompanyGUID = "";
            request.SIM = SIM;

            $.ajax({
                async: false,
                cache: false,
                type: "POST",
                url: serviceUrl + "GetSIMDetail",
                data: request,
                success: function (response) {
                    if (response.IsSuccess) {
                        if (response.Data != '') {
                            var details = response.Data;
                            if (parseInt(details.Status) == parseInt(@((int)AC.Common.Enums.InventoryStatus.Activated))) {
                                showMessage("SIM/IMEI is already activated.", "alert-danger", "alert-warning");
                            }
                            else if (parseInt(details.Status) == parseInt(@((int)AC.Common.Enums.InventoryStatus.Funded))) {
                                showMessage("SIM/IMEI is Prefunded.", "alert-danger", "alert-warning");
                            }
                            else {
                                ADDSIMDetails(details.InventoryId, details.InventoryGuid, details.Item, carrierServiceGUID, PlanCartId, IsSession);
                                $("#txtAddSim").val('');
                                $("#dvMsg").hide();
                            }
                        }
                        else {
                            showMessage("SIM/IMEI is invalid.", "alert-danger", "alert-warning");
                        }
                    }
                    else {
                        showMessage(response.Message, "alert-warning", "alert-danger");
                    }

                },
                failure: function (response) { }
            });
        }
        else {
            showMessage("Please enter SIM/IMEI for activation.", "alert-warning", "alert-danger");

            if ($("#tbodyPlan >tr").length === 0) {
                var body = "<tr class='trMsg'><td colspan='4'>Please add SIM/IMEI for getting plans</td></tr>";
                $("#tbodyPlan").append(body);
            }
        }
    }

    function GetInventoriesBySession() {
        var sessionId;
        sessionId = '@Session.SessionID';

        $.ajax({
            async: false,
            cache: false,
            type: "GET",
            url: '@Url.Action("GetPlans", "Search")',
            data: { sessionId: sessionId },
            success: function (response) {

                if (response.length > 0) {
                    $.each(response, function (i, item) {
                        if (!item.IsAdminAdded) {
                            ADDSIMDetails(item.InventoryId, item.ItemId, item.InventoryName, item.Image, item.PlanCartId, '', item.PlanName);
                        }
                        setTimeout(function () {
                            $("#PlanId" + item.PlanId + '' + item.InventoryId).attr("checked", "checked");
                        }, 1000);
                    });
                }
            },
            failure: function (response) { }
        });
    }
</script>


</asp:Content>
