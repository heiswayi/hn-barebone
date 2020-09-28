# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "hn-barebone"
  spec.version       = "0.0.1"
  spec.authors       = ["Heiswayi Nrird"]
  spec.email         = ["heiswayi@nrird.com"]

  spec.summary       = "Heiswayi Nrird's Barebone Jekyll theme"
  spec.homepage      = "https://github.com/heiswayi/hn-barebone"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r{^(assets|_layouts|_includes|_sass|LICENSE|README)}i) }

  spec.add_runtime_dependency "jekyll", "~> 3.4"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", "~> 12.3.3"
end
