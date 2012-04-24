# -*- encoding: utf-8 -*-
require File.expand_path('../lib/smart_asana/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Ryan Bright"]
  gem.email         = ["ryan@rbright.net"]
  gem.description   = %q{Add Asana tasks using Remember the Milk's Smart Add syntax}
  gem.summary       = %q{Add Asana tasks using Remember the Milk's Smart Add syntax}
  gem.homepage      = "http://github.com/rbright/smart_asana"

  gem.add_dependency 'activesupport', '~> 3.2.3'
  gem.add_dependency 'asana', '~> 0.0.3'

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "smart_asana"
  gem.require_paths = ["lib"]
  gem.version       = SmartAsana::VERSION
end
