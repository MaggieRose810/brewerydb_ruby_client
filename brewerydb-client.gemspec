# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'brewerydb/version'

Gem::Specification.new do |spec|
  spec.name          = "brewerydb-client"
  spec.version       = Brewerydb::VERSION
  spec.authors       = ["Maggie Rose"]
  spec.email         = ["maggie.rose.g@gmail.com"]

  spec.summary       = "Ruby client for BreweryDB API"
  spec.description   = "Support for premium features of the API avaiable"
  spec.homepage      = "https://github.com/MaggieRose810/brewerydb_ruby_client"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "webmock"

  spec.add_dependency "activesupport", ">= 4.0.0", "< 6"
  spec.add_dependency "recursive-open-struct"
end
