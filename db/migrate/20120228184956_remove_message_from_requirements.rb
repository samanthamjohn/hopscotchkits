class RemoveMessageFromRequirements < ActiveRecord::Migration
  def up
    remove_column :requirements, :message
  end

  def down
    add_column :requirements, :message, :string
  end
end
