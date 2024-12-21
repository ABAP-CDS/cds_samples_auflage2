define view entity zcds2_currency_conversion
  with parameters
    target_currency_code: abap.cuky,
    @Environment.systemField: #SYSTEM_DATE
    today: abap.dats
  as select from /dmo/flight{

  key carrier_id,
  key connection_id,
  key flight_date,
  $parameters.target_currency_code as currency_code,
  @Semantics.amount.currencyCode: 'currency_code'
  currency_conversion(
    amount             => price,
    source_currency    => currency_code,
    target_currency    => $parameters.target_currency_code,
    exchange_rate_date => $parameters.today,
    client             => $session.client )
    as price_in_target_currency

}
