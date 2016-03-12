class ProfileController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def edit_password
    @profile = current_user
  end
  def change_password
    @profile = current_user

    if @profile.valid_password?(profile_params[:old_password])
      @profile.password = profile_params[:password]
      @profile.password_confirmation = profile_params[:password_confirmation]
      if @profile.valid?
        @profile.save!
        redirect_to profile_path
      else
        flash.now[:error] = 'Las contraseñas no coinciden'
        render :edit_password
      end
    else
      flash.now[:error] = "La contraseña actual es invalida"
      render :edit_password
    end
  end

  private
  def profile_params
    params.require(:profile)
.permit(:old_password, :password, :password_confirmation)
  end
end
