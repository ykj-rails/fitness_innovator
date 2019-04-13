FactoryBot.define do
  factory :user do
    nickname  {"yuki"}
    password  {"123456"}
    sequence(:email) {Faker::Internet.email}
    profile   {"テストプロフィール"}
    before(:create){ |user|
      user.skip_confirmation!
    }
  end
end