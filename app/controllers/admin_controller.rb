class AdminController < ApplicationController
	
	layout 'admin'

	before_filter :authenticate_active_user

	before_filter :before_actions

	def before_actions
		@all_cats = Cat.all
	end

	def index
		@all_products = Product.all
	end

	def authenticate_active_user
    authenticate_user!
    unless current_user.public?
      flash[:alert] = "Unauthorized Access!"
      redirect_to root_path
    end
  end

end
