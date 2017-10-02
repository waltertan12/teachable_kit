require 'json'

module TeachableKit
  class BaseResource
    def initialize(connection:)
      @connection = connection
    end

    def handle_response(res:)
      if (200...299).include?(res.status)
        JSON.parse(res.body)
      else
        raise TeachableKit::Error.new("Status: #{res.status}, Body: #{res.body}")
      end
    end
  end
end
