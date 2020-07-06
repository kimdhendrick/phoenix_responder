# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :responder,
  ecto_repos: [Responder.Repo]

# Configures the endpoint
config :responder, ResponderWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "TLkJLW5MwuoO/zTLO4yjEs8vtdXeB5EFJjsl1ttMCTYd7UZ9uGnlsIdjigs4k9lC",
  render_errors: [view: ResponderWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Responder.PubSub,
  live_view: [signing_salt: "NW0cvJA4"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
