class ObjectCreator
  def self.create_object(class_name, *args)
    Object.const_get(class_name).new(*args)
  end
end
