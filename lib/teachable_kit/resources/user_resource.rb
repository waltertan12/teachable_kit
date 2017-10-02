require 'json'
require 'teachable_kit/models/user'

module TeachableKit
  class UserResource < BaseResource
    def sign_up(email:, password:, password_confirmation:)
      res = @connection.post do |req|
        req.url '/users.json'
        req.body = {
          user: {
            email: email,
            password: password,
            password_confirmation: password_confirmation
          }
        }.to_json
      end
      
      user_options = self.handle_response(res: res)

      User.new(user_options)
    end

    def sign_in(email:, password:)
      res = @connection.post do |req|
        req.url '/users/sign_in.json'
        req.body = {
          user: {
            email: email,
            password: password
          }
        }.to_json
      end

      user_options = self.handle_response(res: res)

      User.new(user_options)
    end

    def show_user(email:, token:)
      res = @connection.get do |req|
        req.url '/api/users/current_user/edit.json'
        req.params['user_email'] = email
        req.params['user_token'] = token
      end

      user_options = self.handle_response(res: res)

      User.new(user_options)
    end
  end
end

