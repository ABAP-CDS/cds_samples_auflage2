@EndUserText.label: 'View with annotations'
define view entity zcds2_view_with_annotations with parameters
  @EndUserText.label: 'Flight date'
  p_flight_date: /dmo/flight_date
  as select from /dmo/flight{

  @EndUserText.label: 'Airline Code'
  key carrier_id,
  key connection_id,
  key flight_date
} where flight_date = $parameters.p_flight_date
