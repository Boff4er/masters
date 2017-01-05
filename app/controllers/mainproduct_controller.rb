class MainproductController < ApplicationController
	def get

		city = ""
		

		id = params[:id]
		@product = Product.find(id)
		if !@product.blank?
			@cat = Cat.find(@product.cat_id)
			@product.update_attributes(:view => (@product.view.to_i + 1))
			@products = Product.where(public: true, cat_id: @cat.id).where("city like '%#{@product.city}%'")
		end
	end
end
