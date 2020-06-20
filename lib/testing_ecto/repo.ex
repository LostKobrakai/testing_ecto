defmodule TestingEcto.Repo do
  use Ecto.Repo,
    otp_app: :testing_ecto,
    adapter: Ecto.Adapters.Postgres
end

defimpl Ecto.Queryable, for: TestingEcto.Accounts.UserQuery do
  import Ecto.Query
  alias TestingEcto.Accounts.User

  def to_query(%{filters: filters}) do
    base = from User, as: :user

    Enum.reduce(filters, base, fn
      {:name, name}, query ->
        # DO SANITE NAME for prod
        from [user: user] in query, where: like(user.name, ^"%#{name}%")

      _, query ->
        query
    end)
  end
end
