class UserRepository
  class << self
    def create(user_dto)
      user = User.create(
        user_name: user_dto.user_name,
        bio: user_dto.bio,
        password: user_dto.password,
        role: user_dto.role,
        email: user_dto.email
      )
      user
    end

    def find_all
      User.all
    end

    def find_by_id(id)
      User.find(id)
    end
  end
end
