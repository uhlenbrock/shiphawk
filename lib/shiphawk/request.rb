module Shiphawk
  module Request

    # Perform an HTTP GET request
    def get(path, options={})
      request :get, path, options
    end

    # Perform an HTTP POST request
    def post(path, options={})
      request :post, path, options
    end

    private

      # Perform an HTTP request
      def request(method, path, options)
        if credentials?
          connection.params.merge! api_key: credentials[:api_key]
        end

        connection.url_prefix = @endpoint
        response = connection.send(method) do |request|
          case method.to_sym
          when :get, :delete
            request.url path, options
          when :post, :put
            request.path = path
            request.body = options
          end
        end

        response.body
      end

  end
end
