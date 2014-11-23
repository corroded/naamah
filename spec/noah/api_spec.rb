require 'spec_helper'

RSpec.describe Noah::Api do
  after do
    VCR.eject_cassette
  end

  describe '#doppler' do
    before do
      VCR.use_cassette 'doppler_data' do
        @doppler_data = Noah::Api.doppler
      end
    end

    it 'pulls doppler data from the project noah API' do
      expect(@doppler_data).to include('Baguio Station')
    end
  end
end
