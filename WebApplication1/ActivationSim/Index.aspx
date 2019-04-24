<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Index.aspx.cs" Inherits="WebApplication1.ActivationSim.Index" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <link href="../CSS/ActivateFormStyle.css" rel="stylesheet" type="text/css" />
   <script src="../Scripts/ActivationSimScripts/Home-Index.js" type="text/javascript"></script>

   <div class="row text-center dvService" runat="server" id="dvCarriers"> 
       <div class="col-md-4" style="margin-top: 20px;">
           <div class="custom-panel">
     <asp:DataList runat="server" ID="repeater" ItemStyle-CssClass="OrderHistory_RowSeparator" RepeatDirection="Horizontal" OnItemDataBound="DataList1_ItemDataBound">
         <ItemTemplate>
             <asp:Image ID="Image" CssClass="div-img-responsive" runat="server" ImageUrl='../Images/Carriers/H2O Wireless_logo627.jpg'/>
             <asp:RadioButtonList ID="radios" runat="server" RepeatDirection="Vertical" ClientIDMode="Static"/>
         </ItemTemplate>
     </asp:DataList>
          </div>
       </div>
    </div>
    <div class="col-md-12">
       <div class="row">
         <div class="col-md-12">
           <div class="col-md-12 alert alert-warning text-center" id="dvMsg" style="display:none">
               <span id="dvMsgbody"></span>
           </div>
         </div>
      </div>
    </div>
    <div class="row col-md-6 col-md-offset-3 activated-sim-details" style="padding-left:40px;padding-right: 40px;display:none">
            <div class="panel-group" style="padding-bottom:20px">
                <div class="panel panel-primary" id="pnlActivation">
                    <div class="panel-heading" id="headingActivate">
                        <span id="spnTitle">SIM/IMEI is already activated.</span>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-xs-5 col-md-5 text-right">
                                <b>Activated Date</b>
                            </div>
                            <div class="col-xs-7 col-md-7">
                                <span id="activated-activateddate"></span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-5 col-md-5 text-right">
                                <b>Carrier</b>
                            </div>
                            <div class="col-xs-7 col-md-7">
                                <span id="activated-carrier"></span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-5 col-md-5 text-right">
                                <b>SIM / IMEI</b>
                            </div>
                            <div class="col-xs-7 col-md-7">
                                <span id="activated-serialnumber"></span>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-5 col-md-5 text-right">
                                <b>Plan Value</b>
                            </div>
                            <div class="col-xs-7 col-md-7">
                                <span id="activated-planvalue"></span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-5 col-md-5 text-right">
                                <b>Plan Name</b>
                            </div>
                            <div class="col-xs-7 col-md-7">
                                <span id="activated-planname"></span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-5 col-md-5 text-right">
                                <b>Phone Number</b>
                            </div>
                            <div class="col-xs-7 col-md-7">
                                <span id="activated-mobilenumber"></span>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

     <div class="container dvService">
            <div class="row">
                <div class="col-sm-7 col-md-6" id="dvInventory">
                    <div class="col-md-12">

                        <div class="row form-group">
                            <asp:TextBox class="form-control" ID="txtSIM" runat="server" placeholder="Enter SIM Number"/>
                        </div>

                        <div class="row form-group" style="display:none">
                             <asp:TextBox class="form-control" ID="txtDeviceId" runat="server"/>
                        </div>
                    </div>
                            <div class="col-md-12" style="display:none">
                                <div class="row  form-group">
                                    <asp:TextBox class="form-control" ID="txtMobileNumber" maxlength="10" runat="server"/>
                                </div>
                            </div>
                    <div class="col-md-10 row">
                      <asp:Button runat="server" id="btnSubmit" Text="Submit" class="btn btn-primary" />
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
