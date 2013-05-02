# -*- encoding: utf-8 -*-
require File.expand_path("../lib/fkapi/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "fkapi"
  s.version     = Fkapi::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Moises Beltran"]
  s.email       = []
  s.homepage    = "https://github.com/bmoises/fkapi"
  s.summary     = "Simple lib to fake API responses"
  s.description = "TODO: Write a gem description"

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "fkapi"

  s.add_development_dependency "bundler", ">= 1.0.0"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
