<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Index.aspx.cs" Inherits="WebApplication1.ActivationSim.Index" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <link href="../CSS/ActivateFormStyle.css" rel="stylesheet" type="text/css" />


   <div class="row text-center dvService" runat="server" id="dvCarriers"> 
       <div class="col-md-4" style="margin-top: 20px;">
           <div class="custom-panel">
     <asp:DataList runat="server" ID="repeater" ItemStyle-CssClass="OrderHistory_RowSeparator" RepeatDirection="Horizontal" OnItemDataBound="DataBindings_ItemDataBound">
         <ItemTemplate>
             <asp:Image ID="Image" CssClass="div-img-responsive" runat="server"/>
             <asp:RadioButtonList ID="radios" runat="server" RepeatDirection="Vertical" CssClass="options" RepeatLayout="Flow" ClientIDMode="AutoID"/>
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
    <asp:Repeater ID="ActivateResultRpt" Visible="false" runat="server">
        <ItemTemplate>
          <div class="row col-md-6 col-md-offset-3 activated-sim-details" style="padding-left:40px;padding-right: 40px;">
            <div class="panel-group" style="padding-bottom:20px">
                <div class="panel panel-primary" id="pnlActivation">
                    <div class="panel-heading" id="headingActivate">
            <asp:Label id="TitleLbl" runat="server">SIM/IMEI is already activated.</asp:Label>
            <div class="panel-body">
                        <div class="row">
                            <div class="col-xs-5 col-md-5 text-right">
                                <b>Activated Date</b>
                            </div>
                            <div class="col-xs-7 col-md-7">
                                <span id="activated-activateddate"><%#Eval("ActivateDate") %></span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-5 col-md-5 text-right">
                                <b>Carrier</b>
                            </div>
                            <div class="col-xs-7 col-md-7">
                                <span id="activated-carrier"><%#Eval("Carrier") %></span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-5 col-md-5 text-right">
                                <b>SIM / IMEI</b>
                            </div>
                            <div class="col-xs-7 col-md-7">
                                <span id="activated-serialnumber"><%#Eval("SIMIMEI") %></span>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-5 col-md-5 text-right">
                                <b>Plan Value</b>
                            </div>
                            <div class="col-xs-7 col-md-7">
                                <span id="activated-planvalue"><%#Eval("PlanValue") %></span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-5 col-md-5 text-right">
                                <b>Plan Name</b>
                            </div>
                            <div class="col-xs-7 col-md-7">
                                <span id="activated-planname"><%#Eval("PlanName") %></span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-5 col-md-5 text-right">
                                <b>Phone Number</b>
                            </div>
                            <div class="col-xs-7 col-md-7">
                                <span id="activated-mobilenumber"><%#Eval("PhoneNumber") %></span>
                            </div>
                        </div>
                    </div>
                        </div>
                    </div>
                </div>
              </div>
        </ItemTemplate>
    </asp:Repeater>
  
     <div class="container dvService">
            <div class="row">
                <div class="col-sm-7 col-md-6" id="dvInventory">
                    <div class="col-md-12">
                        <div class="row form-group">
                            <asp:TextBox class="form-control" ID="SIMTxt" ClientIDMode="Static" runat="server" placeholder="Enter SIM Number"/>
                        </div>

                        <div class="row form-group">
                             <asp:TextBox class="form-control" ID="DeviceIdTxt" ClientIDMode="Static" runat="server" Visible="false"/>
                        </div>
                    </div>
                            <div class="col-md-12">
                                <div class="row  form-group">
                                    <asp:TextBox class="form-control" ID="MobileNumberTxt" ClientIDMode="Static" maxlength="10" runat="server" Visible="false"/>
                                </div>
                            </div>
                    <div class="col-md-10 row">
                      <asp:Button runat="server" id="SubmitBtn" Text="Submit" ClientIDMode="Static" OnClick="SubmitBtn_Click" class="btn btn-primary" />
                    </div>
                </div>
            </div>
        </div>

    <script type="text/javascript">
    $(document).ready(function(){
        $(".options").each(function(){
           $(this).find("input").each(function(){
            $(this).attr("name", "topic");
           });
        });
    });
    </script>
</asp:Content>
