class AddFieldsToSteps < ActiveRecord::Migration
  def change
    add_column :steps, :title, :string
  end
end
