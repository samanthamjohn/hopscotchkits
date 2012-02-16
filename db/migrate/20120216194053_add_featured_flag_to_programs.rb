class AddFeaturedFlagToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :featured, :boolean, default: false
  end
end
