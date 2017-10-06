require 'json'

module TeachableKit
  class BaseResource
    include TeachableKit::Utils

    def initialize(connection:, user:)
      @connection = connection
      @user = user
    end
  end
end
