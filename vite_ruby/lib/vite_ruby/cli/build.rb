# frozen_string_literal: true

class ViteRuby::CLI::Build < Dry::CLI::Command
  CURRENT_ENV = ENV['RACK_ENV'] || ENV['RAILS_ENV']
  DEFAULT_ENV = CURRENT_ENV || 'production'

  def self.shared_options
    option(:mode, default: self::DEFAULT_ENV, values: %w[development production], aliases: ['m'], desc: 'The build mode for Vite')
    option(:debug, desc: 'Run Vite in verbose mode, printing all debugging output', aliases: ['verbose'], type: :boolean)
    option(:inspect, desc: 'Run Vite in a debugging session with node --inspect-brk', aliases: ['inspect-brk'], type: :boolean)
    option(:trace_deprecation, desc: 'Run Vite in debugging mode with node --trace-deprecation', aliases: ['trace-deprecation'], type: :boolean)
  end

  desc 'Bundle all entrypoints using Vite.'
  shared_options
  option(:force, desc: 'Force the build even if assets have not changed', type: :boolean)

  def call(mode:, args: [], **boolean_opts)
    ViteRuby.env['VITE_RUBY_MODE'] = mode
    boolean_opts.map { |name, value| args << "--#{ name }" if value }
    block_given? ? yield(args) : ViteRuby.commands.build_from_task(*args)
  end
end
