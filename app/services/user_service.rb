require_relative '../repositories/user_repository'

class UserService
  def self.create(user_dto)
    new_user = ObjectCreator.create('User', user_dto)
    UserRepository.create(new_user)
  end

  def self.find_all
    UserRepository.find_all
  end

  def self.find_by_id(id)
    UserRepository.find_by_id(id)
  end
end
