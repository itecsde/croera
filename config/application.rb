require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require *Rails.groups(:assets => %w(development test))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module AREAV03
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Custom directories with classes and modules you want to be autoloadable.
    # config.autoload_paths += %W(#{config.root}/extras)

    # Only load the plugins named here, in the order given (default is alphabetical).
    # :all can be used as a placeholder for all plugins not explicitly named.
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

    # Activate observers that should always be running.
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Madrid'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    
    
    I18n.config.enforce_available_locales = false
    
    
    config.i18n.default_locale = :en


    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"



    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    # Enable the asset pipeline
    config.assets.enabled = true

    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'
    
    # Disable model loading when compiling assets
    config.assets.initialize_on_precompile = false
    
    #config.i18n.fallbacks = true
    config.i18n.fallbacks = {:en => [:en, :es, :pt, :fr, :fi, :no, :lt, :tr, :nl, :sk, :hu, :gl], :es =>[:es, :en, :gl, :pt, :lt, :hu, :fi], :pt => [:pt, :gl, :en, :es, :lt, :hu, :fi], :lt => [:lt, :en, :es, :pt, :hu, :fi], :no => [:no, :en, :fi, :es, :lt, :pt], :fi => [:fi, :en, :es, :pt, :lt, :gl], :tr => [:tr, :en, :es, :lt, :pt, :fi], :fr => [:fr, :en, :es, :pt, :no, :fi], :nl => [:nl, :en, :es, :pt, :no, :fi], :gl => [:gl, :es, :pt, :en, :no, :fi], :sk => [:sk, :en, :es, :pt, :no, :fi], :hu => [:hu, :en, :es, :pt, :no, :sk]}
    
    # TODOS:  config.i18n.fallbacks = {:en => [:en, :es, :pt, :fr, :fi, :no, :lt, :tr, :nl, :sk, :hu, :gl], :es =>[:es, :en, :gl, :pt, :fr, :fi, :no, :lt, :tr, :nl, :sk , :hu], :pt => [:pt, :gl, :en, :es, :fr, :fi, :no, :lt, :tr, :nl, :sk, :hu], :gl => [:gl, :es, :pt, :en, :fr, :no, :fi, :lt, :tr, :nl, :sk, :hu], :lt => [:lt, :en, :es, :pt, :fr, :fi, :no, :tr, :nl, :sk, :hu, :gl], :no => [:no, :en, :fi, :es, :fr, :pt, :lt, :tr, :nl, :sk, :hu, :gl], :fi => [:fi, :no, :en, :es, :pt, :fr, :lt, :tr, :nl, :sk, :hu, :gl], :tr => [:tr, :en, :es, :fr, :pt, :fi, :no, :lt, :nl, :sk, :hu, :gl], :fr => [:fr, :en, :es, :pt, :tr, :no, :fi, :lt, :nl, :sk, :hu, :gl], :nl => [:nl, :en, :es, :fr, :pt, :no, :fi, :lt, :tr, :sk, :hu, :gl], :sk => [:sk, :en, :es, :fr, :pt, :no, :fi, :lt, :tr, :nl, :hu, :gl], :hu => [:hu, :en, :es, :pt, :fr, :no, :fi, :lt, :tr, :nl, :sk, :gl]}
    #config.i18n.fallbacks = {:en => [:en, :es, :pt, :hu, :fi, :no, :lt, :tr, :gl], :es =>[:es, :en, :gl, :pt, :hu, :fi, :no, :lt, :tr], :pt => [:pt, :gl, :en, :es, :hu, :fi, :no, :lt, :tr], :gl => [:gl, :es, :pt, :en, :hu, :no, :fi, :lt, :tr], :lt => [:lt, :en, :es, :pt, :hu, :fi, :no, :tr, :gl], :no => [:no, :en, :fi, :es, :hu, :pt, :lt, :tr, :gl], :fi => [:fi, :no, :en, :es, :pt, :hu, :lt, :tr, :gl], :tr => [:tr, :en, :es, :hu, :pt, :fi, :no, :lt, :gl], :fr => [:fr, :en, :es, :pt, :tr, :hu, :fi, :lt, :gl], :nl => [:nl, :en, :es, :hu, :pt, :no, :fi, :lt, :gl], :sk => [:sk, :en, :es, :hu, :pt, :no, :fi, :lt, :gl], :hu => [:hu, :en, :es, :pt, :hu, :no, :fi, :lt, :gl]}
    
    
    Cloudmate.configure do |config|
      config.api_key = 'a19d1d45661e468697514deaf502669f'
    end
  end
end

