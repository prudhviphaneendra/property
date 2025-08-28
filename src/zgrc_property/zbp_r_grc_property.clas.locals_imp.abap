CLASS lsc_zr_grc_property DEFINITION INHERITING FROM cl_abap_behavior_saver.

  PROTECTED SECTION.

    METHODS save_modified REDEFINITION.

ENDCLASS.

CLASS lsc_zr_grc_property IMPLEMENTATION.

  METHOD save_modified.

    DATA : lt_property_log_u TYPE STANDARD TABLE OF ztgrc_prop_log,
           lt_property_log   TYPE STANDARD TABLE OF ztgrc_prop_log,
           ls_property_log   TYPE ztgrc_prop_log.

    IF update-zrgrcproperty IS NOT INITIAL.
*      lt_property_log = CORRESPONDING #( update-zrgrcproperty ).
*       LOOP AT update-zrgrcproperty INTO DATA(ls_update).
      READ TABLE update-zrgrcproperty INTO DATA(ls_update) INDEX 1.
      ls_property_log-property_no = ls_update-PropertyNo.
*      ls_property_log-building_val = ls_update-BuildingValue.
*      ls_property_log-equipment_val = ls_update-EquipmentValue.
*          APPEND ls_property_log TO lt_property_log.
*       ENDLOOP.
      SELECT  * FROM ztgrc_property
       WHERE property_no = @ls_property_log-property_no
       INTO  TABLE @DATA(lt_property).
      IF sy-subrc = 0.
*        SORT lt_property BY lastchangedat DESCENDING.

        READ TABLE lt_property INDEX 1 INTO DATA(ls_property).
      ENDIF.


      LOOP AT update-zrgrcproperty ASSIGNING FIELD-SYMBOL(<ls_log_update>).


*        GET TIME STAMP FIELD ls_property_log-change_date.
        IF <ls_log_update>-%control-BuildingValue = if_abap_behv=>mk-on.

          ls_property_log-building_val = ls_property-building_value.

        ENDIF.

        IF <ls_log_update>-%control-EquipmentValue = if_abap_behv=>mk-on.
          ls_property_log-equipment_val = ls_property-equipment_value.

        ENDIF.
        IF <ls_log_update>-%control-TenantsImprovements = if_abap_behv=>mk-on.
          ls_property_log-tenants_improvements = ls_property-tenants_improvements.

        ENDIF.
        IF <ls_log_update>-%control-BusinessInterptVal = if_abap_behv=>mk-on.
          ls_property_log-business_interpt_val = ls_property-business_interpt_val.

        ENDIF.
        IF <ls_log_update>-%control-AvgCargoValue = if_abap_behv=>mk-on.
          ls_property_log-avg_cargo_value = ls_property-avg_cargo_value.
        ENDIF.
        IF <ls_log_update>-%control-MaxCargoValue = if_abap_behv=>mk-on.
          ls_property_log-max_cargo_value = ls_property-max_cargo_value.
        ENDIF.
        IF ls_property_log-building_val IS NOT INITIAL OR
           ls_property_log-equipment_val IS NOT INITIAL OR
           ls_property_log-tenants_improvements IS NOT INITIAL OR
           ls_property_log-business_interpt_val IS NOT INITIAL OR
           ls_property_log-avg_cargo_value IS NOT INITIAL OR
           ls_property_log-max_cargo_value IS NOT INITIAL.
          GET TIME STAMP FIELD ls_property_log-change_date.
          TRY.
              ls_property_log-prop_log_no = cl_system_uuid=>create_uuid_x16_static( ) .
            CATCH cx_uuid_error.
          ENDTRY.
          DATA: lv_date TYPE string.
          lv_date = ls_property-lastchangedat.
          ls_property_log-value_date = lv_date+0(8).
          APPEND ls_property_log TO lt_property_log_u.
        ENDIF.
      ENDLOOP.
      INSERT ztgrc_prop_log FROM TABLE @lt_property_log_u.

    ENDIF.


