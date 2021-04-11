use Mix.Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :bank_api, BankAPI.Repo,
  username: "postgres",
  password: "hainover1",
  database: "bank_api_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox


config :bank_api, BankAPI.EventStore,
  serializer: EventStore.JsonSerializer,
  username: "postgres",
  password: "hainover1",
  database: "bank_api_eventstore_test",
  hostname: "localhost",
  pool_size: 1

config :bank_api, :event_store,
  adapter: Commanded.EventStore.Adapters.InMemory

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :bank_api, BankAPIWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
