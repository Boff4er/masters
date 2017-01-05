class MaincatController < ApplicationController

	def index
		@cat = Cat.where(public: true, level: 0).order("ord asc")
	end
	
	def get
		@one_cat = Cat.find(params[:id])
		@tasks = Task.where(cat_sub: params[:id]).order("created_at asc")
		@cat = Cat.where(public: true, level: 0).order("ord asc")
		@cat_sub = Cat.where(public: true, level: 1).order("ord asc")		
	end
end
