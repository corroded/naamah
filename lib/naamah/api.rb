require 'httparty'
require 'pry'

module Naamah
  class Api
    include HTTParty

    base_uri 'noah.dost.gov.ph/api'

    class << self
      %w(doppler latest_contour cumulative_rainfall stations four_day_forecast four_hour_forecast flood_maps landslide_maps storm_surge_maps muncities provinces regions).each do |endpoint|
        define_method endpoint do
          get "/#{endpoint}"
        end
      end
    end

    def self.mtsat
      response = get '/mtsat'
      JSON.parse(response).map do |data|
        Naamah::SatelliteData.new(data)
      end
    end

  end
end
