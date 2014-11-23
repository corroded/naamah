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
      expect(@doppler_data.code).to eq(200)
    end
  end

  describe '#mtsat' do
    before do
      VCR.use_cassette 'mtsat_data' do
        @mtsat_data = Noah::Api.mtsat
      end
    end

    it 'should include all three types of mtsat images' do
      expect(@mtsat_data).to include('MTSAT')
      expect(@mtsat_data).to include('Processed MTSAT')
      expect(@mtsat_data).to include('MTSAT VIS')
      expect(@mtsat_data.code).to eq(200)
      expect(JSON.parse(@mtsat_data).size).to eq(3)
    end
  end
end
