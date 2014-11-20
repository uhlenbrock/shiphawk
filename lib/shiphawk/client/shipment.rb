module Shiphawk
  class Client
    module Shipment

      # Subscribe to a shipment for tracking
      def track_shipment(shipment_id, options={})
        post "shipments/#{shipment_id}/subscribe", options
      end

      # Get status history for a shipment
      def shipment_status(shipment_id)
        get 'shipments/tracking/status', { shipment_id: shipment_id }
      end

      # Book a shipment
      def book_shipment(options={})
        post "shipments/book", options
      end

      # Cancel shipment
      def cancel_shipment(shipment_id)
        put "shipments/#{shipment_id}/cancel"
      end

      # Update a shipment
      # OPTIONS: to_address_attributes, billing_address_attributes
      # NOTE: If you need to change the City, State or Zip or Location Type for
      # the Destination Address, you should Cancel the shipment and book a new one.
      def update_shipment(shipment_id, options={})
        put "shipments/#{shipment_id}", options
      end

    end
  end
end
