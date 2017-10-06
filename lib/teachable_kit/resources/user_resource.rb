require 'json'
require 'teachable_kit/models/user'

module TeachableKit
  class UserResource < BaseResource
    def get
      res = @connection.get do |req|
        req.url '/api/users/current_user/edit.json'
        req.params['user_email'] = @user.email
        req.params['user_token'] = @user.tokens
      end

      user_options = self.handle_response(res: res)

      User.new(user_options)
    end
  end
end

