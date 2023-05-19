class ObjectCreator
  def self.create(class_name, *args)
    Object.const_get(class_name).new(*args)
  end
end
