CLASS lhc_Attachment DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PUBLIC SECTION.

  types : BEGIN OF gty_resource,
          id TYPE ZGRC_DOC_MGMT_FILE_ID,
          name TYPE string,
          END OF GTY_RESOURCE.
  TYPES : BEGIN OF gty_file_upload_resp,
          message TYPE string,
          resource TYPE gty_resource,
          status TYPE i,
          END OF gty_file_upload_resp.

  DATA : gs_response TYPE gty_file_upload_resp.
  PRIVATE SECTION.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Attachment RESULT result.

    METHODS uploadFile FOR MODIFY
      IMPORTING keys FOR ACTION Attachment~uploadFile RESULT result.

    METHODS downloadFile FOR MODIFY
      IMPORTING keys FOR ACTION Attachment~downloadFile RESULT result.

ENDCLASS.

CLASS lhc_Attachment IMPLEMENTATION.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD uploadFile.

    DATA(lv_user) = cl_abap_context_info=>get_user_technical_name( ).

    READ ENTITIES OF zr_grc_property IN LOCAL MODE
    ENTITY Attachment
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(lt_doc_rep).

    DATA(lv_attachment) = lt_doc_rep[ 1 ]-Attachment.
    CHECK lv_attachment IS NOT INITIAL.


* BEGIN OF TEST BY ARN033
    DATA(lo_doc_mgmt) = new zcl_doc_mgmt_rolodex( iv_app_name = 'PROPERTY'
                                                  iv_main_uuid = lt_doc_rep[ 1 ]-Uuid ).

    TRY.
        lo_doc_mgmt->upload_file(
          EXPORTING
            iv_file_name   = CONV string( lt_doc_rep[ 1 ]-filename )
            iv_file_data   = lv_attachment
            iv_app_name    = 'PROPERTY'
          IMPORTING
            es_status      = data(ls_status)
            ev_status_text = data(lv_status_text)
        ).
      CATCH cx_web_http_client_error.
        "handle exception
    ENDTRY.

    if ls_status-code EQ '207'.
*    it means file is successfully uploaded

xco_cp_json=>data->from_string( lv_status_text )->apply( VALUE #(
  ( xco_cp_json=>transformation->pascal_case_to_underscore )
  ( xco_cp_json=>transformation->boolean_to_abap_bool )
) )->write_to( REF #( gs_response ) ).
        DATA(ls_resource) = gs_response-resource.
        MODIFY ENTITIES OF zr_grc_property IN LOCAL MODE
        ENTITY Attachment
        UPDATE
        FIELDS ( FileDocid  FolderId ) WITH VALUE #( ( %tky = lt_doc_rep[ 1 ]-%tky FileDocid = ls_resource-id
                                                                                   folderId =  lo_doc_mgmt->gv_folder_id ) ).


    ENDIF.

* end of test by ARN033



  ENDMETHOD.

  METHOD downloadfile.

    DATA(lv_user) = cl_abap_context_info=>get_user_technical_name( ).

    READ ENTITIES OF zr_grc_property IN LOCAL MODE
    ENTITY Attachment
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(lt_doc_rep).

* BEGIN OF TEST BY ARN033
    DATA(lo_doc_mgmt) = new zcl_doc_mgmt_rolodex( iv_app_name = 'PROPERTY'
                                                  iv_main_uuid = lt_doc_rep[ 1 ]-Uuid ).

    TRY.
*        lo_doc_mgmt->download_file(
*          EXPORTING
*            iv_file_name   = CONV string( lt_doc_rep[ 1 ]-filename )
*            iv_file_data   = lv_attachment
*            iv_app_name    = 'PROPERTY'
*          IMPORTING
*            es_status      = data(ls_status)
*            ev_status_text = data(lv_status_text)
*        ).
      CATCH cx_web_http_client_error.
        "handle exception
    ENDTRY.
* end of test by ARN033



  ENDMETHOD.

ENDCLASS.
