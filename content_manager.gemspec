$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "content_manager/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "content_manager"
  s.version     = ContentManager::VERSION
  s.authors     = ["Write your name"]
  s.email       = ["Write your email address"]
  s.homepage    = ""
  s.summary     = "Summary of ContentManager."
  s.description = "Description of ContentManager."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency 'rails', '~> 6.0', '>= 6.0.3.3'
  s.add_development_dependency "mysql2"

  s.test_files = Dir["spec/**/*"]            

  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'factory_bot_rails'
  s.add_development_dependency 'dotenv-rails'
end
