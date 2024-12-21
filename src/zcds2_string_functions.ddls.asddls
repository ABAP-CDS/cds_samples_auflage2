@EndUserText.label: 'build in functions for strings'
define view entity zcds2_string_functions as select 
  from /dmo/customer {
    key customer_id,

    //2 Zeichenketten zusammenfuegen ohne Leerzeichen
    concat( title, last_name ) as salutation_without_space,

    /*2 Zeichenketten zusammenfuegen getrennt durch
      ein Leerzeichen */
    concat_with_space( title, last_name, 1 ) as
      salutation_with_space,

    //Position erstes Vorkommen von '-'
    instr( phone_number, '-' ) as position_separator,

    /*Die ersten 3 Zeichen der Telefonnummer
      von links gesehen */
    left( phone_number, 3 ) as first_3_chars,

    //Laenge der Telefonnummer
    length( phone_number ) as length_telephone_no,

    //Umwandlung von Gross- in Kleinbuchstaben
    lower( last_name ) as last_name_lower,

    /*Postfach rechtsbuendig anordnen
      und mit fuehrenden Nullen auffuellen */
    lpad( postal_code, 10, '0' ) as postbox_leading_zeros,

    //Fuehrende Nullen entfernen
    ltrim( postal_code, '0' ) as postbox_wo_leading_zeros,

    /*Ersetzen Strasse durch Str.;
      Gross- und Kleinschreibung wird beachtet. */
    replace( street, 'Strasse', 'Str.' ) as street,

    // Alle Zeichen außer Zahlen und `+` 
    // in Telefonnummer ersetzen
    replace_regexpr( pcre => '[^(0-9\\\\+)]',
      value => phone_number,
      with => '',
      result_length => 30 ) as phone_number_condensed,

    //Die letzten 5 Ziffern der Telefonnummer
    right( phone_number, 5 ) as last_5_chars,

    //Postfach mit Nullen rechts auffuellen
    rpad( postal_code, 10, '0' ) as postbox_trailing_zeros,

    //Nullen am Ende des Postfaches entfernen
    rtrim( postal_code, '0' ) as trimed_post_box,

    /*Teilzeichenkette von Position 2 bis 3
      (einschliesslich); Dritter Parameter gibt die
      Laenge der Teilzeichenkette an. */
    substring( phone_number, 2, 2 ) as
      telephone_no_from_2_to_3,

    //Umwandlung in Grossbuchstaben
    upper( last_name ) as last_name_upper
}
