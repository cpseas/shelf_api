class UserDTO
  attr_accessor :user_name, :bio, :password, :role, :email

  def initialize(params)
    @user_name = params[:user_name]
    @bio = params[:bio]
    @password = params[:password]
    @role = params[:role]
    @email = params[:email]
  end

  def valid?
    user_name.present? && bio.present? && password.present? && role.present? && email.present?
  end
end
