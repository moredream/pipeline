class CreateGroupings < ActiveRecord::Migration
  def change
    create_table :groupings do |t|
      t.references :group, index: true
      t.references :article, index: true

      t.timestamps
    end
  end
end
