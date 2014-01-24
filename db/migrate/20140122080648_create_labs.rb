class CreateLabs < ActiveRecord::Migration
  def change
    create_table :labs do |t|
      t.string :name
      t.string :url
      t.string :head
      t.text :content
      t.references :user
      t.timestamps
    end

    add_index :labs, :user_id
  end
end
