defmodule TestingEctoTest do
  use ExUnit.Case, async: true
  import Mox

  setup :verify_on_exit!

  describe "create_user" do
    test "can create user with valid params" do
      # Arrange
      TestingEcto.RepoMock
      |> expect(:insert, fn changeset, opts ->
        send(self(), changeset)
        {:ok, %TestingEcto.Accounts.User{}}
      end)

      params = %{
        name: "Max"
      }

      # Act
      TestingEcto.create_user(params, repo: TestingEcto.RepoMock)

      # Assert
      assert_received changeset
      assert %{valid?: true} = changeset
      assert "Max" = Ecto.Changeset.fetch_change!(changeset, :name)
    end
  end
end
