<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CardDetail.aspx.cs" Inherits="WebApplication1.ActivationSim.CardDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<%--    @model AC.Common.CommonView.PaymentInfoModel--%>
<%
    var pageCtrl = Model.PageControlModel;
}%>


<style>
    .BottomSpace {
        padding-bottom: 10px;
    }
    .error_message {
        color:#c71d1d;
    }
 
</style>
@using (Html.BeginForm("CardDetail", "checkout", new {IsMobile = ViewBag.IsMobile }, FormMethod.Post))
{

    <div class="container">
        <h3 style="color:#3BA7D1">  @(pageCtrl.Where(i => i.ControlTypeName == "lblCREDITCARDDETAILS").FirstOrDefault() != null ? pageCtrl.Where(i => i.ControlTypeName == "lblCREDITCARDDETAILS").FirstOrDefault().ControlValue : "RETAILER CREDIT CARD DETAILS")</h3>
        <br />
        @if (TempData["msg"] != null && TempData["msg"] != "")
        {
            <div class="col-md-12 alert alert-warning" id="dvMsg">
                <a href="#" class="close" onclick="hide();" aria-label="close">&times;</a>
                <center>@TempData["msg"]</center>
            </div>
        }
        @if (!Model.IsCompanyVaultList)
        {
            <div class="row BottomSpace">
                <div class="col-xs-12 col-md-3"> </div>
                <div class="col-xs-12 col-md-4">@Html.CheckBoxFor(m => m.cbkUserCardOnFile) @(pageCtrl.Where(i => i.ControlTypeName == "cbkUserCardOnFileTitle").FirstOrDefault() != null ? pageCtrl.Where(i => i.ControlTypeName == "cbkUserCardOnFileTitle").FirstOrDefault().ControlValue : "Use Credit Card on File") </div>
            </div>
            <div id="dvCreditCardDetails">
                <div class="row BottomSpace">
                    <div class="col-xs-12 col-md-3 @(ViewBag.IsMobile ? "text-left" : "text-right")"  ><label id="lblCreditCardTypeTitle">@(pageCtrl.Where(i => i.ControlTypeName == "lblCreditCardTypeTitle").FirstOrDefault() != null ? pageCtrl.Where(i => i.ControlTypeName == "lblCreditCardTypeTitle").FirstOrDefault().ControlValue : "Credit Card Type")</label></div>
                    <div class="col-xs-12 col-md-5">
                        @Html.DropDownListFor(m => m.CreditCardTypeId, new SelectList(ViewBag.CreditCardList, "AppTypeId", "Name"), "Select Card Type", new { @class = "form-control" })
                        <label id="CreditCardTypeId_error" class="error_message"> Credit Card Type is required.</label> 
                    </div>
                </div>
                <div class="row BottomSpace">
                    <div class="col-xs-12 col-md-3 @(ViewBag.IsMobile ? "text-left" : "text-right")"><label id="lblFirstNameTitle">@(pageCtrl.Where(i => i.ControlTypeName == "lblFirstNameTitle").FirstOrDefault() != null ? pageCtrl.Where(i => i.ControlTypeName == "lblFirstNameTitle").FirstOrDefault().ControlValue : "First Name")</label></div>
                    <div class="col-xs-12 col-md-5"> @Html.TextBoxFor(m => m.FirstName, new { @class = "form-control", placeholder = "Enter Credit Holder First Name" }) <label id="FirstName_error" class="error_message"> First Name is required.</label>  </div>
                </div>
                <div class="row BottomSpace">
                    <div class="col-xs-12 col-md-3 @(ViewBag.IsMobile ? "text-left" : "text-right")"><label id="lblLastNameTitle">@(pageCtrl.Where(i => i.ControlTypeName == "lblLastNameTitle").FirstOrDefault() != null ? pageCtrl.Where(i => i.ControlTypeName == "lblLastNameTitle").FirstOrDefault().ControlValue : "Last Name")</label></div>
                    <div class="col-xs-12 col-md-5">@Html.TextBoxFor(m => m.LastName, new { @class = "form-control", placeholder = "Enter Credit Holder Last Name" }) <label id="LastName_error" class="error_message"> Last Name is required.</label></div>
                </div>
                <div class="row BottomSpace">
                    <div class="col-xs-12 col-md-3 @(ViewBag.IsMobile ? "text-left" : "text-right")"><label id="lblCreditCardNumberTitle">@(pageCtrl.Where(i => i.ControlTypeName == "lblCreditCardNumberTitle").FirstOrDefault() != null ? pageCtrl.Where(i => i.ControlTypeName == "lblCreditCardNumberTitle").FirstOrDefault().ControlValue : "Credit Card Number")</label></div>
                    <div class=" col-xs-12 col-md-5">@Html.TextBoxFor(m => m.CardNumber, new { @class = "form-control", placeholder = "Enter Credit Card Number", onkeypress = "return IsNumeric(event)" }) <label id="CardNumber_error" class="error_message">Card Number is required.</label> </div>
                </div>
                <div class="row BottomSpace">
                    <div class="col-xs-12 col-md-3 @(ViewBag.IsMobile ? "text-left" : "text-right")"><label id="lblExpiryDateTitle">@(pageCtrl.Where(i => i.ControlTypeName == "lblExpiryDateTitle").FirstOrDefault() != null ? pageCtrl.Where(i => i.ControlTypeName == "lblExpiryDateTitle").FirstOrDefault().ControlValue : "Exipry Date")</label></div>
                    <div class="col-xs-12 col-md-2">
                        @Html.DropDownListFor(m => m.ExpiryDateMonth, new SelectList(ViewBag.MonthList, "Text", "Value"), "Select Month", new { @class = "form-control" })
                        <label id="ExpiryDateMonth_error" class="error_message">Month is required.</label>
                    </div>
                    <div class="col-xs-12 col-md-2">
                        @Html.DropDownListFor(m => m.ExpiryDateYear, new SelectList(ViewBag.YearList, "Value", "Text"), "Select Year", new { @class = "form-control" })
                        <label id="ExpiryDateYear_error" class="error_message">Year is required.</label>
                    </div>

                </div>

                <div class="row BottomSpace">
                    <div class="col-xs-12 col-md-3 @(ViewBag.IsMobile ? "text-left" : "text-right")"><label id="lblCVVTitle">@(pageCtrl.Where(i => i.ControlTypeName == "lblCVVTitle").FirstOrDefault() != null ? pageCtrl.Where(i => i.ControlTypeName == "lblCVVTitle").FirstOrDefault().ControlValue : "CVV")</label></div>
                    <div class="col-xs-12 col-md-5">@Html.TextBoxFor(m => m.CvvNumber, new { @class = "form-control", placeholder = "Enter CVV", onkeypress = "return IsNumeric(event)" }) <label id="CvvNumber_error" class="error_message">CVV is required.</label></div>
                </div>
                <div class="row BottomSpace">
                    <div class="col-xs-12 col-md-3 @(ViewBag.IsMobile ? "text-left" : "text-right")"><label id="lblAddressTitle">@(pageCtrl.Where(i => i.ControlTypeName == "lblAddressTitle").FirstOrDefault() != null ? pageCtrl.Where(i => i.ControlTypeName == "lblAddressTitle").FirstOrDefault().ControlValue : "Address")</label></div>
                    <div class="col-xs-12 col-md-5">@Html.TextBoxFor(m => m.Address1, new { @class = "form-control", placeholder = "Enter Address" }) <label id="Address_error" class="error_message">Address is required.</label></div>
                </div>
                <div class="row BottomSpace">
                    <div class="col-xs-12 col-md-3 @(ViewBag.IsMobile ? "text-left" : "text-right")"><label id="lblCityTitle">@(pageCtrl.Where(i => i.ControlTypeName == "lblCityTitle").FirstOrDefault() != null ? pageCtrl.Where(i => i.ControlTypeName == "lblCityTitle").FirstOrDefault().ControlValue : "City")</label></div>
                    <div class="col-xs-12 col-md-5">@Html.TextBoxFor(m => m.City, new { @class = "form-control", placeholder = "Enter City" }) <label id="City_error" class="error_message">City is required.</label> </div>
                </div>
                <div class="row BottomSpace">
                    <div class="col-xs-12 col-md-3 @(ViewBag.IsMobile ? "text-left" : "text-right")"><label id="lblStateTitle">@(pageCtrl.Where(i => i.ControlTypeName == "lblStateTitle").FirstOrDefault() != null ? pageCtrl.Where(i => i.ControlTypeName == "lblStateTitle").FirstOrDefault().ControlValue : "State")</label></div>
                    <div class="col-xs-12 col-md-5"> @Html.DropDownListFor(m => m.State, new SelectList(ViewBag.StateList, "Code", "Code"), "Select State", new { @class = "form-control", placeholder = "Select State" }) <label id="State_error" class="error_message">State is required.</label> </div>
                  
                </div>
                <div class="row BottomSpace">
                    <div class="col-xs-12 col-md-3 @(ViewBag.IsMobile ? "text-left" : "text-right")"><label id="lblZipTitle">@(pageCtrl.Where(i => i.ControlTypeName == "lblZipTitle").FirstOrDefault() != null ? pageCtrl.Where(i => i.ControlTypeName == "lblZipTitle").FirstOrDefault().ControlValue : "Zip Code")</label></div>
                    <div class="col-xs-12 col-md-5">@Html.TextBoxFor(m => m.Zip, new { @class = "form-control", placeholder = "Enter Zip Code", onkeypress = "return IsNumeric(event)" })  <label id="Zip_error" class="error_message">Zip Code is required.</label></div>
                </div>
                <div class="row BottomSpace">
                    <div class="col-xs-12 col-md-3"> </div>
                    <div class="col-xs-12 col-md-6">@Html.CheckBoxFor(m => m.chbSaveCard)&nbsp;@(pageCtrl.Where(i => i.ControlTypeName == "chbSaveCardTitle").FirstOrDefault() != null ? pageCtrl.Where(i => i.ControlTypeName == "chbSaveCardTitle").FirstOrDefault().ControlValue : "Save Payment Information for future usage ") </div>
                </div>
                <div id="dvEmail" class="row BottomSpace" style="display:none">
                    <div class="col-xs-12 col-md-3 @(ViewBag.IsMobile ? "text-left" : "text-right")"><label id="lblCVVTitle">@(pageCtrl.Where(i => i.ControlTypeName == "lblCVVTitlea").FirstOrDefault() != null ? pageCtrl.Where(i => i.ControlTypeName == "lblCVVTitle").FirstOrDefault().ControlValue : "Emai")</label></div>
                    <div class="col-xs-12 col-md-5">@Html.TextBoxFor(m => m.CompanyEmail, new { @class = "form-control", placeholder = "Email" }) </div>
                </div>
                <div class="row BottomSpace">
                    <div class="col-xs-12 col-md-3"> </div>
                    <div class="col-xs-12 col-md-6">
                        <input type="submit" class="btn btn-primary" onclick="return Validation()" value="@(pageCtrl.Where(i => i.ControlTypeName == "btnPlaceOrderTitle").FirstOrDefault() != null ? pageCtrl.Where(i => i.ControlTypeName == "btnPlaceOrderTitle").FirstOrDefault().ControlValue : "Place Order")" />
                    </div>
                </div>
            </div>
            <div id="dvVaultDetail" style="display:none">
                <div class="row BottomSpace">
                    <div class="col-xs-12 col-md-3 @(ViewBag.IsMobile ? "text-left" : "text-right")"><label id="lblCVVTitle">@(pageCtrl.Where(i => i.ControlTypeName == "lblCVVTitlea").FirstOrDefault() != null ? pageCtrl.Where(i => i.ControlTypeName == "lblCVVTitle").FirstOrDefault().ControlValue : "Email")</label></div>
                    <div class="col-xs-12 col-md-5">@Html.TextBoxFor(m => m.Email, new { @class = "form-control", placeholder = "Email" }) </div>
                </div>
                <div class="row BottomSpace">
                    <div class="col-xs-12 col-md-3 @(ViewBag.IsMobile ? "text-left" : "text-right")"><label id="lblAddressTitle">@(pageCtrl.Where(i => i.ControlTypeName == "lblAddressTitlea").FirstOrDefault() != null ? pageCtrl.Where(i => i.ControlTypeName == "lblAddressTitle").FirstOrDefault().ControlValue : "Password")</label></div>
                    <div class="col-xs-12 col-md-5">@Html.PasswordFor(m => m.Password, new { @class = "form-control", placeholder = "Password" })</div>
                </div>
                <div class="row BottomSpace">
                    <div class="col-xs-12 col-md-3"> </div>
                    <div class="col-xs-12 col-md-6">
                        <input type="submit" class="btn btn-primary" onclick="return ValidateLogin()" value="@(pageCtrl.Where(i => i.ControlTypeName == "btnPlaceOrderTitleq").FirstOrDefault() != null ? pageCtrl.Where(i => i.ControlTypeName == "btnPlaceOrderTitle").FirstOrDefault().ControlValue : "Login")" />
                    </div>
                </div>
            </div>
        }
        else
        {
            foreach (var item in Model.CompanyVaultList)
            {
                <div class="row BottomSpace">
                    <div class="col-xs-12 col-md-3"> </div>
                    <div class="col-xs-12 col-md-6">
                        <label>
                            <input type="radio" value="@item.VaultId" name="companyVault">&nbsp;&nbsp;&nbsp; @item.CreditCardType &nbsp;&nbsp;&nbsp; <span id="VaultCardNumber" value="@item.Last4">@item.Last4</span> 
                        </label>
                    </div>
                </div>
            }
            @Html.HiddenFor(m => m.HdnCustomer_Vault)
            <div class="row BottomSpace">
                <div class="col-xs-12 col-md-3"> </div>
                <div class="col-xs-12 col-md-6">
                    <input type="submit" class="btn btn-primary" onclick="return ValidateChk()" value="@(pageCtrl.Where(i => i.ControlTypeName == "btnPlaceOrderTitle").FirstOrDefault() != null ? pageCtrl.Where(i => i.ControlTypeName == "btnPlaceOrderTitle").FirstOrDefault().ControlValue : "Place Order")" />
                </div>
            </div>
    @Html.HiddenFor(m => m.CardNumber);
        }
    </div>
}


