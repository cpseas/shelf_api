require_relative '../dtos/base_dto'

class NovelDTO < BaseDTO
  attr_accessor :title, :synopsis, :user_id, :status, :published_date
end
