import Config

config :kandesk,
  ecto_repos: [Kandesk.Repo]

# Configures the endpoint
config :kandesk, KandeskWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "O8I0j9p1IXJUi65h5S73INz0qDzLxQ3pfIcCR9Y3BjMmWGXhlcJFTFfDRMbHpHr7",
  render_errors: [view: KandeskWeb.ErrorView, accepts: ~w(html json)],
  pubsub_server: Kandesk.PubSub,
  live_view: [signing_salt: "5BFoIPvCG/CUh9GwpXNBIC2qh/JUB/Z5"],
  http: [port: 4001],
  debug_errors: true,
  code_reloader: true,
  check_origin: false

# Configures pow
config :kandesk, :pow,
  user: Kandesk.Schema.User,
  repo: Kandesk.Repo,
  web_module: KandeskWeb,
  extensions: [PowResetPassword, PowPersistentSession],
  controller_callbacks: Pow.Extension.Phoenix.ControllerCallbacks,
  mailer_backend: Kandesk.Mailer,
  web_mailer_module: KandeskWeb

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Configures timezone database
config :elixir, :time_zone_database, Tzdata.TimeZoneDatabase

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
