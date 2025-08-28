@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity for Alarms Field Multi Input Field'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_GRC_PROP_ALM as select from ztgrc_prop_alm
association to parent ZR_GRC_PROPERTY as _Property on
$projection.Guid = _Property.PropertyNo
association [0..1] to ZR_GRC_ALRM_PL           as _Alarm_PL          on $projection.Alarms = _Alarm_PL.Id
{
    key guid as Guid,
   key  alarms as Alarms,
  @Semantics.user.createdBy: true
  createdby as Createdby,
  @Semantics.systemDateTime.createdAt: true
  createdat as Createdat,
  @Semantics.user.localInstanceLastChangedBy: true
  lastchangedby as Lastchangedby,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  lastchangedat as Lastchangedat,
    _Property,
    _Alarm_PL
    }
