@Metadata.allowExtensions: true
@EndUserText.label: 'Property Application - Recommendation'
@AccessControl.authorizationCheck: #CHECK
define view entity ZC_GRC_PROP_RECM
  as projection on ZR_GRC_PROP_RECM
{
@UI.hidden: true
  key PropertyNo,
@UI.hidden: true
  key RecommendNo,
  PropertyName,
  RecommendationName,
  InspectResult,
  RecommType,
  RecommReportDt,
  RecommStatus,
  RecommCloseDt,
  InspectType,
  OutAgencyName,
  Survey,
  RecommDesc,
  ActionTaken,
  Createdby,
  Createdat,
  Lastchangedby,
  Lastchangedat,
  /* Associations */
    _Property : redirected to parent ZC_GRC_PROPERTY
  
}
