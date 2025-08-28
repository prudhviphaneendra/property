@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity for Property Use Dependency Group'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_GRC_PROPUSE_DEPN_GRP as select from ztgrc_prop_depn
{
    key proptype_id as ProptypeId,
    key property_type as PropertyType,
   key  propuse_id as PropuseId,
   key property_use as PropertyUse
}
group by proptype_id,property_type,propuse_id,property_use
