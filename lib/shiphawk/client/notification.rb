module Shiphawk
  class Client
    module Notification

      # Publish catalog sale
      def publish_catalog_sale(options={})
        post "notifications/catalog_sale", options
      end

      # Update catalog sale
      def update_catalog_sale(sale_xid, options={})
        put "/catalog_sales/#{sale_xid}/pickup_times", options
      end

    end
  end
end
