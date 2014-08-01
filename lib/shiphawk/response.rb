require 'hashie'

module Shiphawk
  class Response

    attr_reader :response

    class << self
      attr_accessor :mash_class
    end

    self.mash_class = Hashie::Mash

    def initialize(response)
      @response = mashify response
    end

    def method_missing(name, *arguments, &block)
      @data.send name, *arguments, &block
    end

    def mashify(body)
      case body
      when Hash
        self.class.mash_class.new(body)
      when Array
        body.map { |item| mashify item }
      else
        body
      end
    end

  end
end
