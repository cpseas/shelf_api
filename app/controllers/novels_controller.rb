require_relative '../dtos/novel_dto'

class NovelsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :novel_not_found

  def index
    users = NovelService.find_all
    unless users.has_errors?
      render json: { message: 'No Novels!' }
    end
    render json: novels
  end

  def show
    novel = NovelService.find_by_id(params[:id])
    render json: novel
  end

  def create
    novel_dto = NovelDTO(novel_params)
    unless novel_dto.valid?
      render json: ErrorService.invalid_data('novel'), status: :unprocessable_entity
      return
    end

    novel_service = NovelService.create(novel_dto)
    unless novel_service.has_errors?
      render json: { errors: novel_service.errors }, status: :unprocessable_entity
      return
    end

    render json: { message: 'Novel created successfully!' }, status: :created
  end

  private

  def novel_params
    params.require(:novel).permit(:title, :synopsis, :user_id, :status, :published_date)
  end

  def novel_not_found
    render json: ErrorService.not_found('Novel'), status: :not_found
  end
end
