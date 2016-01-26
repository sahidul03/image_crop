class User < ActiveRecord::Base
  mount_uploader :photo, UserPhotoUploader
  crop_uploaded :photo
  validates :first_name, :last_name, presence: true
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_photo

  def crop_photo
    photo.recreate_versions! if crop_x.present?
  end
  def image_reload
    unless self.photo.nil?

         raise self.photo.cthumb.inspect

    end
  end
end
