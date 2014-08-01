require 'faraday'
require 'shiphawk/response'

module Shiphawk
  class Response::ParseShiphawkResponse < Faraday::Response::Middleware

    class << self
      attr_accessor :response_class
    end

    self.response_class = Shiphawk::Response

    def parse(body)
      self.class.response_class.new body
    end

  end
end
