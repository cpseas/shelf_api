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
      ResultService.new(res)
    end

    def find_all
      res = Theme.all
      unless res
        return ResultService.new(nil, res.errors.messages)
      end
      ResultService.new(res)
    end

    def find_by_id(id)
      res = Theme.find(id)
      ResultService.new(res)
    end
  end
end
