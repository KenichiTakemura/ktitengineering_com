KtitengineeringCom::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # Code is not reloaded between requests
  config.cache_classes = true

  # Full error reports are disabled and caching is turned on
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Disable Rails's static asset server (Apache or nginx will already do this)
  config.serve_static_assets = false

  # Compress JavaScripts and CSS
  config.assets.compress = true

  # Don't fallback to assets pipeline if a precompiled asset is missed
  config.assets.compile = false

  # Generate digests for assets URLs
  config.assets.digest = true

  # Defaults to nil and saved in location specified by config.assets.prefix
  # config.assets.manifest = YOUR_PATH

  # Specifies the header that your server uses for sending files
  # config.action_dispatch.x_sendfile_header = "X-Sendfile" # for apache
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for nginx

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  # config.force_ssl = true

  # See everything in the log (default is :info)
  # config.log_level = :debug

  # Prepend all log lines with the following tags
  # config.log_tags = [ :subdomain, :uuid ]

  # Use a different logger for distributed setups
  # config.logger = ActiveSupport::TaggedLogging.new(SyslogLogger.new)

  # Use a different cache store in production
  # config.cache_store = :mem_cache_store

  # Enable serving of images, stylesheets, and JavaScripts from an asset server
  # config.action_controller.asset_host = "http://assets.example.com"

  # Precompile additional assets (application.js, application.css, and all non-JS/CSS are already added)
  # config.assets.precompile += %w( search.js )

  # Disable delivery errors, bad email addresses will be ignored
  # config.action_mailer.raise_delivery_errors = false

  # Enable threaded mode
  # config.threadsafe!

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation can not be found)
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners
  config.active_support.deprecation = :notify

  # Log the query plan for queries taking more than this (works
  # with SQLite, MySQL, and PostgreSQL)
  # config.active_record.auto_explain_threshold_in_seconds = 0.5

  # Mail
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.default_url_options = { :host => "ktitengineering.com" }
  config.action_mailer.smtp_settings = {
    :address => 's3-singapore.accountservergroup.com',
    :enable_starttls_auto => false,
    :openssl_verify_mode => OpenSSL::SSL::VERIFY_NONE,
    :authentication => :plain,
    :user_name => 'contact@ktitengineering.com',
    :password => 'ktitisawesome2013!',
  }

  config.contact_mailer = {
    :admin_email => "kenichi_takemura1976@yahoo.com",
    :admin_email_locale => "en",
    :is_debug => false
  }
    
 # Exception Handling
  config.middleware.use ExceptionNotifier,
    :email_prefix => "[K.T. IT Engineering Exception] ",
    :sender_address => %{"K.T. IT Engineering" <contact@ktitengineering.com>},
    :exception_recipients => %w{kenichi_takemura1976@yahoo.com}

  config.my_host = "108.174.147.28"
  
  config.available_language = %w{en ja}

end
