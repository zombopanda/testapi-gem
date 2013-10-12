# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'testapi/version'

Gem::Specification.new do |spec|
  spec.name          = "testapi"
  spec.version       = Testapi::VERSION
  spec.authors       = ["bo"]
  spec.email         = ["zombopanda@gmail.com"]
  spec.description   = 'test api gem description'
  spec.summary       = 'test api gem description'
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "fakeweb"
  spec.add_runtime_dependency "httparty"
end
