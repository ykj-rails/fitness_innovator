FactoryBot.define do

  factory :content do
    before_body_weight  {"80"}
    after_body_weight   {"70"}
    period              {"10週間"}
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
    user
  end

end