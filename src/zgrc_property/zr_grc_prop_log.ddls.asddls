@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity for ZTGRC_PROP_LOG'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_GRC_PROP_LOG as select from ztgrc_prop_log
  association to parent ZR_GRC_PROPERTY as _Property on
$projection.PropertyNo = _Property.PropertyNo
  association[0..1] to I_User as _Lastchangedby
    on $projection.lastchangedby = _Lastchangedby.UserID
{
    key property_no as PropertyNo,
    key prop_log_no as PropLogNo,
    change_date as ChangeDate,
    value_date as ValueDate,
    building_val as BuildingValue,
    equipment_val as EquipmentValue,
    tenants_improvements as TenantsImprovements,
    business_interpt_val as BusinessInterptVal,
    avg_cargo_value as AvgCargoValue,
    max_cargo_value as MaxCargoValue,
   _Property.Lastchangedby,
    lastchangedat,
    _Property,
    _Lastchangedby
}
