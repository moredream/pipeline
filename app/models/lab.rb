class Lab < ActiveRecord::Base
  belongs_to :user
  has_many :categorizations
  has_many :categories, through: :categorizations

  accepts_nested_attributes_for :categorizations, allow_destroy: true

  def to_param
    "#{id}-#{name}".parameterize
  end
end
