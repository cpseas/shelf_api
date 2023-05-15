require_relative '../repositories/novel_repository'

class NovelService
  def self.create(novel_dto)
    novel = Novel.new(novel_dto.to_h)
    NovelRepository.create(novel)
  end

  def self.find_all
    NovelRepository.find_all
  end

  def self.find_by_id(id)
    NovelRepository.find_by_id(id)
  end
end
