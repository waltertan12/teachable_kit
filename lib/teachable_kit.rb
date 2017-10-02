require "teachable_kit/version"

module TeachableKit
  autoload :Client, 'teachable_kit/client'

  # Models
  autoload :BaseModel, 'teachable_kit/models/base_model'
  autoload :User, 'teachable_kit/models/user'
  autoload :Order, 'teachable_kit/models/order'

  # Resources
  autoload :BaseResource, 'teachable_kit/resources/base_resource'
  autoload :UserResource, 'teachable_kit/resources/user_resource'
  autoload :OrderResource, 'teachable_kit/resources/order_resource'

  # Errors
  Error = Class.new(StandardError)
end
