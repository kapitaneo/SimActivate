using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    public class PaymentInfoModel
    {
        public PaymentInfoModel()
        {
            PageControlModel = new List<PageControlModel>();
            ListPaymentInfo = new List<PaymentInfoModel>();
            ListOrderDetails = new List<OrderModel>();
            CompanyVaultList = new List<CompanyVaultModel>();
            IsCompanyVaultList = false;
        }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string ApiPassword { get; set; }
        public string Url { get; set; }

        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Address1 { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Zip { get; set; }
        public string PaymentType { get; set; }
        public string Ptype { get; set; }
        public decimal Amount { get; set; }
        public string CardNumber { get; set; }
        public string ExpiryDate { get; set; }
        public string CvvNumber { get; set; }

        public bool cbkUserCardOnFile { get; set; }
        public bool chbSaveCard { get; set; }
        public float GrandTotal { get; set; }
        public string ExpiryDateMonth { get; set; }
        public string ExpiryDateYear { get; set; }
        public string Customer_Vault { get; set; }
        public string HdnCustomer_Vault { get; set; }
        public float ProcessingFee { get; set; }
        public bool? IsACH { get; set; }
        public string PaymentMode { get; set; }
        public string Email { get; set; }
        public string CompanyEmail { get; set; }
        public bool IsCompanyVaultList { get; set; }
        public int CreditCardTypeId { get; set; }
        public int StateId { get; set; }
        public int CompanyId { get; set; }
        public string ComapnyName { get; set; }
        public string Address { get; set; }
        public DateTime OrderDate { get; set; }
        public List<PaymentInfoModel> ListPaymentInfo { get; set; }
        public List<OrderModel> ListOrderDetails { get; set; }
        public List<PageControlModel> PageControlModel { get; set; }

        public List<CompanyVaultModel> CompanyVaultList { get; set; }

    }
}