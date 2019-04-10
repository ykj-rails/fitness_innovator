FactoryBot.define do

  factory :user do
    nickname  {"yuki"}
    password  {"00000000"}
    sequence(:email) {Faker::Internet.email}
    before(:create){ |user|
      user.skip_confirmation!
    }
  end

end