# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_amelem_session',
  :secret      => '5d1669fed8221465002e3a7e90ef166d447462da16887b16d1cc43e2553bce5a240a92ce90c1920544eb264645d22396b89d5c79f2e9458405fa79562be9c4cd'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
