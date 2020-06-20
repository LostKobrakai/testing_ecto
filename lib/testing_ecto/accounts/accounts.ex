defmodule TestingEcto.Accounts do
  alias TestingEcto.Accounts.User
  alias TestingEcto.Accounts.UserQuery

  def list_users(repo, filters) do
    filters
    |> UserQuery.new()
    |> repo.all([])
    |> Enum.map(&User.avatar_letters/1)
  end

  def create_user(repo, params) do
    %User{}
    |> User.changeset(params)
    |> repo.insert([])
  end
end
