class GenreRepository
  class << self
    def create(genre)
      res = Genre.new(
        name: genre.name,
        description: genre.description,
        active: genre.active,
      )
      unless res.save
        return ResultService.new(nil, res.errors.messages)
      end
      ResultService.new(res)
    end

    def find_all
      res = Genre.all
      unless res
        return ResultService.new(nil, res.errors.messages)
      end
      ResultService.new(res)
    end

    def find_by_id(id)
      res = Genre.find(id)
      ResultService.new(res)
    end
  end
end
