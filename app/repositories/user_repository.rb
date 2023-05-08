class UserRepository
  class << self
    def create(user)
      new_user = User.create(
        user_name: user.user_name,
        bio: user.bio,
        password: user.password,
        role: user.role,
        email: user.email
      )
      new_user
    end

    def find_all
      User.all
    end

    def find_by_id(id)
      User.find(id)
    end
  end
end
