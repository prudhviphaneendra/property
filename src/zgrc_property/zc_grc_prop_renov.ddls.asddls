@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View for ZR_GRC_PROP_RENOV'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZC_GRC_PROP_RENOV as projection on ZR_GRC_PROP_RENOV
{
    key Guid,
                 @ObjectModel.text.element:  ['RenovYears_Value']
      @UI.textArrangement: #TEXT_ONLY
     @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_RENOVYRS_PL', element: 'Id' } }]
    key RenovYrs,
    _Renov_PL.RenovYears as RenovYears_Value,
    Createdby,
    Createdat,
    Lastchangedby,
    Lastchangedat,
    /* Associations */
    _Property: redirected to parent ZC_GRC_PROPERTY,
    _Renov_PL 
}
