class Program < ActiveRecord::Base
  validates :title, presence: true, length: { maximum: 140 }
  validates :content, presence: true
end
