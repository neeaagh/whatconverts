# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'whatconverts/version'

Gem::Specification.new do |spec|
  spec.name          = "whatconverts"
  spec.version       = Whatconverts::VERSION
  spec.authors       = ["Joe Giancaspro"]
  spec.email         = ["neeaagh@gmail.com"]

  spec.summary       = %q{A Ruby gem for interacting with the WhatConverts API.}
  spec.description   = %q{A Ruby gem for interacting with the WhatConverts API.}
  spec.homepage      = "https://whatconverts.com/api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~>3.5"
  spec.add_development_dependency "pry", "~>0.10"
  spec.add_development_dependency "webmock", "2.1"

  spec.add_dependency "faraday", "~> 0.9"
end
