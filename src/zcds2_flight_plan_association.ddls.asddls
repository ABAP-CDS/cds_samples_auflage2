@EndUserText.label: 'CDS view with association'
define view entity zcds2_flight_plan_association as select 
  from /dmo/connection
  association to /dmo/carrier on 
  /dmo/carrier.carrier_id = /dmo/connection.carrier_id{

  key carrier_id,
  key connection_id,
  airport_from_id,
  airport_to_id,
  /dmo/carrier.name as carrier_name

}
