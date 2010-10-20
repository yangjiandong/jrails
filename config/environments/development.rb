# Settings specified here will take precedence over those in config/environment.rb

# In the development environment your application's code is reloaded on
# every request.  This slows down response time but is perfect for development
# since you don't have to restart the webserver when you make code changes.
config.cache_classes = false

# http://railsillustrated.com/logger-tricks.html
if $0 == "irb"
  config.logger = Logger.new(STDOUT)
else
  config.logger = Logger.new(Rails.root.join("log",Rails.env + ".log"),3,5*1024*1024)  
end

config.log_level = :debug

#http://www.javaeye.com/topic/767333
#config.logger = begin
#    path = config.paths.log.to_a.first
#    logger = ActiveSupport::BufferedLogger.new(path, "daily")
#    logger.level = ActiveSupport::BufferedLogger.const_get(config.log_level.to_s.upcase)
#    logger.auto_flushing = false if Rails.env.production?
#    logger
#  rescue StandardError => e
#    logger = ActiveSupport::BufferedLogger.new(STDERR)
#    logger.level = ActiveSupport::BufferedLogger::WARN
#    logger.warn(
#      "Rails Error: Unable to access log file. Please ensure that #{path} exists and is chmod 0666. " +
#      "The log level has been raised to WARN and the output directed to STDERR until the problem is fixed."
#    )
#    logger
#  end

# Log error messages when you accidentally call methods on nil.
config.whiny_nils = true

# Show full error reports and disable caching
config.action_controller.consider_all_requests_local = true
config.action_view.debug_rjs                         = true
config.action_controller.perform_caching             = false

# Don't care if the mailer can't send
config.action_mailer.raise_delivery_errors = false