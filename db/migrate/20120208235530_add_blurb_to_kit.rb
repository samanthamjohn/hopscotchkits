class AddBlurbToKit < ActiveRecord::Migration
  def change
    add_column :kits, :blurb, :text
  end
end
