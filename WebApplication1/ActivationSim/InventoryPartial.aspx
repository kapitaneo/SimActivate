<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InventoryPartial.aspx.cs" Inherits="WebApplication1.ActivationSim.InventoryPartial" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script runat="server">
        protected void Page_Load(object sender, EventArgs e)
        {
            spnTitle.InnerText = "Prefunded";
            spnTitlePartial.InnerText = "status is pending";
            IsFundingRequird.Visible = false;
            portIn.Visible = false;
            portInIsLyca.Visible = false;
        }
    </script>

    <asp:Repeater runat="server"></asp:Repeater>
<div class="panel-group">
    <div class="panel panel-primary" id="pnlActivation">
        <div class="panel-heading" id="headingActivate">
           SIM / IMEI
<%--           @if (Model.PlanId != null)
            {--%>
                <span runat="server" id="spnTitle"></span>
<%--            }
            @if (Model.Status.ToLower() == "pending")
            {--%>
                <span runat="server" id="spnTitlePartial"></span>
           <%--}
            @if(Model.Status.ToLower() == "activated")
            {
                <span id="spnTitle">The SIM number is activated successfully.</span>
            }--%>
        </div>
        <div class="panel-body">
            <div class="col-md-12">
                <%--@if (Model.IsFundingRequird == true)
                {--%>
                   <div runat="server" id="IsFundingRequird" class="row">
                        <div class="col-xs-12 col-md-12 alert-danger">
                            <span>The Required Funding for this plan has increased to<%-- $@(((decimal) Math.Round((Model.NewFundingRequired  > 0 ? Model.NewFundingRequired - @Model.FundingRequired : Model.NewFundingRequired),2)).ToString("#.00")).--%>  Please pay the difference amount before activating</span>
                        </div>
                    </div>
                <%--}--%>

                <div class="row no-padding">
                    <div class="alert text-center" id="dvActivationMessage" style="display:none">
                        @*<a onclick="HideMsg();" class="close">&times;</a>*@
                        <span id="spnActivationMessage"></span>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-5 col-md-5 text-right">
                        <b>Carrier</b>
                    </div><div class="col-xs-7 col-md-7">
                        <%--@Model.CarrierName--%>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-5 col-md-5 text-right">
                        <b>SIM / IMEI</b>
                    </div>
                    <div class="col-xs-7 col-md-7">
                       <%-- @Model.SerialNumber--%>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-5 col-md-5 text-right">
                        <b>Plan Value</b>
                    </div>
                    <div class="col-xs-7 col-md-7">
                        <%--$@Convert.ToDecimal(Model.PlanValue)--%>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-5 col-md-5 text-right">
                        <b>Plan Name</b>
                    </div>
                    <div class="col-xs-7 col-md-7">
                        <%--@Model.PlanName--%>
                    </div>
                </div>
               <%-- @if (!string.IsNullOrEmpty(Model.MobileNumber))
                {--%>
                    <div class="row">
                        <div class="col-xs-5 col-md-5 text-right">
                            <b>Mobile Number</b>
                        </div>
                        <div class="col-xs-7 col-md-7">
                            <%--@Model.MobileNumber--%>
                        </div>
                    </div>
              <%--  }
                else
                {
                    <div class="row" id="dvMobileNumber" style="display:none">
                        <div class="col-xs-5 col-md-5 text-right">
                            <b>Mobile Number</b>
                        </div>
                        <div class="col-xs-7 col-md-7">
                            <span id="mobileNumber"></span>
                        </div>
                    </div>
                }--%>

                <%--@if (!string.IsNullOrEmpty(Model.ActivationDate))
                {--%>
                    <div class="row">
                        <div class="col-xs-5 col-md-5 text-right">
                            <b>Activated Date</b>
                        </div>
                        <div class="col-xs-7 col-md-7">
                           <%-- @Model.ActivationDate--%>
                        </div>
                    </div>
               <%-- }
                else
                {
                    <div class="row" id="dvActivatedDate" style="display:none">
                        <div class="col-xs-5 col-md-5 text-right">
                            <b>Activated Date</b>
                        </div>
                        <div class="col-xs-7 col-md-7">
                            <span id="activatedDate"></span>
                        </div>
                    </div>
                }--%>

                <%--@if (Model.PlanId != null)
                {
                    if (Model.IsFundingRequird == false)
                    {--%>
                        <div class="row form-group dvPortIn">
                            <div class="col-xs-5 col-md-5 text-right">
                                <b>Enter Zip Code</b>
                            </div>
                            <div class="col-xs-7 col-md-7">
                                <div class="row col-md-7">
                                    <input id="txtZip<%---@Model.ItemInventoryId--%>" class="form-control" type="text" onkeypress="return IsNumeric(event)" maxlength="5" />
                                </div>
                            </div>
                        </div>
                   <%-- }
                    if (Model.CarrierServiceName.ToLower().Contains("port-in") && !Model.IsLycaPortIn)
                    {--%>
                        <div runat="server" id="portIn" class="row dvPortIn">
                            <div class="col-xs-12 col-md-12">
                                <div class="col-xs-6 col-md-6">
                                    <div class="form-group">
                                        <label for="firstname">First Name</label>
                                        <input type="text" id="FirstName" class="form-control" name="FirstName" placeholder="First Name" />
                                    </div>
                                </div>
                                <div class="col-xs-6 col-md-6">
                                    <div class="form-group">
                                        <label for="lastname">Last Name</label>
                                        <input type="text" id="LastName" class="form-control" name="LastName" placeholder="Last Name" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-md-12">
                                <div class="col-xs-6 col-md-6">
                                    <div class="form-group">
                                        <label for="address">Street Name</label>
                                        <input type="text" id="StreetName" class="form-control" name="StreetName" placeholder="Street Name" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-md-12">
                                <div class="col-xs-6 col-md-6">
                                    <div class="form-group">
                                        <label for="City">City</label>
                                        <input type="text" id="City" class="form-control" name="City" placeholder="City" />
                                    </div>
                                </div>
                                <div class="col-xs-6 col-md-6">
                                    <div class="form-group">
                                        <label for="State">State</label>
                                        <input type="text" id="AddressState" class="form-control" name="AddressState" placeholder="State" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-md-12">
                                <div class="col-xs-6 col-md-6">
                                    <div class="form-group">
                                        <label for="addressZipCode">Zip Code</label>
                                        <input type="text" id="AddressZipCode" class="form-control" name="AddressZipCode" maxlength="5" placeholder="Zip Code" />
                                    </div>
                                </div>
                                <div class="col-xs-6 col-md-6">
                                    <div class="form-group">
                                        <label for="CBRPhone">CBR Phone</label>
                                        <input type="text" id="CBRPhone" class="form-control" onkeypress="return IsNumeric(event);" name="CBRPhone" placeholder="CBR Phone" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-md-12">
                                <div class="col-xs-6 col-md-6">
                                    <div class="form-group">
                                        <label for="passwordPin">Password PIN</label>
                                        <input type="text" id="PasswordPIN" class="form-control" name="PasswordPIN" placeholder="Password Pin" />
                                    </div>
                                </div>
                                <div class="col-xs-6 col-md-6">
                                    <div class="form-group">
                                        <label for="portInNumber">Port In Number</label>
                                        <input type="text" id="PortInNumber" class="form-control" onkeypress="return IsNumeric(event);" name="PortInNumber" placeholder="Port In Number" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-md-12">
                                <div class="col-xs-6 col-md-6">
                                    <div class="form-group">
                                        <label for="phoneUserName">Phone User Name</label>
                                        <input type="text" id="PhoneUserName" class="form-control" name="PhoneUserName" placeholder="Phone User Name" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-md-12">
                                <div class="col-xs-6 col-md-6">
                                    <div class="form-group">
                                        <label for="OSPAccountNum">OSP Account Number</label>
                                        <input type="text" id="OSPAccountNum" class="form-control" onkeypress="return IsNumeric(event);" name="OSPAccountNum" placeholder="OSP Account Number" />
                                    </div>
                                </div>
                                <div class="col-xs-6 col-md-6">
                                    <div class="form-group">
                                        <label for="authorizedSigner">Authorized Signer</label>
                                        <input type="text" id="AuthSigner" class="form-control" name="AuthSigner" placeholder="Authorized Signer" />
                                    </div>
                                </div>
                            </div>
                        </div>
                   <%-- }
                    else if (Model.CarrierServiceName.ToLower().Contains("port-in") && Model.IsLycaPortIn)
                    {
                        if (Model.IsFundingRequird == false)
                        {--%>
                            <div runat="server" id="portInIsLyca" class="row dvPortIn">
                                <div class="row">
                                    <div class="col-xs-5 col-md-5 text-right">
                                        <label for="OSPAccountNum">Account Number</label>
                                    </div><div class="col-md-6 form-group">
                                        <input type="text" id="OSPAccountNum" class="form-control" onkeypress="return IsNumeric(event);" name="OSPAccountNum" placeholder="Account Number" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-5 col-md-5 text-right">
                                        <label for="passwordPin">Account Password, PIN</label>
                                    </div><div class="col-xs-6 col-md-6 form-group">
                                        <input type="text" id="PasswordPIN" class="form-control" name="PasswordPIN" placeholder="Password PIN" />
                                    </div>
                                </div>
                            </div>
             <%--           } 
                    }--%>
                    <div class="row dvPortIn">
                        <div class="col-xs-5 col-md-5 text-right">
                        </div>
                        <div class="col-xs-7 col-md-7">
                         <%--   @if (Model.IsFundingRequird == false)
                            {--%>
                                <input type="button" class="btn btn-primary" onclick="" value="Activate" />
                                <input type="button" class="btn btn-default" onclick="" value="Back" />
                            <%--}
                            else
                            {
                                using (Html.BeginForm("FundingRequired", "checkout", FormMethod.Post))
                                {
                                    @Html.HiddenFor(m => m.ItemInventoryId)
                                    @Html.HiddenFor(m => m.PlanPriceId)
                                    @Html.HiddenFor(m => m.FundingRequired)--%>
                                   <%-- <input type="submit" class="btn btn-primary" value="Pay Now" />
                                    <input type="button" class="btn btn-default" onclick="showService();" value="Back" />--%>
                           <%--     }
                            }--%>

                        </div>
                    </div>
                    <div id="dvActivate" style="display:none">
                        <%--@if (Model.IsVersizonProvider)
                        {--%>
                            <div class="row">
                                <div class="col-md-offset-5  col-xs-7 col-md-7">
                                    <input type="button" value="Refresh" class="btn btn-sm btn-primary" onclick="CheckStatus('@Model.Item')" />
                                </div>
                            </div>
                      <%--  }--%>
                    </div>
               <%-- }--%>
            </div>
        </div>
    </div>
