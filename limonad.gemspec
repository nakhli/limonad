# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$:.unshift lib unless $:.include?(lib)
require 'limonad/version'

Gem::Specification.new do |spec|
  spec.name          = 'limonad'
  spec.version       = LiMonad::VERSION
  spec.authors       = ['Chaker Nakhli']
  spec.email         = ['chaker.nakhli@sinbadsoft.com']
  spec.summary       = %q{A tiny Monad library.}
  spec.description   = %q{A tiny Monad library.}
  spec.homepage      = 'https://github.com/nakhli/limonad'
  spec.license       = 'MIT'

  spec.files         = Dir.glob('{bin,lib}/**/*') + %w(Rakefile LICENSE.txt README.md)
  spec.test_files    = Dir.glob('spec/**/*')
  spec.rdoc_options  = ['--charset=UTF-8']
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.0.0'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.1'
end
