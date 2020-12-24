@AbapCatalog.sqlViewName: 'ZCOVPPSTATUS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Purchase Overview by Status & Priority'
@Metadata.allowExtensions: true
define view ZC_RISHI_OVPPRIOSTATUSV1
  as select from ZI_Rishi_PurchaseDoc
{
  key PurchaseDocument,
      PurchaseDesc,
      PurchaseStatus,
      _Status.text   as StatusText,
      PurchasePrio,
      _Priority.text as PriorityText,
      @Aggregation.default: #SUM
      1              as sumofDocuments,
      _Priority,
      _Status
}
