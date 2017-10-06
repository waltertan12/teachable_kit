module TeachableKit
  module Utils
    def handle_response(res:)
      if res.status == 204
        nil
      elsif (200...299).include?(res.status)
        JSON.parse(res.body)
      else
        raise TeachableKit::Error.new("Status: #{res.status}, Body: #{res.body}")
      end
    end
  end
end
