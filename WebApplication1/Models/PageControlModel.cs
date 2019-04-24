using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    public class PageControlModel
    {
        public PageControlModel()
        {
            Deleted = false;
        }
        public int PageControlId { get; set; }
        public int LanguageTypeId { get; set; }
        public string LanguageTypeName { get; set; }
        public int ControlNameTypeId { get; set; }
        public string ControlTypeName { get; set; }
        public string ControlValue { get; set; }
        public int PageReferenceTypeId { get; set; }
        public string PageReferenceTypaName { get; set; }
        public bool Deleted { get; set; }
        public int EnteredBy { get; set; }
        public DateTime EnteredDate { get; set; }
        public int? UpdatedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public bool CanView { get; set; }
        public bool CanAdd { get; set; }
        public bool CanDelete { get; set; }
        public bool CanEdit { get; set; }
        public bool IsActive { get; set; }
    }
}