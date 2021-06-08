# frozen_string_literal: true

require 'test_helper'

class HelperTest < ActionView::TestCase
  include ViteRubyTestHelpers

  tests ViteRails::TagHelpers

  attr_reader :request

  def setup
    super
    @request = Class.new do
      def send_early_hints(links) end

      def base_url
        'https://example.com'
      end
    end.new
  end

  def test_vite_client_tag
    assert_nil vite_client_tag
    with_dev_server_running {
      assert_equal '<script src="/vite-production/@vite/client" type="module"></script>', vite_client_tag
    }
  end

  def test_vite_react_refresh_tag
    assert_nil vite_react_refresh_tag
    with_dev_server_running {
      assert_equal <<~HTML, vite_react_refresh_tag
        <script type="module">
          import RefreshRuntime from '/vite-production/@react-refresh'
          RefreshRuntime.injectIntoGlobalHook(window)
          window.$RefreshReg$ = () => {}
          window.$RefreshSig$ = () => (type) => type
          window.__vite_plugin_react_preamble_installed__ = true
        </script>
      HTML
    }
  end

  def test_vite_asset_path
    assert_equal '/vite-production/assets/application.d9514acc.js', vite_asset_path('application.ts')
    assert_equal '/vite-production/assets/styles.0e53e684.css', vite_asset_path('styles.css')
    with_dev_server_running {
      assert_equal '/vite-production/application.ts', vite_asset_path('application.ts')
      assert_equal '/vite-production/styles.css', vite_asset_path('styles.css')
      assert_equal '/vite-production/image/logo.png', vite_asset_path('image/logo', type: :png)
    }
  end

  def test_vite_stylesheet_tag
    assert_similar link(href: '/vite-production/assets/styles.0e53e684.css'), vite_stylesheet_tag('styles')

    assert_equal vite_stylesheet_tag('styles'), vite_stylesheet_tag('styles.css')

    with_dev_server_running {
      assert_similar link(href: '/vite-production/styles.css'), vite_stylesheet_tag('styles')

      assert_equal vite_stylesheet_tag('styles'), vite_stylesheet_tag('styles.css')
    }
  end

  def test_vite_javascript_tag
    assert_similar [
      %(<script src="/vite-production/assets/application.d9514acc.js" crossorigin="anonymous" type="module"></script>),
      %(<link rel="modulepreload" href="/vite-production/assets/vendor.880705da.js" as="script" crossorigin="anonymous">),
      %(<link rel="modulepreload" href="/vite-production/assets/example_import.8e1fddc0.js" as="script" crossorigin="anonymous">),
      link(href: '/vite-production/assets/application.f510c1e9.css', crossorigin: 'anonymous'),
    ].join, vite_javascript_tag('application')

    assert_equal vite_javascript_tag('application'), vite_javascript_tag('application.js')
    assert_equal vite_javascript_tag('application'), vite_typescript_tag('application')

    with_dev_server_running {
      assert_equal %(<script src="/vite-production/application.js" crossorigin="anonymous" type="module"></script>),
        vite_javascript_tag('application')

      assert_equal %(<script src="/vite-production/application.ts" crossorigin="anonymous" type="module"></script>),
        vite_typescript_tag('application')
    }
  end

  def link(href:, rel: 'stylesheet', media: 'screen', crossorigin: nil)
    attrs = [%(media="#{ media }"), %(href="#{ href }"), (%(crossorigin="#{ crossorigin }") if crossorigin)].compact
    attrs[1], attrs[2] = attrs[2], attrs[1] if Rails.gem_version > Gem::Version.new('6.1') && Rails.gem_version < Gem::Version.new('6.2') && attrs[2]
    attrs.reverse! if Rails.gem_version > Gem::Version.new('6.2')
    %(<link rel="#{ rel }" #{ attrs.join(' ') } />)
  end

  def assert_similar(*args)
    assert_equal(*args.map { |str|
      return str.tr("\n", '').gsub('" />', '">').gsub('"/>', '">') if RUBY_VERSION.start_with?('2.4')

      str.tr("\n", '')
    })
  end
end
