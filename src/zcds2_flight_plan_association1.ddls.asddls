@EndUserText.label: 'Association with projection'
define view entity zcds2_flight_plan_association1 
  as select from /dmo/connection as co
  association to /dmo/carrier as ca on 
  ca.carrier_id = $projection.carrier_id{

  key co.carrier_id,
  key co.connection_id,
  co.airport_from_id,
  co.airport_to_id,
  ca.name as carrier_name

}
