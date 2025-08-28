//@AccessControl.authorizationCheck: #CHECK
//@Metadata.allowExtensions: true
//@EndUserText.label: '###GENERATED Core Data Service Entity'

@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity for Property Attachment'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.sapObjectNodeType.name: 'ZTGRC_DOC_REP'
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_GRC_DOC_REPO
  as select from ztgrc_doc_rep 
association to parent ZR_GRC_PROPERTY as _Property on
$projection.Uuid = _Property.PropertyNo  
{
  key uuid as Uuid,
  key doc_uuid as DocUuid,
  key doc_type as DocType,
  key external_doc_num as ExternalDocNum,
  key counter as Counter,
@Semantics.largeObject:
      { mimeType: 'MimeType',
      fileName: 'Filename',
        acceptableMimeTypes: ['application/pdf','application/msword',
        'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
        'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
        'application/x-zip-compressed',
        'video/mp4','video/quicktime', 'video/mpeg','video/x-msvideo','image/jpeg' ],      
      contentDispositionPreference: #INLINE }       
  attachment as Attachment,
  
  mimetype as Mimetype,
  filename as Filename,    
  folder_id as FolderId,
  file_docid as FileDocid,
  @Semantics.user.createdBy: true
  local_created_by as LocalCreatedBy,
  @Semantics.systemDateTime.createdAt: true
  local_created_at as LocalCreatedAt,
  @Semantics.user.localInstanceLastChangedBy: true
  local_last_changed_by as LocalLastChangedBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt,
      /* Associations */
    _Property
}
