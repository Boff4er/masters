class Task < ActiveRecord::Base
	mount_uploader :file_image, TaskUploader
end
