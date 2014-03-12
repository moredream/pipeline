class AddAbstractToPapers < ActiveRecord::Migration
  def change
    add_column :papers, :abstract, :text
  end
end
