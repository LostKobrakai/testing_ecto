defmodule TestingEcto.RepoCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias TestingEcto.Repo

      import Ecto
      import Ecto.Query
      import TestingEcto.RepoCase

      # and any other stuff
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(TestingEcto.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(TestingEcto.Repo, {:shared, self()})
    end

    :ok
  end
end
