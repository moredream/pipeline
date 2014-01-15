class DeleteBodyToPhotos < ActiveRecord::Migration
  def change
    remove_column :photos, :body, :string
  end
end
