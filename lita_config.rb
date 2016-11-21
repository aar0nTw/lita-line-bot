Lita.configure do |config|
  # The name your robot will use.
  config.robot.name = "Cabot"

  # The locale code for the language to use.
  # config.robot.locale = :en

  # The severity of messages to log. Options are:
  # :debug, :info, :warn, :error, :fatal
  # Messages at the selected level and above will be logged.
  config.robot.log_level = :info

  # An array of user IDs that are considered administrators. These users
  # the ability to add and remove other users from authorization groups.
  # What is considered a user ID will change depending on which adapter you use.
  # config.robot.admins = ["1", "2"]

  # The adapter you want to connect with. Make sure you've added the
  # appropriate gem to the Gemfile.
  config.robot.adapter = :line

  ## Example: Set options for the chosen adapter.
  # config.adapter.username = "myname"
  # config.adapter.password = "secret"
  config.adapters.line.channel_secret = ENV["LINE_CHANNEL_SECRET"]
  config.adapters.line.channel_token = ENV["LINE_CHANNEL_TOKEN"]

  config.http.port = ENV["PORT"]


  ## Example: Set options for the Redis connection.
  config.redis[:url] = ENV["REDISTOGO_URL"]

  ## Example: Set configuration for any loaded handlers. See the handler's
  ## documentation for options.
  # config.handlers.some_handler.some_config_key = "value"
  config.handlers.google_images.google_cse_id = ENV["GOOGLE_CSE_ID"]
  config.handlers.google_images.google_cse_key = ENV["GOOGLE_CSE_KEY"]
  config.handlers.karma.cooldown = nil
end
locale_paths = Dir[File.join(File.expand_path("../", __FILE__), "locales", "*.yml")]
Lita.logger.info locale_paths
Lita.load_locales(locale_paths)

