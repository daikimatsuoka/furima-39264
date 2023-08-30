FactoryBot.define do
  factory :order_address do
    postcode         { '000-0000' }
    region_id        { 2 }
    municipalities   { Faker::Address.city }
    address          { Faker::Address.street_name }
    building         { Faker::Address.building_number }
    telephone_number { '0901234567' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
