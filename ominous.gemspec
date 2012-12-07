$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ominous/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ominous"
  s.version     = Ominous::VERSION
  s.authors     = ["Rob Nichols"]
  s.email       = ["rob@undervale.co.uk"]
  s.homepage    = "https://github.com/reggieb/ominous"
  s.summary     = "A rails warning engine"
  s.description = "Provides a rails app with a way of displaying and controlling warnings to users"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.8"
  s.add_dependency "jquery-rails"
  s.add_dependency "sass-rails",   '~> 3.2.3'
  s.add_dependency 'acts_as_list'

  s.add_development_dependency "mysql2"
  s.add_development_dependency "dibber"
end
