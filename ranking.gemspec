# -*- encoding: utf-8 -*-

require File.expand_path('../lib/ranking/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "ranking"
  gem.version       = Ranking::VERSION
  gem.summary       = %q{TODO: Summary}
  gem.description   = %q{TODO: Description}
  gem.license       = "MIT"
  gem.authors       = ["Ryan Michael"]
  gem.email         = "kerinin@gmail.com"
  gem.homepage      = "https://github.com/kerinin/ranking#readme"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_development_dependency 'bundler', '~> 1.0'
end
