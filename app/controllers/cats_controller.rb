class CatsController < AdminController
	def index
		@cats = Cat.all
	end

	def new
		
	end

	def edit
		id = params[:id]
		@cat = Cat.find(id)
	end

	def form
		id = params[:id]
		name = params[:name]
		ord = params[:ord]
		url = params[:url]
		if id.blank?
			cat = Cat.create!({:name => name, :ord => ord, :url => url})
		else
			cat = Cat.find(id)
			if cat.name != name
				cat.update_attributes(:name => name)
			end
			if cat.ord != ord
				cat.update_attributes(:ord => ord)
			end
			if cat.url != url
				cat.update_attributes(:url => url)
			end
		end
		redirect_to "/admin/cats"
	end

	def delete
		id = params[:id]
		cat = Cat.find(id)
		cat.destroy
		redirect_to "/admin/cats"
	end
end
