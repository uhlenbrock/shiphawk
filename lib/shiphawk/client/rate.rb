module Shiphawk
  class Client
    module Rate

      FROM_TYPES   = %w[tradeshow construction_site limited_access terminal commercial residential]
      TO_TYPES     = %w[tradeshow construction_site limited_access terminal commercial residential]
      RATE_FILTERS = %w[min_rate fastest top_10]

      # Options: packed, from_type, from_zip, to_type, to_zip, carriers, rate_filter,
      #          items: [xid, id, height, width, length, height, weight, value]

      # returns least expensive rate
      def get_min_rate(options={})
        post 'rates', options.merge(rate_filter: 'min_rate')
      end

      # returns fastest rate
      def get_fastest_rate(options={})
        post 'rates', options.merge(rate_filter: 'fastest')
      end

      # returns all rates with cost breakdown
      def get_rates(options={})
        post 'rates/full', options
      end

    end
  end
end
