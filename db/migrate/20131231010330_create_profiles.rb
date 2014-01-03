class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :user_id
      t.string :provider
      t.string :uid
      t.string :image
      t.string :user_id
      t.string :url

      t.timestamps
    end
  end
end
