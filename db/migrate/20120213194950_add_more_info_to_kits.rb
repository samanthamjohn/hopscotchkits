class AddMoreInfoToKits < ActiveRecord::Migration
  def change
    add_column :steps, :more_info, :text
  end
end
