# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'naamah/version'

Gem::Specification.new do |spec|
  spec.name          = 'naamah'
  spec.version       = Naamah::VERSION
  spec.authors       = ['Eumir Gaspar']
  spec.email         = ['eumir@aelogica.com']
  spec.summary       = %q{A Ruby wrapper for the Project Noah API}
  spec.description   = %q{A Ruby wrapper for the Project Noah (http://beta.noah.dost.gov.ph/apidocs/index.html) API}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'httparty', '~> 0.14'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake', '~> 10.5'
  spec.add_development_dependency 'rspec', '~> 3.5'
  spec.add_development_dependency 'webmock', '~> 1.24'
  spec.add_development_dependency 'vcr', '~> 2.9'
  spec.add_development_dependency 'pry', '~> 0.10'
  spec.add_development_dependency 'simplecov', '~> 0.13'
end
