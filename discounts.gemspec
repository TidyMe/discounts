$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "discounts/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "discounts"
  s.version     = Discounts::VERSION
  s.authors     = ["pjsim"]
  s.email       = ["phillip.j.simmonds@gmail.com"]
  s.homepage    = "https://github.com/TidyMe/discounts/"
  s.summary     = "A gem to handle discounts and coupons."
  s.description = "A gem to handle discounts and coupons."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]
end
