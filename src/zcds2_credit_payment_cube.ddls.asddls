@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@ObjectModel: {
  supportedCapabilities: [ #ANALYTICAL_PROVIDER ],
  modelingPattern: #ANALYTICAL_CUBE
}
@VDM.viewType: #COMPOSITE
@EndUserText.label: 'Cube for credit payment'
define view entity zcds2_credit_payment_cube as select from 
  zcds2_pay_credit as payments
  association[1..1] to zcds2_basic_credit_borrower 
    as _credit
  on $projection.credit_no = _credit.credit_no{
    
  key payments.document_no,
  @ObjectModel.foreignKey.association: '_credit'
  payments.credit_no,
  payments.posting_date,
  payments.currency_code,
  @Semantics.amount.currencyCode: 'currency_code'
  @Aggregation.default: #SUM
  payments.amount,
  _credit
  
}
