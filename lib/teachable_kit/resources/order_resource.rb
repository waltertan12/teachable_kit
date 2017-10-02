require 'json'

module TeachableKit
  class OrderResource < BaseResource
    def place_order(user:, total:, total_quantity:, special_instructions: nil)
      res = @connection.post do |req|
        req.url '/api/orders.json'
        req.params['user_email'] = user.email
        req.params['user_token'] = user.tokens
        req.body = {
          order: {
            total: total,
            total_quantity: total_quantity,
            email: user.email,
            special_instructions: special_instructions
          }
        }.to_json
      end

      order_options = self.handle_response(res: res)

      Order.new(order_options)
    end

    def get_orders(user:)
      res = @connection.get do |req|
        req.url '/api/orders.json'
        req.params['user_email'] = user.email
        req.params['user_token'] = user.tokens
      end

      orders = self.handle_response(res: res)

      orders.map { |order| Order.new(order) }
    end

    def delete_order(user:, order_id:)
      res = @connection.delete do |req|
        req.url "/api/orders/#{order_id}.json"
        req.params['user_email'] = user.email
        req.params['user_token'] = user.tokens
      end

      nil
    end
  end
end
