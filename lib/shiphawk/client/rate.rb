module Shiphawk
  class Client
    module Rate

      FROM_TYPES   = %w[tradeshow construction_site limited_access terminal commercial residential]
      TO_TYPES     = %w[tradeshow construction_site limited_access terminal commercial residential]
      RATE_FILTERS = %w[min_rate fastest top_10]

      # Options: packed, from_type, from_zip, to_type, to_zip, carriers, rate_filter,
      #          items: [xid, id, height, width, length, height, weight, value]

      # Get lowest cost rate
      def get_min_rate(options={})
        post 'rates', options.merge(rate_filter: 'min_rate')
      end

      def get_fastest_rate(options={})
        post 'rates', options.merge(rate_filter: 'fastest')
      end

      # Get all rates
      def get_rates(options={})
        post 'rates/full', options
      end

    end
  end
end
