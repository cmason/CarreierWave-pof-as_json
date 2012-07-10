class UserWorking < ActiveRecord::Base
  attr_accessible :username

  mount_uploader :avatar, AvatarUploader
end
