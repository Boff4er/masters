class TaskController < ApplicationController
	def index
		sort = params[:sort]
		cat_id = params[:cat_id]
		@tasks = Task.where(finish: false, public: true).order("ptype = 'toped' desc, created_at desc")
		if sort == "priceup"
			@tasks = @tasks.order("price_fix asc")
		end
		if sort == "pricedown"
			@tasks = @tasks.order("price_fix desc")
		end
		if !cat_id.blank?
			@tasks = @tasks.where(cat: cat_id).order("price_fix desc")
		end
		@cat = Cat.where(public: true, level: 0).order("ord asc")
		@cat_sub = Cat.where(public: true, level: 1).order("ord asc")
	end

	def get
		@task = Task.find(params[:id])
		@task.update_attributes(:view => (@task.view.to_i + 1))
		if !@task.blank?
			@user = User.where(id: @task.user_id)
			if !@user.blank?
				@user = @user.first
				@tasks = Task.where(user_id: @user.id)
				if !@current_user.blank?
					message = Message.where(task_id: @task.id, read: false, to_user: @current_user.id)
				end
				if !message.blank?
					message.each do |t|
						t.update_attributes(read: true)
					end
				end
				if !@current_user.blank?
					@order = Order.where(task_id: @task.id, user_id: @current_user.id)
					if !@order.blank?
						@order.each do |o|
							o.update_attributes(read: true)
						end
					end
					@order = Order.where(task_id: @task.id, userdo_id: @current_user.id)
					if !@order.blank?
						@order.each do |o|
							o.update_attributes(read_master: true)
						end
					end
				end
			end
		end
	end

	def edit
		@cat = Cat.where(public: true, level: 0).order("ord asc")
		@task = Task.find(params[:id])
	end

	def set_order
		order_id = params[:order_id]
		user_id = params[:user_id]
		task_id = params[:task_id]
		price = params[:price]
		ltime = params[:ltime]
		description = params[:description]

		task = Task.find(task_id)

		if order_id.blank?
			order = Order.new
			order.userdo_id = user_id
			order.task_id = task.id
			order.user_id = task.user_id
			order.price = price
			order.ltime = ltime
			order.description = description
			order.save
		else
			order = Order.find(order_id)
			order.update_attributes(:price => price)
			order.update_attributes(:ltime => ltime)
			order.update_attributes(:description => description)

		end

		redirect_to "/tasks/#{task_id}"
	end

	def delete_order
		order_id = params[:order_id]
		task_id = params[:task_id]

		order = Order.find(order_id)
		order.destroy

		redirect_to "/tasks/#{task_id}"
	end

	def change_order
		order_id = params[:order_id]
		userdo_id = params[:userdo_id]
		status = params[:status]
		task_id = params[:task_id]

		user = User.find(userdo_id)

		result_full = Hash.new
		result_full["error"] = "false"
		result_full["name"] = "#{user.name1} #{user.name2}"

		order = Order.find(order_id)
		order.update_attributes(:status => status)
		if status == "yes"
			task = Task.find(task_id)
			task.update_attributes(userdo_id: userdo_id)
			task.update_attributes(inwork: true)
			task.update_attributes(read: false)
			order.update_attributes(read_master: false)
		end

		render json: result_full.to_json
	end

	def change_task
		task_id = params[:task_id]
		status = params[:status]
		order = Order.where(task_id: task_id)

		if status == "done"
			task = Task.find(task_id)
			task.update_attributes(done: true)
			task.update_attributes(read: false)
			if !order.blank?
				order.first.update_attributes(read_master: false)
			end
		end

		if status == "finish"
			task = Task.find(task_id)
			task.update_attributes(finish: true)
			task.update_attributes(read: false)
			if !order.blank?
				order.first.update_attributes(read_master: false)
			end
			user = User.where(id: task.userdo_id)
			if !user.blank?
				task_all = Task.where(userdo_id: user.first.id, finish: true)
				user.first.update_attributes(tasks: task_all.size)
			end
		end

		redirect_to "/tasks/#{task_id}"
	end

	def edit_order
		order_id = params[:order_id]
		userdo_id = params[:userdo_id]
		status = params[:status]
		task_id = params[:task_id]

		order = Order.find(order_id)
		order.update_attributes(:status => status)

		redirect_to "/tasks/#{task_id}"
	end

	def task_delete
		task_id = params[:task_id]

		result_full = Hash.new

		@task = Task.find(task_id)
		@task.destroy

		result_full["error"] = "false"

		render json: result_full.to_json
	end

	def task_archive
		task_id = params[:task_id]

		result_full = Hash.new

		@task = Task.find(task_id)
		@task.update_attributes(public: false)

		result_full["error"] = "false"

		render json: result_full.to_json
	end
end
