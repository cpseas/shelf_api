class NovelRepository
  class << self
    def create(novel_dto)
      new_novel = ObjectCreator.create_object('Novel', novel_dto)
      if new_novel.save
        ResultService.new(new_novel)
      else
        ResultService.new(nil, new_novel.errors.messages)
      end
    end

    def find_all
      novels = Novel.all
      ResultService.new(novels)
    end

    def find_by_id(id)
      novel = Novel.find_by(id: id)
      if novel.nil?
        ResultService.new(nil)
      end
      ResultService.new(novel)
    end
  end
end
