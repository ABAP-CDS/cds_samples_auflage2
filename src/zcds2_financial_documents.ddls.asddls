@EndUserText.label: 'Financial documents for debit and credit'
define view entity zcds2_financial_documents as select 
  from ybkpf as h
  inner join ybseg as i on i.gjahr = h.gjahr
  and i.belnr = h.belnr and i.bukrs = h.bukrs {

  key h.gjahr,
  key h.belnr,
  key h.bukrs,
  key i.buzei,
  h.budat,
  i.waers,
  @Semantics.amount.currencyCode: 'waers'
  cast( case i.shkzg when 'S' then 
    cast( i.dmbtr as abap.fltp ) else 0 end 
    as abap.curr(23,2) ) as debit,
  @Semantics.amount.currencyCode: 'waers'
  cast( case i.shkzg when 'H' then 
    cast( i.dmbtr as abap.fltp ) else 0 end
    as abap.curr(23,2) ) as credit

}
