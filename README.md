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

    Noah::Api.regions

## TODO:

- Create a CLI
