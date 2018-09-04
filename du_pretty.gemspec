
lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'du_pretty/version'

Gem::Specification.new do |spec|
  spec.name          = 'du_pretty'
  spec.version       = DuPretty::VERSION
  spec.authors       = ['Katsuma Narisawa']
  spec.email         = ['face.the.music721@gmail.com']

  spec.summary       = 'Simple wrapper for "du" to pretty print.'
  spec.description   = 'Simple wrapper for "du" to pretty print.'
  spec.homepage      = 'https://github.com/nullnull/du_pretty'
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_dependency 'thor'
end
