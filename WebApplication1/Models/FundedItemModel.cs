using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    public class FundedItemModel
    {
        public int InventoryId { get; set; }
        public int CarrierId { get; set; }
        public int? PlanId { get; set; }
        public string PlanCode { get; set; }
        public string DeviceType { get; set; }
        public string DeviceId { get; set; }
        public int? CarrierServiceTypeId { get; set; }
        public string CarrierName { get; set; }
        public bool IsVersizonProvider { get; set; }
        public string CarrierServiceName { get; set; }
        public string Status { get; set; }
        public string MobileNumber { get; set; }
        public string ActivationDate { get; set; }

        public string WsUserGuid { get; set; }
        public string CarrierServiceGUID { get; set; }
        public int ItemInventoryId { get; set; }
        public string SerialNumber { get; set; }
        public System.Guid CompanyGuid { get; set; }
        public bool IsFundingRequird { get; set; }
        public int PlanPriceId { get; set; }
        public float FundingRequired { get; set; }
        public bool NoPlanFoundInCurrentDate { get; set; }
        public int CompanyTypeId { get; set; }
        /// <summary>
        /// Sim Number in case of 4G, and Device Id in case of 3G
        /// </summary>
        public string Item { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string ZipCode { get; set; }
        public string OSPAccountNum { get; set; }
        public string AuthSigner { get; set; }
        public string CBRPhone { get; set; }
        public string PasswordPIN { get; set; }
        public string PortInNumber { get; set; }
        public string PhoneUserName { get; set; }
        public string FormerCompanyCode { get; set; }
        public string RateCenter { get; set; }
        public string EtniValidationDate { get; set; }
        public string WirelessPortInd { get; set; }
        public int PlanTypeId { get; set; }
        public string PlanTypeName { get; set; }
        public float PlanValue { get; set; }
        public string PlanName { get; set; }
        public float NewFundingRequired { get; set; }
        public bool IsLycaPortIn { get; set; }
    }
}