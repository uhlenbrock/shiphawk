require 'shiphawk/configurable'
require 'shiphawk/connection'
require 'shiphawk/request'
require 'shiphawk/response'
require 'shiphawk/error'

module Shiphawk
  class API

    include Shiphawk::Configurable
    include Connection
    include Request

    # Creates a new API
    def initialize(options={})
      Shiphawk::Configurable.keys.each do |key|
        instance_variable_set :"@#{key}", options[key] || Shiphawk.instance_variable_get(:"@#{key}")
      end
    end

  end
end
