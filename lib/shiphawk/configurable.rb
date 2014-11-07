require 'shiphawk/default'

module Shiphawk
  module Configurable

    attr_writer :api_key, :sandbox
    attr_accessor :middleware

    class << self

      def keys
        @keys ||= [
          :api_key,
          :sandbox,
          :middleware
        ]
      end

    end

    def configure
      yield self
    end

    # @return [Boolean]
    def credentials?
      credentials.values.all?
    end

    def sandbox?
      @sandbox == true
    end

    def reset!
      Shiphawk::Configurable.keys.each do |key|
        instance_variable_set :"@#{key}", Shiphawk::Default.options[key]
      end
      self
    end
    alias setup reset!

    private

      # @return [Hash]
      def credentials
        { api_key: @api_key }
      end

      # @return [String]
      def endpoint
        if sandbox?
          'https://sandbox.shiphawk.com/api/v1/'
        else
          'https://shiphawk.com/api/v1/'
        end
      end

  end
end
