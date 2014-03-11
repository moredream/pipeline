class AddFilenameToPapers < ActiveRecord::Migration
  def change
    add_column :papers, :original_filename, :string
  end
end
