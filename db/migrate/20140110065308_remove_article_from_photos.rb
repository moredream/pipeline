class RemoveArticleFromPhotos < ActiveRecord::Migration
  def change
    remove_column :photos, :article_id, :string
  end
end
