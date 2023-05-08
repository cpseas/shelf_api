require_relative '../repositories/user_repository'

class UserService
  def self.create(user_dto)
    user = User.new(user_dto.to_h)
    user.encrypt_password! #Code it
    UserRepository.create(user)
    user
  end
end
