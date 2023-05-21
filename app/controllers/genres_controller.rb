require_relative '../dtos/genre_dto'

class GenresController < ApplicationController
  def index
    genres = GenreService.find_all
    if genres.empty_data?
      render json: { message: 'No Genres!' }
    else
      render json: genres
    end
  end

  def show
    genre = GenreService.find_by_id(params[:id])
    if genre.has_data?
      render json: genre
    else
      render json: ErrorService.not_found('Genre'), status: :not_found
    end
  end

  def create
    genre_dto = GenreDTO.new(genre_params)
    unless genre_dto.valid?
      render json: ErrorService.invalid_data('genre'), status: :unprocessable_entity
      return
    end

    genre_service = GenreService.create(genre_dto.to_h)
    unless genre_service.has_errors?
      render json: { errors: genre_service.errors }, status: :unprocessable_entity
    else
      render json: { message: 'Genre created successfully!' }, status: :created
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name, :description, :active)
  end
end
