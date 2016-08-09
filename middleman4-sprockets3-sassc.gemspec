# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'middleman4-sprockets3-sassc/version'

Gem::Specification.new do |spec|
  spec.name          = 'middleman4-sprockets3-sassc'
  spec.version       = Middleman4::Sprockets3::SassC::VERSION
  spec.authors       = ['Brad Chen']
  spec.email         = ['brad.chen@70ms.com']
  spec.homepage      = 'https://github.com/70mainstreet/middleman3-sassc'

  spec.summary       = %q{Use SassC with Middleman 4 and Sprockets 3.}
  spec.description   = %q{This gem lets you use SassC with Middleman 4 and Sprockets 3.}
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_runtime_dependency 'sassc', ['>= 1.7', '< 2']
  spec.add_runtime_dependency 'sassc-rails', ['>= 1.1', '< 2']
  spec.add_runtime_dependency 'middleman-core', '~> 4'
  spec.add_runtime_dependency 'middleman-sprockets', ['>= 4.0.0', '< 5']
  spec.add_runtime_dependency 'sprockets', '~> 3'
end