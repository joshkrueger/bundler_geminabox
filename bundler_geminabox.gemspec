# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "bundler_geminabox/version"

Gem::Specification.new do |gem|
  gem.name        = "bundler_geminabox"
  gem.version     = BundlerGeminabox::VERSION
  gem.authors     = ["Josh Krueger"]
  gem.email       = ["joshsinbox@gmail.com"]
  gem.homepage    = "http://github.com/joshkrueger/bundler_geminabox"
  gem.summary     = %q{Release internal gems}
  gem.description = %q{Allows you to build/tag/push internal gems to a geminabox gem server with the same commands bundler's rake helpers provide. This just hijacks the process :)}

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "bundler"
  gem.add_dependency "geminabox"
end
