<h1 align="center">
  <a href="https://vite-ruby.netlify.app/">
    <img src="https://raw.githubusercontent.com/ElMassimo/vite_ruby/main/docs/public/logo.svg" width="120px"/>
  </a>

  <br>

  <a href="https://vite-ruby.netlify.app/">
    Vite Rails Legacy
  </a>

  <br>

  <p align="center">
    <a href="https://github.com/ElMassimo/vite_ruby/actions">
      <img alt="Build Status" src="https://github.com/ElMassimo/vite_ruby/workflows/build/badge.svg"/>
    </a>
    <a href="https://codeclimate.com/github/ElMassimo/vite_ruby">
      <img alt="Maintainability" src="https://codeclimate.com/github/ElMassimo/vite_ruby/badges/gpa.svg"/>
    </a>
    <a href="https://codeclimate.com/github/ElMassimo/vite_ruby">
      <img alt="Test Coverage" src="https://codeclimate.com/github/ElMassimo/vite_ruby/badges/coverage.svg"/>
    </a>
    <a href="https://rubygems.org/gems/vite_rails_legacy">
      <img alt="Gem Version" src="https://img.shields.io/gem/v/vite_rails_legacy.svg?colorB=e9573f"/>
    </a>
    <a href="https://github.com/ElMassimo/vite_ruby/blob/master/LICENSE.txt">
      <img alt="License" src="https://img.shields.io/badge/license-MIT-428F7E.svg"/>
    </a>
  </p>
</h1>

[vite_rails]: https://github.com/ElMassimo/vite_ruby/tree/main/vite_rails
[vite_ruby]: https://github.com/ElMassimo/vite_ruby/tree/main/vite_ruby

__Vite Rails Legacy__ is [__Vite Rails__][vite_rails], modified to support Rails 4.

## Why a separate library? 🤔

I don't want the burden of having to support Rails 4 in the main codebase.

And yet, after extracting [_Vite Ruby_][vite_ruby] the surface area is smaller,
and it was easy to adapt it to work with Rails 4.

This way, people get to use the library in Rails 4, and I get to not worry about
accidentally breaking support with changes that are tested on Rails 5 and onwards.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
