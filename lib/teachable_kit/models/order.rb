module TeachableKit
  class Order < BaseModel
    attr_accessor :number, :total, :total_quantity, :email, :special_instructions
  end
end
