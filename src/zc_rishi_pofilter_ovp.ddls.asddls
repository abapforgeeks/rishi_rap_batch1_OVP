@AbapCatalog.sqlViewName: 'ZRISHI_OVPFILTER'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'OVP Filter'
@Metadata.allowExtensions: true
define view ZC_RISHI_POFilter_OVP
  as select from ZI_Rishi_PurchaseDoc
{
    
  key PurchaseDocument,
      //    @Consumption.valueHelpDefinition: [{ entity:{ name:'zc_rishi_POPriorityVH',element:'Status' } }]
      @Consumption.valueHelpDefinition: [{ entity:{ name: 'ZC_RISHI_POPriority',element: 'priority'} }]
      ' ' as PurchasePrio,
      @Consumption.valueHelpDefinition: [{ entity:{ name:'zc_rishi_POStatusVH',element:'status' } }]
      ' ' as PurchaseStatus
}
