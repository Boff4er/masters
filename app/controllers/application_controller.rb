class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  skip_before_filter :verify_authenticity_token

  before_filter :before_actions

  before_filter :ip

  before_filter :ensure_signup_complete, only: [:new, :create, :update, :destroy]

  include SimpleCaptcha::ControllerHelpers

  def ip
    require 'translit'

    @resource_user = User.new
    
  	@url = request.path.split('/')
  	@current_user = current_user
  	@all_cats = Cat.order("ord asc")
    #@ip_meta = Ipgeobase.lookup(request.remote_ip)
    @ip_meta = ""

    if !@current_user.blank?
      @tasks = Task.where(user_id: @current_user.id).order("created_at asc")
      @does = Task.where(userdo_id: @current_user.id).order("created_at asc")
      ids = @tasks.map{|t| t.id}
      @tasks_all = Task.where(user_id: @current_user.id).order("created_at asc")
      @order_top = Order.where(task_id: ids, read: false)
      @order_top_t = Message.where(task_id: ids, read: false, to_user: @current_user.id)
      @message_top = Message.where(to_user: @current_user.id, read: false).where.not(dialog_id: nil)
      @audio_top = Audiomessage.where(to_user: @current_user.id, read: false).where.not(audiodialog_id: nil)

      @order_top_2 = Order.where(userdo_id: @current_user.id, read_master: false)
      order_top_22 = Order.where(userdo_id: @current_user.id)
      ids_2 = order_top_22.map{|o| o.task_id}
      task = Task.where(id: ids_2)
      @order_top_2_t = Message.where(task_id: ids_2, read: false, to_user: @current_user.id)
  
      @message_top_2 = Message.where(to_user: @current_user.id, read_master: false).where.not(dialog_id: nil)
    
    end

    if !session[:url_after_reg].blank?
      url = session[:url_after_reg]
      session[:url_after_reg] = nil
      redirect_to(url)
    end

    if params[:action] == "create" && params[:utf8] == "✓"
      if params[:ismaster].to_i == 1
        session[:url_after_reg] = "/profile"
      else
        session[:url_after_reg] = "/profile/master"
      end
    else
      session[:url_after_reg] = nil
    end

    @top_master = User.where(ismaster: true).order("rating desc")

  end

  def before_actions
    @current_user = current_user
  end

  def titles(title, description, keywords)
    @page_title       = title
    @page_description = description
    @page_keywords    = keywords
  end

  def ensure_signup_complete
    # Ensure we don't go into an infinite loop
    #return if action_name == 'finish_signup'

    # Redirect to the 'finish_signup' page if the user
    # email hasn't been verified yet
    #if current_user && !current_user.email_verified?
    #  redirect_to finish_signup_path(current_user)
    #end
  end

  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception, with: :render_500
    rescue_from ActionController::RoutingError, with: :render_404
    rescue_from ActionController::UnknownController, with: :render_404
    #rescue_from ActionController::UnknownAction, with: :render_404
    rescue_from ActiveRecord::RecordNotFound, with: :render_404
  end
  
  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
  
  private
  def render_404(exception)
    @not_found_path = exception.message
    respond_to do |format|
      format.html { render template: 'errors/file_not_found', layout: 'layouts/application', status: 404 }
      format.all { render nothing: true, status: 404 }
    end
  end

  def render_500(exception)
    @error = exception
    respond_to do |format|
      format.html { render template: 'errors/internal_server_error', layout: 'layouts/application', status: 500 }
      format.all { render nothing: true, status: 500}
    end
  end

end
