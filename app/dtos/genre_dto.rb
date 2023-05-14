require_relative '../dtos/base_dto'

class GenreDTO < BaseDTO
  attr_accessor :name, :description, :active
end
