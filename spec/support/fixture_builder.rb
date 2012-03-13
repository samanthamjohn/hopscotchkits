FixtureBuilder.configure do |fbuilder|
  # rebuild fixtures automatically when these files change:
  fbuilder.files_to_check += Dir["spec/factories/*.rb",  Rails.root.join("db/seeds.rb"), "spec/support/fixture_builder.rb"]
  # now declare objects

  fbuilder.factory do
    require File.expand_path(Rails.root.join("db/seeds.rb"), __FILE__)
  end
end

