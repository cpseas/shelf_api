require_relative '../repositories/user_repository'

class UserService
  def self.create(user_dto)
    user = User.new(user_dto.to_h)
    UserRepository.create(user)
  end

  def self.find_all
    UserRepository.find_all
  end

  def self.find_by_id(id)
    UserRepository.find_by_id(id)
  end
end
