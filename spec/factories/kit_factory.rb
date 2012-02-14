FactoryGirl.define do
  factory :kit do
    sequence(:slug) { LoremAthlete::sport }
  end
end
