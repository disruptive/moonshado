# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "moonshado/version"

Gem::Specification.new do |s|
  s.name        = "moonshado"
  
  s.add_development_dependency 'rspec', '~> 2.6'
  s.add_development_dependency 'simplecov', '~> 0.4'
  s.add_development_dependency 'webmock', '~> 1.6'
  s.add_development_dependency 'ZenTest', '~> 4.5'
    
  s.add_dependency('httparty', '>= 0.7.0')
  s.add_dependency('rails', '>= 3.0.1')
  
  s.version     = Moonshado::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jerry Richardson"]
  s.email       = ["jerry@disruptive.it"]
  s.homepage    = "http://moonshado.github.com/"
  s.summary     = %q{Utilize the Moonshado REST API for SMS}
  s.description = %q{SMS needn't make you teary. Use Moonshado's REST API through this handy rails engine.}

  s.rubyforge_project = "moonshado"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.requirements << 'A Moonshado Account'
end
