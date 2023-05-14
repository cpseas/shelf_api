class BaseDTO
  def initialize(params)
    params.each do |attr, value|
      send("#{attr}=", value) if respond_to?("#{attr}=")
    end
  end

  def valid?
    instance_variables.all? { |t| instance_variable_get(t).present?}
  end

  def to_h
    hash = {}
    instance_variables.each { |t| hash[t.to_s.delete('@')] = instance_variable_get(t) }
    hash
  end
end
