class AddImageToLabs < ActiveRecord::Migration
  def change
    add_column :labs, :image, :string
  end
end
