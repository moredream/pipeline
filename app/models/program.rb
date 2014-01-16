class Program < ActiveRecord::Base

  has_many :photos, as: :attachable
  has_many :comments, as: :commentable

  validates :title, presence: true, length: { maximum: 140 }
end
