require_relative '../dtos/user_dto'

class UsersController < ApplicationController
  def index
    users = UserService.find_all
    if users.empty_data?
      render json: {message: "No Users!"}
    else
      render json: users
    end
  end

  def show
    user = UserService.find_by_id(params[:id])
    if user.has_data?
      render json: user
    else
      render json: ErrorService.not_found('User'), status: :not_found
    end
  end

  def create
    user_dto = UserDTO.new(user_params)
    unless user_dto.valid?
      render json: ErrorService.invalid_data('user'), status: :unprocessable_entity
      return
    end

    user_service = UserService.create(user_dto)
    unless user_service.has_errors?
      render json: {errors: user_service.errors}, status: :unprocessable_entity
    else
      render json: { message: 'User created successfully' }, status: :created
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :bio, :password, :role, :email)
  end
end
