CLASS zcds_financial_documents DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES:
      _documents TYPE STANDARD TABLE OF
        zcds2_financial_documents
        WITH NON-UNIQUE DEFAULT KEY.

    CLASS-METHODS read_documents_classical
      EXPORTING
        documents TYPE _documents.

    CLASS-METHODS read_documents_cds
      EXPORTING
        documents TYPE _documents.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcds_financial_documents IMPLEMENTATION.

  METHOD read_documents_classical.
    DATA: document_headers TYPE STANDARD TABLE OF ybkpf,
          document_item    TYPE ybseg,
          document         TYPE zcds2_financial_documents.

    CLEAR documents.

    SELECT * FROM ybkpf
      WHERE budat BETWEEN '20190901' AND '20190930'
      INTO TABLE @document_headers.
    IF sy-subrc <> 0.
      RETURN.
    ENDIF.

    SELECT * FROM ybseg
      FOR ALL ENTRIES IN @document_headers
      WHERE gjahr = @document_headers-gjahr
      AND belnr = @document_headers-belnr
      AND bukrs = @document_headers-bukrs
      INTO @document_item.

      READ TABLE document_headers REFERENCE INTO
        DATA(header)
        WITH KEY gjahr = document_item-gjahr
        belnr = document_item-belnr
        bukrs = document_item-bukrs.
      " should be always successful
      ASSERT sy-subrc = 0.

      CLEAR document.
      document-gjahr = document_item-gjahr.
      document-belnr = document_item-belnr.
      document-bukrs = document_item-bukrs.
      document-buzei = document_item-buzei.
      document-budat = header->*-budat.
      IF document_item-shkzg = 'S'.
        document-debit = document_item-dmbtr.
      ELSE.
        document-credit = document_item-dmbtr.
      ENDIF.
      INSERT document INTO TABLE documents.

    ENDSELECT.

  ENDMETHOD.

  METHOD read_documents_cds.

    SELECT * FROM zcds2_financial_documents
      WHERE budat BETWEEN '20190901' AND '20190930'
      INTO CORRESPONDING FIELDS OF TABLE @documents.

  ENDMETHOD.

ENDCLASS.