* begin of insert by Abdul Rahiman
DATA : lt_doc_rep TYPE TABLE OF ztgrc_doc_rep.
DATA : lt_doc_rep_final TYPE TABLE OF ztgrc_doc_rep.
if  create-attachment IS NOT INITIAL.
lt_doc_rep = CORRESPONDING #( create-attachment MAPPING counter = Counter
                                                        doc_uuid = DocUuid
                                                        doc_type = DocType
                                                        external_doc_num = ExternalDocNum
                                                        file_docid = FileDocid
                                                        folder_id = FolderId
                                                        last_changed_at = LastChangedAt
                                                        local_created_at = LocalCreatedAt
                                                        local_last_changed_at = LocalLastChangedAt
                                                        local_created_by = LocalCreatedBy
                                                EXCEPT attachment ).

*lt_doc_rep_final = CORRESPONDING #(  lt_doc_rep EXCEPT attachment ).

INSERT ztgrc_doc_rep FROM TABLE @lt_doc_rep.


ENDIF.

* end of insert by Abdul Rahiman


  ENDMETHOD.

ENDCLASS.

CLASS lhc_zr_grc_property DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR ZrGrcProperty
        RESULT result,
      totalinsuredval FOR DETERMINE ON SAVE
        IMPORTING keys FOR ZrGrcProperty~totalinsuredval,
      propertyname FOR DETERMINE ON SAVE
        IMPORTING keys FOR ZrGrcProperty~propertyname.

    METHODS valPropertyid FOR VALIDATE ON SAVE
      IMPORTING keys FOR ZrGrcProperty~valPropertyid.
    METHODS valPropertystatus FOR VALIDATE ON SAVE
      IMPORTING keys FOR ZrGrcProperty~valPropertystatus.
    METHODS valDatePurchased FOR VALIDATE ON SAVE
      IMPORTING keys FOR ZrGrcProperty~valDatePurchased.
*    METHODS valdatesold FOR VALIDATE ON SAVE
*      IMPORTING keys FOR ZrGrcProperty~valdatesold.
    METHODS copy FOR MODIFY
      IMPORTING keys FOR ACTION ZrGrcProperty~copy.
ENDCLASS.

