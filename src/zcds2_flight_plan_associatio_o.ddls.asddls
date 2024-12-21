@EndUserText.label: 'Association with path'
define view entity zcds2_flight_plan_associatio_o as select 
  from /dmo/connection as co
  association to /dmo/flight as fl on 
  fl.carrier_id = co.carrier_id
  and fl.connection_id = co.connection_id{

  key co.carrier_id,
  key co.connection_id,
  max( fl[left outer].flight_date ) as last_flight_date

} group by co.carrier_id, co.connection_id
