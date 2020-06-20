import Config

# Do not start
config :testing_ecto,
  start_repos: []

config :testing_ecto, TestingEcto.Repo, pool: Ecto.Adapters.SQL.Sandbox
