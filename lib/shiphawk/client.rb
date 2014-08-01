require 'shiphawk/api'

module Shiphawk
  class Client < API

    # Require client method modules after initializing the Client class in
    # order to avoid a superclass mismatch error, allowing those modules to be
    # Client-namespaced.
    require 'shiphawk/client/item'
    require 'shiphawk/client/order'
    require 'shiphawk/client/rate'
    require 'shiphawk/client/shipment'

    include Shiphawk::Client::Item
    include Shiphawk::Client::Order
    include Shiphawk::Client::Rate
    include Shiphawk::Client::Shipment

  end
end
