
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "watodo/version"

Gem::Specification.new do |spec|
  spec.name          = "watodo"
  spec.version       = Watodo::VERSION
  spec.authors       = ["zorori777"]
  spec.email         = ["e2fde7ded7anxbne05se@yahoo.co.jp"]

  spec.summary       = %q{Todo management tool created by Perefect Ruby Team.}
  spec.description   = %q{Todo management tool}
  spec.homepage      = "http://gihyo.jp/"

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
  spec.files         = Dir.glob("**/*").select{|path| !(path =~ /^doc|^pkg/)}
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency  "activerecord", "~> 5.2.1"
  spec.add_dependency  "sqlite3", "~> 1.3"
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "yard", "~> 0.9"
end
