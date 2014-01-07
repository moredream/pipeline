class Profile < ActiveRecord::Base
  belongs_to :user
  validates :user_id, uniqueness: true, presence: true

end
