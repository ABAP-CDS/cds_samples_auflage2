@Analytics.dataCategory: #DIMENSION
@ObjectModel.representativeKey: 'credit_no'
@VDM.viewType: #BASIC
@EndUserText.label: 'Credit Borrower Basic View'
define view entity zcds2_basic_credit_borrower as select from zcds2_credit as cr
  left outer join zcds2_borrower as bo
  on bo.borrower_no = cr.borrower
  association[0..1] to I_CountryText as _country_text 
  on _country_text.Country = bo.country_code {
  
  key cr.credit_no,
  bo.borrower_no,
  bo.first_name,
  bo.last_name,
  bo.street,
  bo.postal_code,
  bo.city,
  @ObjectModel.text.association: '_country_text'
  bo.country_code,
  _country_text
  
}
