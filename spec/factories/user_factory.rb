FactoryGirl.define do
  factory :user do
    sequence(:name) { LoremAthlete::athlete }
  end
end
