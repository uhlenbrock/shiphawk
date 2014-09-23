# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'shiphawk/version'

Gem::Specification.new do |s|
  s.name        = 'shiphawk'
  s.version     = Shiphawk::VERSION
  s.authors     = ['Bobby Uhlenbrock']
  s.email       = ['bobby@uhlenbrock.us']
  s.homepage    = 'http://github.com/uhlenbrock/shiphawk'
  s.summary     = %q{A Ruby wrapper for the Shiphawk API}
  s.description = %q{A Ruby wrapper for the Shiphawk API}
  s.rubyforge_project = 'shiphawk'

  # Development Gems
  s.add_development_dependency 'rake'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'guard-minitest'
  s.add_development_dependency 'webmock'
  s.add_development_dependency 'minitest-reporters'
  s.add_development_dependency 'minitest-vcr'
  s.add_development_dependency 'rb-inotify'

  # Gems
  s.add_dependency 'hashie', '~> 3.3.1'
  s.add_dependency 'faraday', '~> 0.9.0'
  s.add_dependency 'faraday_middleware', '~> 0.9.1'


  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']
end
