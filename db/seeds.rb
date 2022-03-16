User.create!(
  name: "Example User",
  email: "example@railstutorial.org",
  password: "foobar",
  password_confirmation: "foobar",
  activated: true
)

5.times do |n|
  name = Faker::Name.name
  email = "example_#{n+1}@railstutorial.org"
  password = "password"
  User.create!(
    name: name,
    email: email,
    password: password,
    password_confirmation: password,
    activated: true
  )
end

#users = User.order(:created_at).take(5)
#50.times do
  #understanding = Faker::Lorem.sentence(word_count: 6)
  #problem = Faker::Lorem.sentence(word_count: 6)
  #users.each { |user| user.microposts.create!(understanding: understanding, problem: problem) }
#end

Tag.create([
    { subject: '英語' },
    { subject: '数学（高校）' },
    { subject: '数学（中学）'},
    { subject: '国語'},
    { subject: '古典'},
    { subject: '漢文'},
    { subject: '理科' },
    { subject: '化学' },
    { subject: '物理'},
    { subject: '社会'},
    { subject: '日本史'},
    { subject: '世界史'},
    { subject: 'その他'}
])
