function GetDetails(request) {
    $("#Progressbar").show();
    $.ajax({
        async: true,
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
                        let activatedDate = new Date(details.ActivatedDate);

                        $('.activated-sim-details').show();
                        $('#activated-carrier').text(details.Name);
                        $('#activated-serialnumber').text(details.SerialNumber);
                        $('#activated-planvalue').text('$' + details.PlanValue);
                        $('#activated-planname').text(details.PlanName);
                        $('#activated-activateddate').text((activatedDate.getMonth() + 1) + '/' + activatedDate.getDate() + "/" + activatedDate.getFullYear());
                        if (details.MobileNumber) {
                            $('#activated-mobilenumber').text(details.MobileNumber);
                        } else {
                            $('#activated-mobilenumber').text('n/a');
                        }


                        $("#Progressbar").hide();
                        return false;
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
                            var carrierId = $("input[type='radio']:checked").val();
                            $("#InventoryId").val(details.ItemInventoryId);
                            $("#SIMNumber").val(details.SerialNumber);
                            $("#frmsubmit").submit();
                        }

                    }
                }
                else {
                    showMessage("SIM/IMEI is invalid.", "alert-danger", "alert-warning");
                    $("#Progressbar").hide();
                    return false;
                }
            }
            else {
                showMessage(response.Message, "alert-warning", "alert-danger");

                $("#Progressbar").hide();
                return false;
            }
            $("#Progressbar").hide();
        },
        failure: function (response) {
            $("#Progressbar").hide();
            showMessage(response.Message, "alert-warning", "alert-danger");
        }
    });
}


function getFundedSIM(SIM, CarrierServiceName, CarrierServiceTypeId, CarrierServiceGUID, MobileNumber, companyGuid) {
    var result = false;
    $.ajax({
        async: false,
        cache: false,
        type: "GET",
        url: '/Home/CheckIfLoginRequiredOnPrefunded',
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

    var currentCarrierServiceName = $("#CurrentCarrierServiceName").val();
    $.ajax({
        async: false,
        cache: false,
        type: "GET",
        url: '/Home/GetFundedInventory',
        data: { SIM: SIM, carrierServiceName: CarrierServiceName, carrierServiceTypeId: CarrierServiceTypeId, carrierServiceGUID: CarrierServiceGUID, companyGuid: companyGuid, currentCarrierServiceName: currentCarrierServiceName },
        success: function (response) {
            $("#Prefunded").empty();
            $("#Prefunded").append(response);

            if ($("#PortInNumber").length > 0) {
                $("#PortInNumber").val(MobileNumber);
            }

            showInventoryResult();
            $("#Progressbar").hide();
        },
        failure: function (response) {
            $("#Progressbar").hide();
            showMessage(response, "alert-warning", "alert-danger");
            result = false;
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



function FundedItemInventory(choosenPlan, choosenInventories, companyGuid) {
    CarrierGUID = $("input[name=carriers]:checked").val();
    $.ajax({
        async: false,
        cache: false,
        type: "POST",
        url: '/Search/FundedSimPlans',
        data: { plans: choosenPlan, inventories: choosenInventories, CarrierGUID: CarrierGUID },
        success: function (response) {
            $("#Progressbar").hide();
            var mobileParam = $('#IsMobile').val() == "" || $('#IsMobile').val() == undefined ? "" : "?isMobile=" + $('#IsMobile').val();
            window.location.href = "/checkout/summary" + mobileParam;
            return false;
        },
        failure: function (response) { $("#Progressbar").hide(); }
    });
}

function showInventoryResult() {
    $(".dvService").hide();
}

function CheckActivatedSim() {
    var inventoryGuid = GetQueryStringByParameter("inventoryid");
    var csid = GetQueryStringByParameter("csid");
    if (inventoryGuid != undefined && inventoryGuid != null && inventoryGuid != "") {
        $("#Carrier-" + csid).attr("checked", "checked");

        $.ajax({
            async: false,
            cache: false,
            url: '/Home/GetInventoryByInventoryId',
            data: { inventoryGuid: inventoryGuid },
            success: function (response) {
                if (response != null) {
                    var request = {};
                    request.DeviceId = response.DeviceId;
                    request.CarrierServiceGUID = csid;
                    request.WsUserGUid = wsUserGUid;
                    //request.CompanyGUID = '@Session["CompanyGUID"]';
                    request.CompanyGUID = $('#CompanyGUID').val();
                    request.SIM = response.SerialNumber;
                    request.MobileNumber = response.MobileNumber;
                    request.ConnectionSourceType = connectionSourceType;

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

function showService() {
    $("#Prefunded").empty();
    $(".dvService").show();
    $("#dvMsg").hide();
}

function HideMsg() {
    $("#dvActivationMessage").css("display", "none");
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

    if ($("#Name").val() == "H2O Wireless 4G") {
        //if ($("#CurrentCarrierServiceName").val() == "verizon") {
        $.ajaxSetup({ cache: false, async: false });
        $.get("/Home/GetAreaCode", { zipCode: zipCode }).success(function (response) {
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
    else {
        Activate(inventoryId, item, isPortIn, carrierServiceGUID, 0);
    }

}

function Activate(inventoryId, item, isPortIn, carrierServiceGUID, areaCode) {
    // Loading();
    var carrier = $("#CurrentCarrierServiceName").val();

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
    request.MSISDN = $("#txtMobileNumber").val();
    request.AreaCode = areaCode;
    request.ConnectionSourceType = connectionSourceType;

    if (zipCode == null || zipCode == "" || zipCode == undefined) {
        $("#txtZip-" + inventoryId).css("border-color", "red");
        return false;
    }

    if (zipCode.length > 5 || zipCode.length < 5) {
        showMessage("Zipcode must be of 5 digits", "alert-warning", "alert-danger");
        return false;
    }


    if (isPortIn == 'true' && carrier.toLowerCase() != "lyca") {
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
    else if (isPortIn == 'true' && carrier.toLowerCase() == "lyca") {
        var result = true;
        if (request.OSPAccountNum == undefined || request.OSPAccountNum == null || request.OSPAccountNum == "") {
            $("#OSPAccountNum").css("border-color", "red");
            result = false;
        }
        if (request.PasswordPIN == undefined || request.PasswordPIN == null || request.PasswordPIN == "") {
            $("#PasswordPIN").css("border-color", "red");
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




