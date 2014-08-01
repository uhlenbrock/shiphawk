require 'faraday'
require 'shiphawk/error'

module Shiphawk
  class Response::RaiseErrorOnFailedRequest < Faraday::Response::Middleware

    def on_complete(env)
      if env[:body] && ! (200..299).include?(env[:status].to_i)
        error_code = env[:status].to_i
        message    = env[:response_headers]['status']

        raise @klass.new(error_code, message)
      end
    end

    def initialize(app, klass)
      @klass = klass
      super(app)
    end

  end
end
