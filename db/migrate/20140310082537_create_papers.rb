class CreatePapers < ActiveRecord::Migration
  def change
    create_table :papers do |t|
      t.string :title
      t.text :content
      t.references :user, index: true
      t.string :image
      t.string :link

      t.timestamps
    end
  end
end
