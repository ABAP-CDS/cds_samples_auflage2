extend view entity zcds2_aggregat_functions with {

    /dmo/flight.plane_type_id
      as zzplane_type_id,
    max( /dmo/flight.seats_occupied ) 
      as zzmax_seats_occupied

} group by /dmo/flight.plane_type_id
