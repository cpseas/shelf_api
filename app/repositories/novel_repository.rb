class NovelRepository
  class << self
    def create(novel)
      res = Novel.new(
        title: novel.title,
        synopsis: novel.synopsis,
        user_id: novel.user_id,
        status: novel.status,
        published_date: novel.published_date
      )
      unless res.save
        return ResultService.new(nil, res.errors.messages)
      end
      ResultService.new(res)
    end

    def find_all
      res = Novel.all
      unless res
        return ResultService.new(nil, res.errors.messages)
      end
      ResultService.new(res)
    end

    def find_by_id(id)
      res = Novel.find(id)
      ResultService.new(res)
    end
  end
end
