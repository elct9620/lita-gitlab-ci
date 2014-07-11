Gem::Specification.new do |spec|
  spec.name          = "lita-gitlab-ci"
  spec.version       = "0.0.1"
  spec.authors       = ["蒼時弦也"]
  spec.email         = ["elct9620@frost.tw"]
  spec.description   = %q{Lita Gitlab handler for send message about build status.}
  spec.summary       = %q{Lita Gitlab handler for send message about build status.}
  spec.homepage      = "https://github.com/elct9620/lita-gitlab-ci"
  spec.license       = "MIT"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 3.3"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", ">= 3.0.0"
  spec.add_development_dependency "shoulda", ">= 3.5.0"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "coveralls"
end
