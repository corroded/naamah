require 'pry'
require 'vcr'
require 'json'

require_relative '../lib/noah/api'

#VCR config
VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/cassettes'
  c.hook_into :webmock
end
