FactoryBot.define do
  factory :question do
<<<<<<< HEAD
    title { 'MyString' }
    body { 'MyText' }
    association :user, factory: :user

    trait :invalid do
      title { nil }
    end
=======
    title { "MyString" }
    body { "MyText" }
>>>>>>> d43852864566b4709dd6a25091aa0bd9c113e5f5
  end
end
