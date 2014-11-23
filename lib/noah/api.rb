require 'httparty'

module Noah
  class Api
    include HTTParty

    base_uri 'beta.noah.dost.gov.ph/api'

    def self.doppler
      get '/doppler'
    end

    def self.mtsat
      get '/mtsat'
    end
  end
end
