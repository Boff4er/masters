class HomeController < ApplicationController
	def index

        @cat = Cat.where(public: true, level: 0).order("ord asc")
        @all_cats = Cat.where(public: true).order("ord asc")
        @tasks = Task.all.order("created_at desc").limit(5)
        @users = User.where(ismaster: true).order("created_at desc").limit(5)

        titles("Анти-Депрессанты", "", "")
	end

	def city_serach
		query = params[:query]

		result_main = Array.new
		result_full = Hash.new

		@city = Cat.where("name like '%#{query}%'")
		if !@city.blank?
			@city.each do |c|
				result = {}
				result["id"] = c.id
				result["label"] = c.name
				result["value"] = c.name
				unless result_main.include?(result)
				   result_main << result
				end
			end
		end

		result_full["suggestions"] = result_main

		render json: result_full.to_json

	end

	def create
		@cat = Cat.where(public: true, level: 0).order("ord asc")
	end

	def create_task
		id 		= params[:id]

		cat 		= params[:cat_id]
		cat_sub 	= params[:cat_sub]
		name 		= params[:name]
		description = params[:description]
		file_image 	= params[:file_image]
		budget_1 	= params[:budget_1]
		budget_2 	= params[:budget_2]
		price_fix 	= params[:price_fix]
		price_1 	= params[:price_1]
		price_2 	= params[:price_2]
		price_range	= params[:price_range]
		time_type_1 = params[:time_type_1]
		date_aktual = params[:date_aktual]
		date_count 	= params[:date_count]
		date_start 	= params[:date_start]
		date_stop 	= params[:date_stop]

		user_id 	= params[:user_id]
		
		name1 		= params[:name1]
		phone 		= params[:phone]
		email 		= params[:email]
		password 	= params[:password]
		name2 		= params[:name2]
		file_user 	= params[:file_user]
		password2 	= params[:password2]

		city_from 	= params[:city_from]
		address_from = params[:address_from]
		house_from 	= params[:house_from]
		kv_from 	= params[:kv_from]
		city_to 	= params[:city_to]
		address_to 	= params[:address_to]
		house_to 	= params[:house_to]
		kv_to 		= params[:kv_to]
		soglashenie = params[:soglashenie]

		if !user_id.blank?
			user = User.find(user_id)
		end

		if id.blank?
			task = Task.new
			task.cat = cat
			task.cat_sub = cat_sub
			task.name = name
			task.description = description
			task.file_image = file_image
			if budget_1 == "on"
				task.budget = 1
			end
			if budget_2 == "on"
				task.budget = 2
			end
			task.price_fix = price_fix
			task.price_1 = price_1
			task.price_2 = price_2
			if time_type_1 == "on"
				task.time_type = 1
			end
			task.price1 = price_range
			task.date_aktual = date_aktual
			task.date_count = date_count
			task.date_start = date_start
			task.date_stop = date_stop
			task.city_from = city_from
			task.address_from = address_from
			task.house_from = house_from
			task.kv_from = kv_from
			task.city_to = city_to
			task.address_to = address_to
			task.house_to = house_to
			task.kv_to = kv_to
			task.public = true
			if @current_user.blank?
				task.user_id = user.id
			else
				task.user_id = @current_user.id
			end
			task.save
		else
			task = Task.find(id)
			task.update_attributes(:cat => cat)
			task.update_attributes(:cat_sub => cat_sub)
			task.update_attributes(:name => name)
			task.update_attributes(:description => description)
			task.update_attributes(:file_image => file_image)
			if budget_1 == "on"
				task.update_attributes(:budget => 1)
			end
			if budget_2 == "on"
				task.update_attributes(:budget => 2)
			end
			task.update_attributes(:price_fix => price_fix)
			task.update_attributes(:price_1 => price_1)
			task.update_attributes(:price_2 => price_2)
			if time_type_1 == "on"
				task.update_attributes(:time_type => 1)
			end
			task.update_attributes(:price1 => price_range)
			task.update_attributes(:date_aktual => date_aktual)
			task.update_attributes(:date_count => date_count)
			task.update_attributes(:date_start => date_start)
			task.update_attributes(:date_stop => date_stop)
			task.update_attributes(:city_from => city_from)
			task.update_attributes(:address_from => address_from)
			task.update_attributes(:house_from => house_from)
			task.update_attributes(:kv_from => kv_from)
			task.update_attributes(:city_to => city_to)
			task.update_attributes(:address_to => address_to)
			task.update_attributes(:house_to => house_to)
			task.update_attributes(:kv_to => kv_to)
			if @current_user.blank?
				task.update_attributes(:user_id => user.id)
			else
				task.update_attributes(:user_id => @current_user.id)
			end
		end

		sign_in user

		redirect_to "/tasks"
	end

	def article
		
		
		url = params[:url]
		@article = Article.where(url: url)
		if !@article.blank?
			@article = @article.first
		else
			not_found
		end
	end

	def checkCapcha
		code = params[:code]

		result = {}
		result["error"] = false
		result["error_text"] = ""

		result["valval"] = Integer(rpHash(code))
		result["valval2"] = Integer(code)

		respond_to do |format|
			format.json {
			    render :json => result
			}
		end

	end

	def rpHash (defaultReal) 
        hash = 5381 
        if !defaultReal.nil? 
            defaultReal.upcase! 
            defaultReal.length.times{ |i| hash = ((shift_32 hash, 5) + hash) + defaultReal[i].ord } 
        end 
        return hash 
    end 

    def shift_32 x, shift_amount 
      shift_amount &= 0x1F 
      x <<= shift_amount 
      x &= 0xFFFFFFFF  
     
      if (x & (1<<31)).zero? 
       x 
      else 
       x - 2**32 
      end 
    end 

	def all_obiavlenia
		type_prod = params[:type_prod]
		sort = params[:sort]
		if sort.blank?
			@products = Product.where(public: true, spec: true).order("view DESC")
		end
		if sort == "popular"
			@products = Product.where(public: true, spec: true).order("view DESC")
		end
		if sort == "price"
			@products = Product.where(public: true, spec: true).order("price1 DESC")
		end
		if sort == "isnew"
			@products = Product.where(public: true, spec: true).order("created_at ASC")
		end
		if type_prod == "sdat"
			@products = @products.where(type_prod: type_prod)
		end
		if type_prod == "sold_house"
			@products = @products.where(type_prod: type_prod)
		end
	end

	def all_experts
		@products = Product.where(public: true)
		@all_experts = Expert.where(public: true).order("datepost asc")
	end

	def all_analitics
		@products = Product.where(public: true)
		@all_analitics = Analitic.where(public: true).order("datepost asc")
	end

	def news_index
		city = ""
		
		@all_products = Product.where(public: true, spec: true).where("city like '%#{city}%'").order("view DESC")
		@all_news = News.where(public: true).order("datepost asc")
	end

	def news_get
		@all_articles = Article.where(public: true).order("datepost asc")
		city = ""
		@all_products = Product.where(public: true, spec: true).where("city like '%#{city}%'").order("view DESC")
		@all_news = News.where(public: true).order("datepost asc")
		
		id = params[:id]
		@news = News.find(id)
	end

	def add_obiavlenia
		if @current_user.blank?
			redirect_to "/users/sign_in"
		end
		city = ""
		
		@all_products = Product.where(public: true, spec: true).where("city like '%#{city}%'").order("view DESC")
		@all_experts = Expert.where(public: true).order("datepost asc")
	end

	def get_experts
		city = ""
		
		@all_products = Product.where(public: true, spec: true).where("city like '%#{city}%'").order("view DESC")
		@all_news = News.where(public: true).order("datepost asc")
		@all_experts = Expert.where(public: true).order("datepost asc")
		
		url = params[:id]
		@article = Expert.where(id: url)
		if !@article.blank?
			@article = @article.first
		else
			#not_found
		end
	end

	def get_analitics
		city = ""
		
		@all_products = Product.where(public: true, spec: true).where("city like '%#{city}%'").order("view DESC")
		@all_news = News.where(public: true).order("datepost asc")
		@all_analitics = Analitic.where(public: true).order("datepost asc")
		
		url = params[:id]
		@article = Analitic.where(id: url)
		if !@article.blank?
			@article = @article.first
		else
			#not_found
		end
	end

	def add_obiavlenia_save
		cat_zeml = params[:cat_zeml]
		cat_office = params[:cat_office]
		vid_zeml = params[:vid_zeml]
		cat_biz = params[:cat_biz]
		video = params[:video]
		cat = params[:cat]

		type_prod = params[:type_prod]
		id = params[:id]
		city = params[:city]
		metro = params[:metro]
		address = params[:address]
		plohad = params[:plohad]
		etag_1 = params[:etag_1]
		etag_2 = params[:etag_2]
		etag_checkbox = params[:etag_checkbox]
		if etag_checkbox == "true"
			etag_checkbox = true
		else
			etag_checkbox = false
		end
		price = params[:price]
		name = params[:name]
		description = params[:description]
		video = params[:video]
		packed = params[:packed]

		img1 = params[:img1]
		img2 = params[:img2]
		img3 = params[:img3]
		img4 = params[:img4]
		img5 = params[:img5]
		img6 = params[:img6]
		img7 = params[:img7]
		img8 = params[:img8]
		img9 = params[:img9]
		img10 = params[:img10]
		img11 = params[:img11]

		result = {}
		result["error"] = false
		result["error_text"] = ""

		if id.blank? || id == "undefined"
			product = Product.new	
			product.type_prod = type_prod
			product.city = city
			product.metro = metro
			product.address = address
			product.ploshad = plohad
			product.etag = etag_1
			product.etag2 = etag_2
			product.etag_checkbox = etag_checkbox
			product.price1 = price
			product.datepost = Time.new
			product.name = name
			product.public = true
			product.description = description
			product.video = video
			product.packed = packed
			product.user_id = @current_user.id
			product.image1 = img1
			product.image2 = img2
			product.image3 = img3
			product.image4 = img4
			product.image5 = img5
			product.image6 = img6
			product.image7 = img7
			product.image8 = img8
			product.image9 = img9
			product.image10 = img10
			product.image11 = img11
			product.video = video
			product.cat_id = cat
			if cat == "5" || cat == 5
				product.cat = cat_zeml
				product.vid = vid_zeml
			end
			if cat == "7" || cat == 7
				product.cat = cat_biz
			end
			if cat == "1" || cat == 1 || cat == "3" || cat == 3
				product.cat = cat_office
			end
			product.save
		else
			product = Product.find(id)
			product.update_attributes(:type_prod => type_prod)
			product.update_attributes(:city => city)
			product.update_attributes(:metro => metro)
			product.update_attributes(:address => address)
			product.update_attributes(:ploshad => plohad)
			product.update_attributes(:etag => etag_1)
			product.update_attributes(:etag2 => etag_2)
			product.update_attributes(:etag_checkbox => etag_checkbox)
			product.update_attributes(:price1 => price)
			product.update_attributes(:name => name)
			product.update_attributes(:description => description)
			product.update_attributes(:video => video)
			product.update_attributes(:packed => packed)
			product.update_attributes(:image1 => img1)
			product.update_attributes(:image2 => img2)
			product.update_attributes(:image3 => img3)
			product.update_attributes(:image4 => img4)
			product.update_attributes(:image5 => img5)
			product.update_attributes(:image6 => img6)
			product.update_attributes(:image7 => img7)
			product.update_attributes(:image8 => img8)
			product.update_attributes(:image9 => img9)
			product.update_attributes(:image10 => img10)
			product.update_attributes(:image11 => img11)
			product.update_attributes(:video => video)
			product.update_attributes(:cat_id => cat)
			if cat == "5" || cat == 5
				product.update_attributes(:cat => cat_zeml)
				product.update_attributes(:vid => vid_zeml)
			end
			if cat == "7" || cat == 7
				product.update_attributes(:cat => cat_biz)
			end
			if cat == "1" || cat == 1 || cat == "3" || cat == 3
				product.update_attributes(:cat => cat_office)
			end
		end

		respond_to do |format|
			format.json {
			    render :json => result
			}
		end

	end

	def add_obiavlenia_success
		
	end

	def set_city
		name = params[:name]

		result = {}
		result["error"] = false
		result["error_text"] = ""

		session[:city] = name.split(",")[0]

		respond_to do |format|
			format.json {
			    render :json => result
			}
		end
	end

	def map

		cat_id = params[:cat_id]
		s1 = params[:s1].to_f
		s2 = params[:s2].to_f
		price1 = params[:price1].to_f
		price2 = params[:price2].to_f
		city = params[:city]
		metro = params[:metro]
		address = params[:address]

		@flags = Product.where(public: true)

		if !cat_id.blank?
			if cat_id == "Все"
				
			else
				@flags = @flags.where(cat_id: cat_id)
			end
		end
		if s1 > 0 && s2 > 0
			@flags = @flags.where("(SUBSTRING_INDEX(ploshad, '/', 2) + 0.01) > #{s1} and (SUBSTRING_INDEX(ploshad, '/', 2) + 0.01) < #{s2}")
		end
		if price1 > 0 && price2 > 0
			@flags = @flags.where("(SUBSTRING_INDEX(price1, '/', 2) + 0.01) > #{price1} and (SUBSTRING_INDEX(price1, '/', 2) + 0.01) < #{price2}")
		end
		if !city.blank? && city != "0.0" && city != 0
			city = city.split(",")
			@flags = @flags.where("city like '%#{city[0]}%'")
		end
		if !metro.blank? && metro != "0.0" && metro != 0
			@flags = @flags.where("metro like '%#{metro}%'")
		end
		if !address.blank? && address != "0.0" && address != 0
			@flags = @flags.where("address like '%#{address}%'")
		end

	end

	def search
		word = params[:word]
		s1 = params[:s1].to_f
		s2 = params[:s2].to_f
		price1 = params[:price1].to_f
		price2 = params[:price2].to_f
		city = params[:city]
		metro = params[:metro]
		address = params[:address]
		type_prod = params[:type_prod]

		city = ""
		

		if !word.blank? && word != "0.0" && word != 0
			@products = Product.where("name like '%#{word}%'")
		else
			@products = Product.all
		end

		@products = @products.where("city like '%#{city}%'")

		if s1 > 0 && s2 > 0
			@products = @products.where("(SUBSTRING_INDEX(ploshad, '/', 2) + 0.01) > #{s1} and (SUBSTRING_INDEX(ploshad, '/', 2) + 0.01) < #{s2}")
		end
		if type_prod == "sdat"
			@products = @products.where(type_prod: type_prod)
		end
		if type_prod == "sold_house"
			@products = @products.where(type_prod: type_prod)
		end
		if price1 > 0 && price2 > 0
			@products = @products.where("(SUBSTRING_INDEX(price1, '/', 2) + 0.01) > #{price1} and (SUBSTRING_INDEX(price1, '/', 2) + 0.01) < #{price2}")
		end
		if !city.blank? && city != "0.0" && city != 0
			@products = @products.where("city like '%#{city}%'")
		end
		if !metro.blank? && metro != "0.0" && metro != 0
			@products = @products.where("metro like '%#{metro}%'")
		end
		if !address.blank? && address != "0.0" && address != 0
			@products = @products.where("address like '%#{address}%'")
		end
	end

	def send_message
		product_id = params[:product_id]
		message_text = params[:message]

		product = Product.find(product_id)

		message = Message.new
		message.to_user = product.user_id
		message.product_id = product_id
		message.description = message_text
		message.from_user = @current_user.id
		message.save

		result = {}
		result["error"] = false
		result["error_text"] = ""

		respond_to do |format|
			format.json {
			    render :json => result
			}
		end
	end

	def add_favorite
		product_id = params[:product_id]

		favorite_list = Favorite.where(user_id: @current_user.id, product_id: product_id)
		if favorite_list.blank?
			favorite = Favorite.new
			favorite.user_id = @current_user.id
			favorite.product_id = product_id
			favorite.save
		end

		result = {}
		result["error"] = false
		result["error_text"] = ""

		respond_to do |format|
			format.json {
			    render :json => result
			}
		end
	end

	def remove_favorite
		id = params[:id]
		favorite = Favorite.find(id)
		favorite.destroy
		redirect_to "/profile/favorite"
	end

	def get_map_item
		map = params[:map]
	    @map_item = Product.find(map)
	    respond_to do |format|
	      format.html {
	        render :file => "/layouts/_map_item", :layout => false 
	      }
	    end
	end

	def prod_to_spec
		prod_id = params[:prod_id]
	    prod = Product.find(prod_id)
	    prod.update_attributes(:spec => true)
	    
	    result = {}
		result["error"] = false
		result["error_text"] = ""

		respond_to do |format|
			format.json {
			    render :json => result
			}
		end
	end

	def prod_to_serach
		prod_id = params[:prod_id]
	    prod = Product.find(prod_id)
	    prod.update_attributes(:datepost => Time.now)
	    
	    result = {}
		result["error"] = false
		result["error_text"] = ""

		respond_to do |format|
			format.json {
			    render :json => result
			}
		end
	end

	def status
		
	end

	def kak_eto_rabotaet
		
	end

	def questions
		
	end

	def blank
		
	end

	def get_notify
		result = {}
		result["error"] = false
		result["error_text"] = ""

		if !@current_user.blank?
	      @tasks = Task.where(user_id: @current_user.id).order("created_at asc")
	      @does = Task.where(userdo_id: @current_user.id).order("created_at asc")
	      ids = @tasks.map{|t| t.id}
	      @order_top = Order.where(task_id: ids, read: false)
	      @order_top_t = Message.where(task_id: ids, read: false, to_user: @current_user.id)
	      @message_top = Message.where(to_user: @current_user.id, read: false).where.not(dialog_id: nil)
	      @audiomessage_top = Audiomessage.where(to_user: @current_user.id, read: false).where.not(audiodialog_id: nil)

	      result["order_top"] = (@order_top.size + @order_top_t.size)
	      result["message_top"] = @message_top.size
	      result["audiomessage_top"] = @audiomessage_top.size

	      @order_top_2 = Order.where(userdo_id: @current_user.id, read_master: false)
	      order_top_22 = Order.where(userdo_id: @current_user.id)
	      ids_2 = order_top_22.map{|o| o.task_id}
	      task = Task.where(id: ids_2)
	      @order_top_2_t = Message.where(task_id: ids_2, read: false, to_user: @current_user.id)
	  
	      @message_top_2 = Message.where(to_user: @current_user.id, read_master: false).where.not(dialog_id: nil)
	    	
	      result["order_top_2"] = (@order_top_2.size + @order_top_2_t.size)
	      result["message_top_2"] = @message_top_2.size
	    end

	    respond_to do |format|
			format.json {
			    render :json => result
			}
		end
	end

	def change_task_ptype
		ptype = params[:ptype]
		task_id = params[:task_id]
		result = {}
		result["error"] = false
		result["error_text"] = ""

		if !ptype.blank?
		  task = Task.find(task_id)
	      if ptype == "toped"
	      	price = 1500
	      end
	      if ptype == "up"
			price = 1000
	      end
	      if ptype == "color"
	      	price = 500
	      end

	      if @current_user.balance.to_i >= price
	      	if ptype != "up"
	      		task.update_attributes(:ptype => ptype)
	      	end
	      	user = User.find(@current_user.id)
	      	user.update_attributes(:balance => (user.balance.to_i - price))
	      	if ptype == "up"
	      		task.update_attributes(:created_at => Time.new)
	      	end
	      	result["error_text"] = "Вы успешно изменили заявку."
	      else
	      	result["error"] = true
	      	user = User.find(@current_user.id)
	      	result["error_text"] = "Не хватает денег на балансе. Хотите пополнить баланс на #{(price - user.balance.to_i)} руб?"
	      end
	    end

	    respond_to do |format|
			format.json {
			    render :json => result
			}
		end
	end

	def change_user_ptype
		ptype = params[:ptype]
		user_id = params[:user_id]
		result = {}
		result["error"] = false
		result["error_text"] = ""

		if !ptype.blank?
		  user = User.find(user_id)
	      if ptype == "toped"
	      	price = 1500
	      end
	      if ptype == "up"
			price = 1000
	      end
	      if ptype == "color"
	      	price = 500
	      end

	      if @current_user.balance.to_i >= price
	      	if ptype != "up"
	      		user.update_attributes(:ptype => ptype)
	      	end
	      	user.update_attributes(:balance => (user.balance.to_i - price))
	      	if ptype == "up"
	      		user.update_attributes(:created_at => Time.new)
	      	end
	      	result["error_text"] = "Вы успешно изменили ваш аккаунт."
	      else
	      	result["error"] = true
	      	result["error_text"] = "Не хватает денег на балансе. Хотите пополнить баланс #{(price - user.balance.to_i)} руб?"
	      end
	    end

	    respond_to do |format|
			format.json {
			    render :json => result
			}
		end
	end

	def set_theme
		val = params[:val]
		session[:theme] = val

		result = {}
		result["error"] = false
		result["error_text"] = ""
		
		respond_to do |format|
			format.json {
			    render :json => result
			}
		end
	end

	def add_to_favuser
		user_id = params[:user_id]
		type = params[:type]

		result = {}
		result["error"] = false
		result["error_text"] = ""

		if type == "1"
			favuser = Favuser.where(user_id: user_id, profile_id: @current_user.id)
			if favuser.blank?
				favuser = Favuser.new
				favuser.user_id = user_id
				favuser.profile_id = @current_user.id
				favuser.save
			end
		else
			favuser = Favuser.where(user_id: user_id, profile_id: @current_user.id)
			if !favuser.blank?
				favuser.destroy_all
			end
		end
		
		respond_to do |format|
			format.json {
			    render :json => result
			}
		end
	end

	def add_to_favtask
		task_id = params[:task_id]
		type = params[:type]

		result = {}
		result["error"] = false
		result["error_text"] = ""

		if type == "1"
			favtask = Favtask.where(task_id: task_id, profile_id: @current_user.id)
			if favtask.blank?
				favtask = Favtask.new
				favtask.task_id = task_id
				favtask.profile_id = @current_user.id
				favtask.save
			end
		else
			favtask = Favtask.where(task_id: task_id, profile_id: @current_user.id)
			if !favtask.blank?
				favtask.destroy_all
			end
		end
		
		respond_to do |format|
			format.json {
			    render :json => result
			}
		end
	end
end
