$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "imagination/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "imagination"
  s.version     = Imagination::VERSION
  s.authors     = ["Duke Dorje"]
  s.email       = ["duke.dorje@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Imagination."
  s.description = "TODO: Description of Imagination."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.5"

  s.add_development_dependency "sqlite3"
end
