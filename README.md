<h1 align="center">
  <a href="https://vite-rails.netlify.app/">
    <img src="https://raw.githubusercontent.com/ElMassimo/vite_rails/main/docs/public/logo.svg" width="200px"/>
  </a>

  <br>

  <a href="https://vite-rails.netlify.app/">
    Vite Ruby
  </a>

  <br>

  <p align="center">
    <a href="https://github.com/ElMassimo/vite_rails/actions">
      <img alt="Build Status" src="https://github.com/ElMassimo/vite_rails/workflows/build/badge.svg"/>
    </a>
    <a href="https://codeclimate.com/github/ElMassimo/vite_rails">
      <img alt="Maintainability" src="https://codeclimate.com/github/ElMassimo/vite_rails/badges/gpa.svg"/>
    </a>
    <a href="https://codeclimate.com/github/ElMassimo/vite_rails">
      <img alt="Test Coverage" src="https://codeclimate.com/github/ElMassimo/vite_rails/badges/coverage.svg"/>
    </a>
    <a href="https://github.com/ElMassimo/vite_rails/blob/master/LICENSE.txt">
      <img alt="License" src="https://img.shields.io/badge/license-MIT-428F7E.svg"/>
    </a>
  </p>
</h1>

[website]: https://vite-rails.netlify.app/
[configuration reference]: https://vite-rails.netlify.app/config/
[features]: https://vite-rails.netlify.app/guide/introduction.html
[guides]: https://vite-rails.netlify.app/guide/
[config]: https://vite-rails.netlify.app/config/
[vite_rails]: https://github.com/ElMassimo/vite_rails
[webpacker]: https://github.com/rails/webpacker
[vite]: http://vitejs.dev/
[config file]: https://github.com/ElMassimo/vite_rails/blob/main/vite-plugin-ruby/default.vite.json
[example app]: https://github.com/ElMassimo/pingcrm-vite
[heroku]: https://pingcrm-vite.herokuapp.com/
[Issues]: https://github.com/ElMassimo/vite_rails/issues?q=is%3Aissue+is%3Aopen+sort%3Aupdated-desc
[Discussions]: https://github.com/ElMassimo/vite_rails/discussions


[Vite] is to frontend tooling as Ruby to programming, pure joy! 😍

This repo contains libraries that will allow you to easily integrate Vite in
your favourite Ruby framework.

## Features ⚡️

- 💡 Instant server start
- ⚡️ Blazing fast hot reload
- 🚀 Zero-config deployments
- 🤝 Integrated with <kbd>assets:precompile</kbd>
- [And more!][features]

## Documentation 📖

Visit the [documentation website][website] to check out the [guides] and searchable [configuration reference].

## Installation 💿

Add this line to your application's Gemfile:

```ruby
gem 'vite_rails' # vite_hanami for Hanami apps, vite_ruby for Rack apps
```

Then, run:

```bash
bundle install
bundle exec vite install
```

This will generate configuration files and a sample setup.

Additional installation instructions are available in the [documentation website][website].

## Getting Started 💻

Restart your web server, and then run <kbd>bin/vite dev</kbd> to start the Vite development server.

Visit any page and you should see a printed console output: `Vite ⚡️ Ruby`.

For more [guides] and a full [configuration reference], check the [documentation website][website].

## Contact ✉️

Please use [Issues] to report bugs you find, and [Discussions] to make feature requests or get help.

Don't hesitate to _⭐️ star the project_ if you find it useful!


## Special Thanks 🙏

- [webpacker]
- [vite]

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
