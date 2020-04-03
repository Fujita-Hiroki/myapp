FactoryBot.define do
  factory :contents, class: Micropost do
    trait :content_1 do
      understanding { "I just ate an orange!" }
      problem { "Writing a short test" }
      picture { nil }
      user_id { 1 }
      created_at { 10.minutes.ago }
    end

    trait :content_2 do
      understanding { "Check out the @tauday site by @mhartl: http://tauday.com" }
      problem { "Sad cats are sad: http://youtu.be/PKffm2uI4dk" }
      picture { nil }
      user_id { 1 }
      created_at { 3.years.ago }
    end

    trait :content_3 do
      understanding { "Sad cats are sad: http://youtu.be/PKffm2uI4dk" }
      problem { "Check out the @tauday site by @mhartl: http://tauday.com" }
      picture { nil }
      user_id { 1 }
      created_at { 2.hours.ago }
    end

    trait :content_4 do
      understanding { "Writing a short test" }
      problem { "I just ate an orange!" }
      picture { nil }
      user_id { 1 }
      created_at { Time.zone.now }
    end
    association :user, factory: :user
  end
end