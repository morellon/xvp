# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "xvp/version"

Gem::Specification.new do |s|
  s.name        = "xvp"
  s.version     = Xvp::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Thiago Morello"]
  s.email       = ["morellon@gmail.com"]
  s.homepage    = "https://github.com/morellon/xvp"
  s.summary     = %q{XVP password encryption for ruby}
  s.description = %q{XVP password encryption for ruby}

  s.rubyforge_project = "xvp"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
