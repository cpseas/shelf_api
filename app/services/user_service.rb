require_relative '../repositories/user_repository'

class UserService
  def self.create(user_dto)
    user = User.new(user_dto.to_h)
    UserRepository.create(user)
  end
end
