class ThemeRepository
  class << self
    def create(theme_dto)
      new_theme = ObjectCreator.create('Theme', theme_dto.to_h)
      if new_theme.save
        ResultService.new(new_theme)
      else
        ResultService.new(nil, new_theme.errors.messages)
      end
    end

    def find_all
      themes = Theme.all
      ResultService.new(themes)
    end

    def find_by_id(id)
      theme = Theme.find_by(id: id)
      if theme.nil?
        ResultService.new(nil)
      end
      ResultService.new(theme)
    end
  end
end
