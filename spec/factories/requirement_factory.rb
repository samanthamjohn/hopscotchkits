FactoryGirl.define do
  factory :requirement do
    sequence(:name) { LoremAthlete::athlete }
    sequence(:message) { LoremAthlete::sentence }
    sequence(:spec) { LoremAthlete::paragraph }
  end
end
