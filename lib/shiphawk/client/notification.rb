module Shiphawk
  class Client
    module Notification

      # Publish catalog sale
      def publish_catalog_sale(options={})
        post "notifications/catalog_sale", options
      end
      
    end
  end
end
