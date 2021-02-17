class SalonsController < ApplicationController
    def index
        # @salons = Salon.all
        @salons = policy_scope(Salon)
        # the `geocoded` scope filters only salons with coordinates (latitude & longitude)
        @markers = @salons.geocoded.map do |salon|
          {
            lat: salon.latitude,
            lng: salon.longitude
          }
        end
      end
end
