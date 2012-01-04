class AddHelpToSteps < ActiveRecord::Migration
  def change
    add_column :steps, :hint, :text
  end
end
