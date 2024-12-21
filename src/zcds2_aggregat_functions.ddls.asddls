@EndUserText.label: 'Aggregat functions'
define view entity zcds2_aggregat_functions as select 
  from /dmo/flight {

  key carrier_id,
  key connection_id,
  currency_code,
  @Semantics.amount.currencyCode : 'currency_code'
  sum( price ) as sum_price,
  @Semantics.amount.currencyCode : 'currency_code'
  max( price ) as max_price,
  @Semantics.amount.currencyCode : 'currency_code'
  min( price ) as min_price,
  @Semantics.amount.currencyCode : 'currency_code'
  avg( price as abap.curr(16, 2)  ) as avg_price,
  count(*) as flight_count

} group by carrier_id, connection_id, currency_code 
