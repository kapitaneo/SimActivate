using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    public class CompanyVaultModel
    {
        public int CompanyVaultId { get; set; }
        public int CompanyId { get; set; }
        public string VaultId { get; set; }
        public string CreditCardType { get; set; }
        public string Last4 { get; set; }
        public System.DateTime EnteredDate { get; set; }
    }
}