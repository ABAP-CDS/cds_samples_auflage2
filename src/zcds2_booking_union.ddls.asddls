@EndUserText.label: 'Union clause for flight booking'
@Metadata.ignorePropagatedAnnotations: true
define view entity zcds2_booking_union as 
  select from /dmo/booking{

  key booking_id,
  booking_date,
  customer_id,
  carrier_id,
  connection_id,
  flight_date

} union select from /dmo/a_booking_d{

  key booking_id,
  booking_date,
  customer_id,
  carrier_id,
  connection_id,
  flight_date

}
