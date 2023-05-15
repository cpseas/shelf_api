require_relative '../repositories/novel_repository'

class NovelService
  def self.create(novel_dto)
    NovelRepository.create(novel_dto)
  end

  def self.find_all
    NovelRepository.find_all
  end

  def self.find_by_id(id)
    NovelRepository.find_by_id(id)
  end
end
