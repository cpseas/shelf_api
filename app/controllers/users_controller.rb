require_relative '../dtos/user_dto'
require_relative '../repositories/user_repository'

class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :user_not_found

  def index
    users = UserRepository.find_all
    if users.present?
      render json: users
    else
      render json: {message: "No Users!"}
    end
  end

  def show
    user = UserRepository.find_by_id(params[:id])
    render json: user
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
      return
    end

    render json: { message: 'User created successfully' }, status: :created
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :bio, :password, :role, :email)
  end

  def user_not_found
    render json: ErrorService.not_found('User'), status: :not_found
  end
end
