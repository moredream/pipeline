class Profile < ActiveRecord::Base
  belongs_to :user, inverse_of: :profile
  validates :user_id, uniqueness: true, presence: true

end
