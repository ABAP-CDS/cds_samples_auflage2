CLASS test_documents DEFINITION FOR TESTING
  DURATION SHORT RISK LEVEL HARMLESS.

  PRIVATE SECTION.

    CLASS-METHODS class_setup.

    CLASS-METHODS setup_cds_test_env.

    METHODS read_documents_cds FOR TESTING.

ENDCLASS.

CLASS test_documents IMPLEMENTATION.

  METHOD class_setup.
    setup_cds_test_env(  ).
  ENDMETHOD.

  METHOD setup_cds_test_env.
    DATA:
      headers TYPE STANDARD TABLE OF ybkpf,
      items   TYPE STANDARD TABLE OF ybseg.

    DATA(test_environment) =
      cl_cds_test_environment=>create(
        'zcds2_financial_documents' ).
    test_environment->clear_doubles(  ).

    headers = VALUE #(
      ( gjahr = '2019' belnr = '1'
        bukrs = '1000' budat = '20190901' )
      ( gjahr = '2019' belnr = '3'
        bukrs = '1000' budat = '20191001' ) ).

    items = VALUE #(
      ( gjahr = '2019' belnr = '1' buzei = '0001'
        bukrs = '1000' shkzg = 'H' dmbtr = 100 )
      ( gjahr = '2019' belnr = '1' buzei = '0002'
        bukrs = '1000' shkzg = 'S' dmbtr = 180 )
      ( gjahr = '2019' belnr = '3' buzei = '0001'
        bukrs = '1000' shkzg = 'H' dmbtr = 200 )
      ( gjahr = '2019' belnr = '3' buzei = '0002'
        bukrs = '1000' shkzg = 'S' dmbtr = 280 ) ).

    test_environment->get_double( 'YBKPF' )->insert(
      cl_cds_test_data=>create( headers ) ).
    test_environment->get_double( 'YBSEG' )->insert(
      cl_cds_test_data=>create( items ) ).

  ENDMETHOD.

  METHOD read_documents_cds.

    DATA(exp_documents) = VALUE
      zcds_financial_documents=>_documents(
      ( gjahr = '2019' belnr = '1' bukrs = '1000'
        buzei = '0001' budat = '20190901' credit = 100 )
      ( gjahr = '2019' belnr = '1' bukrs = '1000'
        buzei = '0002' budat = '20190901' debit = 180 ) ).

    SELECT * FROM zcds2_financial_documents
      WHERE budat BETWEEN '20190901' AND '20190930'
      INTO TABLE @DATA(act_documents).

    SORT act_documents.
    cl_abap_unit_assert=>assert_equals(
      exp = exp_documents
      act = act_documents ).

  ENDMETHOD.

ENDCLASS.
