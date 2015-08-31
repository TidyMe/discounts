$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "discounts/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "discounts"
  s.version     = Discounts::VERSION
  s.authors     = ["pjsim"]
  s.email       = ["phillip.j.simmonds@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Discounts."
  s.description = "TODO: Description of Discounts."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_development_dependency "sqlite3"
end
