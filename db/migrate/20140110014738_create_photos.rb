class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.text :body
      t.references :article, index: true

      t.timestamps
    end
  end
end
