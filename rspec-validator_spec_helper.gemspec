# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec/validator_spec_helper/version'

Gem::Specification.new do |spec|
  spec.name          = "rspec-validator_spec_helper"
  spec.version       = RSpec::ValidatorSpecHelper::VERSION
  spec.authors       = ["Masayuki IZUMI"]
  spec.email         = ["masayuki@izumin.info"]
  spec.summary       = "Provide dummy class for validator spec"
  spec.homepage      = "https://github.com/izumin5210/rspec-validator_spec_helper"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rspec", "~> 3.0"
  spec.add_dependency "activemodel"
  spec.add_dependency "activesupport"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
