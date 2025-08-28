@Metadata.allowExtensions: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View for ZR_GRC_PROP_ALM'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZC_GRC_PROP_ALM as projection on ZR_GRC_PROP_ALM
{
    key Guid,
             @ObjectModel.text.element:  ['Alarms_Value']
      @UI.textArrangement: #TEXT_ONLY
     @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_ALRM_PL', element: 'Id' } }]
   key Alarms,
    _Alarm_PL.Alarms as Alarms_Value,
    Createdby,
    Createdat,
    Lastchangedby,
    Lastchangedat,
    /* Associations */
    _Property: redirected to parent ZC_GRC_PROPERTY,
    _Alarm_PL
    
}
