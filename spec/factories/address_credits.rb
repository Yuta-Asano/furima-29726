FactoryBot.define do
  factory :address_credit do
    post_code { '123-4567' }
    city { '京都府' }
    address { '360-6' }
    building { '' }
    area_id { 2 }
    phone_number { '99999999999' }
    user_id {2}
    item_id {6}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
