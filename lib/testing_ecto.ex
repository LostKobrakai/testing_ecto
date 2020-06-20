defmodule TestingEcto do
  @moduledoc """
  Documentation for `TestingEcto`.
  """

  def list_users(filters, opts \\ []) do
    repo = Keyword.get(opts, :repo, TestingEcto.Repo)
    TestingEcto.Accounts.list_users(repo, filters)
  end

  def create_user(params, opts \\ []) do
    repo = Keyword.get(opts, :repo, TestingEcto.Repo)
    TestingEcto.Accounts.create_user(repo, params)
  end
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
