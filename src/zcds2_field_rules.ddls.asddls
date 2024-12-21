@EndUserText.label: 'Field rules'
define view entity zcds2_field_rules as select 
  from /dmo/flight{

  key carrier_id,
  key connection_id,
  key flight_date,
  seats_max,
  seats_occupied,
  seats_max - seats_occupied as free_seats,
  plane_type_id,
  case plane_type_id when 'A340' then 4 else 2 end 
    as engines,
  cast( price as abap.fltp ) as price_float
} 
