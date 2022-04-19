FactoryBot.define do
  factory :purchase_address do
    token {"tok_abcdefghijk00000000000000000"}
    post_code { '123-4567' }
    region_id { '3' }
    municipalities { '小樽市' }
    address_number { '1-1-1' }
    building { '東京ハイツ' }
    phone_number { '09033339999' }
  end
end