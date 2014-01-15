class CreateMentees < ActiveRecord::Migration
  def change
    create_table :mentees do |t|

      t.timestamps
    end
  end
end
