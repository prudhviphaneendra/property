@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity of Property Type PickList'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_GRC_PROPERTY_TYPE_PL as select distinct from ztgrc_prop_depn
{
//   @UI.hidden: true
//     uuid as Uuid,
@EndUserText.label: 'Property Type'
    key property_type as PropertyTypes,
    @UI.hidden: true
    proptype_id as PropertyId
}
