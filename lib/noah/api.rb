require 'httparty'

module Noah
  class Api
    include HTTParty

    base_uri 'beta.noah.dost.gov.ph/api'

    class << self
      %w(doppler mtsat latest_contour cumulative_rainfall stations four_day_forecast four_hour_forecast).each do |endpoint|
        define_method endpoint do
          get "/#{endpoint}"
        end
      end
    end

  end
end
