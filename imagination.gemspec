$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "imagination/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "imagination"
  s.version     = Imagination::VERSION
  s.authors     = ["Duke Dorje"]
  s.email       = ["duke.dorje@gmail.com"]
  # s.homepage    = "TODO"
  s.summary     = "Resize and cache images very easily."
  s.description = "Imagination allows you to define image resize profiles, and automatically generate and cache the resized images."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  # s.add_development_dependency "sqlite3"
end
