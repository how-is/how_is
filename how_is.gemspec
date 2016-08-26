# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'how_is/version'

Gem::Specification.new do |spec|
  spec.name          = "how_is"
  spec.version       = HowIs::VERSION
  spec.authors       = ["Ellen Marie Dash"]
  spec.email         = ["me@duckie.co"]

  spec.summary       = %q{Quantify the health of a GitHub repository is.}
  spec.homepage      = "https://github.com/duckinator/how_is"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "github_api", "~> 0.14.5"
  spec.add_runtime_dependency "contracts", "~> 0.14.0"
  spec.add_runtime_dependency "slop", "~> 4.4.1"
  spec.add_runtime_dependency "prawn", "~> 2.1.0"

  spec.add_runtime_dependency "mini_magick", "~> 4.5.1"

  # Travis CI only supports up to Ruby 2.2.0, but Rack 2.0+ requires Ruby 2.2.2+,
  # so this pegs Rack to the latest version that works with Ruby 2.2.0.
  spec.add_runtime_dependency "rack", "< 2.0"

  spec.add_runtime_dependency "tessellator-fetcher", "~> 5.0.0"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 11.2"
  spec.add_development_dependency "rspec", "~> 3.5"
  spec.add_development_dependency "timecop", "~> 0.8.1"
end
