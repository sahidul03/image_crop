class UserTemp < ActiveRecord::Base
  mount_uploader :photo, UserPhotoUploader
end
