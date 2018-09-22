
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "made_to_measure/version"

Gem::Specification.new do |spec|
  spec.name          = "made_to_measure"
  spec.version       = MadeToMeasure::VERSION
  spec.authors       = ["Dan Garland"]
  spec.email         = ["dan@dangarland.co.uk"]

  spec.summary       = %q{Wrapper to Google Analytics Measurement Protoocol}
  spec.description   = %q{Because I googled for 10 minutes and couldn't find anything, and the official one looked like the entire kitchen sink.}
  spec.homepage      = "https://github.com/dmgarland/made-to-measure"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "pry-byebug"
  spec.add_dependency "httparty"
end
