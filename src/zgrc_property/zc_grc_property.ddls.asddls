@Metadata.allowExtensions: true
@EndUserText.label: 'RMIS Property Application'
@AccessControl.authorizationCheck: #NOT_ALLOWED
//@Metadata.ignorePropagatedAnnotations: true

define root view entity ZC_GRC_PROPERTY
  provider contract transactional_query
  as projection on ZR_GRC_PROPERTY
{
      @UI.hidden: true
  key PropertyNo,
      PropertyId,
      PropertyName,
      @ObjectModel.text.element:  ['PropStatus']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_PROPERTYSTATUS_PL', element: 'Id' },useForValidation: true }]
      PropertyStatus,
      _PROPERTYSTATUS_PL.PropertyStatus as PropStatus,
            @ObjectModel.text.element:  ['PropType']
            @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_PROPERTY_TYPE_PL', element: 'PropertyId' } ,useForValidation: true    }]
      PropertyType,
      _PROPERTYTYPE_PL.PropertyType     as PropType,
      DatePurchased,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_LOCATION_LOOKUP', element: 'Location_Name' }}]
      InsuredName,
            @ObjectModel.text.element:  ['PropUse']
            @UI.textArrangement: #TEXT_ONLY
      @Search.fuzzinessThreshold: 0.7
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_PROP_USE_PL', element: 'PropuseId' },
      additionalBinding: [{ localElement: 'PropertyType',
      element: 'ProptypeId',
      usage: #FILTER_AND_RESULT }],useForValidation: true }]
      PropertyUse,
      _USE_PL.PropertyUse     as PropUse,
      HfmCode,
      @ObjectModel.text.element:  ['Owner_Value']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_OWNERSHIP_PL', element: 'Id' },useForValidation: true }]
      Ownership,
      _OWNERSHIP_PL.Ownership           as Owner_Value,
      DateSold,
      @ObjectModel.text.element:  ['Occupancy_Value']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_OCCUPANCY_PL', element: 'Id' },useForValidation: true }]
      Occupancy,
      _Occupancy_PL.Occupancy           as Occupancy_Value,
      Brand,
      SubBrand,
      SiteOwnerEmail,
      BuildingValue,
      EquipmentValue,
      TenantsImprovements,
      BusinessInterptVal,
      AvgCargoValue,
      MaxCargoValue,
      AddressLine1,
      AddressLine2,
      City,
      @ObjectModel.text.element:  ['State_Value']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_STATE_PL', element: 'Id' },useForValidation: true }]
      State,
      _STATE_PL.State                   as State_Value,
      ZipCode,
      Latitude,
      Longitude,
      Region,
      @ObjectModel.text.element:  ['Area_Value']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_AREA_PL', element: 'Id' },useForValidation: true }]
      Area,
      _Area_PL.Area                     as Area_Value,
      Country,
      //      Photo,

      //  WallType,
      //      RoofType,
      RenewalContact,
      //      @ObjectModel.text.element:  ['RenovYrs']
      //      @UI.textArrangement: #TEXT_ONLY
      //      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_RENOVYRS_PL', element: 'Id' } }]
      //      RenovationYears,
      //      _RENOVYRS_PL.RenovYears           as RenovYrs,
      SquareMetres,
      GrossSquareMetres,
      @ObjectModel.text.element:  ['SolarPanel_Value']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_SOLARPANELS_PL', element: 'Id' },useForValidation: true }]
      SolarPanels,
      _SOLARPANELS_PL.SolarPanel        as SolarPanel_Value,
      BuildingHeight,
      LevelsAboveGrade,
      LevelsBelowGrade,
      FireAreas,
      FloorsOccupied,
      Occupation,
      AreaOccupied,
      @ObjectModel.text.element:  ['FireProtect']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_FIREPROTECT_PL', element: 'Id' },useForValidation: true }]
      FireProtectClass,
      _FireProtect_PL.FireProtect       as FireProtect,
      @ObjectModel.text.element:  ['FireDept']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_FIREDEPT_PL', element: 'Id' },useForValidation: true }]
      FireDeptType,
      _FireDept_PL.FireDept             as FireDept,
      FireHydrantDistance,
      TapaCertification,
      FireDeptLocation,
      ProximityFireHyd,
      @ObjectModel.text.element:  ['Sprinkler_Value']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_SPRINKLERS_PL', element: 'Id' },useForValidation: true }]
      Sprinklers,
      _SPRINKLERS_PL.Sprinklers         as Sprinkler_Value,
      //      Security,
      //      Alarms,
      @ObjectModel.text.element:  ['PropZone']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_PROPERTYZONE_PL', element: 'Id' },useForValidation: true }]
      PropertyZoning,
      _PROPERTYZONE_PL.PropertyZone     as PropZone,
      @ObjectModel.text.element:  ['CoastalDist']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_COSTDIST_PL', element: 'Id' },useForValidation: true}]
      CoastalDistance,
      _Coast_PL.CoastDist               as CoastalDist,
      Elevation,
      @ObjectModel.text.element:  ['FloodZone_Value']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_FLOODZONE_PL', element: 'Id' },useForValidation: true }]
      FloodZone,
      _FloodZone_PL.FloodZone           as FloodZone_Value,
      @ObjectModel.text.element:  ['EQZone']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_EQZONE_PL', element: 'Id' },useForValidation: true }]
      EarthquakeZone,
      _EQZone_PL.EQZone                 as EQZone,
      @ObjectModel.text.element:  ['WindStorm']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_WINDSTORM_PL', element: 'Id' },useForValidation: true }]
      WindStormZone,
      _WINDSTORM_PL.WindStorm           as WindStorm,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_USER_MASTER', element: 'UserDescription' },useForValidation: true }]
      Owner,
      SicCode,
      SkipPropertyValidation,
      ValuesCollectionEmail,
      TotalInsuredValue,
      ConstructionYear,
      InsuranceObgligation,
      Location,
      Archetype,
      @ObjectModel.text.element: [ 'CreatedUser' ]
      @UI.textArrangement: #TEXT_ONLY
      Createdby,
      _Createdby.UserDescription        as CreatedUser,
      Createdat,
      @ObjectModel.text.element: [ 'ChangedUser' ]
      @UI.textArrangement: #TEXT_ONLY
      Lastchangedby,
      _Lastchangedby.UserDescription    as ChangedUser,
      Lastchangedat,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_LOCATION_LOOKUP', element: 'Location_Name' },useForValidation: true}]
      @ObjectModel.text.element:  ['InsuredName']
      @UI.textArrangement: #TEXT_SEPARATE
      @ObjectModel.text.association: '_Location'
      _Location.LocationUuid            as LocationUuid,
      _Recomm     : redirected to composition child ZC_GRC_PROP_RECM,
      _Log        : redirected to composition child ZC_GRC_PROP_LOG,
      //  _Multi : redirected to composition child ZC_GRC_PROP_MULTI,
      _Wall       : redirected to composition child ZC_GRC_PROP_WALL,
      _Roof       : redirected to composition child ZC_GRC_PROP_ROOF,
      _Alarm      : redirected to composition child ZC_GRC_PROP_ALM,
      _Security   : redirected to composition child ZC_GRC_PROP_SECTY,
      _Renov      : redirected to composition child ZC_GRC_PROP_RENOV,
//      _Attachment : redirected to composition child ZC_GRC_PROP_ATTCH,
      _Attachment : redirected to composition child ZC_GRC_DOC_REPO,
      
      _Claim,
      _Coast_PL,
      _EQZone_PL,
      _FireDept_PL,
      _FireProtect_PL,
      _Area_PL,
      _FloodZone_PL,
      _Occupancy_PL,
      _OccupStatus_PL,
      _OWNERSHIP_PL,
      _PROPERTYSTATUS_PL,
      _PROPERTYTYPE_PL,
      _PROPERTYZONE_PL,
      //      _RENOVYRS_PL,
      //      _ROOFTYPE_PL,
      _SOLARPANELS_PL,
      _SPRINKLERS_PL,
      _STATE_PL,
      _USE_PL,
      _WINDSTORM_PL,
      _Location
}
