@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity for RoofType Multi Input Field'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_GRC_PROP_ROOF as select from ztgrc_prop_roof
association to parent ZR_GRC_PROPERTY as _Property on
$projection.Guid = _Property.PropertyNo
association [0..1] to ZR_GRC_ROOFTYPE_PL        as _Roof_PL          on $projection.RoofType = _Roof_PL.Id
{
    key guid as Guid,
   key roof_type as RoofType,
  @Semantics.user.createdBy: true
  createdby as Createdby,
  @Semantics.systemDateTime.createdAt: true
  createdat as Createdat,
  @Semantics.user.localInstanceLastChangedBy: true
  lastchangedby as Lastchangedby,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  lastchangedat as Lastchangedat,
    _Property,
    _Roof_PL
    }
