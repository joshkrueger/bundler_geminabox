# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "bundler_geminabox/version"

Gem::Specification.new do |s|
  s.name        = "bundler_geminabox"
  s.version     = BundlerGeminabox::VERSION
  s.authors     = ["Josh Krueger"]
  s.email       = ["joshsinbox@gmail.com"]
  s.homepage    = "http://github.com/joshkrueger/bundler_geminabox"
  s.summary     = %q{Release internal gems}
  s.description = %q{Allows you to build/tag/push internal gems to a geminabox gem server with the same commands bundler's rake helpers provide. This just hijacks the process :)}

  s.rubyforge_project = "bundler_geminabox"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency  "geminabox"

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
