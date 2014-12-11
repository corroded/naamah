require 'httparty'

module Naamah
  class Api
    include HTTParty

    base_uri 'beta.noah.dost.gov.ph/api'

    class << self
      %w(doppler mtsat latest_contour cumulative_rainfall stations four_day_forecast four_hour_forecast flood_maps landslide_maps storm_surge_maps muncities provinces regions).each do |endpoint|
        define_method endpoint do
          get "/#{endpoint}"
        end
      end
    end

  end
end
