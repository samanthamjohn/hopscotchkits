FactoryGirl.define do
  factory :program do
    user { FactoryGirl.build(:user) }
    kit { FactoryGirl.build(:kit) }
  end
end
