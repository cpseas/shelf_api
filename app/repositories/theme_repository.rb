class ThemeRepository
  class << self
    def create
      res = Theme.new(
        name: theme.name,
        description: theme.description,
        active: theme.active
      )
      unless res.save
        return ResultService.new(new, res.errors.messages)
      end
      return ResultService.new(res)
    end

    def find_all
      Theme.all
    end

    def find_by_id(id)
      theme = Theme.find(id)
      theme
    end
  end
end
