module Shiphawk
  class Client
    module Shipment

      # Subscribe to a shipment for tracking
      def track_shipment(options={})
        post 'shipments/subscribe', options
      end

    end
  end
end
