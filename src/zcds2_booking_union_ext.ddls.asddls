extend view entity zcds2_booking_union with {
    /dmo/booking.currency_code as zzcurrency_code,
    @Semantics.amount.currencyCode: 'zzcurrency_code'
    /dmo/booking.flight_price as zzflight_price
} union {
    /dmo/a_booking_d.currency_code as zzcurrency_code,
    /dmo/a_booking_d.flight_price as zzflight_price
}
