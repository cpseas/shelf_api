class ResultService
  attr_reader :data, :errors

  def initialize(data, errors = [])
    @data = data
    @errors = errors
  end

  def has_errors?
    errors.empty?
  end
end
