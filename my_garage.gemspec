
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "my_garage/version"

Gem::Specification.new do |spec|
  spec.name          = "my_garage"
  spec.version       = MyGarage::VERSION
  spec.authors       = ["bacrossland"]
  spec.email         = ["bacrossland@gmail.com"]

  spec.summary       = %q{A multi-threaded Ruby application for racing cars.}
  spec.description   = %q{A multi-threaded Ruby application for racing cars.}
  spec.homepage      = "https://github.com/bacrossland/my_garage"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
