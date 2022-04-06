FactoryBot.define do
  factory :user do
    transient do
      preson { Gimei.name }
    end
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    first_name { preson.first.kanji }
    last_name { preson.last.kanji }
    first_name_kana { preson.first.katakana }
    last_name_kana { preson.last.katakana }
    birthday { Faker::Date.birthday }
  end
end
