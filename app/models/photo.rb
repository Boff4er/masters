class Photo < ActiveRecord::Base
	mount_uploader :image, UserUploader
end
