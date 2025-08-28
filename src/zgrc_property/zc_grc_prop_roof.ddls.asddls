@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View for ZR_GRC_PROP_ROOF'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZC_GRC_PROP_ROOF as projection on ZR_GRC_PROP_ROOF
{
    key Guid,
                 @ObjectModel.text.element:  ['RoofType_Value']
      @UI.textArrangement: #TEXT_ONLY
     @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_ROOFTYPE_PL', element: 'Id' } }]
    key RoofType,
    _Roof_PL.RoofType as RoofType_Value,
    Createdby,
    Createdat,
    Lastchangedby,
    Lastchangedat,
    /* Associations */
    _Property: redirected to parent ZC_GRC_PROPERTY,
    _Roof_PL
}
