@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity of Property Use PickList'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_GRC_PROP_USE_PL
  as select from ZR_GRC_PROPUSE_DEPN_GRP
{
      @UI.hidden: true
  key ProptypeId,
      @UI.hidden: true
  key PropertyType,
      @UI.hidden: true
  key PropuseId,
  @EndUserText.label: 'Property Use'
  key PropertyUse
}
