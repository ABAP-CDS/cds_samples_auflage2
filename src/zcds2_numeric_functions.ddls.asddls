@EndUserText.label: 'Numerical CDS functions'
define view entity zcds2_numeric_functions as select from 
  zcds2_demo_expr {
    key id,

    //Absolutbetrag
    abs( num1 ) as absolut_value,

    //kleinster ganzzahliger Wert <= dec3
    ceil( dec3 ) as next_ge_integer,

    //Ganzzahliger Anteil der Division
    div( num1, num2 ) as division_rounded_down,

    //Division gerundet auf 2 Nachkommastellen
    division( num1, num2, 2 ) as division_round_2_decimals,

    //Groesster ganzzahliger Wert >= dec3
    floor( dec3 ) as last_le_integer,

    //Ganzzahliger Rest der Division
    mod( num1, num2 ) as modulo,

    //Rundung auf 0 Dezimalen
    round( dec3, 0 ) as rounded_0_decimals
}
