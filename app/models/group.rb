class Group < ActiveRecord::Base
  has_many :groupings
  has_many :articles, through: :groupings
end
