class DropTableMember < ActiveRecord::Migration
  def change
    drop_table :members
    drop_table :mentees

  end
end
