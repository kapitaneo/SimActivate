using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    public class PlanModel
    {
        public string Name { get; set; }
        public string Value { get; set; }
        public string InstantSpiff { get; set; }
        public string FirstMonthResidual { get; set; }
        public string RefillDiscount { get; set; }
        public string SIMCost { get; set; }
        public string FundingRequired { get; set; }
    }
}