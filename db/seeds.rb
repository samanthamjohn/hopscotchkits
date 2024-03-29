# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#
unless User.where(email: "info@gethopscotch.com").first
  u = User.create(name: "admin", email: "info@gethopscotch.com", password: "cheeseburgers")
  u.update_attribute(:role, "admin")
end

require Rails.root.join("lib/kits.rb")
require Rails.root.join("lib/steps.rb")
require Rails.root.join("lib/requirements.rb")
