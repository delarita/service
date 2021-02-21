class SalonsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

    def index
      @salons = policy_scope(Salon)

      # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
      @markers = @salons.geocoded.map do |salon|
        {
          lat: salon.latitude,
          lng: salon.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { salon: salon })
        }
        end
    end
end
