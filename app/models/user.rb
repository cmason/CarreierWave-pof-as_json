class User < ActiveRecord::Base
  attr_accessible :username
  mount_uploader :avatar, AvatarUploader
  mount_uploader :avatar2, AvatarUploader
end
