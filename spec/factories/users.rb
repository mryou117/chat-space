FactoryBot.define do

  factory :user do
    password = Faker::Internet.password(min_length: 8)
    name  {Faker::Name.name}
    email  {Faker::Internet.email}
    password              {"00000000"}
    password_confirmation {"00000000"}
  end

end