module Api::V1::SessionHelper
  def authenticate_user!
    if current_user.nil?
      errors = ['Token invalido']
      render :json => {errors: errors}, status: :unauthorized
    end
  end

  def sign_in_user(user_params)
    @user = User.find_by(email: user_params[:email])

    if !@user.nil?
      if @user.valid_password?(user_params[:password])
        @user.generate_access_token
        render :json => {user: @user}
      else
        @errors = ['Email o password incorrectos']
        render :json => {errors: @errors}, status: :unprocessable_entity
      end
    else
      @errors = ['Email o password incorrectos']
      render :json => {errors: @errors}, status: :unprocessable_entity
    end
  end

  def sign_up_user(user_params)
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      @user.generate_access_token
      render :json => {user: @user}
    else
      errors = @user.errors
      render :json => {errors: errors}, status: :unprocessable_entity
    end
  end

  def current_user
    user = nil
    if !params[:access_token].nil?
      user =  User.find_by(token: params[:access_token])
    elsif !request.headers["HTTP_ACCESS_TOKEN"].nil?
      user =  User.find_by(token: request.headers["HTTP_ACCESS_TOKEN"])
    end


    if !user.nil? and user.valid_token?
      return user
    else
      return nil
    end
  end

end
