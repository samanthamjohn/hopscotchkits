class AddSolutionToKits < ActiveRecord::Migration
  def change
    add_column :steps, :solution, :text
  end
end
