class AddIconToKit < ActiveRecord::Migration
  def change
    add_column :kits, :icon_url, :string
  end
end
