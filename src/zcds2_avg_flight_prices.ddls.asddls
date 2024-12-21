@EndUserText.label: 'Association with paths'
define view entity zcds2_avg_flight_prices as select 
  from /dmo/connection as co
  association to /dmo/flight as fl on
  fl.carrier_id = co.carrier_id and
  fl.connection_id = co.connection_id{

  key co.carrier_id,
  key co.connection_id,
  fl.currency_code,
  @Semantics.amount.currencyCode: 'currency_code'
  avg( fl[left outer where flight_date
      between '20240101' and '20241231'].price 
      as abap.curr(16, 2) )
    as avg_flight_price_2024,
  @Semantics.amount.currencyCode: 'currency_code'
  avg( fl[left outer where flight_date
      between '20250101' and '20251231'].price
      as abap.curr(16, 2) )
    as avg_flight_price_2025

} group by co.carrier_id, co.connection_id, fl.currency_code
