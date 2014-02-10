class ChangeColumnToLabs < ActiveRecord::Migration
  def change
    remove_column :labs, :head, :string
    remove_column :labs, :url, :string
  end
end
