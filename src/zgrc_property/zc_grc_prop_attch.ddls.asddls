@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View for ZR_GRC_PROP_ATTCH'
@Metadata.allowExtensions: true
//@Metadata.ignorePropagatedAnnotations: true
define view entity ZC_GRC_PROP_ATTCH as projection on ZR_GRC_PROP_ATTCH
{
    key ParentGuid,
    key Guid,  
     @EndUserText.label: 'Description' 
    Description,
     @EndUserText.label: 'Attachment'
    Attachment,
    FileName,
    FileType,
    CreatedBy,
    CreationAt,
    LastChangedBy,
    LastChangedAt,
    /* Associations */
    _Property : redirected to parent ZC_GRC_PROPERTY
}
