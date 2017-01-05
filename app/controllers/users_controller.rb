class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users/:id.:format
  def show
    # authorize! :read, @user
  end

  def index
    @users = User.order("ptype = 'toped' desc, created_at desc")
    if !params[:city].blank?
      @users = @users.where(city: params[:city])
    end
    @tasks = Task.all.order("created_at asc")
    @cat = Cat.where(public: true, level: 0).order("ord asc")
    @cat_sub = Cat.where(public: true, level: 1).order("ord asc")
  end

  def get
    url = params[:url]
    @user = User.where(url: url)
    if !@user.blank?
      @user = @user.first
      @tasks = Task.where(user_id: @user.id).order("created_at asc")
      @does = Task.where(userdo_id: @user.id).order("created_at asc")
      ids = @tasks.map{|t| t.id}
      @order = Order.where(task_id: ids)
      @message = Message.where(to_user: @user.id)
      @cats = Cat.where(public: true, level: 1)
      @likes = Rating.where(user_id: @user.id)

      @photos = Photo.where(user_id: @user.id)
      @uarticle = Uarticle.where(user_id: @user.id)
      @audios = Audio.where(user_id: @user.id)

      @recalls_good = Recall.where(user_id: @user.id, isgoood: true)
      @recalls_nogood = Recall.where(user_id: @user.id, isgoood: false)
      
    end

  end

  def like
    user_id = params[:user_id]

    result = {}
    result["error"] = false
    result["error_text"] = ""

    if !@current_user.blank?
      like = Rating.where(user_id: user_id, who_id: @current_user.id)
      if !like.blank?
        result["error"] = true
        result["error_text"] = "Вы уже ставили лайк."
      else
        like = Rating.new
        like.user_id = user_id
        like.who_id = @current_user.id
        like.save
      end
    else
      result["error"] = true
      result["error_text"] = "Сначала авторизируйтесь"
    end

    respond_to do |format|
      format.json {
          render :json => result
      }
    end
  end

  def new_user_reg
    ismaster = params[:ismaster]
    email = params[:email]
    phone = params[:phone]

    password = (0...8).map { ('a'..'z').to_a[rand(26)] }.join

    result = {}
    result["error"] = false
    result["error_text"] = ""
    result["password"] = password

    old_user = User.where(email: email)
    old_user_2 = User.where(phone1: phone)
    if old_user.blank? && old_user_2.blank?
      user = User.new
      user.email = email
      user.name1 = email
      user.phone1 = phone
      user.public = true
      user.password = password
      user.password_confirmation = password
      user.confirmed_at = Time.new
      user.url = phone
      user.save
      sign_in user
      #UserMailer.callback(email, password).deliver!

    else
      result["error"] = true
      if !old_user.blank?
        result["error_text"] = "Пользователь с таким e-mail уже зарегистрирован."
      end
      if !old_user_2.blank?
        result["error_text"] = "Пользователь с таким номером телефона уже зарегистрирован."
      end
    end

    respond_to do |format|
      format.json {
          render :json => result
      }
    end
  end

  def new_user
    email = params[:email]
    password = params[:password]

    result = {}
    result["error"] = false
    result["error_text"] = ""

    old_user = User.where(email: email)
    if old_user.blank?
      result["error"] = true
      result["error_text"] = "Неверный e-mail или пароль"
    else
      if BCrypt::Password.new(old_user.first.encrypted_password).is_password? password
        sign_in old_user.first
      else
        result["error"] = true
        result["error_text"] = "Неверный e-mail или пароль"
      end
    end

    respond_to do |format|
      format.json {
          render :json => result
      }
    end
  end

  # GET /users/:id/edit
  def edit
    # authorize! :update, @user
  end

  # PATCH/PUT /users/:id.:format
  def update
    # authorize! :update, @user
    respond_to do |format|
      if @user.update(user_params)
        sign_in(@user == current_user ? @user : current_user, :bypass => true)
        format.html { redirect_to @user, notice: 'Your profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET/PATCH /users/:id/finish_signup
  def finish_signup
    # authorize! :update, @user 
    if request.patch? && params[:user] #&& params[:user][:email]
      if @user.update(user_params)
        @user.skip_reconfirmation!
        sign_in(@user, :bypass => true)
        redirect_to @user, notice: 'Your profile was successfully updated.'
      else
        @show_errors = true
      end
    end
  end

  # DELETE /users/:id.:format
  def destroy
    # authorize! :delete, @user
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end
  
  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      accessible = [ :name, :email ] # extend with your own params
      accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
      params.require(:user).permit(accessible)
    end
end