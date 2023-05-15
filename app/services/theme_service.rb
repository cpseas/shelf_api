require_relative '../repositories/theme_repository'

class ThemeService
  def self.create(theme_dto)
    theme = Theme.new(theme_dto.to_h)
    ThemeRepository.create(theme)
  end

  def self.find_all
    ThemeRepository.find_all
  end

  def self.find_by_id(id)
    ThemeRepository.find_by_id(id)
  end
end
