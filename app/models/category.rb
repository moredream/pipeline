class Category < ActiveRecord::Base
  has_many :categorizations
  has_many :labs, through: :categorizations
end
