@AbapCatalog.sqlViewName: 'ZCRFILTOVP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Filter for the Overview Page'
@Metadata.allowExtensions: true
define view ZC_RISHI_OVPFILTERV1 as select from ZI_Rishi_PurchaseDoc
{
 
 key PurchaseDocument,
 ' ' as PurchasePrio,
 @Consumption.valueHelpDefinition: [{ entity:{ name: 'ZC_RISHI_POSTATUSVH',element: 'status'} }]
 ' ' as PurchaseStatus  
}
