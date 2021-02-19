class SalonsController < ApplicationController
  def index
    @salons = policy_scope(Salon)

    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @salons.geocoded.map do |salon|
      {
        lat: salon.latitude,
        lng: salon.longitude
      }
    end
  end
end
