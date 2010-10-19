# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
#ActionController::Base.session = {
#  :key         => '_ce_demo_session',
#  :secret      => 'ef434449cb9d90260d0a4e5bcb32a59b0701466836ee0f7713feb48661a0993114fb8088468979c772e2bf2fc260e9e66d0fbcd13ad76c457685594300aec755'
#}


# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
ActionController::Base.session_store = :active_record_store
