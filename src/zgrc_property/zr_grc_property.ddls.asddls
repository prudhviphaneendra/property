@AccessControl.authorizationCheck: #NOT_ALLOWED
@Metadata.allowExtensions: true
@EndUserText.label: 'RMIS Property Application'
define root view entity ZR_GRC_PROPERTY
  as select from ztgrc_property
  composition [0..*] of ZR_GRC_PROP_RECM         as _Recomm
  composition [0..*] of ZR_GRC_PROP_LOG          as _Log
  composition [0..*] of ZR_GRC_PROP_ROOF         as _Roof
  composition [0..*] of ZR_GRC_PROP_WALL         as _Wall
  composition [0..*] of ZR_GRC_PROP_ALM          as _Alarm
  composition [0..*] of ZR_GRC_PROP_SECTY        as _Security
  composition [0..*] of ZR_GRC_PROP_RENOV        as _Renov
  //composition [0..*] of ZR_GRC_PROP_ATTCH        as _Attachment
  composition [0..*] of ZR_GRC_DOC_REPO          as _Attachment
  association [0..*] to ZR_GRC_PROPERTY_CLAIM    as _Claim             on $projection.PropertyName = _Claim.PropertyLookup
  association [0..1] to ZR_TGRC_LOCATION         as _Location          on $projection.InsuredName = _Location.Level1Id
  association [0..1] to ZR_GRC_AREA_PL           as _Area_PL           on $projection.Area = _Area_PL.Id
  association [0..1] to ZR_GRC_COSTDIST_PL       as _Coast_PL          on $projection.CoastalDistance = _Coast_PL.Id
  association [0..1] to ZR_GRC_EQZONE_PL         as _EQZone_PL         on $projection.EarthquakeZone = _EQZone_PL.Id
  association [0..1] to ZR_GRC_FIREDEPT_PL       as _FireDept_PL       on $projection.FireDeptType = _FireDept_PL.Id
  association [0..1] to ZR_GRC_FIREPROTECT_PL    as _FireProtect_PL    on $projection.FireProtectClass = _FireProtect_PL.Id
  association [0..1] to ZR_GRC_FLOODZONE_PL      as _FloodZone_PL      on $projection.FloodZone = _FloodZone_PL.Id
  association [0..1] to ZR_GRC_OCCUPANCY_PL      as _Occupancy_PL      on $projection.Archetype = _Occupancy_PL.Id
  association [0..1] to ZR_GRC_OCCUPSTATUS_PL    as _OccupStatus_PL    on $projection.Occupation = _OccupStatus_PL.Id
  association [0..1] to ZR_GRC_OWNERSHIP_PL      as _OWNERSHIP_PL      on $projection.Ownership = _OWNERSHIP_PL.Id
  association [0..1] to ZR_GRC_PROPERTYSTATUS_PL as _PROPERTYSTATUS_PL on $projection.PropertyStatus = _PROPERTYSTATUS_PL.Id
  association [0..1] to ZR_GRC_PROPERTYTYPE_PL   as _PROPERTYTYPE_PL   on $projection.PropertyType = _PROPERTYTYPE_PL.Id
  association [0..1] to ZR_GRC_PROPERTYZONE_PL   as _PROPERTYZONE_PL   on $projection.PropertyZoning = _PROPERTYZONE_PL.Id
  association [0..1] to ZR_GRC_SOLARPANELS_PL    as _SOLARPANELS_PL    on $projection.SolarPanels = _SOLARPANELS_PL.Id
  association [0..1] to ZR_GRC_SPRINKLERS_PL     as _SPRINKLERS_PL     on $projection.Sprinklers = _SPRINKLERS_PL.Id
  association [0..1] to ZR_GRC_STATE_PL          as _STATE_PL          on $projection.State = _STATE_PL.Id
  association [0..1] to ZR_GRC_USE_PL            as _USE_PL            on $projection.PropertyUse = _USE_PL.Id
  association [0..1] to ZR_GRC_WINDSTORM_PL      as _WINDSTORM_PL      on $projection.WindStormZone = _WINDSTORM_PL.Id
  association [0..1] to I_User                   as _Createdby         on $projection.Createdby = _Createdby.UserID
  association [0..1] to I_User                   as _Lastchangedby     on $projection.Lastchangedby = _Lastchangedby.UserID
  association [0..1] to ZR_GRC_PROP_USE_PL       as _PropUse           on $projection.PropertyUse = _PropUse.PropuseId
{
  key property_no              as PropertyNo,
      property_id              as PropertyId,
      property_name            as PropertyName,
      property_status          as PropertyStatus,
      property_type            as PropertyType,
      date_purchased           as DatePurchased,
      insured_name             as InsuredName,
      property_use             as PropertyUse,
      hfm_code                 as HfmCode,
      ownership                as Ownership,
      date_sold                as DateSold,
      occupancy                as Occupancy,
      brand                    as Brand,
      sub_brand                as SubBrand,
      site_owner_email         as SiteOwnerEmail,
      building_value           as BuildingValue,
      equipment_value          as EquipmentValue,
      tenants_improvements     as TenantsImprovements,
      business_interpt_val     as BusinessInterptVal,
      avg_cargo_value          as AvgCargoValue,
      max_cargo_value          as MaxCargoValue,
      address_line1            as AddressLine1,
      address_line2            as AddressLine2,
      city                     as City,
      state                    as State,
      zip_code                 as ZipCode,
      latitude                 as Latitude,
      longitude                as Longitude,
      region                   as Region,
      area                     as Area,
      country                  as Country,
      //      photo                    as Photo,
      //      wall_type                as WallType,
      //      roof_type                as RoofType,
      renewal_contact          as RenewalContact,
      //      renovation_years         as RenovationYears,
      square_metres            as SquareMetres,
      gross_square_metres      as GrossSquareMetres,
      solar_panels             as SolarPanels,
      building_height          as BuildingHeight,
      levels_above_grade       as LevelsAboveGrade,
      levels_below_grade       as LevelsBelowGrade,
      fire_areas               as FireAreas,
      floors_occupied          as FloorsOccupied,
      occupation               as Occupation,
      area_occupied            as AreaOccupied,
      fire_protect_class       as FireProtectClass,
      fire_dept_type           as FireDeptType,
      fire_hydrant_distance    as FireHydrantDistance,
      tapa_certification       as TapaCertification,
      fire_dept_location       as FireDeptLocation,
      proximity_fire_hyd       as ProximityFireHyd,
      sprinklers               as Sprinklers,
      //      security                 as Security,
      //      alarms                   as Alarms,
      property_zoning          as PropertyZoning,
      coastal_distance         as CoastalDistance,
      elevation                as Elevation,
      flood_zone               as FloodZone,
      earthquake_zone          as EarthquakeZone,
      wind_storm_zone          as WindStormZone,
      owner                    as Owner,
      sic_code                 as SicCode,
      skip_property_validation as SkipPropertyValidation,
      values_collection_email  as ValuesCollectionEmail,
      total_insured_value      as TotalInsuredValue,
      construction_year        as ConstructionYear,
      insurance_obgligation    as InsuranceObgligation,
      location                 as Location,
      archetype                as Archetype,
      @Semantics.user.createdBy: true
      createdby                as Createdby,
      @Semantics.systemDateTime.createdAt: true
      createdat                as Createdat,
      @Semantics.user.localInstanceLastChangedBy: true
      lastchangedby            as Lastchangedby,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      lastchangedat            as Lastchangedat,
      _Recomm,
      _Log,
      _Roof,
      _Wall,
      _Security,
      _Alarm,
      _Renov,
      _Attachment,
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
      _Location,
      _Createdby,
      _Lastchangedby,
      _PropUse
}
