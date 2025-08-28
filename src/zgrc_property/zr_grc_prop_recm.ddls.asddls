@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'RMIS Property Application'
define view entity ZR_GRC_PROP_RECM
  as select from ztgrc_prop_recm
  association to parent ZR_GRC_PROPERTY as _Property on
$projection.PropertyNo = _Property.PropertyNo
{
  key property_no as PropertyNo,
  key recommend_no as RecommendNo,
  property_name as PropertyName,
  recommendation_name as RecommendationName,
  inspect_result as InspectResult,
  recomm_type as RecommType,
  recomm_report_dt as RecommReportDt,
  recomm_status as RecommStatus,
  recomm_close_dt as RecommCloseDt,
  inspect_type as InspectType,
  out_agency_name as OutAgencyName,
  survey as Survey,
  recomm_desc as RecommDesc,
  action_taken as ActionTaken,
  @Semantics.user.createdBy: true
  createdby as Createdby,
  @Semantics.systemDateTime.createdAt: true
  createdat as Createdat,
  @Semantics.user.localInstanceLastChangedBy: true
  lastchangedby as Lastchangedby,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  lastchangedat as Lastchangedat,
  _Property
  
}
