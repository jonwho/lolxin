# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lolxin/helpers/version'

Gem::Specification.new do |spec|
  spec.name          = "lolxin"
  spec.version       = Lolxin::VERSION
  spec.authors       = ["Jon Ho"]
  spec.email         = ["jonwho.contact@gmail.com"]

  spec.summary       = %q{Smooth API wrapper for League of Legends}
  spec.description   = %q{Savage memes can't melt playoff dreams}
  spec.homepage      = 'https://github.com/jonwho/lolxin'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'dotenv'
  spec.add_development_dependency 'factory_girl', '~> 4.0'
  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'codeclimate-test-reporter'
  spec.add_development_dependency 'simplecov'

  spec.add_runtime_dependency 'faraday'
  spec.add_runtime_dependency 'json'
end
