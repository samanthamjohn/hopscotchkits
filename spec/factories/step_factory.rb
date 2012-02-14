FactoryGirl.define do
  factory(:step) do
    kit { FactoryGirl.build(:kit) }
    sequence(:position) { |n| n }
  end
end
