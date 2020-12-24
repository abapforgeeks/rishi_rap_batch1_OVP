@AbapCatalog.sqlViewName: 'ZCPOBUDGET'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'PO Budget Utilization'
@Metadata.allowExtensions: true
define view ZC_RISHI_POBudgetUtil
  as select from ZI_Rishi_PurchaseDocTotalPrice
{
  key PurchaseDocument,
      TotalPrice,
      Currency,
      PurchaseDesc,
      PurchaseStatus,
      PurchasePrio,
      CreatedBy,
      CreatedOn,
      ChangedBy,
      @Semantics.quantity.unitOfMeasure: 'Percentage'
      division(TotalPrice * 100, 1000, 2 ) as BudgetUsage,
      @Semantics.unitOfMeasure: true
      cast( ' % ' as abap.unit( 3 ))       as Percentage,

      /* Associations */
      _Currency,
      _Priority,
      _PurchaseItems,
      _Status
}
