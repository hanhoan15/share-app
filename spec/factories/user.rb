# Read about factories at https://github.com/thoughtbot/factory_bot

FactoryBot.define do
  factory :user do |f|
    trait :valid do
      email { "hanhoan43@gmail.com" }
      password { 123 }
    end

    trait :empty_user_email do
      email { nil }
      password { 123 }
    end
  end
end
