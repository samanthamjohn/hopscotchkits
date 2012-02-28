class CreateStepSpecs < ActiveRecord::Migration
  def change
    create_table :requirements do |t|
      t.string :name
      t.string :message
      t.text :spec
      t.integer :step_id
      t.integer :position
      t.timestamps
    end
  end
end
