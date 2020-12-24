@AbapCatalog.sqlViewName: 'ZCPENDNGPOS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Approval'
@Metadata.allowExtensions: true
@VDM.viewType: #CONSUMPTION
define view ZC_RISHI_PENDINGPOFORAPPROVAL
  as select from ZI_RISHI_PENDINGPOFORAPPROVAL
{
      //Z_I_PendingPOforApproval
      @Consumption.semanticObject: 'PurchasingDocument'
      @ObjectModel.foreignKey.association: '_PODocument'
  key PurchaseDoc,
      POTOtalPrice,
      Approval,
      Currency,
      Description,
      CompanyCode,
      POStatus,
      Priority,
      _POStatus._StatusText[1:language = $session.system_language ].description as StatusText,
      _POPriority[1:language = $session.system_language ].description           as PriorityText,
      CreatedBy,
      /* Associations */
      //Z_I_PendingPOforApproval
      _CompanyCode,
      _Currency,
      _POItems,
      _POPriority,
      _POStatus
}
where
      POStatus     = '1'
  and POTOtalPrice > 1000
