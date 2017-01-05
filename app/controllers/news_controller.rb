class NewsController < AdminController
	def index
		@news = News.all
	end

	def new
		
	end

	def edit
		id = params[:id]
		@news = News.find(id)
	end

	def form
		id = params[:id]
		name = params[:name]
		ord = params[:ord]
		image = params[:image]
		short = params[:short]
		description = params[:description]
		datepost = params[:datepost]
		public = params[:public]
		if public == "on"
			public = 1
		else
			public = 0
		end
		meta_title = params[:meta_title]
		meta_keywords = params[:meta_keywords]
		meta_description = params[:meta_description]
		if id.blank?
			news = News.create!({:name => name, :ord => ord, :image => image, :short => short, :description => description, :datepost => datepost, :public => public, :meta_title => meta_title, :meta_keywords => meta_keywords, :meta_description => meta_description})
		else
			news = News.find(id)
			if news.name != name
				news.update_attributes(:name => name)
			end
			if news.ord != ord
				news.update_attributes(:ord => ord)
			end
			if news.image != image
				news.update_attributes(:image => image)
			end
			if news.short != short
				news.update_attributes(:short => short)
			end
			if news.description != description
				news.update_attributes(:description => description)
			end
			if news.datepost != datepost
				news.update_attributes(:datepost => datepost)
			end
			if news.public != public
				news.update_attributes(:public => public)
			end
			if news.meta_title != meta_title
				news.update_attributes(:meta_title => meta_title)
			end
			if news.meta_keywords != meta_keywords
				news.update_attributes(:meta_keywords => meta_keywords)
			end
			if news.meta_description != meta_description
				news.update_attributes(:meta_description => meta_description)
			end
		end
		redirect_to "/admin/news"
	end

	def delete
		id = params[:id]
		news = News.find(id)
		news.destroy
		redirect_to "/admin/news"
	end
end
