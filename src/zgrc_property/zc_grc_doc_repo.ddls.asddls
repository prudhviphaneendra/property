@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
    @ObjectModel.sapObjectNodeType.name: 'ZTGRC_DOC_REP'
    //define root view entity ZC_TGRC_DOC_REP
//  provider contract TRANSACTIONAL_QUERY
define view entity ZC_GRC_DOC_REPO 
  as projection on ZR_GRC_DOC_REPO
{
  key Uuid,
  key DocUuid,
  key DocType,
  key ExternalDocNum,
  key Counter,
  Attachment,
  Mimetype,
  Filename,
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_DOC_MGMT_ROLODEX'
  @EndUserText.label: 'File'
  virtual vattachment : zgrc_attachment, 
  
  FolderId,
  FileDocid,
  LocalCreatedBy,
  LocalCreatedAt,
  LocalLastChangedBy,
  LocalLastChangedAt,
  LastChangedAt,
  _Property : redirected to parent ZC_GRC_PROPERTY  
}
