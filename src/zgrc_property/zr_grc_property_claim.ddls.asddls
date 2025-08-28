@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity for Claims of Property'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_GRC_PROPERTY_CLAIM
  as select from ZR_TGRC_CLAIM
{


      //      @UI.lineItem: [{ position:10, label: 'ClaimInternal ID'  }]
  key ClaimUuid,

      @UI.lineItem: [{ position:20,
      type: #WITH_INTENT_BASED_NAVIGATION,
      semanticObject: 'zgrc_claims',
      semanticObjectAction: 'get',
      value: 'ClaimName', label: 'Claim Name' }]
      ClaimName,

      PropertyLookup,

      @UI.lineItem: [{ position: 30, label: 'Date of Loss' }]
      DateLossOfTime,

      @UI.lineItem: [{ position: 40, label: 'Asset Name' }]
      AssetName,

      @UI.lineItem: [{ position: 50, label: 'Status' }]
      Status,

      @UI.lineItem: [{ position: 60, label: 'Accident Description' }]
      AccidentDescription,

      @UI.lineItem: [{ position:70, label: 'Record Type' }]
      @ObjectModel.text.element:  ['RecType']
      @UI.textArrangement: #TEXT_ONLY
      ClaimRecType,
      _ClaimRecType_PL.Claim_RecType as RecType,


      _ClaimRecType_PL
}
where
  PropertyLookup <> ' ';
