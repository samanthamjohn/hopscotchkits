FactoryGirl.define do
  factory :user do
    sequence(:name) { LoremAthlete::athlete }
    sequence(:email) { "#{LoremAthlete::word}@aol.com" }
    password "password"
  end
end
