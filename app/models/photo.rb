class Photo < ActiveRecord::Base
  belongs_to :attachable, polymorphic: true
  mount_uploader :image, ImageUploader

  before_create :default_name
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  def default_name
    self.name ||= File.basename(image.filename, '.*').titleize if image
  end

end
