class RemoveImageToProfile < ActiveRecord::Migration
  def change
    remove_column :profiles, :image, :string
  end
end
