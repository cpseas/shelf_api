require_relative '../repositories/theme_repository'

class ThemeService
  def self.create(theme_dto)
    theme = Theme.new(theme_dto.to_h)
    ThemeRepository.create(theme)
  end
end
