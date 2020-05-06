FactoryBot.define do
  factory :comment do
    comment { "MyText" }
    picture { nil }
    association :micropost, factory: :micropost    
  end
end
