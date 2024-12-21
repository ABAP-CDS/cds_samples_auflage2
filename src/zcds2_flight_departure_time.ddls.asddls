define view entity zcds2_flight_departure_time 
  as select from /dmo/flight as fl
  inner join /dmo/connection as co on 
  co.carrier_id = fl.carrier_id and
  co.connection_id = fl.connection_id{

  key fl.carrier_id,
  key fl.connection_id,
  key fl.flight_date,
  co.departure_time,
  dats_tims_to_tstmp(
    fl.flight_date,
    co.departure_time,
    abap_system_timezone($session.client, 'FAIL'),
    $session.client,
    'FAIL'
  ) as timestamp_departure

}
