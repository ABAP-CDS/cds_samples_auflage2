extend view entity zcds2_flight_booking with
  association to zcds2_meal_prefs as zzm on
    zzm.customer_id = /dmo/a_booking_d.customer_id{

    zzm.vegetarian as zzvegetarian

}
