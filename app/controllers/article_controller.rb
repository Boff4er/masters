class ArticleController < AdminController
	def index
		@articles = Article.all
	end

	def new
		
	end

	def edit
		id = params[:id]
		@article = Article.find(id)
	end

	def form
		id = params[:id]
		name = params[:name]
		ord = params[:ord]
		image = params[:image]
		short = params[:short]
		description = params[:description]
		url = params[:url]
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
			article = Article.create!({:name => name, :ord => ord, :image => image, :short => short, :description => description, :url => url, :public => public, :meta_title => meta_title, :meta_keywords => meta_keywords, :meta_description => meta_description})
		else
			article = Article.find(id)
			if article.name != name
				article.update_attributes(:name => name)
			end
			if article.ord != ord
				article.update_attributes(:ord => ord)
			end
			if article.image != image
				article.update_attributes(:image => image)
			end
			if article.short != short
				article.update_attributes(:short => short)
			end
			if article.description != description
				article.update_attributes(:description => description)
			end
			if article.url != url
				article.update_attributes(:url => url)
			end
			if article.public != public
				article.update_attributes(:public => public)
			end
			if article.meta_title != meta_title
				article.update_attributes(:meta_title => meta_title)
			end
			if article.meta_keywords != meta_keywords
				article.update_attributes(:meta_keywords => meta_keywords)
			end
			if article.meta_description != meta_description
				article.update_attributes(:meta_description => meta_description)
			end
		end
		redirect_to "/admin/articles"
	end

	def delete
		id = params[:id]
		article = Article.find(id)
		article.destroy
		redirect_to "/admin/articles"
	end

	
end
