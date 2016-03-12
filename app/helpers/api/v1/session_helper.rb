module Api::V1::SessionHelper
  def authenticate_user!
  end

  def sign_in
  end

  def sign_up_user(user_params)
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      @user.generate_access_token
      render :json => {user: @user}
    else
      errors = @user.errors
      render :json => {errors: errors}
    end
  end

  def current_user
  end
end
