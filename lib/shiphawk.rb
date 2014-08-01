require 'shiphawk/version'
require 'shiphawk/client'
require 'shiphawk/configurable'

module Shiphawk
  class << self
    include Shiphawk::Configurable

    # Alias for Shiphawk::Client.new
    #
    # @return [Shiphawk::Client]
    def new(options={})
      Shiphawk::Client.new(options)
    end

    # Delegate to Shiphawk::Client
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    def respond_to?(method, include_private = false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end

  end
end

Shiphawk.setup
