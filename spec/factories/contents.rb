FactoryBot.define do

  factory :content, class: Content do
    period              {"10週間"}
    before_body_weight  {"80"}
    after_body_weight   {"70"}
    comment             {"テストコメント"}
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
    user
  end

end