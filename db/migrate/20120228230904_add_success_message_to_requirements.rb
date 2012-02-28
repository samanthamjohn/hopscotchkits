class AddSuccessMessageToRequirements < ActiveRecord::Migration
  def change
    add_column :requirements, :success, :string
  end
end
