module Shiphawk
  class Client
    module Shipment

      # Subscribe to a shipment for tracking
      def track_shipment(options={})
        post 'shipments/subscribe', options
      end

      # Get status history for a shipment
      def shipment_status(shipment_id)
        get 'shipments/tracking/status', { shipment_id: shipment_id }
      end

    end
  end
end
