defmodule TestingEcto.Repo do
  use Ecto.Repo,
    otp_app: :testing_ecto,
    adapter: Ecto.Adapters.Postgres
end
