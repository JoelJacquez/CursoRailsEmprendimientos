class User < ActiveRecord::Base
  has_many :entrepreneurs
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable



  def generate_access_token
    access_token = nil
    begin
      access_token = new_token
    end while self.class.exists?(token: access_token)

    update_attributes(token: access_token, token_expires_at: 1.day.from_now)

    #update_attribute(:access_token, Manager.digest(access_token))
  end

  private
  def digest(string)
    cost = ActiveModel::SecurePassword.min_cost ?
    BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def new_token
    SecureRandom.urlsafe_base64
  end
end
