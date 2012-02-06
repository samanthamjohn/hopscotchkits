class CreateSnapshots < ActiveRecord::Migration
  def change
    create_table :snapshots do |t|
      t.text :code
      t.integer :program_id
      t.integer :step_id
      t.timestamps
    end
  end
end
