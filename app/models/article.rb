class Article < ActiveRecord::Base
	mount_uploader :image, ArticleUploader
end
