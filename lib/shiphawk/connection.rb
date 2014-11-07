module Shiphawk
  module Connection

    private

      def connection(options = {})
        @connection ||= Faraday.new endpoint, { builder: @middleware }
      end

  end

end
