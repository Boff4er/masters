class Audiomessage < ActiveRecord::Base
	mount_uploader :audio, AudioUploader
end
