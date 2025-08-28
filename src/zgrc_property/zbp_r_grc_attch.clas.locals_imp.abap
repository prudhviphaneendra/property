CLASS lhc_attachment DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.
   METHODS   GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR Attachment RESULT result.
    METHODS uploadFile FOR MODIFY
      IMPORTING keys FOR ACTION Attachment~uploadFile RESULT result.

ENDCLASS.

CLASS lhc_attachment IMPLEMENTATION.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
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

    DATA(lo_doc_mgmt) = new zcl_doc_mgmt_rolodex( ).

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
* end of test by ARN033

  ENDMETHOD.

ENDCLASS.

*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
