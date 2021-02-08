# frozen_string_literal: true

require 'dry/cli'

# Public: Command line interface that allows to install the library, and run
# simple commands.
class ViteRuby::CLI
  extend Dry::CLI::Registry

  register 'build', Build, aliases: ['b']
  register 'dev', Dev, aliases: %w[d serve]
  register 'install', Install, aliases: %w[setup init]
  register 'version', Version, aliases: ['v', '-v', '--version', 'info']
end