<script type="text/javascript">
    window.history.forward();
    $(document).ready(function () {
        $('.error_message').css('display', 'none');

        $("#cbkUserCardOnFile").change(function () {
            if (this.checked) {
                $("#dvVaultDetail").show();
                $("#dvCreditCardDetails").hide();
            }
            else {
                $("#dvVaultDetail").hide();
                $("#dvCreditCardDetails").show();
            }
        });


        $("#chbSaveCard").change(function () {
            if (this.checked) {
                $("#dvEmail").show();
            }
            else {
                $("#dvEmail").hide();
            }
        });

        if ('@Model.chbSaveCard' == 'True') {
            $("#dvEmail").show();
        }
        else {
            $("#dvEmail").hide();
        }


        if ('@Model.cbkUserCardOnFile' == 'True') {
            $("#dvVaultDetail").show();
            $("#dvCreditCardDetails").hide();

        }
        else {
            $("#dvVaultDetail").hide();
            $("#dvCreditCardDetails").show();
        }
    });




    function Validation() {
        var IsValid = true;
        if ($("#CreditCardTypeId").val() == "") {
            $("#CreditCardTypeId").css('border-color', 'red');
            $("#CreditCardTypeId_error").css('display', 'block');
            IsValid = false;
        }
        else {
            $("#CreditCardTypeId").css('border-color', '');
            $("#CreditCardTypeId_error").css('display', 'none');
        }

        if ($("#FirstName").val().trim() == "") {
            $("#FirstName").css('border-color', 'red');
            $("#FirstName_error").css('display', 'block');
            IsValid = false;
        }
        else {
            $("#FirstName").css('border-color', '');
            $("#FirstName_error").css('display', 'none');
        }

        if ($("#LastName").val().trim() == "") {
            $("#LastName").css('border-color', 'red');
            $("#LastName_error").css('display', 'block');
            IsValid = false;
        }
        else {
            $("#LastName").css('border-color', '');
            $("#LastName_error").css('display', 'none');
        }

        if ($("#CardNumber").val().trim() == "") {
            $("#CardNumber").css('border-color', 'red');
            $("#CardNumber_error").css('display', 'block');
            IsValid = false;
        }
        else {
            $("#CardNumber").css('border-color', '');
            $("#CardNumber_error").css('display', 'none');
        }

        if ($("#ExpiryDateMonth").val().trim() == "") {
            $("#ExpiryDateMonth").css('border-color', 'red');
            $("#ExpiryDateMonth_error").css('display', 'block');
            IsValid = false;
        }
        else {
            $("#ExpiryDateMonth").css('border-color', '');
            $("#ExpiryDateMonth_error").css('display', 'none');
        }

        if ($("#ExpiryDateYear").val().trim() == "") {
            $("#ExpiryDateYear").css('border-color', 'red');
            $("#ExpiryDateYear_error").css('display', 'block');
            IsValid = false;
        }
        else {
            $("#ExpiryDateYear").css('border-color', '');
            $("#ExpiryDateYear_error").css('display', 'none');
        }

        if ($("#CvvNumber").val().trim() == "") {
            $("#CvvNumber").css('border-color', 'red');
            $("#CvvNumber_error").css('display', 'block');
            IsValid = false;
        }
        else {
            $("#CvvNumber").css('border-color', '');
            $("#CvvNumber_error").css('display', 'none');
        }

        if ($("#Address1").val().trim() == "") {
            $("#Address1").css('border-color', 'red');
            $("#Address_error").css('display', 'block');
            IsValid = false;
        }
        else {
            $("#Address1").css('border-color', '');
            $("#Address_error").css('display', 'none');
        }

        if ($("#City").val().trim() == "") {
            $("#City").css('border-color', 'red');
            $("#City_error").css('display', 'block');
            IsValid = false;
        }
        else {
            $("#City").css('border-color', '');
            $("#City_error").css('display', 'none');
        }

        if ($("#State").val().trim() == "") {
            $("#State").css('border-color', 'red');
            $("#State_error").css('display', 'block');
            IsValid = false;
        }
        else {
            $("#State").css('border-color', '');
            $("#State_error").css('display', 'none');
        }

        if ($("#Zip").val().trim() == "") {
            $("#Zip").css('border-color', 'red');
            $("#Zip_error").css('display', 'block');
            IsValid = false;
        }
        else {
            $("#Zip").css('border-color', '');
            $("#Zip_error").css('display', 'none');
        }
        var chkSaveCard = document.getElementById("chbSaveCard").checked;
        if (chkSaveCard == true) {
            if ($("#CompanyEmail").val().trim() == "") {
                $("#CompanyEmail").css('border-color', 'red');
                IsValid = false;
            }
            else {
                $("#CompanyEmail").css('border-color', '');
            }
        }
        return IsValid;
    }

    function ValidateLogin() {
        var IsValid = true;
        if ($("#Email").val().trim() == "") {
            $("#Email").css('border-color', 'red');
            IsValid = false;
        }
        else {
            $("#Email").css('border-color', '');
        }

        if ($("#Password").val().trim() == "") {
            $("#Password").css('border-color', 'red');
            IsValid = false;
        }
        else {
            $("#Password").css('border-color', '');
        }
        return IsValid;
    }

    function ValidateChk() {
        Loading();
        var companyVaultId = $("input[name=companyVault]:checked").val();
        var vaultCardnumber = $("#VaultCardNumber").html();
        if (companyVaultId != undefined && vaultCardnumber != undefined) {
            $("#HdnCustomer_Vault").val(companyVaultId);
            $("#CardNumber").val(vaultCardnumber);
            return true;
        }
        else {
            StopLoading();
            return false;
        }
    }

</script>
</asp:Content>
