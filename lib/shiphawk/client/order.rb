module Shiphawk
  class Client
    module Order

      # Book a shipment
      def book_shipment(rate_id, options={})
        post "orders/#{rate_id}/request", options
      end

    end
  end
end
