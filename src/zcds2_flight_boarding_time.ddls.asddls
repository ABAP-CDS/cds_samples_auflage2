@EndUserText.label: 'Flight Boarding Time'
define view entity zcds2_flight_boarding_time
  with parameters boarding_time_in_seconds: abap.dec(10, 0)
  as select from zcds2_flight_departure_time{

  key carrier_id,
  key connection_id,
  key flight_date,
  tstmp_add_seconds(
    timestamp_departure,
    -1 * $parameters.boarding_time_in_seconds,
    'FAIL'
  ) as timestamp_boarding

}
