class Audio < ActiveRecord::Base
	mount_uploader :file, AudioUploader
end
