class AddColumnToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :rank, :integer
    add_column :categories, :location, :string
  end
end
