@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity for Renov Years Multi Input Field'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_GRC_PROP_RENOV as select from ztgrc_prop_renov
association to parent ZR_GRC_PROPERTY as _Property on
$projection.Guid = _Property.PropertyNo
association [0..1] to ZR_GRC_RENOVYRS_PL   as _Renov_PL       on $projection.RenovYrs = _Renov_PL.Id
{
    key guid as Guid,
    key renov_yrs as RenovYrs,
  @Semantics.user.createdBy: true
  createdby as Createdby,
  @Semantics.systemDateTime.createdAt: true
  createdat as Createdat,
  @Semantics.user.localInstanceLastChangedBy: true
  lastchangedby as Lastchangedby,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  lastchangedat as Lastchangedat,
    _Property,
    _Renov_PL
    }
