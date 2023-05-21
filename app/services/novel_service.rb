require_relative '../repositories/novel_repository'

class NovelService
  def self.create(novel_dto)
    genres = GenreRepository.find_by_ids(novel_dto['genres'])
    themes = ThemeRepository.find_by_ids(novel_dto['themes'])
    new_novel = NovelCreator.create(novel.except('genres', 'themes'))
    new_novel.genres = genres
    new_novel.themes = themes
    NovelRepository.create(new_novel)
  end

  def self.find_all
    NovelRepository.find_all
  end

  def self.find_by_id(id)
    NovelRepository.find_by_id(id)
  end
end
