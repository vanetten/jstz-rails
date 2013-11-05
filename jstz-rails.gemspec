# -*- encoding: utf-8 -*-
require File.expand_path('../lib/jstz-rails/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["William Van Etten"]
  gem.email         = ["bill@bioteam.net"]
  gem.description   = "This gem provides jstz.js and for your Rails 3 application."
  gem.summary       = "Use jstz with Rails 3"
  gem.homepage      = "http://rubygems.org/gems/jstz-rails"

  gem.files         = Dir["{lib,vendor}/**/*"] + ["LICENSE", "README.md"]
  gem.add_dependency "railties", ">= 3.1"
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "jstz-rails"
  gem.require_paths = ["lib"]
  gem.version       = Jstz::Rails::VERSION
end
