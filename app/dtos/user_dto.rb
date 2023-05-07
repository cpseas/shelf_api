class UserDTO
  attr_accessor :user_name, :bio, :password, :role, :email

  def initialize(user_params)
    @user_name = user_params[:user_name]
    @bio = user_params[:bio]
    @password = user_params[:password]
    @role = user_params[:role]
    @email = user_params[:email]
  end

  def inspect
    "#{user_name}, #{bio}, #{password}, #{role}, #{email}"
  end
end
