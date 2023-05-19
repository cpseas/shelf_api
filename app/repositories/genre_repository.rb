class GenreRepository
  class << self
    def create(new_genre)
      if new_genre.save
        ResultService.new(new_genre)
      else
        ResultService.new(nil, new_genre.errors.messages)
      end
    end

    def find_all
      genres = Genre.all
      ResultService.new(genres)
    end

    def find_by_id(id)
      genre = Genre.find_by(id: id)
      if genre.nil?
        ResultService.new(nil)
      end
      ResultService.new(genre)
    end
  end
end
