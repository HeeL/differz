# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'differ/version'

Gem::Specification.new do |spec|
  spec.name          = "differ"
  spec.version       = Differ::VERSION
  spec.authors       = ["HeeL"]
  spec.email         = ["parizhskiy@gmail.com"]
  spec.description   = %q{Compare two yaml-files and show the missing keys.}
  spec.summary       = %q{It shows the differences in keys of passed yaml-files.}
  spec.homepage      = "https://github.com/heel/differ"
  spec.license       = "MIT"
  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_runtime_dependency('gli','2.8.1')
  spec.bindir = 'bin'
  spec.executables << 'differ'
end
