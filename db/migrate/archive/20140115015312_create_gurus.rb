class CreateGurus < ActiveRecord::Migration
  def change
    create_table :gurus do |t|
      t.string :name
      t.string :slug
      t.string :account
      t.string :link

      t.timestamps
    end
  end
end
