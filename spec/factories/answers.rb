FactoryBot.define do
  factory :answer do
    body { 'MyText' }
    association :question, factory: :question
    association :user, factory: :user

    trait :invalid do
      body { nil }
    end
  end
end
