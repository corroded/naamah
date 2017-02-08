module Naamah
  class SatelliteData
    attr_reader :url, :verbose_name, :extent, :size

    def initialize(data)
      @url = data.dig('url')
      @verbose_name = data.dig('verbose_name')
      @extent = data.dig('extent')
      @size = data.dig('size')
    end
  end
end
