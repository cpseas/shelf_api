require_relative '../dtos/theme_dto'

class ThemesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFount, with: :genre_not_found

  def index
    themes = ThemeService.find_all
    unless themes.has_errors?
      render json: { message: 'No Themes!' }
    end
    render json: themes
  end

  def show
    theme = ThemeService.find_by_id(params[:id])
    render json: theme
  end

  def create
    theme_dto = ThemeDTO.new(theme_params)
    unless theme_dto.valid?
      render json: ErrorService.invalid_data('theme'), status: :unprocessable_entity
      return
    end

    theme_service = ThemeService.create(theme_dto)
    unless theme_service.has_errors?
      render json: { errors: theme_dto.errors }, status: :unprocessable_entity
      return
    end

    render json: { message: 'Theme created successfully!' }, status: :created
  end

  private

  def theme_params
    params.require(:theme).permit(:name, :description, :active)
  end

  def theme_not_found
    render json: ErrorService.not_found('Theme'), status: :not_found
  end
end
