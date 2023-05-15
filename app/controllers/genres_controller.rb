require_relative '../dtos/genre_dto'

class GenresController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :genre_not_found

  def index
    genres = GenreService.find_all
    unless genres.has_errors?
      render json: { message: 'No Genres!' }
    end
    render json: genres
  end

  def show
    genre = GenreService.find_by_id(params[:id])
    render json: genre
  end

  def create
    genre_dto = GenreDTO.new(genre_params)
    unless genre_dto.valid?
      render json: ErrorService.invalid_data('genre'), status: :unprocessable_entity
      return
    end

    genre_service = GenreService.create(genre_dto)
    unless genre_service.has_errors?
      render json: { errors: genre_service.errors }, status: :unprocessable_entity
      return
    end

    render json: { message: 'Genre created successfully!' }, status: :created
  end

  private

  def genre_params
    params.require(:genre).permit(:name, :description, :active)
  end

  def genre_not_found
    render json: ErrorService.not_found('Genre'), status: :not_found
  end
end
