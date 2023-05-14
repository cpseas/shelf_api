require_relative '../dtos/base_dto'

class ThemeDTO < BaseDTO
  attr_accessor :name, :description, :active
end
