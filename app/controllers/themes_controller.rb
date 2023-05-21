require_relative '../dtos/theme_dto'

class ThemesController < ApplicationController
  def index
    themes = ThemeService.find_all
    if themes.empty_data?
      render json: { message: 'No Themes!' }
    else
      render json: themes
    end
  end

  def show
    theme = ThemeService.find_by_id(params[:id])
    if theme.has_data?
      render json: theme
    else
      render json: ErrorService.not_found('Theme'), status: :not_found
    end
  end

  def create
    theme_dto = ThemeDTO.new(theme_params)
    unless theme_dto.valid?
      render json: ErrorService.invalid_data('theme'), status: :unprocessable_entity
      return
    end

    theme_service = ThemeService.create(theme_dto.to_h)
    unless theme_service.has_errors?
      render json: { errors: theme_service.errors }, status: :unprocessable_entity
    else
      render json: { message: 'Theme created successfully!' }, status: :created
    end
  end

  private

  def theme_params
    params.require(:theme).permit(:name, :description, :active)
  end
end
