require 'faraday'
require 'json'

module TeachableKit
  class Client
    include TeachableKit::Utils

    BASE_URL = "https://fast-bayou-75985.herokuapp.com/" 

    def self.resources
      {
        users: UserResource,
        orders: OrderResource
      }
    end

    def sign_up(email:, password:, password_confirmation:)
      res = connection.post do |req|
        req.url '/users.json'
        req.body = {
          user: {
            email: email,
            password: password,
            password_confirmation: password_confirmation
          }
        }.to_json
      end

      user_options = handle_response(res: res)

      @user = User.new(user_options)

      reset_connection(user: @user)

      @user
    end

    def sign_in(email:, password:)
      res = connection.post do |req|
        req.url '/users/sign_in.json'
        req.body = {
          user: {
            email: email,
            password: password
          }
        }.to_json
      end

      user_options = handle_response(res: res)

      @user = User.new(user_options)

      reset_connection(user: @user)

      @user
    end

    def method_missing(name, *args, &block)
      if self.class.resources.keys.include?(name)
        resources[name] ||= self.class.resources[name].new(connection: connection, user: @user)
        resources[name]
      else
        super
      end
    end

    def resources
      @resources ||= {}
    end

    def reset_connection(user: user)
      resources.each do |name, resource|
        resources[name] = self.class.resources[name].new(connection: connection, user: user)
      end
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
