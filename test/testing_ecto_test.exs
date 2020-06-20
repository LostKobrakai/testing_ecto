defmodule TestingEctoTest do
  use ExUnit.Case, async: true
  import Mox

  setup :verify_on_exit!

  describe "create_user" do
    test "can create user with valid params" do
      # Arrange
      TestingEcto.RepoMock
      |> expect(:insert, fn changeset, _opts ->
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

  describe "list_users" do
    test "can query users based on filters" do
      # Arrange
      TestingEcto.RepoMock
      |> expect(:all, fn queryable, _opts ->
        send(self(), queryable)
        []
      end)

      # Act
      TestingEcto.list_users([name: "Max"], repo: TestingEcto.RepoMock)

      # Assert
      assert_received %TestingEcto.Accounts.UserQuery{
        filters: [name: "Max"]
      }
    end
  end
end
