class Api::V1::SessionsController <  Api::V1::MasterApiController
  def sign_in

    @user = User.find_by(email: user_params[:email])
    render :json => {user: @user}
  end

  def sign_up
    sign_up_user(user_params)
  end


  private
  def user_params
    params.require(:user)
    .permit(:password, :password_confirmation, :email)
  end
end
