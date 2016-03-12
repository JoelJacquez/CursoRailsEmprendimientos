class ProfileController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def edit_password
    @profile = current_user
  end
  def change_password

  end

  private
  def profile_params
    params.require(:profile)
.permit(:old_password, :password, :password_confirmation)
  end
end
