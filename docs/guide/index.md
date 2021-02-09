[discussions]: https://github.com/ElMassimo/vite_rails/discussions
[rails]: https://rubyonrails.org/
[webpacker]: https://github.com/rails/webpacker
[vite rails]: https://github.com/ElMassimo/vite_rails
[vite]: https://vitejs.dev/
[vite_hanami]: https://github.com/ElMassimo/vite_rails/tree/main/vite_hanami
[vite_ruby]: https://github.com/ElMassimo/vite_rails/tree/main/vite_ruby
[commands]: /guide/development.html#cli-commands-⌨%EF%B8%8F
[vite-templates]: https://github.com/vitejs/vite/tree/main/packages/create-app
[plugins]: https://vitejs.dev/plugins/
[configuration reference]: /config/
[simple app]: https://github.com/ElMassimo/vite_rails/tree/main/examples/blog
[example app]: https://github.com/ElMassimo/pingcrm-vite
[heroku]: https://pingcrm-vite.herokuapp.com/
[dev options]: /config/#development-options
[json config]: /config/#shared-configuration-file-%F0%9F%93%84
[vite config]: /config/#configuring-vite-%E2%9A%A1
[GitHub Issues]: https://github.com/ElMassimo/vite_rails/issues?q=is%3Aissue+is%3Aopen+sort%3Aupdated-desc
[GitHub Discussions]: https://github.com/ElMassimo/vite_rails/discussions

# Getting Started

If you are interested to learn more about Vite Ruby before trying it, check out the [Introduction](./introduction).

If you are looking for configuration options, check out the [configuration reference].

::: tip Compatibility Note
[Vite] requires [Node.js](https://nodejs.org/en/) version >= 12.0.0.

If using [Vite Rails], it requires [Rails] version > 5.1.
:::

## Installation 💿

Add this line to your application's Gemfile:

```ruby
gem 'vite_rails'
```

And then run:

    $ bundle install

- If using Hanami, install the <kbd>[vite_hanami]</kbd> gem instead.
- If using other Ruby web frameworks, install the <kbd>[vite_ruby]</kbd> gem.

### Setup 📦

Run <kbd>bundle exec vite install</kbd>, which:

- Adds the <kbd>bin/vite</kbd> executable to start the dev server and run other [commands]
- Installs <kbd>vite</kbd> and <kbd>vite-plugin-ruby</kbd> (which is used to configure Vite)
- Adds [`vite.config.ts`][vite config] and [`config/vite.json`][json config] configuration files
- Creates a sample `application.js` entrypoint in your web app

### Running your first example 🏃‍♂️

Run <kbd>bin/vite dev</kbd> to start the Vite development server.

When using Rails or Hanami, restart your web server before visiting any page, and you should see a printed console output:

```
Vite ⚡️ Ruby
```

You can now start writing modern JavaScript apps with Vite! 😃

Check an [example app] running on [Heroku].

### Further Configuration 🧩

When working with a framework such as Vue or React, refer to [vite][plugins] to see which [plugins] to add.

If you would like to contribute a framework-specific template, reach out and we might consider adding it to the installation script.

### Contact ✉️

Please visit [GitHub Issues] to report bugs you find, and [GitHub Discussions] to make feature requests, or to get help.

Don't hesitate to [⭐️ star the project][vite rails] if you find it useful!
