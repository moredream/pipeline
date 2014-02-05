class Profile < ActiveRecord::Base
  belongs_to :user, inverse_of: :profile
  validates :user_id, uniqueness: true, presence: true
  mount_uploader :image, ImageUploader

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_avatar

  def crop_avatar
    image.recreate_versions! if crop_x.present?
  end

  def to_param
    "#{id}-#{user.username}".parameterize
  end

end
