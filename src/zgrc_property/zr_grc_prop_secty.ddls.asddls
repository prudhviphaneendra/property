@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity for Security Multi Input Field'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZR_GRC_PROP_SECTY
  as select from ztgrc_prop_secty
  association        to parent ZR_GRC_PROPERTY as _Property    on $projection.Guid = _Property.PropertyNo
  association [0..1] to ZR_GRC_SECURITY_PL     as _Security_PL on $projection.Security = _Security_PL.Id
{
  key guid          as Guid,
  key security      as Security,
      @Semantics.user.createdBy: true
      createdby     as Createdby,
      @Semantics.systemDateTime.createdAt: true
      createdat     as Createdat,
      @Semantics.user.localInstanceLastChangedBy: true
      lastchangedby as Lastchangedby,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      lastchangedat as Lastchangedat,
      _Property,
      _Security_PL
}
