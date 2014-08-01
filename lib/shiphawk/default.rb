require 'shiphawk/configurable'
require 'faraday_middleware'
require 'shiphawk/response'
require 'shiphawk/response/raise_error_on_failed_request'
require 'shiphawk/response/parse_shiphawk_response'

module Shiphawk
  module Default

    SANDBOX = true unless defined? SANDBOX
    ENDPOINT = begin
      if SANDBOX
        'https://sandbox.shiphawk.com/api/v1/'
      else
        'https://shiphawk.com/api/v1/'
      end
    end unless defined? ENDPOINT

    MIDDLEWARE = Faraday::Builder.new(
      &Proc.new do |builder|
        # Convert request params to json
        builder.use FaradayMiddleware::EncodeJson

        # Converts parsed response bodies to a Shiphawk::Response
        builder.use Shiphawk::Response::ParseShiphawkResponse

        # Raise Errors on Failed Requests from Shiphawk with Shiphawk::Error
        builder.use Shiphawk::Response::RaiseErrorOnFailedRequest, Shiphawk::Error

        # Parse JSON response bodies using MultiJson
        builder.use Faraday::Response::ParseJson

        # Set Faraday's HTTP adapter
        builder.adapter :net_http
      end
    )

    class << self

      def options
        Hash[Shiphawk::Configurable.keys.map{|key| [key, send(key)]}]
      end

      def api_key
        ENV['SHIPHAWK_API_KEY']
      end

      def endpoint
        ENDPOINT
      end

      def middleware
        MIDDLEWARE
      end

      def sandbox
        SANDBOX
      end

    end

  end
end
