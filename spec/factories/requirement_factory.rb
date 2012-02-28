FactoryGirl.define do
  factory :requirement do
    sequence(:name) { LoremAthlete::athlete }
    sequence(:spec) { LoremAthlete::paragraph }
    sequence(:position) {|n| n }
  end
end
