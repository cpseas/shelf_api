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
    if user_dto.valid?
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

  def user_not_found
    render json: { error: "User not found..." }, status: :not_found
  end
end
