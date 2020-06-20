defmodule TestingEcto do
  @moduledoc """
  Documentation for `TestingEcto`.
  """

  def create_user(params, opts \\ []) do
    repo = Keyword.get(opts, :repo, TestingEcto.Repo)
    TestingEcto.Accounts.create_user(repo, params)
  end
end
