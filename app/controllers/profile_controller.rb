class ProfileController < ApplicationController

	def before_main
		order = Order.where(userdo_id: @current_user.id)
		ids = order.map{|o| o.task_id}
		@task_answer = Task.where(id:ids)
		@task_inwork = Task.where(inwork: true, userdo_id: @current_user.id)
		@task_done = Task.where(done: true, userdo_id: @current_user.id)
		@task_finish = Task.where(finish: true, userdo_id: @current_user.id)
		@favusers_all = Favuser.where(profile_id: @current_user.id)
		@favtasks_all = Favtask.where(profile_id: @current_user.id)
		@recalls_all = Recall.where(user_id: @current_user.id)
	end

	def main_page
		if @current_user.default_profile == "user"
			redirect_to "/profile"
		else
			redirect_to "/profile/master"
		end
		before_main
	end

	def index
		if @current_user.blank?
			redirect_to "/"
		else
			sort = params[:sort]
			@tasks = Task.where(user_id: @current_user.id).order("created_at asc")
			if sort == "priceup"
				@tasks = Task.where(user_id: @current_user.id).order("price_fix asc")
			end
			if sort == "pricedown"
				@tasks = Task.where(user_id: @current_user.id).order("price_fix desc")
			end
			@does = Task.where(userdo_id: @current_user.id).order("created_at asc")
			ids = @tasks.map{|t| t.id}
			@order = Order.where(task_id: ids)
			@message = Message.where(to_user: @current_user.id)
			@likes = Rating.where(user_id: @current_user.id)

			@recalls = Recall.where(user_id: @current_user.id).where.not(parent_id: nil).order("created_at asc")

			@photos = Photo.where(user_id: @current_user.id)
			@uarticle = Uarticle.where(user_id: @current_user.id)
			@audios = Audio.where(user_id: @current_user.id)

			before_main
		end
	end

	def master
		order = Order.where(userdo_id: @current_user.id)
		o_ids = order.map{|o| o.task_id}
		@tasks = Task.where(id: o_ids).order("created_at asc")
		@does = Task.where(userdo_id: @current_user.id).order("created_at asc")
		ids = @tasks.map{|t| t.id}
		@order = Order.where(task_id: ids)
		@message = Message.where(to_user: @current_user.id)
		@cats = Cat.where(public: true, level: 1)
		@likes = Rating.where(user_id: @current_user.id)

		@recalls = Recall.where(user_id: @current_user.id).order("created_at asc")

		before_main
	end

	def master_answer
		order = Order.where(userdo_id: @current_user.id)
		o_ids = order.map{|o| o.task_id}
		@tasks = Task.where(id: o_ids).order("created_at asc")
		@does = Task.where(userdo_id: @current_user.id).order("created_at asc")
		ids = @tasks.map{|t| t.id}
		@order = Order.where(task_id: ids)
		@message = Message.where(to_user: @current_user.id)
		@cats = Cat.where(public: true, level: 1)
		@likes = Rating.where(user_id: @current_user.id)

		before_main
	end

	def master_inwork
		order = Order.where(userdo_id: @current_user.id)
		o_ids = order.map{|o| o.task_id}
		@tasks = Task.where(inwork: true, userdo_id: @current_user.id).order("created_at asc")
		@does = Task.where(userdo_id: @current_user.id).order("created_at asc")
		ids = @tasks.map{|t| t.id}
		@order = Order.where(task_id: ids)
		@message = Message.where(to_user: @current_user.id)
		@cats = Cat.where(public: true, level: 1)
		@likes = Rating.where(user_id: @current_user.id)

		before_main
	end

	def master_finish
		order = Order.where(userdo_id: @current_user.id)
		o_ids = order.map{|o| o.task_id}
		@tasks = Task.where(done: true, userdo_id: @current_user.id).order("created_at asc")
		@does = Task.where(userdo_id: @current_user.id).order("created_at asc")
		ids = @tasks.map{|t| t.id}
		@order = Order.where(task_id: ids)
		@message = Message.where(to_user: @current_user.id)
		@cats = Cat.where(public: true, level: 1)
		@likes = Rating.where(user_id: @current_user.id)

		before_main
	end

	def master_achive
		order = Order.where(userdo_id: @current_user.id)
		o_ids = order.map{|o| o.task_id}
		@tasks = Task.where(finish: true, userdo_id: @current_user.id).order("created_at asc")
		@does = Task.where(userdo_id: @current_user.id).order("created_at asc")
		ids = @tasks.map{|t| t.id}
		@order = Order.where(task_id: ids)
		@message = Message.where(to_user: @current_user.id)
		@cats = Cat.where(public: true, level: 1)
		@likes = Rating.where(user_id: @current_user.id)

		before_main
	end

	def settings
		@tasks = Task.where(user_id: @current_user.id).order("created_at asc")
		@does = Task.where(userdo_id: @current_user.id).order("created_at asc")
		ids = @tasks.map{|t| t.id}
		@order = Order.where(task_id: ids)
		@cats = Cat.where(public: true, level: 1)
		@message = Message.where(to_user: @current_user.id)
		@likes = Rating.where(user_id: @current_user.id)
		@answers = Answer.where(user_id: @current_user.id)

		before_main
	end

	def balance
		@tasks = Task.where(user_id: @current_user.id).order("created_at asc")
		@does = Task.where(userdo_id: @current_user.id).order("created_at asc")
		ids = @tasks.map{|t| t.id}
		@order = Order.where(task_id: ids)
		@cats = Cat.where(public: true, level: 1)
		@message = Message.where(to_user: @current_user.id)
		@likes = Rating.where(user_id: @current_user.id)
		@answers = Answer.where(user_id: @current_user.id)

		before_main
	end

	def messages
		@tasks = Task.where(user_id: @current_user.id).order("created_at asc")
		@does = Task.where(userdo_id: @current_user.id).order("created_at asc")
		ids = @tasks.map{|t| t.id}
		@order = Order.where(task_id: ids)
		@message = Message.where(task_id: nil).where("to_user = #{@current_user.id} or from_user = #{@current_user.id}").order("created_at asc")
		@likes = Rating.where(user_id: @current_user.id)
		#if !@message.blank?
		#	@message.each do |t|
		#		t.update_attributes(read: true)
		#	end
		#end

		@dialogs = Dialog.where("user1_id = #{@current_user.id} or user2_id = #{@current_user.id}")

		before_main
	end

	def audiomessages
		@tasks = Task.where(user_id: @current_user.id).order("created_at asc")
		@does = Task.where(userdo_id: @current_user.id).order("created_at asc")
		ids = @tasks.map{|t| t.id}
		@order = Order.where(task_id: ids)
		@message = Audiomessage.where(task_id: nil).where("to_user = #{@current_user.id} or from_user = #{@current_user.id}").order("created_at asc")
		@likes = Rating.where(user_id: @current_user.id)
		#if !@message.blank?
		#	@message.each do |t|
		#		t.update_attributes(read: true)
		#	end
		#end

		@audiodialogs = Audiodialog.where("user1_id = #{@current_user.id} or user2_id = #{@current_user.id}")

		before_main
	end

	def settings_master
		@tasks = Task.where(user_id: @current_user.id).order("created_at asc")
		@does = Task.where(userdo_id: @current_user.id).order("created_at asc")
		ids = @tasks.map{|t| t.id}
		@order = Order.where(task_id: ids)
		@cats = Cat.where(public: true, level: 1)
		@message = Message.where(to_user: @current_user.id)
		@likes = Rating.where(user_id: @current_user.id)
		@answers = Answer.where(user_id: @current_user.id)

		before_main
	end

	def balance_master
		@tasks = Task.where(user_id: @current_user.id).order("created_at asc")
		@does = Task.where(userdo_id: @current_user.id).order("created_at asc")
		ids = @tasks.map{|t| t.id}
		@order = Order.where(task_id: ids)
		@cats = Cat.where(public: true, level: 1)
		@message = Message.where(to_user: @current_user.id)
		@likes = Rating.where(user_id: @current_user.id)
		@answers = Answer.where(user_id: @current_user.id)

		before_main
	end

	def messages_master
		@tasks = Task.where(user_id: @current_user.id).order("created_at asc")
		@does = Task.where(userdo_id: @current_user.id).order("created_at asc")
		ids = @tasks.map{|t| t.id}
		@order = Order.where(task_id: ids)
		@message = Message.where(task_id: nil).where("to_user = #{@current_user.id} or from_user = #{@current_user.id}").order("created_at asc")
		@likes = Rating.where(user_id: @current_user.id)
		#if !@message.blank?
		#	@message.each do |t|
		#		t.update_attributes(read: true)
		#	end
		#end

		@dialogs = Dialog.where("user1_id = #{@current_user.id} or user2_id = #{@current_user.id}")

		before_main
	end

	def messages_get
		@tasks = Task.where(user_id: @current_user.id).order("created_at asc")
		@does = Task.where(userdo_id: @current_user.id).order("created_at asc")
		ids = @tasks.map{|t| t.id}
		@order = Order.where(task_id: ids)
		@message = Message.where(dialog_id: params[:id]).order("created_at asc")
		@likes = Rating.where(user_id: @current_user.id)
		if !@message.blank?
			@message.where(to_user: @current_user.id).each do |t|
				t.update_attributes(read: true)
			end
		end
		before_main
	end

	def audiomessages_get
		@tasks = Task.where(user_id: @current_user.id).order("created_at asc")
		@does = Task.where(userdo_id: @current_user.id).order("created_at asc")
		ids = @tasks.map{|t| t.id}
		@order = Order.where(task_id: ids)
		@message = Audiomessage.where(audiodialog_id: params[:id]).order("created_at asc")
		@likes = Rating.where(user_id: @current_user.id)
		if !@message.blank?
			@message.where(to_user: @current_user.id).each do |t|
				t.update_attributes(read: true)
			end
		end
		before_main
	end

	def messages_get_master
		@tasks = Task.where(user_id: @current_user.id).order("created_at asc")
		@does = Task.where(userdo_id: @current_user.id).order("created_at asc")
		ids = @tasks.map{|t| t.id}
		@order = Order.where(task_id: ids)
		@message = Message.where(dialog_id: params[:id]).order("created_at asc")
		@likes = Rating.where(user_id: @current_user.id)
		if !@message.blank?
			@message.where(to_user: @current_user.id).each do |t|
				t.update_attributes(read_master: true)
			end
		end
	end

	def messages2_get
		@tasks = Task.where(user_id: @current_user.id).order("created_at asc")
		@does = Task.where(userdo_id: @current_user.id).order("created_at asc")
		ids = @tasks.map{|t| t.id}
		@order = Order.where(task_id: ids)
		@message = Message.where(task_id: params[:id]).order("created_at asc")
		@task = Task.find(params[:id])
		@likes = Rating.where(user_id: @current_user.id)
		if !@message.where(to_user: @current_user.id).blank?
			@message.each do |t|
				t.update_attributes(read: true)
			end
		end
	end

	def messages_orders
		@tasks = Task.where(user_id: @current_user.id).order("created_at asc")
		@does = Task.where(userdo_id: @current_user.id).order("created_at asc")
		ids = @tasks.map{|t| t.id}
		@order = Order.where(task_id: ids)
		@likes = Rating.where(user_id: @current_user.id)

		@orders = Order.where("user_id = #{@current_user.id} or userdo_id = #{@current_user.id}")
		if @orders.blank?
			@orders = Order.where("userdo_id = #{@current_user.id} or user_id = #{@current_user.id}")
		end
		

		before_main
	end

	def message
		user_id = params[:user_id]
		description = params[:description]
		from_messages_id = params[:from_messages_id]

		dialog = Dialog.where(user1_id: user_id, user2_id: @current_user.id)
		if !dialog.blank?
			dialog = dialog.first
		else
			dialog = Dialog.where(user1_id: @current_user.id, user2_id: user_id)
			if !dialog.blank?
				dialog = dialog.first
			else
				dialog = Dialog.create!(user1_id: user_id, user2_id: @current_user.id)
			end
		end

		message = Message.new
		message.to_user = user_id
		message.from_user = @current_user.id
		message.description = description
		message.dialog_id = dialog.id
		message.save

		user = User.find(user_id)
		if from_messages_id.blank?
			redirect_to "/#{user.url}"
		else
			redirect_to "/profile/messages/#{dialog.id}"
		end
	end

	def audiomessage
		require 'base64'
		user_id = params[:user_id]
		description = params[:description]
		from_messages_id = params[:from_messages_id]
		audio = params[:audio]
		#audio_data=Base64.decode64(audio['data:audio/ogg;base64,'.length .. -1])

		dialog = Audiodialog.where(user1_id: user_id, user2_id: @current_user.id)
		if !dialog.blank?
			dialog = dialog.first
		else
			dialog = Audiodialog.where(user1_id: @current_user.id, user2_id: user_id)
			if !dialog.blank?
				dialog = dialog.first
			else
				dialog = Audiodialog.create!(user1_id: user_id, user2_id: @current_user.id)
			end
		end

		message = Audiomessage.new
		message.to_user = user_id
		message.from_user = @current_user.id
		message.description = description
		message.audio = audio
		message.audiodialog_id = dialog.id
		message.save

		user = User.find(user_id)
		if from_messages_id.blank?
			redirect_to "/#{user.url}"
		else
			redirect_to "/profile/audiomessages/#{dialog.id}"
		end
	end

	def message_order
		order_id = params[:order_id]
		task_id = params[:task_id]
		from_user = params[:from_user]
		to_user = params[:to_user]
		description = params[:description]

		message = Message.new
		message.task_id = task_id
		message.order_id = order_id
		message.to_user = to_user
		message.from_user = from_user
		message.description = description
		message.save

		task = Task.find(task_id)
		task.update_attributes(read: false)

		redirect_to "/tasks/#{task_id}"
	end

	def recall
		task_id = params[:task_id]
		parent_id = params[:parent_id]
		from_user_id = params[:from_user_id]
		user_id = params[:user_id]
		description = params[:description]
		rating = 0
		question1 = params[:question1]
		question2 = params[:question2]
		question3 = params[:question3]
		question4 = params[:question4]
		question5 = params[:question5]
		question6 = params[:question6]
		question7 = params[:question7]
		question8 = params[:question8]
		question9 = params[:question9]
		question10 = params[:question10]

		task = Task.find(task_id)
		user = User.find(task.userdo_id)

		if question1 == "on"
			rating += 1 
		end
		if question2 == "on"
			rating += 1 
		end
		if question3 == "on"
			rating += 1 
		end
		if question4 == "on"
			rating += 1 
		end
		if question5 == "on"
			rating += 1 
		end
		if question6 == "on"
			rating += 1 
		end
		if question7 == "on"
			rating += 1 
		end
		if question8 == "on"
			rating += 1 
		end
		if question9 == "on"
			rating += 1 
		end
		if question10 == "on"
			rating += 1 
		end

		recall = Recall.new
		if user_id.blank?
			recall.user_id = task.userdo_id
		else
			recall.user_id = user_id
		end
		recall.task_id = task_id
		recall.from_user_id = from_user_id
		recall.description = description
		if question1 != "on"
			recall.question1 = false
		end
		if question2 != "on"
			recall.question2 = false
		end
		if question3 != "on"
			recall.question3 = false
		end
		if question4 != "on"
			recall.question4 = false
		end
		if question5 != "on"
			recall.question5 = false
		end
		if question6 != "on"
			recall.question6 = false
		end
		if question7 != "on"
			recall.question7 = false
		end
		if question8 != "on"
			recall.question8 = false
		end
		if question9 != "on"
			recall.question9 = false
		end
		if question10 != "on"
			recall.question10 = false
		end
		recall.rating = rating
		if !parent_id.blank?
			recall.parent_id = parent_id
		end
		recall.save

		recalls = Recall.where(user_id: user.id)
		sum = 0
		if !recalls.blank?
			recalls.each do |r|
				sum += r.rating
			end
		end
		user.update_attributes(rating: (sum/recalls.size).to_i)
		user.update_attributes(plus: (user.plus.to_i + 1))

		if parent_id.blank?
			redirect_to "/tasks/#{task_id}"
		else
			redirect_to "/profile/master"
		end
	end

	def orders
		sort = params[:sort]
		@tasks = Task.where("user_id = #{@current_user.id} || userdo_id = #{@current_user.id}").order("created_at asc")
		ids = @tasks.map{|t| t.id}
		@order = Order.where(task_id: ids)
		ids = @order.map{|t| t.task_id}
		@tasks = Task.where(id: ids).order("created_at asc")
		if sort == "priceup"
			@tasks = Task.where(id: ids).order("price_fix asc")
		end
		if sort == "pricedown"
			@tasks = Task.where(id: ids).order("price_fix desc")
		end
		if !@tasks.blank?
			@tasks.each do |t|
				t.update_attributes(read: true)
			end
		end
		@message = Message.where(to_user: @current_user.id)
		@cats = Cat.where(public: true, level: 1)
		@likes = Rating.where(user_id: @current_user.id)

		before_main
	end

	def myorders
		sort = params[:sort]
		@tasks = Task.where("user_id = #{@current_user.id}").order("created_at asc")
		if sort == "priceup"
			@tasks = Task.where(id: ids).order("price_fix asc")
		end
		if sort == "pricedown"
			@tasks = Task.where(id: ids).order("price_fix desc")
		end
		if !@tasks.blank?
			@tasks.each do |t|
				t.update_attributes(read: true)
			end
		end

		before_main
	end

	def orders_master
		sort = params[:sort]
		@tasks = Task.where(user_id: @current_user.id).order("created_at asc")
		ids = @tasks.map{|t| t.id}
		@order = Order.where(task_id: ids)
		ids = @order.map{|t| t.task_id}
		@tasks = Task.where(id: ids).order("created_at asc")
		if sort == "priceup"
			@tasks = Task.where(id: ids).order("price_fix asc")
		end
		if sort == "pricedown"
			@tasks = Task.where(id: ids).order("price_fix desc")
		end
		if !@tasks.blank?
			@tasks.each do |t|
				t.update_attributes(read: true)
			end
		end
		@message = Message.where(to_user: @current_user.id)
		@cats = Cat.where(public: true, level: 1)
		@likes = Rating.where(user_id: @current_user.id)

		before_main
	end

	def add_photo
		user_id = params[:user_id]
		image = params[:image]
		if !user_id.blank?
			photo = Photo.new
			photo.user_id = user_id
			photo.image = image
			photo.save
		end

		redirect_to "/profile"
	end

	def delete_photo
		id = params[:id]
		photo = Photo.find(id)
		photo.destroy
		redirect_to "/profile"
	end

	def add_uarticle
		user_id = params[:user_id]
		description = params[:description]
		if !user_id.blank?
			uarticle = Uarticle.new
			uarticle.user_id = user_id
			uarticle.description = description
			uarticle.save
		end

		redirect_to "/profile"
	end

	def delete_uarticle
		id = params[:id]
		uarticle = Uarticle.find(id)
		uarticle.destroy
		redirect_to "/profile"
	end

	def add_audio
		user_id = params[:user_id]
		file = params[:file]
		name = params[:name]
		if !user_id.blank?
			audio = Audio.new
			audio.user_id = user_id
			audio.name = name
			audio.file = file
			audio.save
		end

		redirect_to "/profile"
	end

	def delete_audio
		id = params[:id]
		audio = Audio.find(id)
		audio.destroy
		redirect_to "/profile"
	end

	def save
		user_id = params[:user_id]
		phone1 = params[:phone1]
		phone2 = params[:phone2]
		skype = params[:skype]
		email = params[:email]
		www = params[:www]

		learn1 = params[:learn1]
		learn2 = params[:learn2]
		learn3 = params[:learn3]

		garant1 = params[:garant1]
		garant2 = params[:garant2]

		pays = params[:pays]

		opyt = params[:opyt]
		auto = params[:auto]
		location = params[:location]

		cats = params[:cats]

		password = params[:password]
		name1 = params[:name1]
		name2 = params[:name2]
		name3 = params[:name3]

		description = params[:description]

		image = params[:image]

		ismaster = params[:ismaster]
		b_date = params[:b_date]
		b_month = params[:b_month]
		b_year = params[:b_year]
		status_1 = params[:status_1]
		status_2 = params[:status_2]
		status_3 = params[:status_3]
		status_4 = params[:status_4]
		pays_1 = params[:pays_1]
		pays_2 = params[:pays_2]
		pays_3 = params[:pays_3]
		pays_4 = params[:pays_4]
		auto1 = params[:auto1]
		auto2 = params[:auto2]
		auto3 = params[:auto3]
		price1 = params[:price1]

		city = params[:city]

		balance = params[:balance]

		raions = params[:raions]

		if !cats.blank?
			cats = cats.join(",")
		end

		if !user_id.blank?
			user = User.find(user_id)
			if !phone1.blank?
				user.update_attributes(:phone1 => phone1)
			end
			if !phone2.blank?
				user.update_attributes(:phone2 => phone2)
			end
			if !skype.blank?
				user.update_attributes(:skype => skype)
			end
			if !www.blank?
				user.update_attributes(:www => www)
			end
			if !city.blank?
				user.update_attributes(:city => city)
			end

			if !learn1.blank?
				user.update_attributes(:learn1 => learn1)
			end
			if !learn2.blank?
				user.update_attributes(:learn2 => learn2)
			end
			if !learn3.blank?
				user.update_attributes(:learn3 => learn3)
			end

			if !garant1.blank?
				user.update_attributes(:garant1 => garant1)
			end
			if !garant2.blank?
				user.update_attributes(:garant2 => garant2)
			end

			if !opyt.blank?
				user.update_attributes(:opyt => opyt)
			end
			if !auto.blank?
				user.update_attributes(:auto => auto)
			end
			if !location.blank?
				user.update_attributes(:location => location)
			end

			if !cats.blank?
				user.update_attributes(:cats => cats)
			end

			if !pays.blank?
				user.update_attributes(:pays => pays)
			end

			if !raions.blank?
				user.update_attributes(:raions => raions)
			end

			if !password.blank?
				user.update_attributes(:password => password)
			end
			if !name1.blank?
				user.update_attributes(:name1 => name1)
			end
			if !name2.blank?
				user.update_attributes(:name2 => name2)
			end
			if !name3.blank?
				user.update_attributes(:name3 => name3)
			end

			if !image.blank?
				user.update_attributes(:image => image)
			end

			if !description.blank?
				user.update_attributes(:description => description)
			end

			if !price1.blank?
				user.update_attributes(:price => price1)
			end
			if !ismaster.blank?
				user.update_attributes(:ismaster => true)
			end
			if !b_date.blank?
				user.update_attributes(:b_date => b_date)
			end
			if !b_month.blank?
				user.update_attributes(:b_month => b_month)
			end
			if !b_year.blank?
				user.update_attributes(:b_year => b_year)
			end
			status = "#{status_1},#{status_2},#{status_3},#{status_4}"
			if !status.blank?
				user.update_attributes(:status => status)
			end
			if !pays_1.blank? || !pays_2.blank? || !pays_3.blank? || !pays_4.blank?
				pays = "#{pays_1},#{pays_2},#{pays_3},#{pays_4}"
				if !pays.blank?
					user.update_attributes(:pays => pays)
				end
			end
			if !auto1.blank? || !auto2.blank? || !auto3.blank?
				auto = "#{auto1},#{auto2},#{auto3}"
				if !auto.blank?
					user.update_attributes(:auto => auto)
				end
			end

			if !balance.blank?
				user.update_attributes(:balance => (user.balance.to_i + balance.to_i))
			end

		end

		if balance.blank?
			redirect_to "/profile"
		else
			if params[:url].blank?
				redirect_to "/profile/balance"
			else
				redirect_to params[:url]
			end
		end
	end

	def step1
		@cats = Cat.where(public: true, level: 1)
	end

	def step2_1
		
		
	end

	def step2_2
		
	end

	def step2_3
		
	end

	def step2_4
		
	end

	def step2_5
		
	end

	def step3
		user_id = params[:user_id]
		phone1 = params[:phone1]
		phone2 = params[:phone2]
		skype = params[:skype]
		email = params[:email]
		www = params[:www]

		learn1 = params[:learn1]
		learn2 = params[:learn2]
		learn3 = params[:learn3]

		garant1 = params[:garant1]
		garant2 = params[:garant2]

		pays = params[:pays]

		opyt = params[:opyt]
		auto = params[:auto]
		location = params[:location]

		cats = params[:cats]

		password = params[:password]
		name1 = params[:name1]
		name2 = params[:name2]
		name3 = params[:name3]

		description = params[:description]

		image = params[:image]

		ismaster = params[:ismaster]
		b_date = params[:b_date]
		b_month = params[:b_month]
		b_year = params[:b_year]
		status_1 = params[:status_1]
		status_2 = params[:status_2]
		status_3 = params[:status_3]
		status_4 = params[:status_4]
		pays_1 = params[:pays_1]
		pays_2 = params[:pays_2]
		pays_3 = params[:pays_3]
		pays_4 = params[:pays_4]
		auto1 = params[:auto1]
		auto2 = params[:auto2]
		auto3 = params[:auto3]
		price1 = params[:price1]

		usluga_name = params[:usluga_name]
		usluga_price = params[:usluga_price]
		rayon = params[:rayon]

		if !cats.blank?
			cats = cats.join(",")
		end

		if !user_id.blank?
			user = User.find(user_id)
			if !phone1.blank?
				user.update_attributes(:phone1 => phone1)
			end
			if !phone2.blank?
				user.update_attributes(:phone2 => phone2)
			end
			if !skype.blank?
				user.update_attributes(:skype => skype)
			end
			if !www.blank?
				user.update_attributes(:www => www)
			end

			if !learn1.blank?
				user.update_attributes(:learn1 => learn1)
			end
			if !learn2.blank?
				user.update_attributes(:learn2 => learn2)
			end
			if !learn3.blank?
				user.update_attributes(:learn3 => learn3)
			end

			if !garant1.blank?
				user.update_attributes(:garant1 => garant1)
			end
			if !garant2.blank?
				user.update_attributes(:garant2 => garant2)
			end

			if !pays.blank?
				user.update_attributes(:pays => pays)
			end

			if !opyt.blank?
				user.update_attributes(:opyt => opyt)
			end
			if !auto.blank?
				user.update_attributes(:auto => auto)
			end
			if !location.blank?
				user.update_attributes(:location => location)
			end

			if !cats.blank?
				user.update_attributes(:cats => cats)
			end

			if !password.blank?
				user.update_attributes(:password => password)
			end
			if !name1.blank?
				user.update_attributes(:name1 => name1)
			end
			if !name2.blank?
				user.update_attributes(:name2 => name2)
			end
			if !name3.blank?
				user.update_attributes(:name3 => name3)
			end

			if !image.blank?
				user.update_attributes(:image => image)
			end

			if !description.blank?
				user.update_attributes(:description => description)
			end

			if !price1.blank?
				user.update_attributes(:price => price1)
			end
			if !ismaster.blank?
				user.update_attributes(:ismaster => true)
			end
			if !b_date.blank?
				user.update_attributes(:b_date => b_date)
			end
			if !b_month.blank?
				user.update_attributes(:b_month => b_month)
			end
			if !b_year.blank?
				user.update_attributes(:b_year => b_year)
			end
			status = "#{status_1},#{status_2},#{status_3},#{status_4}"
			if !status.blank?
				user.update_attributes(:status => status)
			end
			pays = "#{pays_1},#{pays_2},#{pays_3},#{pays_4}"
			if !pays.blank?
				user.update_attributes(:pays => pays)
			end
			auto = "#{auto1},#{auto2},#{auto3}"
			if !auto.blank?
				user.update_attributes(:auto => auto)
			end

		end

		prices = Price.where(user_id: user_id)
		prices.destroy_all

		if !usluga_name.blank?
			i = 0
			usluga_name.each do |u|
				if !u.blank?
					price = Price.new
					price.user_id = user_id
					price.name = u
					price.price = usluga_price[i].to_i
					price.save
				end
				i += 1
			end
		end

		rayons = Rayon.where(user_id: user_id)
		rayons.destroy_all

		if !rayon.blank?
			rayon.each do |r|
				if !r.blank?
					rayon_one = Rayon.new
					rayon_one.user_id = user_id
					rayon_one.name = r
					rayon_one.save
				end
			end
		end
	end

	def answer_save
		user_id = params[:user_id]
		answer_id = params[:answer_id]
		cat_id = params[:cat_id]
		name = params[:name]
		description = params[:description]
		
		if !answer_id.blank?
			answer = Answer.find(answer_id)
			if !cat_id.blank?
				answer.update_attributes(:cat_id => cat_id)
			end
			if !name.blank?
				answer.update_attributes(:name => name)
			end
			if !description.blank?
				answer.update_attributes(:description => description)
			end
		else
			answer = Answer.new
			answer.cat_id = cat_id
			answer.user_id = user_id
			answer.name = name
			answer.description = description
			answer.save
		end
		redirect_to "/profile/settings"
	end

	def answer_remove
		answer_id = params[:answer_id]
		answer = Answer.find(answer_id)
		answer.destroy
		render json: answer_id.to_json
	end

	def set_user_type
		user_type = params[:user_type]
		user = User.find(@current_user.id)
		user.update_attributes(:default_profile => user_type)

		render json: user.to_json
	end

	def message_delete
		message_id = params[:message_id]
		message = Message.find(message_id)
		message.destroy
		render json: message_id.to_json
	end

	def users_favorite
		before_main
		fu = Favuser.where(profile_id: @current_user.id)
		user_ids = fu.map{|f| f.user_id}
		@users = User.where(id:user_ids).order("ptype = 'toped' desc, created_at desc")
	end

	def tasks_favorite
		before_main
		fu = Favtask.where(profile_id: @current_user.id)
		task_ids = fu.map{|f| f.task_id}
		@tasks = Task.where(id:task_ids).order("ptype = 'toped' desc, created_at desc")
	end

	def recalls
		before_main
		@recalls_good = Recall.where(user_id: @current_user.id, isgoood: true)
		@recalls_nogood = Recall.where(user_id: @current_user.id, isgoood: false)
	end

end
