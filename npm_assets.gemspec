# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "npm_assets/version"

Gem::Specification.new do |s|
  s.name        = "npm_assets"
  s.version     = NpmAssets::VERSION
  s.authors     = ["Chris Nelson"]
  s.email       = ["chris@gaslightsoftware.com"]
  s.homepage    = ""
  s.summary     = %q{Adds your npm modules to your rails asset path}

  s.rubyforge_project = "npm_assets"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_dependency "rails", ">= 3.1"
end
