@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View for ZR_GRC_PROP_SECTY'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZC_GRC_PROP_SECTY as projection on ZR_GRC_PROP_SECTY
{
    key Guid,
                 @ObjectModel.text.element:  ['Security_Value']
      @UI.textArrangement: #TEXT_ONLY
     @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_SECURITY_PL', element: 'Id' } }]
    key Security,
    _Security_PL.Security as Security_Value,
    Createdby,
    Createdat,
    Lastchangedby,
    Lastchangedat,
    /* Associations */
    _Property: redirected to parent ZC_GRC_PROPERTY,
    _Security_PL
}
