<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CardDetail.aspx.cs" Inherits="WebApplication1.ActivationSim.CardDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<%
    var pageCtrl = Model.PageControlModel;
%>

<script src="../Scripts/ActivationSimScripts/Common.js"></script>
<style>
    .BottomSpace {
        padding-bottom: 10px;
    }
    .error_message {
        color:#c71d1d;
    }
 
</style>

    <div class="container">
        <h3 style="color:#3BA7D1"><%= (pageCtrl.Where(i => i.ControlTypeName == "lblCREDITCARDDETAILS").FirstOrDefault() != null ? pageCtrl.Where(i => i.ControlTypeName == "lblCREDITCARDDETAILS").FirstOrDefault().ControlValue : "RETAILER CREDIT CARD DETAILS") %></h3>
        <br />
        <% if (TempData != null && TempData != "")
        {%>
            <div class="col-md-12 alert alert-warning" id="dvMsg">
                <a href="#" class="close" onclick="hide();" aria-label="close">&times;</a>
                <p><%= TempData%></p>
            </div>
        <%}
        if (!Model.IsCompanyVaultList)
        {%>
            <div class="row BottomSpace">
                <div class="col-xs-12 col-md-3"> </div>
                <div class="col-xs-12 col-md-4">
                    <Label>
                    <asp:CheckBox ID="cbkUserCardOnFile" ClientIDMode="Static" runat="server" Checked="<%# Convert.ToBoolean(Model.cbkUserCardOnFile)%>"/>
                    <%= (Model.PageControlModel.Where(i => i.ControlTypeName == "cbkUserCardOnFileTitle").FirstOrDefault() != null ? Model.PageControlModel.Where(i => i.ControlTypeName == "cbkUserCardOnFileTitle").FirstOrDefault().ControlValue : "Use Credit Card on File")%>
                </Label>
             </div>
            </div>
            <div id="dvCreditCardDetails">
                <div class="row BottomSpace">
                    <div class="col-xs-12 col-md-3 text-right"><label id="lblCreditCardTypeTitle">
                        <%=(pageCtrl.Where(i => i.ControlTypeName == "lblCreditCardTypeTitle").FirstOrDefault() != null ? pageCtrl.Where(i => i.ControlTypeName == "lblCreditCardTypeTitle").FirstOrDefault().ControlValue : "Credit Card Type")%></label></div>
                        <div class="col-xs-12 col-md-5">
                        <asp:DropDownList runat="server" CssClass="form-control" ClientIDMode="Static" ID="CreditCardDDLId">
                            <asp:ListItem Value="">Select Card Type</asp:ListItem>
                        </asp:DropDownList>
                        <%--@Html.DropDownListFor(m => m.CreditCardTypeId, new SelectList(ViewBag.CreditCardList, "AppTypeId", "Name"), "Select Card Type", new { @class = "form-control" })--%>
                        <label id="CreditCardTypeId_error" class="error_message"> Credit Card Type is required.</label> </div>
                    </div>
                <div class="row BottomSpace">
                    <div class="col-xs-12 col-md-3 text-right"><label id="lblFirstNameTitle"><%=(pageCtrl.Where(i => i.ControlTypeName == "lblFirstNameTitle").FirstOrDefault() != null ? pageCtrl.Where(i => i.ControlTypeName == "lblFirstNameTitle").FirstOrDefault().ControlValue : "First Name")%></label></div>
                    <div class="col-xs-12 col-md-5"> 
                        <asp:TextBox runat="server" ClientIDMode="Static" CssClass="form-control" ID="FirstNameTxt" placeholder="Enter Credit Holder First Name"></asp:TextBox>                        
                        <label id="FirstName_error" class="error_message"> First Name is required.</label>  </div>
                </div>
                <div class="row BottomSpace">
                    <div class="col-xs-12 col-md-3 text-right"><label id="lblLastNameTitle"><%=(pageCtrl.Where(i => i.ControlTypeName == "lblLastNameTitle").FirstOrDefault() != null ? pageCtrl.Where(i => i.ControlTypeName == "lblLastNameTitle").FirstOrDefault().ControlValue : "Last Name")%></label></div>
                    <div class="col-xs-12 col-md-5">
                        <asp:TextBox runat="server" ClientIDMode="Static" CssClass="form-control" ID="LastNameTxt" placeholder="Enter Credit Holder Last Name"></asp:TextBox>
                        <label id="LastName_error" class="error_message"> Last Name is required.</label></div>
                </div>
                <div class="row BottomSpace">
                    <div class="col-xs-12 col-md-3 text-right"><label id="lblCreditCardNumberTitle"><%=(pageCtrl.Where(i => i.ControlTypeName == "lblCreditCardNumberTitle").FirstOrDefault() != null ? pageCtrl.Where(i => i.ControlTypeName == "lblCreditCardNumberTitle").FirstOrDefault().ControlValue : "Credit Card Number")%></label></div>
                    <div class=" col-xs-12 col-md-5">
                        <asp:TextBox runat="server" ClientIDMode="Static" CssClass="form-control" ID="CardNumberTxt" onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);" placeholder="Enter Credit Card Number"></asp:TextBox>
                        <label id="CardNumber_error" class="error_message">Card Number is required.</label> </div>
                </div>
                <div class="row BottomSpace">
                    <div class="col-xs-12 col-md-3 text-right"><label id="lblExpiryDateTitle"><%=(pageCtrl.Where(i => i.ControlTypeName == "lblExpiryDateTitle").FirstOrDefault() != null ? pageCtrl.Where(i => i.ControlTypeName == "lblExpiryDateTitle").FirstOrDefault().ControlValue : "Exipry Date")%></label></div>
                    <div class="col-xs-12 col-md-2">
                        <asp:DropDownList runat="server" CssClass="form-control" ID="MonthListDDL" >
                            <asp:ListItem Value="">Select Month</asp:ListItem>
                        </asp:DropDownList>
                        <%--@Html.DropDownListFor(m => m.ExpiryDateMonth, new SelectList(ViewBag.MonthList, "Text", "Value"), "Select Month", new { @class = "form-control" })--%>
                        <label id="ExpiryDateMonth_error" class="error_message">Month is required.</label>
                    </div>
                    <div class="col-xs-12 col-md-2">
                        <asp:DropDownList runat="server" CssClass="form-control" ID="YearListDDL" >
                            <asp:ListItem Value="">Select Year</asp:ListItem>
                        </asp:DropDownList>
                        <%--@Html.DropDownListFor(m => m.ExpiryDateYear, new SelectList(ViewBag.YearList, "Value", "Text"), "Select Year", new { @class = "form-control" })--%>
                        <label id="ExpiryDateYear_error" class="error_message">Year is required.</label>
                    </div>

                </div>

                <div class="row BottomSpace">
                    <div class="col-xs-12 col-md-3 text-right"><label id="lblCVVTitle"><%=(pageCtrl.Where(i => i.ControlTypeName == "lblCVVTitle").FirstOrDefault() != null ? pageCtrl.Where(i => i.ControlTypeName == "lblCVVTitle").FirstOrDefault().ControlValue : "CVV")%></label></div>
                    <div class="col-xs-12 col-md-5">
                        <asp:TextBox runat="server" ClientIDMode="Static" CssClass="form-control" ID="CvvNumberTXT" onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);" placeholder="Enter CVV"></asp:TextBox>
                        <label id="CvvNumber_error" class="error_message">CVV is required.</label></div>
                </div>
                <div class="row BottomSpace">
                    <div class="col-xs-12 col-md-3 text-right"><label id="lblAddressTitle"><%=(pageCtrl.Where(i => i.ControlTypeName == "lblAddressTitle").FirstOrDefault() != null ? pageCtrl.Where(i => i.ControlTypeName == "lblAddressTitle").FirstOrDefault().ControlValue : "Address")%></label></div>
                    <div class="col-xs-12 col-md-5">
                        <asp:TextBox runat="server" ClientIDMode="Static" CssClass="form-control" ID="Address1Txt" placeholder="Enter Address"></asp:TextBox>
                        <label id="Address_error" class="error_message">Address is required.</label></div>
                </div>
                <div class="row BottomSpace">
                    <div class="col-xs-12 col-md-3 text-right"><label id="lblCityTitle"><%=(pageCtrl.Where(i => i.ControlTypeName == "lblCityTitle").FirstOrDefault() != null ? pageCtrl.Where(i => i.ControlTypeName == "lblCityTitle").FirstOrDefault().ControlValue : "City")%></label></div>
                    <div class="col-xs-12 col-md-5">
                        <asp:TextBox runat="server" ClientIDMode="Static" CssClass="form-control" ID="CityTxt" placeholder="Enter City"></asp:TextBox>
                        <label id="City_error" class="error_message">City is required.</label> </div>
                </div>
                <div class="row BottomSpace">
                    <div class="col-xs-12 col-md-3 text-right"><label id="lblStateTitle"><%=(pageCtrl.Where(i => i.ControlTypeName == "lblStateTitle").FirstOrDefault() != null ? pageCtrl.Where(i => i.ControlTypeName == "lblStateTitle").FirstOrDefault().ControlValue : "State")%></label></div>
                    <div class="col-xs-12 col-md-5">
                        <asp:DropDownList runat="server" CssClass="form-control" ID="StateListDDL">
                            <asp:ListItem Value="">Select State</asp:ListItem>
                        </asp:DropDownList>
                        <%--@Html.DropDownListFor(m => m.State, new SelectList(ViewBag.StateList, "Code", "Code"), "Select State", new { @class = "form-control", placeholder = "Select State" })--%> <label id="State_error" class="error_message">State is required.</label> </div>
                  
                </div>
                <div class="row BottomSpace">
                    <div class="col-xs-12 col-md-3 text-right"><label id="lblZipTitle"><%=(pageCtrl.Where(i => i.ControlTypeName == "lblZipTitle").FirstOrDefault() != null ? pageCtrl.Where(i => i.ControlTypeName == "lblZipTitle").FirstOrDefault().ControlValue : "Zip Code")%></label></div>
                    <div class="col-xs-12 col-md-5">
                        <asp:TextBox runat="server" ClientIDMode="Static" CssClass="form-control" ID="ZipTxt" placeholder="Enter Zip Code" onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);"></asp:TextBox>
                        <label id="Zip_error" class="error_message">Zip Code is required.</label></div>
                </div>
                <div class="row BottomSpace">
                    <div class="col-xs-12 col-md-3"> </div>
                    <div class="col-xs-12 col-md-6">
                        <Label>
                          <asp:CheckBox ID="chbSaveCard" ClientIDMode="Static" runat="server" Checked="<%# Convert.ToBoolean(Model.chbSaveCard)%>"/>
                          <%= (Model.PageControlModel.Where(i => i.ControlTypeName == "chbSaveCardTitle").FirstOrDefault() != null ? Model.PageControlModel.Where(i => i.ControlTypeName == "chbSaveCardTitle").FirstOrDefault().ControlValue : "Save Payment Information for future usage")%>
                       </Label>

                    </div>
                </div>
                <div id="dvEmail" class="row BottomSpace" style="display:none">
                    <div class="col-xs-12 col-md-3 text-right"><label id="lblCVVTitle"><%=(pageCtrl.Where(i => i.ControlTypeName == "lblCVVTitlea").FirstOrDefault() != null ? pageCtrl.Where(i => i.ControlTypeName == "lblCVVTitle").FirstOrDefault().ControlValue : "Email")%></label></div>
                    <div class="col-xs-12 col-md-5">
                        <asp:TextBox runat="server" ClientIDMode="Static" CssClass="form-control" ID="CompanyEmailTxt" placeholder="Email"></asp:TextBox>
                    </div>
                </div>
                <div class="row BottomSpace">
                    <div class="col-xs-12 col-md-3"> </div>
                    <div class="col-xs-12 col-md-6">
                        <asp:Button runat="server" class="btn btn-primary" OnClick="Submit_Click" Text="Place Order"/>
                    </div>
                </div>
            </div>
            <div id="dvVaultDetail" style="display:none">
                <div class="row BottomSpace">
                    <div class="col-xs-12 col-md-3 text-right"><label id="lblCVVTitle"><%=(pageCtrl.Where(i => i.ControlTypeName == "lblCVVTitlea").FirstOrDefault() != null ? pageCtrl.Where(i => i.ControlTypeName == "lblCVVTitle").FirstOrDefault().ControlValue : "Email")%></label></div>
                    <div class="col-xs-12 col-md-5">
                        <asp:TextBox runat="server" ClientIDMode="Static" CssClass="form-control" ID="EmailTxt" placeholder="Email"></asp:TextBox>
                    </div>
                </div>
                <div class="row BottomSpace">
                    <div class="col-xs-12 col-md-3 text-right"><label id="lblAddressTitle"><%=(pageCtrl.Where(i => i.ControlTypeName == "lblAddressTitlea").FirstOrDefault() != null ? pageCtrl.Where(i => i.ControlTypeName == "lblAddressTitle").FirstOrDefault().ControlValue : "Password")%></label></div>
                    <div class="col-xs-12 col-md-5">
                        <asp:TextBox runat="server" ClientIDMode="Static" CssClass="form-control" ID="PasswordTxt" TextMode="Password" placeholder="Password"></asp:TextBox>
                    </div>
                </div>
                <div class="row BottomSpace">
                    <div class="col-xs-12 col-md-3"> </div>
                    <div class="col-xs-12 col-md-6">
                        <input type="submit" class="btn btn-primary" onclick="return ValidateLogin()" value="<%=(pageCtrl.Where(i => i.ControlTypeName == "btnPlaceOrderTitleq").FirstOrDefault() != null ? pageCtrl.Where(i => i.ControlTypeName == "btnPlaceOrderTitle").FirstOrDefault().ControlValue : "Login")%>" />
                    </div>
                </div>
            </div>
        <%}
        else
        {%>
               <asp:Repeater ID="CompanyVaultListRpt" ClientIDMode="Static" runat="server">
                   <ItemTemplate>
                     <div class="row BottomSpace">
                       <div class="col-xs-12 col-md-3"> </div>
                        <div class="col-xs-12 col-md-6">
                          <label>
                              <input type="radio" value="<%#Eval("VaultId")%>" name="companyVault">
                              <span id="CreditCardTypeSpan"><%# Eval("Last4")%></span>
                              <span id="VaultCardNumber"> <%#Eval("CreditCardType")%></span>
                          </label>
                        </div>
                      </div>
                    </ItemTemplate>
                </asp:Repeater>

              <input type="hidden" runat="server" value="<%= Model.HdnCustomer_Vault%>" />
              <div class="row BottomSpace">
                  <div class="col-xs-12 col-md-3"> </div>
                  <div class="col-xs-12 col-md-6">
                      <asp:Button class="btn btn-primary" OnClick="ValidateChk_Click" Text="Place Order" runat="server" />
                  </div>
              </div>

        <input type="hidden" runat="server" value="<%= Model.CardNumber%>" />
        <%}%>
    </div>
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

