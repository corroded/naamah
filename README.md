Naamah
====

A Ruby wrapper for Project Noah's API

## Installation

    $ gem install naamah

or if you're using Bundler, add this to your Gemfile

    gem 'naamah'

## Usage

All commands are based on the API endpoint names. You can check out the API [here](http://beta.noah.dost.gov.ph/apidocs/index.html).

These are the current (v1.0) commands that are available:

* doppler
* mtsat
* latest_contour
* cumulative_rainfall
* stations
* four_day_forecast
* four_hour_forecast
* flood_maps
* landslide_maps
* storm_surge_maps
* muncities
* provinces
* regions

So for example, you want to get a list of regions, simply do:

    Naamah::Api.regions

This will give you an HTTParty response object that can then easily be converted to a JSON object:

    json_response = JSON.parse(Naamah::Api.doppler)
    # [{"url"=>"http://climatex.dost.gov.ph/img/latestBAG.png", "verbose_name"=>"Baguio Station", "extent"=>[118.6529, 14.5471, 122.2565, 18.1507], "size"=>[622, 622]}, {"url"=>"http://climatex.dost.gov.ph/img/latestSUB.png", "verbose_name"=>"Subic Station", "extent"=>[118.4619, 13.0203, 122.0655, 16.6239], "size"=>[622, 622]}, {"url"=>"http://climatex.dost.gov.ph/img/latestTAG.png", "verbose_name"=>"Tagaytay Station", "extent"=>[119.1204, 12.3403, 122.724, 15.944], "size"=>[622, 622]}, {"url"=>"http://climatex.dost.gov.ph/img/latestCEB.png", "verbose_name"=>"Cebu Station", "extent"=>[122.0784, 8.5208, 125.682, 12.1244], "size"=>[622, 622]}, {"url"=>"http://climatex.dost.gov.ph/img/latestHIN.png", "verbose_name"=>"Hinatuan Station", "extent"=>[124.4367, 6.5655, 128.0403, 10.1691], "size"=>[622, 622]}, {"url"=>"http://climatex.dost.gov.ph/img/latestTAM.png", "verbose_name"=>"Tampakan Station", "extent"=>[123.1206, 4.6189, 126.7406, 8.2161], "size"=>[622, 622]}, {"url"=>"http://climatex.dost.gov.ph/img/latestAPA.png", "verbose_name"=>"Aparri Station", "extent"=>[119.645, 16.551389, 123.435, 20.148611], "size"=>[622, 622]}, {"url"=>"http://climatex.dost.gov.ph/img/latestVIR.png", "verbose_name"=>"Virac Station", "extent"=>[122.37944, 11.821389, 126.080556, 15.418611], "size"=>[622, 622]}, {"url"=>"http://climatex.dost.gov.ph/img/latestBAL.png", "verbose_name"=>"Baler Station", "extent"=>[119.695, 13.925, 123.405, 17.562], "size"=>[622, 622]}]

## TODO:

- Create a CLI
