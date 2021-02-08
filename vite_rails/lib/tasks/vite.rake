# frozen_string_literal: true

$stdout.sync = true

def enhance_assets_precompile
  # Before installing
  ['yarn:install', 'webpacker:yarn_install'].each do |name|
    Rake::Task[name].enhance([:'vite:set_node_env']) if Rake::Task.task_defined?(name)
  end

  # After precompiling
  Rake::Task['assets:precompile'].enhance do |task|
    prefix = task.name.split(/#|assets:precompile/).first
    Rake::Task["#{ prefix }vite:build"].invoke
  end
end

namespace :vite do
  desc 'Fixes Rails management of node dev dependencies (build dependencies)'
  task :set_node_env do
    ENV['NODE_ENV'] = 'development'
  end

  desc 'Compile JavaScript packs using vite for production with digests'
  task build: [:'vite:verify_install', :environment] do
    ViteRails.build_from_rake
  end
end

# Compile packs after we've compiled all other assets during precompilation
skip_vite_precompile = %w[no false n f].include?(ENV['VITE_RUBY_PRECOMPILE'])

unless skip_vite_precompile
  if Rake::Task.task_defined?('assets:precompile')
    enhance_assets_precompile
  else
    Rake::Task.define_task('assets:precompile' => [:'vite:install_dependencies', :'vite:build'])
  end
end
