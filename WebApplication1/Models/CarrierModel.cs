using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    public class CarrierModel
    {
        public CarrierModel()
        {
            Deleted = false;
            PageControlModel = new List<PageControlModel>();
        }
        public int CarrierId { get; set; }
        public string Name { get; set; }
        public string Logo { get; set; }
        public System.Guid CarrierGuid { get; set; }
        public System.Guid CarrierServiceGuid { get; set; }
        public bool Deleted { get; set; }
        public int InventoryId { get; set; }
        public string InventoryName { get; set; }
        public int EnteredBy { get; set; }
        public Nullable<int> UpdatedBy { get; set; }
        public List<PageControlModel> PageControlModel { get; set; }
        public List<CarrierModel> Data { get; set; }
        public bool ShowLogin { get; set; }
        public bool ShowDeviceId { get; set; }
        public string SelectedCarrierService { get; set; }
        public bool IsLogin { get; set; }
        public bool ShowSim { get; set; }
        public string SIMNumber { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public int CarrierServiceId { get; set; }
        public bool IsShowPlancart { get; set; }
        public string Message { get; set; }
        public string Code { get; set; }
        public bool IsRequiredLogin { get; set; }
        public string CarrierRetailerId { get; set; }
        public bool CanView { get; set; }
        public bool CanAdd { get; set; }
        public bool CanDelete { get; set; }
        public bool CanEdit { get; set; }
        public bool IsMobile { get; set; }
        public string CurrentCarrierServiceName { get; set; }
        public int AppTypeId { get; set; }
    }
}