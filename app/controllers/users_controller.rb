require_relative '../dtos/user_dto'
require_relative '../repositories/user_repository'

class UsersController < ApplicationController
  def index
    users = UserRepository.find_all
    if users
      render json: users
    end
  end

  def create
    user_dto = UserDTO.new(user_params)
    if user_dto
      UserRepository.create(user_dto)
      render json: { message: 'User created successfully' }, status: :created
    else
      render json: { errors: user_dto.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :bio, :password, :role, :email)
  end
end
