@EndUserText.label: 'Flight booking'
define view entity zcds2_flight_booking as select from /dmo/a_booking_d{

  key booking_uuid,
  carrier_id,
  connection_id,
  flight_date,
  booking_id as booking_number,
  booking_date

}
