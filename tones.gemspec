# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tones/version'

Gem::Specification.new do |gem|
  gem.name          = "tones"
  gem.version       = Tones::VERSION
  gem.authors       = ["Lex Childs"]
  gem.email         = ["lexchilds@gmail.com"]
  gem.description   = %q{tones events}
  gem.summary       = %q{tones events}
  gem.homepage      = ""

  dependencies = %w'wavefile'
  dependencies.each do |d|
    gem.add_dependency d
  end

  dependencies = %w'rake minitest pry'
  dependencies.each do |d|
    gem.add_development_dependency d
  end

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
