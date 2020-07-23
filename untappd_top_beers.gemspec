require_relative 'lib/untappd_top_beers/version'

Gem::Specification.new do |spec|
  spec.name          = "untappd_top_beers"
  spec.version       = UntappdTopBeers::VERSION
  spec.authors       = ["<github username>"]
  spec.email         = ["<github email address>"]

  spec.summary       = "Untappd Most Popular Beers in the US"
  spec.description   = "Provides details of the most popular beers rated on Untappd by their users"
  spec.homepage      = "http://somethingsomething.com"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "http://somethingsomething.com"
  spec.metadata["changelog_uri"] = "http://somethingsomething.com"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_dependency "nokogiri"
end
