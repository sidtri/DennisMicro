# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
Prelaunchr::Application.config.secret_token = ENV["RAILS_SECRET"] || '6d3311e6d0da977cf8560a4f508c6bf5be6dbbe6082da6fd147623c3f02d7bb7293ff3d5b23ccb33368cab86f25d6e50c2fe48b89f46d911134248f75de4a82e'