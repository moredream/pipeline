class Lab < ActiveRecord::Base
  belongs_to :user
  has_many :categorizations
  has_many :categories, through: :categorizations
  has_many :photos, as: :attachable

  accepts_nested_attributes_for :categorizations, allow_destroy: true

  def to_param
    "#{id}-#{name}".parameterize
  end
end
