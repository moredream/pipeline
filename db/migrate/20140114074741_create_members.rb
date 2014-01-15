class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.text :bio
      t.string :link

      t.timestamps
    end
  end
end
