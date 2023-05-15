class UserRepository
  class << self
    def create(user)
      res = User.new(
        user_name: user.user_name,
        bio: user.bio,
        password: user.password,
        role: user.role,
        email: user.email
      )
      unless res.save
        return ResultService.new(nil, res.errors.messages)
      end
      ResultService.new(res)
    end

    def find_all
      res = User.all
      unless res
        return ResultService.new(nil, res.errors.messages)
      end
      ResultService.new(res)
    end

    def find_by_id(id)
      res = User.find(id)
      ResultService.new(res)
    end
  end
end
