require_relative '../repositories/genre_repository'

class GenreService
  def self.create(genre_dto)
    new_genre = ObjectCreator.create('Genre', genre_dto.to_h)
    GenreRepository.create(new_genre)
  end

  def self.find_all
    GenreRepository.find_all
  end

  def self.find_by_id(id)
    GenreRepository.find_by_id(id)
  end
end