CLASS lhc_zr_grc_property IMPLEMENTATION.
  METHOD get_global_authorizations.
    IF requested_authorizations-%create = if_abap_behv=>mk-on.
      AUTHORITY-CHECK OBJECT 'Z_PROP_O'
            ID 'ACTVT' FIELD '01'.
      IF sy-subrc <> 0.
        result-%create = if_abap_behv=>auth-unauthorized.
        APPEND VALUE #( %msg      = new_message_with_text(
                        severity = if_abap_behv_message=>severity-error
                        text = 'operation not authorized!' ) )
                        TO reported-zrgrcproperty.
      ENDIF.
    ENDIF.

    IF requested_authorizations-%update = if_abap_behv=>mk-on.
      AUTHORITY-CHECK OBJECT 'Z_PROP_O'
            ID 'ACTVT' FIELD '02'.
      IF sy-subrc <> 0.
        result-%update = if_abap_behv=>auth-unauthorized.
        result-%action-Edit = if_abap_behv=>auth-unauthorized.
      ENDIF.
    ENDIF.
    IF requested_authorizations-%delete = if_abap_behv=>mk-on.
      AUTHORITY-CHECK OBJECT 'Z_PROP_O'
            ID 'ACTVT' FIELD '06'.
      IF sy-subrc <> 0.
        result-%delete = if_abap_behv=>auth-unauthorized.
      ENDIF.
    ENDIF.
  ENDMETHOD.
  METHOD totalinsuredval.
    READ ENTITIES OF zr_grc_property IN LOCAL MODE
    ENTITY ZrGrcProperty
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(lt_value).

    LOOP AT lt_value INTO DATA(ls_value).
      DATA(lv_total) = ls_value-BuildingValue + ls_value-EquipmentValue + ls_value-TenantsImprovements
                        + ls_value-BusinessInterptVal.

      IF lv_total IS NOT INITIAL.
        MODIFY ENTITIES OF zr_grc_property IN LOCAL MODE
        ENTITY ZrGrcProperty
        UPDATE
        FIELDS ( TotalInsuredValue ) WITH VALUE #( ( %tky = ls_value-%tky TotalInsuredValue = lv_total ) ).
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD propertyname.
    READ ENTITIES OF zr_grc_property IN LOCAL MODE
        ENTITY ZrGrcProperty
        FIELDS ( PropertyId ) WITH CORRESPONDING #( keys )
        RESULT DATA(lt_propertyname).
    SELECT COUNT( * )
           FROM ztgrc_property
           INTO @DATA(lv_propcount).
         IF sy-subrc = 0 OR lv_propcount IS INITIAL.
            DATA(lv_nextprop) = lv_propcount + 1.
         ENDIF.

      LOOP AT lt_propertyname ASSIGNING FIELD-SYMBOL(<fs_property_name>).
         DATA(lv_propno) =  |{ lv_nextprop WIDTH = 6 ALIGN = RIGHT PAD = '0' }|.
         DATA(lv_propname) = |{ <fs_property_name>-InsuredName } { '- Building -'  } { lv_propno }|.
         <fs_property_name>-PropertyName = CONV #( lv_propname ).
          MODIFY ENTITIES OF zr_grc_property IN LOCAL MODE
        ENTITY ZrGrcProperty
        UPDATE
        FIELDS ( PropertyName ) WITH VALUE #( ( %tky = <fs_property_name>-%tky PropertyName = <fs_property_name>-PropertyName ) ).
        lv_nextprop = lv_nextprop + 1.
      ENDLOOP.


  ENDMETHOD.

  METHOD valPropertyid.
    READ ENTITIES OF zr_grc_property IN LOCAL MODE
        ENTITY ZrGrcProperty
        FIELDS ( PropertyId ) WITH CORRESPONDING #( keys )
        RESULT DATA(lt_propertyid).
    LOOP AT lt_propertyid INTO DATA(ls_propertyid).
      IF ls_propertyid-PropertyId IS INITIAL.
        APPEND VALUE #( %tky = ls_propertyid-%tky ) TO failed-zrgrcproperty.
        APPEND VALUE #( %tky = ls_propertyid-%tky
                     %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
                                                   text = 'Please Enter Property ID' )
                    ) TO reported-zrgrcproperty.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD valPropertystatus.
    READ ENTITIES OF zr_grc_property IN LOCAL MODE
          ENTITY ZrGrcProperty
          FIELDS ( PropertyStatus ) WITH CORRESPONDING #( keys )
          RESULT DATA(lt_propertystatus).
    LOOP AT lt_propertystatus INTO DATA(ls_propertystatus).
      IF ls_propertystatus-PropertyStatus IS INITIAL.
        APPEND VALUE #( %tky = ls_propertystatus-%tky ) TO failed-zrgrcproperty.
        APPEND VALUE #( %tky = ls_propertystatus-%tky
                     %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
                                                   text = 'Please Select Property Status' )
                    ) TO reported-zrgrcproperty.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD valDatePurchased.
    READ ENTITIES OF zr_grc_property IN LOCAL MODE
        ENTITY ZrGrcProperty
        FIELDS ( DatePurchased ) WITH CORRESPONDING #( keys )
        RESULT DATA(lt_datepurchased).
    LOOP AT lt_datepurchased INTO DATA(ls_datepurchased).
      IF ls_datepurchased-DatePurchased IS INITIAL.
        APPEND VALUE #( %tky = ls_datepurchased-%tky ) TO failed-zrgrcproperty.
        APPEND VALUE #( %tky = ls_datepurchased-%tky
                     %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
                                                   text = 'Please Select Date Purchased' )
                    ) TO reported-zrgrcproperty.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

