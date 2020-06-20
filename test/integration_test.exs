defmodule TestingEcto.IntegrationTest do
  use TestingEcto.RepoCase, async: true

  @moduletag :integration

  describe "create_user" do
    test "can create user with valid params" do
      # Arrange
      params = %{
        name: "Max"
      }

      # Act
      result = TestingEcto.create_user(params)

      # Assert
      assert {:ok, user} = result
      assert "Max" = user.name
    end
  end

  describe "list_users" do
    test "can query users based on filters" do
      # Arrange
      {:ok, %{id: u1_id}} =
        TestingEcto.create_user(%{
          name: "Max"
        })

      {:ok, %{id: u2_id}} =
        TestingEcto.create_user(%{
          name: "Maximilian"
        })

      TestingEcto.create_user(%{
        name: "Moni"
      })

      # Act
      [u1, u2] = TestingEcto.list_users(name: "Max")

      # Assert
      assert u1.id == u1_id
      assert u1.name =~ "Max"
      assert u2.id == u2_id
      assert u2.name =~ "Max"
    end

    # test "computed field is filled"
    #
    # If you're missing this test:
    # It's not needed for integration tests
    # All the tested functionality happens after the repo call
  end
end
