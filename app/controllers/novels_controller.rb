require_relative '../dtos/novel_dto'

class NovelsController < ApplicationController
  def index
    novels = NovelService.find_all
    if novels.empty_data?
      render json: { message: 'No Novels!' }
    else
      render json: novels
    end
  end

  def show
    novel = NovelService.find_by_id(params[:id])
    if novel.has_data?
      render json: novel
    else
      render json: ErrorService.not_found('Novel'), status: :not_found
    end
  end

  def create
    novel_dto = NovelDTO.new(novel_params)
    unless novel_dto.valid?
      render json: ErrorService.invalid_data('novel'), status: :unprocessable_entity
      return
    end

    novel_service = NovelService.create(novel_dto.to_h)
    unless novel_service.has_errors?
      render json: { errors: novel_service.errors }, status: :unprocessable_entity
    else
      render json: { message: 'Novel created successfully!' }, status: :created
    end
  end

  private

  def novel_params
    params.require(:novel).permit(:title, :synopsis, :user_id, :status, :published_date, genres: [], themes: [])
  end
end
