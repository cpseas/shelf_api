class UserRepository
  class << self
    def create(user_dto)
      new_user = ObjectCreator.create_object('User', user_dto)
      if new_user.save
        ResultService.new(user_dto)
      else
        ResultService.new(nil, user_dto.errors.messages)
      end
    end

    def find_all
      users = User.all
      ResultService.new(users)
    end

    def find_by_id(id)
      user = User.find_by(id: id)
      if user.nil?
        ResultService.new(nil)
      end
      ResultService.new(users)
    end
  end
end