*  METHOD valdatesold.
*    READ ENTITIES OF zr_grc_property IN LOCAL MODE
*         ENTITY ZrGrcProperty
*         FIELDS ( PropertyStatus ) WITH CORRESPONDING #(  keys )
*         RESULT DATA(lt_datesold).
*    LOOP AT lt_datesold INTO DATA(ls_datesold).
**      IF ls_datesold-PropertyStatus = 'Inactive' OR ls_datesold-PropertyStatus = 'INACTIVE'.
**        APPEND VALUE #( %tky = ls_datesold-%tky ) TO failed-zrgrcproperty.
**        APPEND VALUE #( %tky = ls_datesold-%tky
**                %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
**                                              text = 'Date of Date Removed / Sold is mandatory' )
**
**                ) TO reported-zrgrcproperty.
**      ENDIF.
*    ENDLOOP.
*  ENDMETHOD.

  METHOD copy.
    DATA: property TYPE TABLE FOR CREATE zr_grc_property,
          wall TYPE TABLE FOR CREATE zr_grc_property\\ZrGrcProperty\_Wall.
    "Remove the travel instances with initial %cid
    READ TABLE keys WITH KEY %cid = '' INTO DATA(key_with_initial_cid).
    ASSERT key_with_initial_cid IS INITIAL.

    "Read all travel, booking and booking supplement using EML
    READ ENTITIES OF zr_grc_property IN LOCAL MODE
    ENTITY ZrGrcProperty
        ALL FIELDS WITH CORRESPONDING #( keys )
        RESULT DATA(property_read_result)
        FAILED failed.

        read entities of zr_grc_property in local mode
    entity ZrGrcProperty by \_Wall
        ALL FIELDS WITH CORRESPONDING #( property_read_result )
        RESULT DATA(wall_result)
        FAILED failed.


    " Fill travel internal table for travel data creation - %cid
    LOOP AT property_read_result ASSIGNING FIELD-SYMBOL(<property>).
*      DATA(lv_wall) = lt_wall[ Guid = <property>-PropertyId  ]-WallType.

      "Property data prepration
      APPEND VALUE #( %cid = keys[ %tky = <property>-%tky ]-%cid
                     %data = CORRESPONDING #( <property> )
      ) TO property ASSIGNING FIELD-SYMBOL(<new_property>).

*      append value #( %cid_ref = keys[ key entity %tky = <property>-%tky ]-%cid  )
*
*          to wall ASSIGNING FIELD-SYMBOL(<wall>).
*
*      LOOP AT wall_result ASSIGNING FIELD-SYMBOL(<walls>) WHERE Guid = <property>-Propertyno.
*             append value #( %cid = keys[ key entity %tky = <property>-%tky ]-%cid && <walls>-Guid
*                            %data = CORRESPONDING #( wall_result[ key entity %tky = <walls>-%tky ] EXCEPT Guid )
*            )
*                to <wall>-%target.
*
*
*      ENDLOOP.

    ENDLOOP.

    " MODIFY ENTITY EML to create new BO instance using existing data
    MODIFY ENTITIES OF zr_grc_property IN LOCAL MODE
        ENTITY ZrGrcProperty
            CREATE FIELDS (
  PropertyId
  PropertyName
  PropertyStatus
  PropertyType
  DatePurchased
  InsuredName
  PropertyUse
  HfmCode
  Ownership
  DateSold
  Occupancy
  Brand
  SubBrand
  SiteOwnerEmail
  BuildingValue
  EquipmentValue
  TenantsImprovements
  BusinessInterptVal
  AvgCargoValue
  MaxCargoValue
  AddressLine1
  AddressLine2
  City
  State
  ZipCode
  Latitude
  Longitude
  Region
  Area
  Country
*  Photo
*  RoofType
  RenewalContact
*  RenovationYears
  SquareMetres
  GrossSquareMetres
  SolarPanels
  BuildingHeight
  LevelsAboveGrade
  LevelsBelowGrade
  FireAreas
  FloorsOccupied
  Occupation
  AreaOccupied
  FireProtectClass
  FireDeptType
  FireHydrantDistance
  TapaCertification
  FireDeptLocation
  ProximityFireHyd
  Sprinklers
*  Security
*  Alarms
  PropertyZoning
  CoastalDistance
  Elevation
  FloodZone
  EarthquakeZone
  WindStormZone
  Owner
  SicCode
  SkipPropertyValidation
  ValuesCollectionEmail
  TotalInsuredValue
  ConstructionYear
  InsuranceObgligation
  Location
  Archetype
           )
                WITH property
*                CREATE BY \_Wall FIELDS (  WallType )
*                WITH wall
        MAPPED DATA(mapped_create).

    mapped-zrgrcproperty = mapped_create-zrgrcproperty.

  ENDMETHOD.

ENDCLASS.
