<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InventoryPartial.aspx.cs" Inherits="WebApplication1.ActivationSim.InventoryPartial" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


<asp:Repeater runat="server" ID="Repeater" ItemType="WebApplication1.Models.FundedItemModel">
   <ItemTemplate>
     <div class="panel-group">
        <div class="panel panel-primary" id="pnlActivation">
            <div class="panel-heading" id="headingActivate">
           SIM / IMEI
           <%# DataBinder.Eval(Container.DataItem,("PlanId")) != null? 
               "<span>Prefunded</span>" : string.Empty%>
           <%# DataBinder.Eval(Container.DataItem, "Status").ToString().ToLower() == "pending" ? 
                   "<span>status is pending</span>" : 
                   DataBinder.Eval(Container.DataItem,"Status").ToString().ToLower() == "activated"?
                   "<span>The SIM number is activated successfully.</span>":string.Empty%>
        </div>
            <div class="panel-body">
            <div class="col-md-12">
                <%# Convert.ToBoolean(DataBinder.Eval(Container.DataItem , "IsFundingRequird")) == true ?
                "<div id=\"IsFundingRequird\" class=\"row\"><div class=\"col-xs-12 col-md-12 alert-danger\"><span>The Required Funding for this plan has increased to "+
                Convert.ToDecimal(Math.Round(Convert.ToDouble(DataBinder.Eval(Container.DataItem , "NewFundingRequired")))> 0? Convert.ToDouble(DataBinder.Eval(Container.DataItem , "NewFundingRequired")) - Convert.ToDouble(DataBinder.Eval(Container.DataItem , "FundingRequired"))
                 : Convert.ToDouble(DataBinder.Eval(Container.DataItem , "NewFundingRequired"))).ToString("#.00")+
                  "Please pay the difference amount before activating</span></div></div>":""
                %>
                <div class="row no-padding">
                    <div class="alert text-center" id="dvActivationMessage" style="display:none">
                        <span id="spnActivationMessage"></span>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-5 col-md-5 text-right">
                        <b>Carrier</b>
                    </div><div class="col-xs-7 col-md-7"><%# DataBinder.Eval(Container.DataItem,("CarrierName"))%></div>
                </div>
                <div class="row">
                    <div class="col-xs-5 col-md-5 text-right">
                        <b>SIM / IMEI</b>
                    </div>
                    <div class="col-xs-7 col-md-7"><%# DataBinder.Eval(Container.DataItem,("SerialNumber"))%></div>
                </div>
                <div class="row">
                    <div class="col-xs-5 col-md-5 text-right">
                        <b>Plan Value</b>
                    </div>
                    <div class="col-xs-7 col-md-7"><%# DataBinder.Eval(Container.DataItem,("PlanValue"))%></div>
                </div>
                <div class="row">
                    <div class="col-xs-5 col-md-5 text-right">
                        <b>Plan Name</b>
                    </div>
                    <div class="col-xs-7 col-md-7"><%# DataBinder.Eval(Container.DataItem,("PlanName"))%></div>
                </div>
               <%# !string.IsNullOrEmpty(Convert.ToString(DataBinder.Eval(Container.DataItem,("MobileNumber")))) ? 
                    "<div class=\"row\">"+
                        "<div class=\"col-xs-5 col-md-5 text-right\">"+
                            "<b>Mobile Number</b>"+
                        "</div>"+
                        "<div class=\"col-xs-7 col-md-7\">"+ Convert.ToString(DataBinder.Eval(Container.DataItem, "MobileNumber")) + "</div></div>": "" %>
                 <%# !string.IsNullOrEmpty(Convert.ToString(DataBinder.Eval(Container.DataItem,("ActivationDate")))) ?
                    "<div class=\"row\">"+
                        "<div class=\"col-xs-5 col-md-5 text-right\">"+
                            "<b>Activated Date</b></div>"+
                        "<div class=\"col-xs-7 col-md-7\">"+Convert.ToString(DataBinder.Eval(Container.DataItem, "ActivationDate"))+"</div></div>": 
                        "<div class=\"row\" id=\"dvActivatedDate\" style=\"display:none\">"+
                        "<div class=\"col-xs-5 col-md-5 text-right\"><b>Activated Date</b></div>"+
                        "<div class=\"col-xs-7 col-md-7\"><span id=\"activatedDate\"></span></div></div>"
                 %>
             <%# DataBinder.Eval(Container.DataItem,"PlanId") != null ?
                     Convert.ToBoolean(DataBinder.Eval(Container.DataItem,"IsFundingRequird")) ?
                               "<div class=\"row form-group dvPortIn\">" +
                                 "<div class=\"col-xs-5 col-md-5 text-right\">" +
                                     "<b>Enter Zip Code</b>" +
                                 "</div><div class=\"col-xs-7 col-md-7\">" +
                                     "<div class=\"row col-md-7\">" +
                                         "<input id=\"txtZip" + Convert.ToString(Eval("ItemInventoryId")) +
                                         "class=\"form-control\" type=\"text\" onkeypress=\"return IsNumeric(event)\" maxlength=\"5\"/></div></div></div>" : "" : ""%>

                 <asp:Panel ID="portIn" runat="server" ClientIDMode="Static" Visible="false">
                        <div  class="row dvPortIn" >
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
                     </asp:Panel>
                     <asp:Panel runat="server" ID="portInIsLyca" ClientIDMode="Static" Visible="false">
                            <div class="row dvPortIn">
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
                      </asp:Panel>
                <input type="hidden" id="ItemInventoryId" value="<%#DataBinder.Eval(Container.DataItem, "ItemInventoryId") %>" />
                    <div class="row dvPortIn">
                        <div class="col-xs-5 col-md-5 text-right">
                        </div>
                        <div class="col-xs-7 col-md-7">
                         <%# Convert.ToBoolean(DataBinder.Eval(Container.DataItem,"IsFundingRequird")) == false ?
                                "<input type=\"button\" class=\"btn btn-primary\" value=\"Activate\"/>"+
                                "<input type=\"button\" class=\"btn btn-default\"  value=\"Back\"/>": "<input type=\"hidden\" id=\"ItemInventoryId\" value=\""+DataBinder.Eval(Container.DataItem, "ItemInventoryId")+"\" />"+
                                "<input type=\"hidden\" id=\"PlanPriceId\" value=\""+DataBinder.Eval(Container.DataItem, "PlanPriceId")+"\" />"+
                                "<input type=\"hidden\" id=\"FundingRequired\" value=\""+DataBinder.Eval(Container.DataItem, "FundingRequired")+"\" />"+
                                "<input type=\"submit\" class=\"btn btn-primary\" value=\"Pay Now\"/>"+
                                "<input type=\"button\" class=\"btn btn-default\" onclick=\"showService();\" value=\"Back\"/>"
                         %>
                        
                        </div>
                    </div>
                    <div id="dvActivate" style="display:none">
                        @if (Model.IsVersizonProvider)
                        {
                            <div class="row">
                                <div class="col-md-offset-5  col-xs-7 col-md-7">
                                    <input type="button" value="Refresh" class="btn btn-sm btn-primary" onclick="CheckStatus('@Model.Item')" />
                                </div>
                            </div>
                     }
                    </div>
            </div>
        </div>
        </div>
     </div>
    </ItemTemplate>
</asp:Repeater>

</asp:Content>
