lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'oop/workshop/version'

Gem::Specification.new do |spec|
  spec.name          = 'oop-workshop'
  spec.version       = Oop::Workshop::VERSION
  spec.authors       = ['igor-i']
  spec.email         = ['inkovskiy@gmail.com']
  spec.summary       = %q{OOP workshop.}
  spec.homepage      = 'https://github.com/igor-i/oop-workshop'

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.8'
  spec.add_development_dependency 'rspec-power_assert'
  spec.add_development_dependency 'webmock'
end
