module Shiphawk
  class Client
    module Order

      # Request a shipment
      def request(rate_id, options={})
        get "orders/#{rate_id}/request"
      end

    end
  end
end
