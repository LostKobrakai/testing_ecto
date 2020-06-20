defmodule TestingEcto.Accounts do
  alias TestingEcto.Accounts.User

  def create_user(repo, params) do
    %User{}
    |> User.changeset(params)
    |> repo.insert([])
  end
end
