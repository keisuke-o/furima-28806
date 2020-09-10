FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              { 'test1234' }
    password_confirmation {password}
    family_name           {"ああ"}
    first_name            {Gimei.first.kanji}
    family_name_kana      {Gimei.last.katakana}
    first_name_kana       {Gimei.first.katakana}
    birth_date            {Faker::Date.forward(days: 23)}
  end
end