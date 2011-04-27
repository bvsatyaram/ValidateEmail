# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ValidateEmail/version"

Gem::Specification.new do |s|
  s.name        = "ValidateEmail"
  s.version     = Validateemail::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Satyaram B V"]
  s.email       = ["bvsatyaram@gmail.com"]
  s.homepage    = "http://bvsatyaram.com"
  s.summary     = %q{Validates email address optionally also validating the mx records}
  s.description = %q{Validates email address optionally also validating the mx records}

  s.rubyforge_project = "ValidateEmail"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
