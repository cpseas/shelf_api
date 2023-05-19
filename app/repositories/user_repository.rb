class UserRepository
  class << self
    def create(new_user)
      if new_user.save
        ResultService.new(new_user)
      else
        ResultService.new(nil, new_user.errors.messages)
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
      ResultService.new(user)
    end
  end
end
