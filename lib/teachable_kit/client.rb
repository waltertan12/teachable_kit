require 'faraday'

module TeachableKit
  class Client
    BASE_URL = "https://fast-bayou-75985.herokuapp.com/" 

    def self.resources
      {
        users: UserResource,
        orders: OrderResource
      }
    end

    def method_missing(name, *args, &block)
      if self.class.resources.keys.include?(name)
        p self.class.resources[name]
        resources[name] ||= self.class.resources[name].new(connection: connection)
        resources[name]
      else
        super
      end
    end

    def resources
      @resources ||= {}
    end

    def connection
      @faraday ||= Faraday.new connection_options do |req|
        req.adapter :net_http
      end
    end

    private

    def connection_options
      {
        url: BASE_URL,
        headers: {
          content_type: 'application/json',
          accept: 'application/json'
        }
      }
    end
  end
end
