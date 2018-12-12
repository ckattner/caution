# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'caution/version'

Gem::Specification.new do |spec|
  spec.name          = 'caution'
  spec.version       = Caution::VERSION
  spec.authors       = ['Ryan Gerry']
  spec.email         = ['rgerry@bluemarblepayroll.com']

  spec.summary       = 'Essential general purpose Ruby error classes.'
  spec.description   = 'Provides several usefull error classes for common use-cases.'
  spec.homepage    = 'https://github.com/bluemarblepayroll/caution'
  spec.license     = 'MIT'

  spec.required_ruby_version = '>= 2.3'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
end
