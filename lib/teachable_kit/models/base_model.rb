module TeachableKit
  class BaseModel
    attr_accessor :id, :created_at, :updated_at

    def initialize(options={})
      options.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end
  end
end
