class AddImageUrlToSteps < ActiveRecord::Migration
  def change
    add_column :steps, :image_url, :string
  end
end
