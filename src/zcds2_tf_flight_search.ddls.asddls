@EndUserText.label: 'Flight Search with Table function'
@ClientHandling.algorithm: #SESSION_VARIABLE
@ClientHandling.type: #CLIENT_DEPENDENT
define table function zcds2_tf_flight_search
with parameters
  @Environment.systemField: #CLIENT
  p_client : abap.clnt,
  p_city_from : /dmo/city,
  p_city_to : /dmo/city,
  p_flight_date : /dmo/flight_date
returns {
  client : abap.clnt;
  carrier_id : /dmo/carrier_id;
  connection_id : /dmo/connection_id;
  flight_date : /dmo/flight_date;
  airport_from_id : /dmo/airport_from_id;
  city_from : /dmo/city;
  airport_to_id : /dmo/airport_to_id;
  city_to : /dmo/city;
  distance : /dmo/flight_distance;

}
implemented by method zcds2_flight_search_impl=>search;