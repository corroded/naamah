require 'pry'
require 'vcr'
require 'json'

require_relative '../lib/noah/api'

#VCR config
VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/cassettes'
  c.hook_into :webmock
end

def record_api_call_for(method_name)
  VCR.use_cassette method_name do
    @api_response = Noah::Api.send(method_name)
  end
end
