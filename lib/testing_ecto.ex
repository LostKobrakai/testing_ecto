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
