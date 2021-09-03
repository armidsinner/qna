FactoryBot.define do
  factory :answer do
<<<<<<< HEAD
    body { 'MyText' }
    association :question, factory: :question
    association :user, factory: :user

    trait :invalid do
      body { nil }
    end
=======
    body { "MyText" }
    question { "SomeQuestion" }
>>>>>>> d43852864566b4709dd6a25091aa0bd9c113e5f5
  end
end
