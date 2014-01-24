class Categorization < ActiveRecord::Base
  belongs_to :lab
  belongs_to :category
end
