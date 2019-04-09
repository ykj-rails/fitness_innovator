FactoryBot.define do

  factory :user do
    nickname  {"yuki"}
    email     {"kkk@gmail.com"}
    password  {"00000000"}

    before(:create){ |user|
      user.skip_confirmation!
    }
  end

end