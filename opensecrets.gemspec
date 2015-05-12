# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'opensecrets/version'

Gem::Specification.new do |s|
  s.name              = "opensecrets"
  s.version           = OpenSecrets::VERSION
  s.platform          = Gem::Platform::RUBY
  s.authors           = ["Glenn Rempe"]
  s.email             = ["glenn@rempe.us"]
  s.homepage          = "http://github.com/grempe/opensecrets"
  s.summary           = %q{OpenSecrets.org API Ruby Wrapper}
  s.license           = "MIT"

  s.has_rdoc          = 'true'
  s.extra_rdoc_files  = ['README.md']

  s.rubyforge_project = "opensecrets"

  s.files             = `git ls-files`.split($/)
  s.executables       = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files        = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths     = ["lib"]

  s.add_dependency 'httparty', '~> 0.13.3'
  s.add_development_dependency 'yard'

  s.description = "OpenSecrets are the best kind. Created as a community service as requested by the Sunlight Foundation."

end
