import Config

config :testing_ecto,
  ecto_repos: [TestingEcto.Repo],
  start_repos: [TestingEcto.Repo]

config :testing_ecto, TestingEcto.Repo,
  database: "testing_ecto_repo_#{Mix.env()}",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

import_config("#{Mix.env()}.exs")
