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
      return ResultService.new(res)
    end

    def find_all
      Genre.all
    end

    def find_by_id(id)
      genre = Genre.find(id)
      genre
    end
  end
end
