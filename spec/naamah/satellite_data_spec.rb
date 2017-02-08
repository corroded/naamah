require 'spec_helper'

RSpec.describe Naamah::SatelliteData do
  subject(:satellite_data) { described_class.new(data) }

  describe '.initialize' do
    let(:data) do
      {
        'url' => 'http://climatex.dost.gov.ph/himawari/noah/hima_simple_trans_13.png',
        'verbose_name' => 'Satellite Image (Himawari)',
        'extent' => [100.0, 4.85, 160.0, 29.85],
        'size' => [800, 334]
      }
    end

    it { expect(satellite_data).to have_attributes(data) }
  end
end
