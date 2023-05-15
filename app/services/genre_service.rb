require_relative '../repositories/genre_repository'

class GenreService
  def self.create(genre_dto)
    genre = Genre.new(genre_dto.to_h)
    GenreRepository.create(genre)
  end

  def self.find_all
    GenreRepository.find_all
  end

  def self.find_by_id(id)
    GenreRepository.find_by_id(id)
  end
end
