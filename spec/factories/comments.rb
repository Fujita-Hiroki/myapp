FactoryBot.define do
  factory :comment do
    comment { "MyText" }
    picture { "MyString" }
    micropost { nil }
  end
end
