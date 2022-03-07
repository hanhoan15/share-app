# Read about factories at https://github.com/thoughtbot/factory_bot

FactoryBot.define do
  factory :article do |f|
    trait :valid do
      url { "https://www.youtube.com/watch?v=oV8XoOc4WWE" }
      user_id { 1 }
    end

    trait :empty_url do
      url { nil }
      user_id { 1 }
    end

    trait :empty_user_id do
      url { "https://www.youtube.com/watch?v=oV8XoOc4WWE" }
      user_id { nil }
    end
  end
end
