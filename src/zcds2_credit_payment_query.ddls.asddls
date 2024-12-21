@Analytics.query: true
@VDM.viewType: #CONSUMPTION
@EndUserText.label: 'Credit payment query'
define view entity zcds2_credit_payment_query as 
  select from zcds2_credit_payment_cube{
    
  key document_no,
  @AnalyticsDetails.query.axis: #COLUMNS
  credit_no,
  @AnalyticsDetails.query.axis: #COLUMNS
  _credit.country_code,
  @AnalyticsDetails.query.axis: #COLUMNS
  _credit.borrower_no,
  @AnalyticsDetails.query.axis: #COLUMNS
  _credit.first_name,
  @AnalyticsDetails.query.axis: #COLUMNS
  _credit.last_name,
  @AnalyticsDetails.query.axis: #ROWS
  posting_date,
  currency_code,
  amount

}