</div>
    <script type="text/javascript">

        if ('@Session["OrderId"]' != "") {
            window.history.forward();
        }
        $('#txtDeviceId').keypress(function (e) {
            if (e.which == 13) {
                return false;
            }
        });
        $(document).ready(function () {
            CheckMessage();
            CheckActivatedSim();

            $("#btnSubmit").click(function () {
                $("#dvMsg").hide();
                var SIM, CarrierGUID, deviceId, companyGuid, mobileNumber; result = true;
                CarrierGUID = $("input[name=carriers]:checked").val();
                $("#CarrierServiceGuid").val(CarrierGUID);
                SIM = $("#txtSIM");
                mobileNumber = $("#txtMobileNumber");
                deviceId = ($("#txtDeviceId").val() != undefined && $("#txtDeviceId").val() != "") ? $("#txtDeviceId").val() : "";
                companyGuid = '@Session["CompanyGUID"]';
                $("#dvMsgbody").empty();
                if ($("#txtSIM").length > 0 && ($("#txtSIM").val() == undefined || $("#txtSIM").val() == "")) {
                    showMessage("Please enter sim number.", "alert-warning", "alert-danger");
                    return result = false;
                }

                if (mobileNumber.length > 0) {
                    if (mobileNumber.val() == undefined || mobileNumber.val() == "") {
                        //   $("#txtMobileNumber").css("border", "1px solid red");
                        showMessage("Please enter mobile no for activation.", "alert-warning", "alert-danger");
                        result = false;
                    }
                    else {
                        if (mobileNumber.val().length < 10) {
                            // $("#txtMobileNumber").css("border", "1px solid red");
                            showMessage("Mobile no should be atleast 10 digit.", "alert-danger", "alert-warning");
                            result = false;
                        }

                        if (mobileNumber.val().length > 10) {
                            // $("#txtMobileNumber").css("border", "1px solid red");
                            showMessage("Mobile no should not be greater than 10 digit.", "alert-danger", "alert-warning");
                            result = false;
                        }
                    }
                }

                if ($("#txtDeviceId").length > 0 && ($("#txtDeviceId").val() == undefined || $("#txtDeviceId").val() == "")) {
                    showMessage("Please enter device id.", "alert-warning", "alert-danger");
                    result = false;
                }

                if (result) {
                    var request = {};
                    request.DeviceId = deviceId;
                    request.CarrierServiceGUID = CarrierGUID;
                    request.WsUserGUid = wsUserGUid;
                    request.CompanyGUID = companyGuid;
                    request.SIM = SIM.val();
                    request.MobileNumber = $("#txtMobileNumber").val();

                    GetDetails(request);
                }

                StopLoading();
                return result;
            });

            GetNotes();
        });

        function GetNotes() {
            var lanGuage = '@Session["Language"].ToString()';

            $.ajax({
                async: false,
                cache: false,
                type: "GET",
                url: '/Home/ShowContentText',
                data: { language: lanGuage },
                success: function (response) {
                    if (response != null) {
                        $.each(response, function (key, val) {
                            var data = val.ContentText;
                            $('#ShowContent').append(data);
                        });
                    }
                },
                failure: function (response) {
                    showMessage(response.Message, "alert-warning", "alert-danger");
                }
            });
        }

        function GetDetails(request) {
            Loading();
            $.ajax({
                async: false,
                cache: false,
                type: "POST",
                url: serviceUrl + "GetSIMDetail/" + wsUserGUid,
                data: request,
                success: function (response) {
                    if (response.IsSuccess) {
                        if (response.Data != '') {
                            var details = response.Data;
                            if (details.Status.toLowerCase() === "activated") {
                                showMessage("SIM/IMEI is already activated.", "alert-danger", "alert-warning");
                                result = false;
                            }
                            else if (details.OrderId > 0 && details.TransactionId != null && details.TransactionId != "") {
                                getFundedSIM(details.SerialNumber, details.CarrierService, details.CarrierServiceTypeId, details.CarrierServiceGUID, details.MobileNumber, details.CompanyGuid);
                            }
                            else if (details.Status.toLowerCase() === "activated") {
                                CheckStatus(details.Item);
                            }
                            else {
                                if (details.PlanPriceId != null && details.PlanPriceId > 0) {

                                    FundedItemInventory(details.PlanId, details.ItemInventoryId, details.CompanyGuid);
                                }
                                else {
                                    var mobilenumber = $("#txtDeviceId").val();
                                    var careerId = $("input[type='radio']:checked").val();
                                    $("#InventoryId").val(details.ItemInventoryId);
                                    $("#SIMNumber").val(details.SerialNumber);
                                    $("#frmsubmit").submit();
                                }

                            }
                        }
                        else {
                            showMessage("SIM/IMEI is invalid.", "alert-danger", "alert-warning");
                            result = false;
                        }
                    }
                    else {
                        showMessage(response.Message, "alert-warning", "alert-danger");
                    }

                },
                failure: function (response) {
                    showMessage(response.Message, "alert-warning", "alert-danger");
                }
            });
        }


        function LoadCarriers() {
            Loading();
            var count = 0;
            $.post(serviceUrl + "GetCarriers/" + wsUserGUid, function (response) {
                if (response.IsSuccess) {
                    $.each(response.Data, function (i, item) {
                        var planData = '<label class=' + (count === 0 ? "" : "col-md-offset-1") + '>';
                        if (item.Name.toLowerCase().indexOf("verizon 3g") === 0) {
                            planData += '<input type="radio" value="' + item.CarrierServiceGuid + '" onclick="ShowLogin();" name="carriers"  checked="checked"  />&nbsp;' + item.Name;
                        }
                        else {
                            if (item.Name.toLowerCase().indexOf("verizon") === 0)
                                planData += '<input type="radio" onclick="ShowLogin();" value="' + item.CarrierServiceGuid + '" name="carriers"/>&nbsp;' + item.Name;
                            else
                                planData += '<input type="radio" onclick="ShowInventory();" value="' + item.CarrierServiceGuid + '" name="carriers"/>&nbsp;' + item.Name;
                        }
                        planData += '</label>';
                        $("#dvCarriers").append(planData);
                        count += 1;
                    });
                }
                else {
                    showMessage(response.Message, "alert-warning", "alert-danger");
                }

                StopLoading();
            });
        }

        function Submit(carrierServiceGuid) {
            Loading();
            var islogin = GetQueryStringByParameter("isLogin");
            window.location.href = "/home/index?carrierServiceGuid=" + carrierServiceGuid;
        }

        function validateLogin() {
            if ($("#Email").val() == "" || $("#Email").val() == null || $("#Email").val() == undefined) {
                showMessage("Please enter email.", "alert-warning", "alert-danger");
                return false;
            }

            if ($("#Password").val() == "" || $("#Password").val() == null || $("#Password").val() == undefined) {
                showMessage("Please enter password.", "alert-warning", "alert-danger");
                return false;
            }
        }

        function ActivateNow() {
            $("#loadingmessage").show();
            $('#myModal').modal('hide');
            var areaCode = $("input[name='areacodes']:checked").val();
            $("#areaCode").empty();
            if (areaCode == undefined || areaCode == "") {
                $("#dvMsgAreaCode").show();
                $("#spnAreaCode").text("Please choose an Area Code to Activate.");
                return false;
            }

            var inventoryId = $("#hdnInventoryId").val();
            var item = $("#hdnItem").val();
            var isPortIn = $("#hdnIsPortIn").val();
            var carrierServiceGUID = $("#hdnCarrierServiceGUID").val();

            Activate(inventoryId, item, isPortIn, carrierServiceGUID, areaCode);
            return true;
        }

        function getAreaCodeAndActivateSIM(inventoryId, item, isPortIn, carrierServiceGUID) {
            var zipCode = $("#txtZip-" + inventoryId).val();
            if (zipCode == null || zipCode == "" || zipCode == undefined) {
                $("#txtZip-" + inventoryId).css("border-color", "red");
                return false;
            }

            if (zipCode.length > 5 || zipCode.length < 5) {
                showMessage("Zipcode must be of 5 digits", "alert-warning", "alert-danger");
                return false;
            }
            $.ajaxSetup({ cache: false, async: false });
            $.get("@Url.Action("GetAreaCode", "Home")", { zipCode: zipCode }).success(function (response) {
                if (response != null) {
                    if (response.length > 1) {
                        $("#hdnInventoryId").val(inventoryId);
                        $("#hdnItem").val(item);
                        $("#hdnIsPortIn").val(isPortIn);
                        $("#hdnCarrierServiceGUID").val(carrierServiceGUID);
                        $.each(response, function (i, item) {
                            $("#areaCode").append("<li class='list-group-item'><input type='radio' name='areacodes' value='" + item + "'>&nbsp;" + item + "</li>");
                        });

                        $('#myModal').modal('show');
                    }
                    else if (response.length > 0) {
                        Activate(inventoryId, item, isPortIn, carrierServiceGUID, response[0]);
                    }
                    else {
                        showMessage("We did not find the entered zipcode in the system, please enter valid zipcode to activate.", "alert-warning", "alert-danger");
                    }
                }

            }).error(function (error) {
                console.log(error);
            });

        }

        function Activate(inventoryId, item, isPortIn, carrierServiceGUID, areaCode) {
            // Loading();

            $("#dvMsg").hide();
            var zipCode = $("#txtZip-" + inventoryId).val();
            var request = {};
            request.WsUserGUid = wsUserGUid;
            request.Item = item;
            request.CarrierServiceGUID = carrierServiceGUID;
            request.ZipCode = zipCode;
            request.FirstName = $("#FirstName").val();
            request.LastName = $("#LastName").val();
            request.StreetName = $("#StreetName").val();
            request.City = $("#City").val();
            request.AddressState = $("#AddressState").val();
            request.OSPAccountNum = $("#OSPAccountNum").val();
            request.AuthSigner = $("#AuthSigner").val();
            request.CBRPhone = $("#CBRPhone").val();
            request.PasswordPIN = $("#PasswordPIN").val();
            request.PortInNumber = $("#PortInNumber").val();
            request.PhoneUserName = $("#PhoneUserName").val();
            request.AddressZipCode = $("#AddressZipCode").val();
            request.AreaCode = areaCode;

            if (zipCode == null || zipCode == "" || zipCode == undefined) {
                $("#txtZip-" + inventoryId).css("border-color", "red");
                return false;
            }

            if (zipCode.length > 5 || zipCode.length < 5) {
                showMessage("Zipcode must be of 5 digits", "alert-warning", "alert-danger");
                return false;
            }

            if (isPortIn == 'true') {
                var result = true;

                if (request.FirstName == undefined || request.FirstName == null || request.FirstName == "") {
                    $("#FirstName").css("border-color", "red");
                    result = false;
                }

                if (request.LastName == undefined || request.LastName == null || request.LastName == "") {
                    $("#LastName").css("border-color", "red");
                    result = false;
                }

                //////////////////////////////////////////

                if (request.City == undefined || request.City == null || request.City == "") {
                    $("#City").css("border-color", "red");
                    result = false;
                }

                if (request.AddressZipCode == undefined || request.AddressZipCode == null || request.AddressZipCode == "") {
                    $("#AddressZipCode").css("border-color", "red");
                    result = false;
                }

                if (request.AddressState == undefined || request.AddressState == null || request.AddressState == "") {
                    $("#AddressState").css("border-color", "red");
                    result = false;
                }

                if (request.AuthSigner == undefined || request.AuthSigner == null || request.AuthSigner == "") {
                    $("#AuthSigner").css("border-color", "red");
                    result = false;
                }

                if (request.StreetName == undefined || request.StreetName == null || request.StreetName == "") {
                    $("#StreetName").css("border-color", "red");
                    result = false;
                }

                if (request.OSPAccountNum == undefined || request.OSPAccountNum == null || request.OSPAccountNum == "") {
                    $("#OSPAccountNum").css("border-color", "red");
                    result = false;
                }

                //////////////////////////////////////////

                if (request.CBRPhone == undefined || request.CBRPhone == null || request.CBRPhone == "") {
                    $("#CBRPhone").css("border-color", "red");
                    result = false;
                }

                if (request.CBRPhone.length < 10) {
                    $("#CBRPhone").css("border-color", "red");
                    showMessage("CBR phone must be of min 10 digits", "alert-warning", "alert-danger");
                    result = false;
                }

                if (request.PasswordPIN == undefined || request.PasswordPIN == null || request.PasswordPIN == "") {
                    $("#PasswordPIN").css("border-color", "red");
                    result = false;
                }

                if (request.PortInNumber == undefined || request.PortInNumber == null || request.PortInNumber == "") {
                    $("#PortInNumber").css("border-color", "red");
                    result = false;
                }

                if (request.PhoneUserName == undefined || request.PhoneUserName == null || request.PhoneUserName == "") {
                    $("#PhoneUserName").css("border-color", "red");
                    result = false;
                }

                if (result == false)
                    return false;
            }
            //  Loading();
            $("#Progressbar").show();
            $.ajax({
                async: true,
                cache: false,
                type: "POST",
                url: serviceUrl + "Activate/" + wsUserGUid,
                data: request,
                //beforeSend: function () {
                //    Loading();
                //},
                success: function (response) {
                    if (!response.IsSuccess) {
                        $("#spnActivationMessage").text(response.Message);
                        $("#dvActivationMessage").addClass("alert-danger")
                        $("#dvActivationMessage").show();
                    }
                    else {
                        $(".dvPortIn").hide();
                        $("#spnTitle").text("Activation");
                        $("#spnActivationMessage").text(response.Message);
                        $("#dvActivationMessage").addClass("alert-success")
                        $("#dvActivationMessage").show();

                        if (response.Data != null && response.Data != undefined) {
                            $("#activatedDate").html(response.Data.ActivationDate);
                            $("#dvActivatedDate").show();

                            $("#mobileNumber").html(response.Data.MobileNumber);
                            $("#dvMobileNumber").show();

                            //$("#pnlActivation").removeClass("panel-primary");
                            //$("#pnlActivation").addClass("panel-success");
                        }
                    }
                    // StopLoading();
                    $("#Progressbar").hide();
                },
                failure: function (response) {
                    //   StopLoading();
                    $("#Progressbar").hide();
                    showMessage(response, "alert-warning", "alert-danger");
                }
            });
        }

        function CheckStatus(SIM) {
            $("#dvMsg").hide();
            Loading();
            var request = {};
            request.WsUserGUid = wsUserGUid;
            request.SIM = SIM;

            $.ajax({
                async: false,
                cache: false,
                type: "POST",
                url: serviceUrl + "CheckStatus/" + wsUserGUid,
                data: request,
                success: function (response) {
                    if (!response.IsSuccess) {
                        showMessage(response.Message, "alert-warning", "alert-danger");
                    }
                    else {
                        showMessage(response.Message, "alert-warning", "alert-success");
                        $("#headingActivate").empty();
                        $("#headingActivate").text("Congratulations - Your SIM/IMEI is activated");
                        $("#dvActivate").hide();
                    }

                    StopLoading();
                },
                failure: function (response) {
                    showMessage(response, "alert-warning", "alert-danger");
                    StopLoading();
                }
            });
        }

        function CheckMessage() {
            var msg = '@TempData["msg"]';
            if (msg != '' && msg != null && msg != undefined) {

                var register = '@Request.QueryString["register"]';
                if (register != '' && register != undefined) {
                    $("#dvMsg").removeClass("alert-warning").addClass("alert-success");
                }
                else {
                    $("#dvMsg").removeClass("alert-warning").addClass("alert-danger");
                }
                $("#dvMsg").show();
            }
        }

        function showService() {
            $("#Prefunded").empty();
            $(".dvService").show();
            $("#dvMsg").hide();
        }

        function showInventoryResult() {
            $(".dvService").hide();
        }

        function getFundedSIM(SIM, CarrierServiceName, CarrierServiceTypeId, CarrierServiceGUID, MobileNumber, companyGuid) {
            var result = false;
            $.ajax({
                async: false,
                cache: false,
                type: "GET",
                url: '@Url.Action("CheckIfLoginRequiredOnPrefunded", "Home")',
                data: { SIM: SIM, carrierServiceGUID: CarrierServiceGUID },
                success: function (response) {
                    if (response == "SUCCESS") {
                        result = true;
                    }
                    else {
                        showMessage(response, "alert-warning", "alert-danger");
                    }
                },
                failure: function (response) {
                    showMessage(response, "alert-warning", "alert-danger");
                    result = false;
                }
            });

            if (!result)
                return;

            $.ajax({
                async: false,
                cache: false,
                type: "GET",
                url: '@Url.Action("GetFundedInventory", "Home")',
                data: { SIM: SIM, carrierServiceName: CarrierServiceName, carrierServiceTypeId: CarrierServiceTypeId, carrierServiceGUID: CarrierServiceGUID, companyGuid: companyGuid },
                success: function (response) {
                    $("#Prefunded").empty();
                    $("#Prefunded").append(response);

                    if ($("#PortInNumber").length > 0) {
                        $("#PortInNumber").val(MobileNumber);
                    }

                    showInventoryResult();
                },
                failure: function (response) {
                    showMessage(response, "alert-warning", "alert-danger");
                    result = false;
                }
            });
        }

        function CheckActivatedSim() {
            var inventoryGuid = GetQueryStringByParameter("inventoryid");
            var csid = GetQueryStringByParameter("csid");
            if (inventoryGuid != undefined && inventoryGuid != null && inventoryGuid != "") {
                $("#Carrier-" + csid).attr("checked", "checked");

                $.ajax({
                    async: false,
                    cache: false,
                    url: '@Url.Action("GetInventoryByInventoryId", "Home")',
                    data: { inventoryGuid: inventoryGuid },
                    success: function (response) {
                        if (response != null) {
                            var request = {};
                            request.DeviceId = response.DeviceId;
                            request.CarrierServiceGUID = csid;
                            request.WsUserGUid = wsUserGUid;
                            request.CompanyGUID = '@Session["CompanyGUID"]';
                            request.SIM = response.SerialNumber;
                            request.MobileNumber = response.MobileNumber;

                            GetDetails(request);
                        }
                        else {
                            showMessage("SIM Invalid", "alert-warning", "alert-danger");
                        }
                    },
                    failure: function (response) {
                        showMessage(response, "alert-warning", "alert-danger");
                    }
                });
            }
        }

        function FundedItemInventory(choosenPlan, choosenInventories, companyGuid) {
            CarrierGUID = $("input[name=carriers]:checked").val();
            $.ajax({
                async: false,
                cache: false,
                type: "POST",
                url: '@Url.Action("FundedSimPlans", "Search")',
                data: { plans: choosenPlan, inventories: choosenInventories, CarrierGUID: CarrierGUID },
                success: function (response) {
                    window.location.href = "/checkout/summary";
                    return false;
                },
                failure: function (response) { }
            });
        }

        function HideMsg() {
            $("#dvActivationMessage").css("display", "none");
        }
</script>
</asp:Content>
