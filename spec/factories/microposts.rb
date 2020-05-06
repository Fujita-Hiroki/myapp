FactoryBot.define do
  factory :micropost do
    understanding { "I just ate an orange!" }
    problem { "Writing a short test" }
    picture { nil }
    association :user, factory: :user
  end
end