class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end

    add_column :programs, :user_id, :integer
  end
end
