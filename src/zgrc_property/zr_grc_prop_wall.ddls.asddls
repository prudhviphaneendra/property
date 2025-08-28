@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity for WallType Multi Input Field'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_GRC_PROP_WALL as select from ztgrc_prop_wall
association to parent ZR_GRC_PROPERTY as _Property on
$projection.Guid = _Property.PropertyNo
association [0..1] to ZR_GRC_WALLTYPE_PL           as _Wall_PL          on $projection.WallType = _Wall_PL.Id
{
    key guid as Guid,
    key wall_type as WallType,
  @Semantics.user.createdBy: true
  createdby as Createdby,
  @Semantics.systemDateTime.createdAt: true
  createdat as Createdat,
  @Semantics.user.localInstanceLastChangedBy: true
  lastchangedby as Lastchangedby,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  lastchangedat as Lastchangedat,
    _Property,
    _Wall_PL
    }
