class AddPublishFlagToKit < ActiveRecord::Migration
  def change
    add_column :kits, :published, :boolean
  end
end
