@EndUserText.label: 'Flight Search'
define view entity zcds2_flight_search with parameters
  city_from: /dmo/city,
  city_to: /dmo/city,
  p_flight_date: /dmo/flight_date

  as select from /dmo/connection as co
  inner join /dmo/airport as af on af.airport_id = 
    co.airport_from_id
  inner join /dmo/airport as at on at.airport_id = 
    co.airport_to_id
  inner join /dmo/flight as fl 
    on fl.carrier_id = co.carrier_id
    and fl.connection_id = co.connection_id{

  fl.carrier_id,
  fl.connection_id,
  fl.flight_date,
  co.airport_from_id,
  co.airport_to_id,
  co.distance

} where af.city = $parameters.city_from
  and at.city = $parameters.city_to
  and fl.flight_date = $parameters.p_flight_date
