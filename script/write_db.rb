f = File.open(Rails.root.join("lib/kits.rb"), 'w')
kits = Kit.all.map do |kit|
  kit = kit.attributes
  kit['created_at'] = kit['created_at'].to_s
  kit['updated_at'] = kit['updated_at'].to_s
  kit
end
f.write("kits = #{kits.to_s.gsub(/\}, /, "},\n").gsub(/,\ \"/, ",\n \"" )}")
f.close
f = File.open(Rails.root.join("lib/kits.rb"), 'a')
f.write(
"
kits.each do |kit|
  if existing_kit = Kit.where(id: kit['id']).first
    existing_kit.update_attributes(kit)
  else
    new_kit = Kit.new(kit)
    new_kit.id = kit['id']
    new_kit.save
  end
end"
)

f = File.open(Rails.root.join("lib/steps.rb"), 'w')
steps = Step.all.map do |step|
  step = step.attributes
  step['created_at'] = step['created_at'].to_s
  step['updated_at'] = step['updated_at'].to_s
  step
end
f.write("steps = #{steps.to_s.gsub(/\}, /, "},\n").gsub(/,\ \"/, ",\n \"" )}")
f.close
f = File.open(Rails.root.join("lib/steps.rb"), 'a')
f.write(
"
steps.each do |step|
  if existing_step = Step.where(id: step['id']).first
    existing_step.update_attributes(step)
  else
    new_step = Step.new(step)
    new_step.id = step['id']
    new_step.save
  end
end"
)

