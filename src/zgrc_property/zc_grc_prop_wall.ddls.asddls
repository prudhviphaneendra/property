@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View for ZR_GRC_PROP_WALL'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZC_GRC_PROP_WALL as projection on ZR_GRC_PROP_WALL
{
    key Guid,
                 @ObjectModel.text.element:  ['WallType_Value']
      @UI.textArrangement: #TEXT_ONLY
     @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_WALLTYPE_PL', element: 'Id' } }]
    key WallType,
    _Wall_PL.WallType as WallType_Value,
    Createdby,
    Createdat,
    Lastchangedby,
    Lastchangedat,
    /* Associations */
    _Property: redirected to parent ZC_GRC_PROPERTY,
    _Wall_PL
}
