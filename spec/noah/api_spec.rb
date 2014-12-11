require 'spec_helper'

RSpec.describe Noah::Api do
  after do
    VCR.eject_cassette
  end

  describe '.doppler' do
    before do
      record_api_call_for 'doppler'
    end

    it 'pulls doppler data from the project noah API' do
      expect(@api_response).to include('Baguio Station')
      expect(@api_response.code).to eq(200)
    end
  end

  describe '.mtsat' do
    before do
      record_api_call_for 'mtsat'
    end

    it 'should include all three types of mtsat images' do
      expect(@api_response).to include('MTSAT')
      expect(@api_response).to include('Processed MTSAT')
      expect(@api_response).to include('MTSAT VIS')
      expect(@api_response.code).to eq(200)
      expect(JSON.parse(@api_response).size).to eq(3)
    end
  end

  describe '.latest_contour' do
    before do
      record_api_call_for 'latest_contour'
    end

    it 'should have 4 contours: Temperature, Pressure, Humidity and Rainfall' do
      expect(@api_response).to include('Temperature Contour')
      expect(@api_response).to include('Pressure Contour')
      expect(@api_response).to include('Humidity Contour')
      expect(@api_response).to include('Rainfall Contour')
      expect(JSON.parse(@api_response).size).to eq(4)
    end
  end

  describe '.cumulative_rainfall' do
    before do
      record_api_call_for 'cumulative_rainfall'
    end

    it 'should have 4 timeframes of rainfall data' do
      expect(@api_response).to include('3-hour Rainfall')
      expect(@api_response).to include('6-hour Rainfall')
      expect(@api_response).to include('12-hour Rainfall')
      expect(@api_response).to include('24-hour Rainfall')
      expect(JSON.parse(@api_response).size).to eq(4)
    end
  end

  describe '.stations' do
    before do
      record_api_call_for 'stations'
    end

    it 'should have a list of weather stations that have the ff: coordinates, url, name, id' do
      sample_station = @json_data['stations'].first

      expect(sample_station['lat']).to_not be_nil
      expect(sample_station['lng']).to_not be_nil
      expect(sample_station['url']).to_not be_nil
      expect(sample_station['verbose_name']).to_not be_nil
      expect(sample_station['station_id']).to_not be_nil
    end
  end

  describe '.four_day_forecast' do
    before do
      record_api_call_for 'four_day_forecast'
    end

    it 'should have seven top level fields: last_update, source, location, lat, lng, icon, data' do
      expect(@json_data['lat']).to_not be_nil
      expect(@json_data['lng']).to_not be_nil
      expect(@json_data['last_update']).to_not be_nil
      expect(@json_data['source']).to_not be_nil
      # expect(@json_data['icon']).to_not be_nil commenting out bec we don't receive the icon field as of now 11/29/2014
      expect(@json_data['data']).to_not be_nil
      expect(@json_data['location']).to_not be_nil
    end
  end

  describe '.four_hour_forecast' do
    before do
      record_api_call_for 'four_hour_forecast'
    end

    it 'should have seven top level fields: last_update, source, location, lat, lng, icon, data' do
      expect(@json_data['lat']).to_not be_nil
      expect(@json_data['lng']).to_not be_nil
      expect(@json_data['last_update']).to_not be_nil
      expect(@json_data['source']).to_not be_nil
      # expect(@json_data['icon']).to_not be_nil commenting out bec we don't receive the icon field as of now 11/29/2014
      expect(@json_data['data']).to_not be_nil
      expect(@json_data['location']).to_not be_nil
    end
  end

  describe '.flood_maps' do
    before do
      record_api_call_for 'flood_maps'
    end

    it 'should have the type_id, verbose_name and layers fields' do
      expect(@json_data['type_id']).to_not be_nil
      expect(@json_data['verbose_name']).to_not be_nil
      expect(@json_data['layers']).to_not be_nil
    end
  end

  describe '.landslide_maps' do
    before do
      record_api_call_for 'landslide_maps'
    end

    it 'should have the type_id, verbose_name and layers fields' do
      expect(@json_data['type_id']).to_not be_nil
      expect(@json_data['verbose_name']).to_not be_nil
      expect(@json_data['layers']).to_not be_nil
    end
  end

  describe '.storm_surge_maps' do
    before do
      record_api_call_for 'storm_surge_maps'
    end

    it 'should have type_id, verbose_name and layers fields' do
      expect(@json_data['type_id']).to_not be_nil
      expect(@json_data['verbose_name']).to_not be_nil
      expect(@json_data['layers']).to_not be_nil
    end
  end

  describe '.muncities' do
    before do
      record_api_call_for 'muncities'
    end

    it 'should return a list of municipalities/cities which contain a name and psgc codes' do
      expect(@json_data['mun_city_psgc']).to_not be_nil
      expect(@json_data['province_psgc']).to_not be_nil
      expect(@json_data['region_psgc']).to_not be_nil
      expect(@json_data['verbose_name']).to_not be_nil
    end
  end

  describe '.provinces' do
    before do
      record_api_call_for 'provinces'
    end

    it 'should return a list of provinces which contain the name and psgc codes' do
      expect(@json_data['province_psgc']).to_not be_nil
      expect(@json_data['region_psgc']).to_not be_nil
      expect(@json_data['verbose_name']).to_not be_nil
    end
  end

  describe '.regions' do
    before do
      record_api_call_for 'regions'
    end

    it 'should return a list of regions which contain the name and psgc codes' do
      expect(@json_data['region_psgc']).to_not be_nil
      expect(@json_data['verbose_name']).to_not be_nil
    end
  end
end
