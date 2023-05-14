require_relative '../repositories/genre_repository'

class GenreService
  def self.create(genre_dto)
    genre = Genre.new(genre_dto.to_h)
    GenreRepository.create(genre)
  end
end
