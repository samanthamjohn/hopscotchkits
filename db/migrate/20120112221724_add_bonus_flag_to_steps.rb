class AddBonusFlagToSteps < ActiveRecord::Migration
  def change
    add_column :steps, :bonus, :boolean, default: false
    add_column :steps, :freeplay, :boolean, default: false
  end
end
