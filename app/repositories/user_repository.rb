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
        return ResultService.new(nil, res.errors.full_messages)
      end
      return ResultService.new(res)
    end

    def find_all
      User.all
    end

    def find_by_id(id)
      user = User.find(id)
      user
    end
  end
end
