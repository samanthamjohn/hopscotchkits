class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :name
      t.integer :progress
      t.text :code
      t.integer :kit_id

      t.timestamps
    end
  end
end
