class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.integer :kit_id
      t.text :description
      t.text :spec
      t.text :success_message
      t.integer :position
      t.timestamps
    end

    add_column :programs, :step_id, :integer
  end
end
