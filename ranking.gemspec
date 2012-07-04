# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.name          = "ranking"
  gem.version       = "0.1.1"
  gem.summary       = %q{Sorted sets using scores}
  gem.description   = %q{Extends Set with a score.  Sorts by score on #to_a, #each, etc}
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
