class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:name1, :name2, :email, :password, :password_confirmation, :phone1)
  end

  def account_update_params
    params.require(:user).permit(:name1, :name2, :email, :password, :password_confirmation, :phone1)
  end
end