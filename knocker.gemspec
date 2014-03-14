# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'knocker/version'

Gem::Specification.new do |spec|
  spec.name          = "knocker"
  spec.version       = Knocker::VERSION
  spec.authors       = ["Robert McLeod"]
  spec.email         = ["robert@penguinpower.co.nz"]
  spec.summary       = %q{Uses stored config to knocks on knock daemons}
  spec.description   = %q{Uses a config file to knock on a host and execute command(s), tries to mimic .ssh/config function}
  spec.homepage      = "https://github.com/penguinpowernz/knocker"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
