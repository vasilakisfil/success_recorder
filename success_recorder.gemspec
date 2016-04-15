# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'success_recorder/version'

Gem::Specification.new do |spec|
  spec.name          = "success_recorder"
  spec.version       = SuccessRecorder::VERSION
  spec.authors       = ["Filippos Vasilakis"]
  spec.email         = ["vasilakisfil@gmail.com"]

  spec.summary       = %q{A gem that helps you to track success/failure ratios. Uses Redis.}
  spec.description   = %q{A gem that helps you to track success/failure ratios. Uses Redis.}
  spec.homepage      = "https://github.com/vasilakisfil/success_recorder"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "redis-objects", "~> 1.2"

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.4"
  spec.add_development_dependency "fakeredis", "~> 0.5"
end
