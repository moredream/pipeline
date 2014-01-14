class Program < ActiveRecord::Base
  validates :title, presence: true, length: { maximum: 140 }
  has_many :photos, as: :attachable

end
