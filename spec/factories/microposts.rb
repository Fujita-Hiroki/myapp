FactoryBot.define do
  factory :micropost do
    content { "MyText" }
    picture { "MyString" }
    user { nil }
  end
end
