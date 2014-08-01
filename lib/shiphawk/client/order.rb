module Shiphawk
  class Client
    module Order

      # Book a shipment
      def book_shipment(options={})
        post "shipments/book", options
      end

    end
  end
end
