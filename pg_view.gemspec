$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "pg_view/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "pg_view"
  spec.version     = PgView::VERSION
  spec.authors     = ["Robert W Ferney"]
  spec.email       = ["robert.w.ferney@uscis.dhs.gov"]
  spec.homepage    = "http://github.com/capnregex/pg_view"
  spec.summary     = "Manage Database Views in a Ruby on Rails application"
  spec.description = "Manage Database Views in a Ruby on Rails application"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "http://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 5.2.3"

  spec.add_development_dependency "pg"
end
