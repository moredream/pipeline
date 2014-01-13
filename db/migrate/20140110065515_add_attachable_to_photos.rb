class AddAttachableToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :attachable_id, :integer
    add_column :photos, :attachable_type, :string
    add_index :photos, [:attachable_id, :attachable_type]

  end
end
