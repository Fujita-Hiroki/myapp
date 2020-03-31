FactoryBot.define do
  factory :content, class: Micropost do
    trait :content_1 do
      content { "I just ate an orange!" }
      picture { nil }
      user_id { 1 }
      created_at { 10.minutes.ago }
    end

    trait :content_2 do
      content { "Check out the @tauday site by @mhartl: http://tauday.com" }
      picture { nil }
      user_id { 1 }
      created_at { 3.years.ago }
    end

    trait :content_3 do
      content { "Sad cats are sad: http://youtu.be/PKffm2uI4dk" }
      picture { nil }
      user_id { 1 }
      created_at { 2.hours.ago }
    end

    trait :content_4 do
      content { "Writing a short test" }
      picture { nil }
      user_id { 1 }
      created_at { Time.zone.now }
    end
    association :user, factory: :user
  end
end