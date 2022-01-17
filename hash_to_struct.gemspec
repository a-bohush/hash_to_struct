require_relative 'lib/hash_to_struct/version'

Gem::Specification.new do |spec|
  spec.name          = "hash_to_struct"
  spec.version       = HashToStruct::VERSION
  spec.authors       = ["Andrew Bohush"]
  spec.email         = ["a.bohush01@gmail.com"]

  spec.summary       = "It enables recursive conversion of ruby Hash to Struct-like object and back."
  spec.description   = "It is built on top of standard `Struct` and `OpenStruct` classes with all their features preserved while adding a few on top for conveniences like handling nested hashes/arrays, unified constructor interface, immutability."
  spec.homepage      = "https://github.com/a-bohush/hash_to_struct.git"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/a-bohush/hash_to_struct/blob/main/CHANGELOG.md"
  spec.extra_rdoc_files = ['README.md']

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
