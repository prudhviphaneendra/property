@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity for Property Attachment'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_GRC_PROP_ATTCH as select from ztgrc_attach
association to parent ZR_GRC_PROPERTY as _Property on
$projection.ParentGuid = _Property.PropertyNo
{
    key parent_guid as ParentGuid,
    key guid as Guid,
    description as Description,
    @Semantics.largeObject: {
        mimeType: 'filetype',
        fileName: 'filename',
        
        acceptableMimeTypes: ['application/pdf','application/msword',
        'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
        'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
        'application/x-zip-compressed',
        'video/mp4','video/quicktime', 'video/mpeg','video/x-msvideo','image/jpeg' ],
        contentDispositionPreference:#INLINE
    }
    attachment as Attachment,
    
    
    file_name as FileName,
     @Semantics.mimeType: true
    file_type as FileType,
    @Semantics.user.createdBy: true
    created_by as CreatedBy,
    @Semantics.systemDateTime.createdAt: true
    creation_at as CreationAt,
    @Semantics.user.localInstanceLastChangedBy: true
    last_changed_by as LastChangedBy,
     @Semantics.systemDateTime.localInstanceLastChangedAt: true
    last_changed_at as LastChangedAt,
    _Property
}
