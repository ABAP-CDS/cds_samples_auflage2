CLASS zcds2_flight_search_impl DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_amdp_marker_hdb .

    CLASS-METHODS search FOR TABLE FUNCTION
        zcds2_tf_flight_search.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcds2_flight_search_impl IMPLEMENTATION.

  METHOD search BY DATABASE FUNCTION
    FOR HDB LANGUAGE SQLSCRIPT
    OPTIONS READ-ONLY
    USING /DMO/CONNECTION /DMO/AIRPORT /DMO/FLIGHT.

    RETURN select fl.client, fl.carrier_id,
      fl.connection_id, fl.flight_date,
      co.airport_from_id, af.city as city_from,
      co.airport_to_id, ad.city as city_to,
      co.distance
      from "/DMO/CONNECTION" as co
       inner join "/DMO/AIRPORT" as af on
         af.client = co.client and
         af.airport_id = co.airport_from_id
       inner join "/DMO/AIRPORT" as ad on
         ad.client = co.client and
         ad.airport_id = co.airport_to_id
       inner join "/DMO/FLIGHT" as fl on
         fl.client = co.client and
         fl.carrier_id = co.carrier_id and
         fl.connection_id = co.connection_id
       where co.client = :p_client
       and fl.flight_date = :p_flight_date
       and af.city = :p_city_from
       and ad.city = :p_city_to;

  ENDMETHOD.

ENDCLASS.
