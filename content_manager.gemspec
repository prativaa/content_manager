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
  s.add_dependency 'mysql2', '~> 0.5.3'

  s.test_files = Dir["spec/**/*"]            

  # s.add_dependency 'rspec-rails', '~> 4.0', '>= 4.0.1'
  # s.add_dependency 'factory_bot_rails', '~> 6.1'
  # s.add_dependency 'dotenv-rails', '~> 2.7', '>= 2.7.6'
  # s.add_dependency 'bcrypt', '~> 3.1', '>= 3.1.16'
  s.add_dependency 'friendly_id', '~> 5.4'
  # s.add_dependency 'shoulda-matchers', '~> 4.1', '>= 4.1.2'
  # s.add_dependency 'pry-rails', '~> 0.3.9'
  # s.add_dependency 'sass-rails', '~> 6.0'
  s.add_dependency 'ckeditor', '~> 5.1'
  # s.add_dependency 'carrierwave', '~> 2.1'
  # s.add_dependency 'mini_magick', '~> 4.10', '>= 4.10.1'
  # s.add_dependency 'coffee-rails', '~> 5.0'
  # s.add_dependency 'bootstrap-sass', '~> 3.4', '>= 3.4.1'
  # s.add_dependency 'jquery-rails', '~> 4.4'
end
