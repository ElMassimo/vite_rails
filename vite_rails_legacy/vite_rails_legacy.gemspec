# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('./lib', __dir__)
require 'vite_rails_legacy/version'

Gem::Specification.new do |s|
  s.name     = 'vite_rails_legacy'
  s.version  = ViteRailsLegacy::VERSION
  s.authors  = ['Máximo Mussini']
  s.email    = ['maximomussini@gmail.com']
  s.summary  = 'Use Vite in Rails 4 and bring joy to your JavaScript experience'
  s.homepage = 'https://github.com/ElMassimo/vite_ruby'
  s.license  = 'MIT'

  s.metadata = {
    'source_code_uri' => "https://github.com/ElMassimo/vite_ruby/tree/vite_rails_legacy@#{ ViteRailsLegacy::VERSION }/vite_rails_legacy",
    'changelog_uri' => "https://github.com/ElMassimo/vite_ruby/blob/vite_rails_legacy@#{ ViteRailsLegacy::VERSION }/vite_rails_legacy/CHANGELOG.md",
  }

  s.required_ruby_version = Gem::Requirement.new('>= 2.5')

  s.add_dependency 'railties', '< 5'
  s.add_dependency 'vite_ruby'

  s.add_development_dependency 'bundler', '>= 1.3.0'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'rubocop-minitest'
  s.add_development_dependency 'rubocop-performance'

  s.files = Dir.glob('{lib,templates}/**/*') + %w[README.md CHANGELOG.md LICENSE.txt]
  s.test_files = `git ls-files -- test/*`.split("\n")
end
