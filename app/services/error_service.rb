class ErrorService
  def self.invalid_data(model)
    { message: "Invalid #{model} data" }
  end

  def self.failed_to_create(model)
    { message: "Failed to create #{model}" }
  end

  def self.not_found(model)
    { message: "#{model} not found!" }
  end
end
