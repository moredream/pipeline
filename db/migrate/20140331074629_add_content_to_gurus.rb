class AddContentToGurus < ActiveRecord::Migration
  def change
    add_column :gurus, :content, :text
  end
end
