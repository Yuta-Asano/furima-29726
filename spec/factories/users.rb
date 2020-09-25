FactoryBot.define do
  factory :user do
    nickname  {Faker::Name.initials(number: 2)}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    birthday {Faker::Date.between(from: '1930-01-01', to: '2020-09-25')}
    first_name {"浅野"}
    last_name {"裕太"}
    first_name_kana {"アサノ"}
    last_name_kana {"ユウタ"}
  end
end