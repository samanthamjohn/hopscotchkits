# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
kits = JSON.parse(File.read(Rails.root.join("lib/kits.json")))
kits.each do |kit_json|
  kit = JSON.parse(kit_json)
  if existing_kit = Kit.find_by_slug(kit["slug"])
    existing_kit.update_attributes(kit)
  else
    Kit.create(kit)
  end
end

steps = JSON.parse(File.read(Rails.root.join("lib/steps.json")))
steps.each do |step_json|
  step = JSON.parse(step_json)
  if existing_step = Step.where(kit_id: step["kit_id"]).where(position: step["position"]).first
    existing_step.update_attributes(step)
  else
    Step.create(step)
  end
end

require Rails.root.join("lib/requirements.rb")
