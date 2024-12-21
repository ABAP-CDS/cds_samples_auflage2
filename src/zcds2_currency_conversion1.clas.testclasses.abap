CLASS test_currency_conversion DEFINITION FOR TESTING
  DURATION SHORT RISK LEVEL HARMLESS.

  PRIVATE SECTION.

    CLASS-METHODS class_setup.

    CLASS-METHODS setup_cds_test_env.

    METHODS should_use_conv_rate_of_2 FOR TESTING.

ENDCLASS.

CLASS test_currency_conversion IMPLEMENTATION.

  METHOD class_setup.

    setup_cds_test_env( ).

  ENDMETHOD.

  METHOD setup_cds_test_env.
    DATA:
      flights TYPE STANDARD TABLE OF /dmo/flight.

    DATA(test_environment) =
      cl_cds_test_environment=>create(
        'zcds2_currency_conversion' ).

    flights = VALUE #(
      ( carrier_id = 'SQ' connection_id = '0001'
        flight_date = '20241202'
        price = 500 currency_code = 'EUR' ) ).

    test_environment->get_double( '/dmo/flight' )->insert(
      cl_cds_test_data=>create( flights ) ).

    DATA(stub_currency_amount) =
      cl_cds_test_data=>create_currency_conv_data(
        1000 )->for_parameters(
        amount = 500
        source_currency = 'EUR'
        target_currency = 'USD'
        exchange_rate_date = sy-datum ).

    test_environment->get_double(
      cl_cds_test_environment=>currency_conversion
    )->insert( stub_currency_amount ).

  ENDMETHOD.

  METHOD should_use_conv_rate_of_2.
    DATA:
      exp_flights TYPE STANDARD TABLE OF
        zcds2_currency_conversion.

    exp_flights = VALUE #( (
      carrier_id = 'SQ' connection_id = '0001'
      flight_date = '20241202'
      price_in_target_currency = 1000
      currency_code = 'USD' ) ).

    SELECT * FROM zcds2_currency_conversion(
      target_currency_code = 'USD' )
      INTO TABLE @DATA(act_flights).

    cl_abap_unit_assert=>assert_equals(
      exp = exp_flights
      act = act_flights ).

  ENDMETHOD.

ENDCLASS.
