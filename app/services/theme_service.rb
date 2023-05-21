require_relative '../repositories/theme_repository'

class ThemeService
  def self.create(theme_dto)
    new_theme = ObjectCreator.create('Theme', theme_dto)
    ThemeRepository.create(theme_dto)
  end

  def self.find_all
    ThemeRepository.find_all
  end

  def self.find_by_id(id)
    ThemeRepository.find_by_id(id)
  end
end
