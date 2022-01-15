require_relative 'lib/hash_to_struct/version'

Gem::Specification.new do |spec|
  spec.name          = "hash_to_struct"
  spec.version       = HashToStruct::VERSION
  spec.authors       = ["Andrew Bohush"]
  spec.email         = ["a.bohush01@gmail.com"]

  spec.summary       = "Converts Hash to different types of structs."
  # spec.description   = "TODO"
  # spec.homepage      = "TODO"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  # spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  # spec.require_paths = ["lib"]

  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rspec", "~> 3.0"
end
