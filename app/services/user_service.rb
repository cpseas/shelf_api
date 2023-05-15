require_relative '../repositories/user_repository'

class UserService
  def self.create(user_dto)
    UserRepository.create(user_dto)
  end

  def self.find_all
    UserRepository.find_all
  end

  def self.find_by_id(id)
    UserRepository.find_by_id(id)
  end
end
